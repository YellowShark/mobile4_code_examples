import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool expanded = false;
  bool visible = false;
  double fontSize = 16;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(_createRoute());
              },
              child: const Text('Go')),
          TextButton(
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: const Text('Press')),
          Center(
            child: Container(
              width: 300,
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _title,
                  _options,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _title => const Text(
        'Text',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      );

  Widget get _options => AnimatedContainer(
        height: expanded ? (56 * (items.length + 1)).toDouble() : 0,
        duration: const Duration(milliseconds: 400),
        onEnd: () {
          setState(() {
            visible = !visible;
          });
        },
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 400),
          opacity: visible ? 1 : 0,
          onEnd: () {
            setState(() {
              fontSize = visible ? fontSize * 2 : fontSize / 2;
            });
          },
          child: SingleChildScrollView(
            child: Column(
              children: items
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 56,
                          child: Text(
                            e,
                            style: TextStyle(fontSize: fontSize),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      );

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}
