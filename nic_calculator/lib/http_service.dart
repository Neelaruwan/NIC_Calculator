import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nic_calculator/main.dart';
import 'dart:async';

import 'employeemodel.dart';

Future<List<Employees>> fetchResults() async {
  Uri url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1");
  var response = await http.get(url);
  var resultsJson = json.decode(response.body).cast<Map<String, dynamic>>();
  List<Employees> emplist = await resultsJson
      .map<Employees>((json) => Employees.fromJson(json))
      .toList();
  return emplist;
}


class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late List<Employees> emps;

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
    DataColumn(label: Text('ID')),
    DataColumn(label: Text('UserId')),
    DataColumn(label: Text('Title')),
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
            Text(emp.userId),
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