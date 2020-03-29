import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grupo de Risco',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Grupo de Risco'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'lib/images/covid19.png',
            height: 20.0,
          ),
          backgroundColor: Color(0xff07213B),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 15.0, 14.0, 0.0),
            child: Column(
              children: <Widget>[
                Text("Grupo de Risco",
                    style: TextStyle(fontSize: 18.0, color: Colors.deepPurple)),
                Padding(padding: EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 0.0)),
                TextFormField(
                    style: TextStyle(fontSize: 18.0),
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    autofocus: false,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.blue)),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Informe sua idade:",
                    )),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: false,
                      onChanged: (bool value) {},
                    ),
                    Text(
                      "Possui Algum tipo de doença?",
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Row(children: <Widget>[
                  Checkbox(
                    value: false,
                    onChanged: (bool value) {},
                  ),
                  Text("Possui Algum tipo de doença?"),
                ]),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                  width: double.infinity,
                  height: 70.0,
                  child: RaisedButton(
                    onPressed: () {},
                    elevation: 5.0,
                 shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)
                ),
                    child: Text("Verificar"),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
