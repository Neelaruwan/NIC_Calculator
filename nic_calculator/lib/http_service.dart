import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nic_calculator/main.dart';
import 'dart:async';

Future<List<Employees>> fetchResults() async {
  Uri url = Uri.parse("https://jsonplaceholder.typicode.com/albums");
  var response = await http.get(url);
  var resultsJson = jsonDecode(response.body) as List;
  print(resultsJson.toString());
  List<Employees> empList = resultsJson.map((employeeJson) => Employees.fromJson(employeeJson)).toList();
 /* List<Employees> emplist = await resultsJson
      .map<Employees>((json) => Employees.fromJson(json))
      .toList();*/
  return empList;
}
/*
List<Employees> employeesFromJson(String str) =>
    List<Employees>.from(json.decode(str).map((x) => Employees.fromJson(x)));

String employeesToJson(List<Employees> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));*/

class Employees {
  Employees(
    this.id,
    this.userId,
    this.title,
  );

  int id;
  int userId;
  String title;

  factory Employees.fromJson(dynamic json){
    return Employees(
        json['id'] as int,
        json['userId'] as int,
        json['title'] as String
    );
  }

  /*Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "title": title,
  };*/
  @override
  String toString() {
    return '{ ${this.id}, ${this.userId}, ${this.title} }';
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late Future<List<Employees>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchResults();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP Get Request',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Http Get Request'),
        ),
        backgroundColor: Colors.greenAccent,
        body: SingleChildScrollView(
    child: Column(
    children: [
    FutureBuilder<List<Employees>>(
    initialData: const <Employees>[],
    future: fetchResults(),
    builder: (context, snapshot) {
    if (snapshot.hasError ||
    snapshot.data == null ||
    snapshot.connectionState == ConnectionState.waiting) {
    return const CircularProgressIndicator();
    }
    return DataTable(
    columns: const [
    DataColumn(label: Text('ID',
      style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16,
          color: Colors.deepOrange),
    )),
    DataColumn(label: Text('UserId',
      style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16,
          color: Colors.deepOrange),
    )),
    DataColumn(label: Text('Title',
      style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16,
          color: Colors.deepOrange),
    )),
    ],
    rows: List.generate(
    snapshot.data!.length,
    (index) {
        var emp = snapshot.data![index];
        return DataRow(cells: [
            DataCell(
            Text(emp.id.toString()),
            ),
            DataCell(
            Text(emp.userId.toString()),
            ),
            DataCell(
            Text(emp.title),
            ),
        ]);
        },
    ).toList(),
    );
    },
    ),
    ],
    ),
    ),
    ),
    );
  }
}