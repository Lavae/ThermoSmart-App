import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Energy Saver",
      home: MyNavigationBar(), //FirstRoute(), //MyHomePage(),
    );
  }
}


//Temp route stuff

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FirstRoute()),
            );
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

//Nav Bar

class MyNavigationBarRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key key}) : super(key: key);
  
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Temperature',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Control',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('energy app'), backgroundColor: Colors.blue),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.thermostat_sharp),
                title: Text('Temperature'),
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.toggle_on),
              title: Text('Control'),
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}

//Data stuff


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class Record {
  String day;
  int Hr1;
  int Hr2;
  int Hr3;
  int Hr4;
  int Hr5;
  int Hr6;
  int Hr7;
  int Hr8;
  int Hr9;
  int Hr10;
  int Hr11;
  int Hr12;
  int Hr13;
  int Hr14;
  int Hr15;
  int Hr16;
  int Hr17;
  int Hr18;
  int Hr19;
  int Hr20;
  int Hr21;
  int Hr22;
  int Hr23;
  int Hr24;
  DocumentReference reference;
  double avg;
  int curr;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['day'] != null),
        assert(map['Hr1'] != null),
        assert(map['Hr2'] != null),
        assert(map['Hr3'] != null),
        assert(map['Hr4'] != null),
        assert(map['Hr5'] != null),
        assert(map['Hr6'] != null),
        assert(map['Hr7'] != null),
        assert(map['Hr8'] != null),
        assert(map['Hr9'] != null),
        assert(map['Hr10'] != null),
        assert(map['Hr11'] != null),
        assert(map['Hr12'] != null),
        assert(map['Hr13'] != null),
        assert(map['Hr14'] != null),
        assert(map['Hr15'] != null),
        assert(map['Hr16'] != null),
        assert(map['Hr17'] != null),
        assert(map['Hr18'] != null),
        assert(map['Hr19'] != null),
        assert(map['Hr20'] != null),
        assert(map['Hr21'] != null),
        assert(map['Hr22'] != null),
        assert(map['Hr23'] != null),
        assert(map['Hr24'] != null),
        day = map['day'],
        Hr1 = map['Hr1'],
        Hr2 = map['Hr2'],
        Hr3 = map['Hr3'],
        Hr4 = map['Hr4'],
        Hr5 = map['Hr5'],
        Hr6 = map['Hr6'],
        Hr7 = map['Hr7'],
        Hr8 = map['Hr8'],
        Hr9 = map['Hr9'],
        Hr10 = map['Hr10'],
        Hr11 = map['Hr11'],
        Hr12 = map['Hr12'],
        Hr13 = map['Hr13'],
        Hr14 = map['Hr14'],
        Hr15 = map['Hr15'],
        Hr16 = map['Hr16'],
        Hr17 = map['Hr17'],
        Hr18 = map['Hr18'],
        Hr19 = map['Hr19'],
        Hr20 = map['Hr20'],
        Hr21 = map['Hr21'],
        Hr22 = map['Hr22'],
        Hr23 = map['Hr23'],
        Hr24 = map['Hr24'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  double calcAvg() {
    avg = (Hr1 +
            Hr2 +
            Hr3 +
            Hr4 +
            Hr5 +
            Hr6 +
            Hr7 +
            Hr8 +
            Hr9 +
            Hr10 +
            Hr11 +
            Hr12 +
            Hr13 +
            Hr14 +
            Hr15 +
            Hr16 +
            Hr17 +
            Hr18 +
            Hr19 +
            Hr20 +
            Hr21 +
            Hr22 +
            Hr23 +
            Hr24) /
        24;
    return avg;
  }

  int getCurr() {
    curr = Hr10;
    return curr;
  }

  @override
  String toString() => "Record<$day:$avg:$curr>";
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hourly Temps')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Week data').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.day),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: DataTable(
          columns: [
            DataColumn(label: Text('Day')),
            DataColumn(label: Text('Average')),
            DataColumn(label: Text('Current')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text(record.day)),
              DataCell(Text(record.calcAvg().toStringAsFixed(1))),
              DataCell(Text(record.getCurr().toString())),
            ])
          ],
        ),
      ),
    );
  }
}

<<<<<<< HEAD
/*
class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Temperature',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Control',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('energy app'), backgroundColor: Colors.blue),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.thermostat_sharp),
                title: Text('Temperature'),
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.toggle),
              title: Text('Control'),
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
<<<<<<< HEAD

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      home: new MyApp(),
    );
  }
}
=======
*/
>>>>>>> faa7f7c (built datatable)
=======
>>>>>>> 9234ed1 (Nathan's commit 3/31)
