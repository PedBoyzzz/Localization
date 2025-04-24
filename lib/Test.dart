import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'main.dart';
class Test extends StatefulWidget {
  const Test({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Test> createState() => _Test();
}
void _changeLocale(BuildContext context, Locale newLocale) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (BuildContext context) => Localizations.override(
        context: context,
        locale: newLocale,
        child: MyHomePage(title: '',),
      ),
    ),
  );
}
class _Test extends State<Test> {
  @override
  void initState() {
    super.initState();
    print("------_Test init");
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final localizations = AppLocalizations.of(context); // ใช้ตัวนี้เป็นหลักใน Text
    if(localizations==null){
      print("---- localizations2 is null");
    }else{
      print("---- localizations2 is not null");
    }
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("widget.title"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              localizations!.nextPage,
              style: TextStyle(fontSize: 18),
            ),

          ],
        ),
      ),

    );
  }
}