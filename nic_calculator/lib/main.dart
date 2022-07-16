import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NIC Calculator',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'NIC Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool calculate() {
    var nic;
    var dayText=0;
    var mon = "";
    var year="";
    var day="";

     year = "19"+nic.substr(0,2);
     dayText = (nic.substr(2,3));

    if(dayText>500){
      dayText = dayText-500;
      print("Female");
    }
    else{
      print("Male");
    }
    if (dayText < 1 && dayText > 366) {
      print("Invalid NIC NO");
    }
    else{
      if (dayText > 335) {
        day = (dayText-335) as String;
        mon = "December";
      }
      else if (dayText>305) {
        day = (dayText-305) as String;
        mon = "November";
      }
      else if (dayText > 274) {
        day = (dayText - 274) as String;
        mon = "October";
      }
      else if (dayText > 244) {
        day = (dayText - 244) as String;
        mon = "September";
      }
      else if (dayText > 213) {
        day = (dayText - 213) as String;
        mon = "August";
      }
      else if (dayText > 182) {
        day = (dayText - 182) as String;
        mon = "July";
      }
      else if (dayText > 152) {
        day = (dayText - 152) as String;
        mon = "June";
      }
      else if (dayText > 121) {
        day = (dayText - 121) as String;
        mon = "May";
      }
      else if (dayText > 91) {
        day = (dayText - 91) as String;
        mon = "April";
      }
      else if (dayText > 60) {
        day = (dayText - 60) as String;
        mon = "March";
      }
      else if (dayText < 32) {
        mon = "January";
        day = dayText as String;
      }
      else if (dayText > 31) {
        day = (dayText - 31) as String;
        mon = "February";
      }
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter 9 Digits of NIC Number',
                ),
                maxLength: 9,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
            ),
            RaisedButton(
              color: Colors.red,
              onPressed: calculate,
              textColor: Colors.white,
              splashColor: Colors.grey,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text("Find DOB & Gender"),
            ),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondRoute()),
          );
        },
        child: const Text('Next'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
