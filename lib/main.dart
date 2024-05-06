import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentButton = 0;
  List<String> buttonList01 = [
    "https://i.pinimg.com/564x/6c/ea/ca/6ceaca2e4af25ec075b7749ac0bbfe20.jpg",
    "https://i.pinimg.com/564x/6b/a4/a2/6ba4a2e20d2d18953c58a976190053e3.jpg",
  ];
  List<String> buttonList02 = [
    "https://i.pinimg.com/564x/0a/14/80/0a14809ee4597d0e6847e683357eb32d.jpg",
    "https://i.pinimg.com/564x/2b/3d/e2/2b3de2ad001b34954a535004fe3e976c.jpg",
  ];
  List<String> buttonList03 = [
    "https://i.pinimg.com/564x/df/59/8d/df598d9a3e846f230f0aca344790eefd.jpg",
    "https://i.pinimg.com/564x/30/19/86/30198640d7547c4a6eef9b75d08019ce.jpg",
  ];
  List<String> mainList = [];
  @override
  void initState() {
// TODO: implement initState
    mainList = buttonList01;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Color(0xff050b64),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 40.0, bottom: 30.0),
                child: Text(
                  "Explora \ncon Inovatech",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mainList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return RotatedBox(
                        quarterTurns: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentButton = 2;
                                    mainList = buttonList03;
                                  });
                                },
                                child: Text("Audiculares",
                                    style: TextStyle(
                                      color: currentButton == 2
                                          ? Color(0xff07fff3)
                                          : Colors.black,
                                    )),
                              ),
                              SizedBox(
                                width: 100.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentButton = 1;
                                    mainList = buttonList02;
                                  });
                                },
                                child: Text("Scorpion",
                                    style: TextStyle(
                                      color: currentButton == 1
                                          ? Color(0xff07e2ff)
                                          : Colors.black,
                                    )),
                              ),
                              SizedBox(
                                width: 100.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentButton = 0;
                                    mainList = buttonList01;
                                  });
                                },
                                child: Text(
                                  "Compu",
                                  style: TextStyle(
                                    color: currentButton == 0
                                        ? Color(0xff07c5ff)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(20.0),
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.network(
                                    mainList[index - 1],
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text("Computadoras y mas.",
                                style: TextStyle(fontSize: 26)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 26.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Color(0xff031684),
                                ),
                                Text("Inovatech Ave.Saturno",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey))
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
