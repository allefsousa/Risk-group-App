import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bloc/calculateBloc.dart';

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
  var bloc = new CalculateBloc();

  void _incrementCounter() {
    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      setState(() {
        bloc.calculate();
        bloc.clearControls();
      });
    } else {
      print('Form is invalid');
    }
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
                    style: TextStyle(fontSize: 18.0, color: Color(0xff07213B))),
                Padding(padding: EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 0.0)),
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                            validator: (value) => value.isEmpty
                                ? 'Campo não pode ser vazio'
                                : null,
                            style: TextStyle(fontSize: 18.0),
                            keyboardType: TextInputType.number,
                            autocorrect: false,
                            autofocus: false,
                            controller: bloc.idadeInformada,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.blue)),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Informe sua idade:",
                            )),
                      ],
                    )),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: bloc.doencaCronica,
                      onChanged: (bool value) {
                        setState(() {
                          bloc.doencaCronica = value;
                        });
                      },
                    ),
                    Text(
                      "Possui Algum tipo de doença cronica?",
                      textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 15.0, color: Color(0xff07213B))
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                  width: double.infinity,
                  height: 70.0,
                  child: RaisedButton(
                    color: Color(0xff07213B),
                    onPressed: () {
                      validateAndSave();
                    },
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    child: Text(
                      "Calcular Risco",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    bloc.result,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
