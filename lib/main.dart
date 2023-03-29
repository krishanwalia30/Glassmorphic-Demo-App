import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlassApp(
      theme: GlassThemeData(
        blur: 20,
      ),
      home: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.network(
                        "https://images.unsplash.com/photo-1482189349482-3defd547e0e9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHdpbmRvd3MlMjAxMSUyMHdhbGxwYXBlciUyMGRhcmt8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60")
                    .image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: GlassAppBar(
            border: 0,
            title: const GlassText(
              'Glass Morphic App Demo',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            actions: [
              IconButton(
                icon: const GlassIcon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const GlassIcon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlassListTile(
                  border: 0,
                  leading: const GlassIcon(Icons.search),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      hintStyle: glassTextStyle,
                    ),
                    style: glassTextStyle,
                  ),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
                GlassButton(
                    border: 0,
                    blur: 10,
                    linearGradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.5),
                        Colors.blue.withOpacity(0.4),
                      ],
                    ),
                    onPressed: () {
                      showGlassBottomSheet(
                        blur: 2,
                        context: context,
                        child: const Center(
                          child: GlassText("Hello I am a Glass Bottom Sheet",
                              fontSize: 20),
                        ),
                      );
                    },
                    child: const GlassText("Button")),
              ],
            ),
          ),
          bottomNavigationBar: GlassBottomBar(
            items: [
              GlassBottomBarItem(
                icon: const Icon(Icons.home),
                title: const GlassText("Home"),
                selectedGradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.5),
                    Colors.yellow.withOpacity(0.5),
                    Colors.red.withOpacity(0.5),
                  ],
                ),
              ),
              GlassBottomBarItem(
                icon: const Icon(Icons.search),
                title: const GlassText("Search"),
                selectedGradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.5),
                    Colors.yellow.withOpacity(0.5),
                    Colors.red.withOpacity(0.5),
                  ],
                ),
              ),
              GlassBottomBarItem(
                icon: const Icon(Icons.settings),
                title: const GlassText("Settings"),
                selectedGradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.5),
                    Colors.yellow.withOpacity(0.5),
                    Colors.red.withOpacity(0.5),
                  ],
                ),
              ),
            ],
            onTap: (i) {
              setState(() {
                index = i;
              });
            },
            currentIndex: index,
          ),
        )
      ],
    );
  }
}
