import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  final headings = ['Idx', 'Color', 'Up', 'Down', 'Edit',];
  final rows = <TableRows>[TableRows(idx: 0, color: 'red', up: 'up', down: 'down', edit: true,),
  TableRows(idx: 1, color: 'color', up: 'up', down: 'down', edit: true),
  TableRows(idx: 2, color: 'color', up: 'up', down: 'down', edit: true),
  TableRows(idx: 3, color: 'color', up: 'up', down: 'down', edit: true),
  TableRows(idx: 4, color: 'color', up: 'up', down: 'down', edit: true),
  TableRows(idx: 5, color: 'color', up: 'up', down: 'down', edit: true),
  TableRows(idx: 6, color: 'color', up: 'up', down: 'down', edit: true),
  TableRows(idx: 7, color: 'color', up: 'up', down: 'down', edit: true),
  TableRows(idx: 8, color: 'color', up: 'up', down: 'down', edit: true),
  TableRows(idx: 9, color: 'color', up: 'up', down: 'down', edit: true),
  TableRows(idx: 10, color: 'color', up: 'up', down: 'down', edit: true),
  TableRows(idx: 11, color: 'color', up: 'up', down: 'down', edit: true),
  TableRows(idx: 12, color: 'color', up: 'up', down: 'down', edit: true),
  TableRows(idx: 13, color: 'color', up: 'up', down: 'down', edit: true),
  TableRows(idx: 14, color: 'color', up: 'up', down: 'down', edit: true),
  TableRows(idx: 15, color: 'color', up: 'up', down: 'down', edit: true),];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: createTable(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget createTable(){
    return DataTable(columns: getColumns(headings), rows: getRows(rows),);
  }
  getColumns(columns){
    columns.map((String column)=>DataColumn(label: Text(column),),);
  }
  getRows(List<TableRows> rows){
rows.map((TableRows row){
  final cell = [row.idx, row.color, row.up, row.down, row.edit];
  return DataRow(cells: getCells(cell));
}).toList();
  }
  getCells(List<dynamic> cells){
    cells.map((cell) => DataCell(cell == true? TextButton(onPressed: (){}, child: const Text('Edit'),) : Text(cell),),).toList();
  }
}



TableRows tableRowsFromJson(String str) => TableRows.fromJson(json.decode(str));

String tableRowsToJson(TableRows data) => json.encode(data.toJson());

class TableRows {
    TableRows({
        required this.idx,
        required this.color,
        required this.up,
        required this.down,
        required this.edit,
    });

    int idx;
    String color;
    String up;
    String down;
    bool edit;

    factory TableRows.fromJson(Map<String, dynamic> json) => TableRows(
        idx: json["Idx"],
        color: json["Color"],
        up: json["Up"],
        down: json["Down"],
        edit: json["Edit"],
    );

    Map<String, dynamic> toJson() => {
        "Idx": idx,
        "Color": color,
        "Up": up,
        "Down": down,
        "Edit": edit,
    };
}
