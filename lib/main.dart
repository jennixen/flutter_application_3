import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'JenniferWuzHere JessicaWasHere'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          // The main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 60),
                const Text(
                  'Mixing... mixing... mixing...',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 400,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: -30,
                        child: Image.asset(
                          'assets/wizard.png',
                          width: 300,
                          height: 300,
                        ),
                      ),
                      Image.asset(
                        'assets/cauldron.png',
                        width: 300,
                        height: 300,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Positioned "Next" button at the bottom right
          Positioned(
            bottom: 30,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the next page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NextPage(),
                  ),
                );
              },
              child: const Text("Next"),
            ),
          ),
        ],
      ),
    );
  }
}

// Next page with same content + dog image on the right side
class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Next Page'),
      ),
      body: Stack(
        children: <Widget>[
          // The main content with images
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 60),
                const Text(
                  'Oh hi doggy!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Stack widget for images
                SizedBox(
                  height: 400,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Wizard and cauldron remain centered
                      Positioned(
                        top: -30,
                        child: Image.asset(
                          'assets/wizard.png',
                          width: 300,
                          height: 300,
                        ),
                      ),
                      Image.asset(
                        'assets/cauldron.png',
                        width: 300,
                        height: 300,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: -200,
            bottom: -200, 
            child: Image.asset(
              'assets/dog.png',
              width: 1500, 
              height: 1500,
            ),
          ),

          Positioned(
            bottom: 30,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the next page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WaitOhNoPage(),
                  ),
                );
              },
              child: const Text("Next"),
            ),
          ),
        ],
      ),
    );
  }
}

// New page with dialogue "Wait oh no!"
class WaitOhNoPage extends StatefulWidget {
  const WaitOhNoPage({super.key});

  @override
  State<WaitOhNoPage> createState() => _WaitOhNoPageState();
}

class _WaitOhNoPageState extends State<WaitOhNoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Wait Oh No!'),
      ),
      body: Stack(
        children: <Widget>[
          // The main content with images
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 60),
                const Text(
                  'Wait oh no!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Stack widget for images
                SizedBox(
                  height: 400,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Wizard and cauldron remain centered
                      Positioned(
                        top: -30,
                        child: Image.asset(
                          'assets/wizard.png',
                          width: 300,
                          height: 300,
                        ),
                      ),
                      Image.asset(
                        'assets/cauldron.png',
                        width: 300,
                        height: 300,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: -200,
            bottom: -200, 
            child: Image.asset(
              'assets/dog.png',
              width: 1500, 
              height: 1500,
            ),
          ),

          Positioned(
            bottom: 30,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the next page (if any)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChickensPage(),
                  ),
                );
              },
              child: const Text("Next"),
            ),
          ),
        ],
      ),
    );
  }
}

class ChickensPage extends StatefulWidget {
  const ChickensPage({super.key});

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
