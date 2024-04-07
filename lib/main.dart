import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of my application.
        // textTheme: GoogleFonts.bungeeSpiceTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quote of the Day Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of my application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  int currentPageIndex = 0;
  bool? saveSelected = false;
  int modifier = 1;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter += modifier;
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
            Card.filled(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
              // EdgeInsetGeometry: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    // No leading widget, so the title is centered.
                    // leading: Icon(Icons.album),
                    title: Text(
                      'The greatest glory in living lies not in never falling, but in rising every time we fall.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      // style: GoogleFonts.jetBrainsMono().fon,
                    ),
                    subtitle: Text(
                      '\n- Nelson Mandela',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FilledButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.share_outlined),
                        label: const Text('Share'),
                      ),
                      IconButton.filledTonal(
                        isSelected: saveSelected,
                        onPressed: () {
                          setState(() {
                            saveSelected = !saveSelected!;
                            modifier = saveSelected! ? 1 : -1;
                          });
                        },
                        icon: const Icon(Icons.bookmark_border_rounded),
                        selectedIcon: const Icon(Icons.bookmark_outlined),
                      ),
                      IconButton.filledTonal(
                        isSelected: saveSelected,
                        onPressed: () {
                          setState(() {
                            saveSelected = !saveSelected!;
                            modifier = saveSelected! ? 1 : -1;
                          });
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const CircleBorder(),
                          ),
                        ),
                        selectedIcon: const Icon(Icons.favorite_rounded),
                        icon: const Icon(Icons.favorite_border_rounded),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // const Text(
            //   'quote of the day: "Hello, World!"',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // label: Text('$_counter'), // for Extended FAB
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
        onPressed: _incrementCounter,
        tooltip: 'Refresh',
        // icon: const Icon(Icons.refresh_rounded), // for Extended FAB
        child: const Icon(Icons.refresh_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: NavigationBar(
          // indicatorShape: const CircleBorder(),

          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          // indicatorColor: Colors.amber,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home_rounded),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            // NavigationDestination(
            //   icon: Badge(child: Icon(Icons.notifications_sharp)),
            //   label: 'Notifications',
            // ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bookmark_rounded),
              icon: Icon(Icons.bookmark_border_rounded),
              // icon: Badge(
              //   label: Text('2'),
              //   child: Icon(Icons.bookmark_border_rounded),
              // ),
              label: 'Bookmarks',
            ),
          ],
        ),
      ),
    );
  }
}
