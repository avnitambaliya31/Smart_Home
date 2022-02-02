import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/const_data/color_const.dart';
import 'package:smart_home/my_pages/my_second_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitchedOn = true;

  List<String> bottomBarIcon = [
    "images/home-2.png",
    "images/clock.png",
    "images/note.png",
    "images/setting.png",
  ];
  List<String> bottomBarIconName = [
    "",
    "",
    "",
    "",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundColors,
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "My Home",
              style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Controlers",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: darkFontcolor),
                  ),
                  Icon(
                    Icons.more_horiz_outlined,
                    color: fontcolors,
                  )
                ],
              ),
            ),
            ControllContainer(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Devices",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: darkFontcolor),
                  ),
                  Icon(
                    Icons.more_horiz_outlined,
                    color: fontcolors,
                  )
                ],
              ),
            ),
            DevicesData(isSwitchedOn: isSwitchedOn)
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              items: List.generate(4, (index) {
                return BottomNavigationBarItem(
                    backgroundColor: Color(0xFF2E3034),
                    icon: Center(
                      child: Image.asset(
                        bottomBarIcon[index],
                        color: currentIndex == index
                            ? Color(0xFF73C06F)
                            : Color(0xFFB2B2B2),
                        alignment: Alignment.center,
                        height: 25,
                      ),
                    ),
                    label: bottomBarIconName[index]);
              })),
        ));
  }
}

class ControllContainer extends StatelessWidget {
  const ControllContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (_) => MySecondPage()));
      },
      child: Container(
        height: 170,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: containerColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_upward_rounded,
                              color: Color(0xFFBC8745),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Temperature",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: containerTextColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "40",
                              style: GoogleFonts.poppins(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400,
                                  color: fontcolors),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                " °C",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: fontcolors),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Outside",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: containerTextColor),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "40",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: fontcolors),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    " °C",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: fontcolors),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class DevicesData extends StatefulWidget {
  bool isSwitchedOn;
  DevicesData({required this.isSwitchedOn});

  @override
  State<DevicesData> createState() => _DevicesDataState();
}

class _DevicesDataState extends State<DevicesData> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
          itemCount: 3,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, snapshot) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Container(
                height: 100,
                width: size.width * 0.90,
                decoration: BoxDecoration(
                    color: Color(0xFF242529),
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                    minVerticalPadding: 18,
                    leading: Icon(
                      Icons.lightbulb_outline_rounded,
                      size: 35,
                      color: Color(0xFF6D6F73),
                    ),
                    title: Text(
                      "Smart Lights",
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA3A4A8)),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Living room ",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF626164)),
                          ),
                          TextSpan(
                            text: " -  4 devices",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFA3A4A8)),
                          )
                        ]),
                      ),
                    ),
                    trailing: SizedBox(
                      width: 80,
                      child: FlutterSwitch(
                        activeColor: Color(0xFF68B768),
                        inactiveColor: Color(0xFF42434C),
                        width: 60,
                        height: 30,
                        value: widget.isSwitchedOn,
                        onToggle: (value) {
                          setState(() {
                            widget.isSwitchedOn = value;
                          });
                        },
                      ),
                    )),
              ),
            );
          }),
    );
  }
}
