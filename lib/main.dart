import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Spinbox Example'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SpinBox(
              value: 10,
              decoration: const InputDecoration(labelText: 'Control'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SpinBox(
              value: 10,
              decoration: const InputDecoration(labelText: 'Material State Property'),
              iconColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.grey;
                  }
                  if (states.contains(MaterialState.error)) {
                    return Colors.red;
                  }
                  if (states.contains(MaterialState.focused)) {
                    return Colors.green;
                  }
                  return Colors.blue;
                }
              ),
            ),
          ),
          SpinBoxTheme(
            data: SpinBoxThemeData(
              iconColor: MaterialStateProperty.resolveWith((states) {
                return Colors.red;
              })
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SpinBox(
                    value: 10,
                    decoration: const InputDecoration(labelText: 'Inherited Theme 1'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SpinBox(
                    value: 10,
                    decoration: const InputDecoration(labelText: 'Inherited Theme 2'),
                  ),
                ),
              ]
            )
          ),
        ],
      ),
    );
  }

}
