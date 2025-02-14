import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'JenniferWuzHere JessicaWasHere'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChickensPage()),
        );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ChickensPage extends StatefulWidget {
  @override
  _ChickensPageState createState() => _ChickensPageState();
}

class _ChickensPageState extends State<ChickensPage> {
  final List<String> chickenImages = [
    'assets/blue-chicken.png', 'assets/blue-chicken.png', 'assets/blue-chicken.png', 'assets/blue-chicken.png',
    'assets/void-chicken.png', 'assets/void-chicken.png', 'assets/void-chicken.png', 'assets/void-chicken.png',
    'assets/white-chicken-left.png', 'assets/white-chicken-left.png',
    'assets/white-chicken-right.png', 'assets/white-chicken-right.png',
  ];
  final Random _random = Random();
  List<Offset> positions = [];
  List<Offset> velocities = [];
  final double speed = 20.0;
  double screenWidth = 0;
  double screenHeight = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        screenWidth = MediaQuery.of(context).size.width;
        screenHeight = MediaQuery.of(context).size.height;
        _initializePositions();
        _startAnimationLoop();
      });
    });
  }

  void _initializePositions() {
    if (screenWidth == 0 || screenHeight == 0) return;
    positions = List.generate(chickenImages.length, (index) => _randomOffset());
    velocities = List.generate(chickenImages.length, (index) => _randomVelocity());
  }

  Offset _randomOffset() {
    return Offset(
      _random.nextDouble() * (screenWidth - 50),
      _random.nextDouble() * (screenHeight - 50),
    );
  }

  Offset _randomVelocity() {
    return Offset(
      (_random.nextDouble() - 0.5) * speed * 2,
      (_random.nextDouble() - 0.5) * speed * 2,
    );
  }

  void _startAnimationLoop() {
    _timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      if (!mounted || positions.isEmpty || screenWidth == 0 || screenHeight == 0) return;
      setState(() {
        for (int i = 0; i < positions.length; i++) {
          double newX = positions[i].dx + velocities[i].dx;
          double newY = positions[i].dy + velocities[i].dy;

          if (newX <= 0 || newX >= screenWidth - 50) {
            velocities[i] = Offset(-velocities[i].dx, velocities[i].dy);
            newX = newX.clamp(0, screenWidth - 50);
          }
          if (newY <= 0 || newY >= screenHeight - 50) {
            velocities[i] = Offset(velocities[i].dx, -velocities[i].dy);
            newY = newY.clamp(0, screenHeight - 50);
          }

          positions[i] = Offset(newX, newY);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    if (positions.isEmpty || screenWidth == 0 || screenHeight == 0) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Stack(
        children: List.generate(chickenImages.length, (index) {
          return AnimatedPositioned(
            duration: Duration(milliseconds: 30),
            left: positions[index].dx,
            top: positions[index].dy,
            child: Image.asset(
              chickenImages[index],
              width: 50,
              height: 50,
            ),
          );
        }),
      ),
    );
  }
}
