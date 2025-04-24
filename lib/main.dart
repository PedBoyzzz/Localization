import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';//ถ้า import error ให้ flutter gen-l10n หลังจากสร้าง โฟลเดอร์ "i10n"

import 'Test.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("---- start test");
    final localizations = AppLocalizations.of(context); // ใช้ตัวนี้เป็นหลักใน Text
    if(localizations==null){
      print("---- localizations0 is null");
    }else{
      print("---- localizations0 is not null");
    }
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
        Locale('th'),
        Locale('zh'),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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

  @override
  void initState() {
    super.initState();
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context); // ใช้ตัวนี้เป็นหลักใน Text
    if(localizations==null){
      print("---- localizations1 is null");
    }else{
      print("---- localizations1 is not null");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              localizations!.languageSelection,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _changeLocale(context, Locale('en')),
              child: Text("อังกฤษ"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _changeLocale(context, Locale('es')),
              child: Text("สเปน"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _changeLocale(context, Locale('th')),
              child: Text("ไทย"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _changeLocale(context, Locale('zh')),
              child: Text("จีน"),
            ),
            SizedBox(height: 10),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test0()),
                );
              },
              child: Text(localizations!.languageSelection),
            )
          ],
        ),
      ),

    );
  }
}
class Test0 extends StatefulWidget {
  const Test0({super.key});
  @override
  State<Test0> createState() => _Test0();
}
class _Test0 extends State<Test0> {
  @override
  void initState() {
    super.initState();
    print("------_Test0 init");
  }
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context); // ใช้ตัวนี้เป็นหลักใน Text
    if(localizations==null){
      print("---- localizations0 is null");
    }else{
      print("---- localizations0 is not null");
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