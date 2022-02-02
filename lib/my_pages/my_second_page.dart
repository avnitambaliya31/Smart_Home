import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/const_data/color_const.dart';
import 'package:smart_home/my_pages/my_third_page.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MySecondPage extends StatefulWidget {
  MySecondPage({Key? key}) : super(key: key);

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Temperature",
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Living room",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFB2B2B2)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 110.0),
                  child: temperatureMeter(),
                ),
              ],
            ),
            bottomData(context)
          ],
        ),
      ),
    );
  }

  Widget temperatureMeter() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 12,
        ),
        SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 30,
              axisLabelStyle: GaugeTextStyle(color: Color(0xFF626164)),
              radiusFactor: 1.0,
              axisLineStyle: AxisLineStyle(
                thickness: 1,
                cornerStyle: CornerStyle.bothCurve,
              ),
              endAngle: 0,
              startAngle: 180,
              labelsPosition: ElementsPosition.outside,
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 0,
                  endValue: 30,
                  gradient: const SweepGradient(
                    colors: [
                      Color(0xFF73C3EE),
                      Color(0xFF92CF7B),
                      Color(0xFFE8AE7E),
                      Color(0xFFE57A6E),
                    ],
                    startAngle: 20,
                    endAngle: 30,
                    center: Alignment.center,
                  ),
                ),
              ],
              pointers: const <GaugePointer>[
                NeedlePointer(value: 90)
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Container(
                    alignment: Alignment.center,
                    height: 235,
                    width: 235,
                    decoration: const BoxDecoration(
                        color: Color(0xFF25262A), shape: BoxShape.circle),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "20",
                              style: GoogleFonts.poppins(
                                  fontSize: 60,
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
                        Text(
                          "Heat set to",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFB2B2B2)),
                        )
                      ],
                    ),
                  ),
                )
              ])
        ]),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/cloud-plus.png"),
            const SizedBox(
              width: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: fontcolors),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
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
            const SizedBox(
              width: 10,
            ),
            Text("Outside",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFBCBCBC),
                ))
          ],
        ),
      ],
    );
  }

  Column bottomData(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "images/vector.png",
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (_) => MyThirdPage()));
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 160),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Color(0xFF393D45), shape: BoxShape.circle),
                  child: Icon(
                    Icons.power_settings_new_sharp,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 40, right: 35),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                      Text(
                        "Current",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF626164)),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                      Text(
                        "Inside Humidity",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF626164)),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
