import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_home/const_data/color_const.dart';

class MyThirdPage extends StatefulWidget {
  MyThirdPage({Key? key}) : super(key: key);

  @override
  State<MyThirdPage> createState() => _MyThirdPageState();
}

class _MyThirdPageState extends State<MyThirdPage> {
  List<Color> gradientColor = [Color(0xFF6D75CD), Color(0xFF7398CD)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
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
                      Text(
                        "Solar panels",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      Container(),
                      Container()
                    ],
                  ),
                  Text(
                    "Today",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFFB2B2B2)),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "32.059",
                    style: GoogleFonts.poppins(
                        fontSize: 50,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Daily balance",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFFB2B2B2)),
                  ),
                ],
              ),
              const SizedBox(
                height: 55,
              ),
              chartDataContainer(context),
              const SizedBox(
                height: 35,
              ),
              dataList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget dataList() {
    return Container(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                height: 180,
                width: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF282A2E)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 5.0,
                      animation: true,
                      percent: 0.7,
                      center: new Text("78%",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Color(0xFF6D75CD),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Capacity",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "6k W",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFA3A4A9)),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Container chartDataContainer(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: LineChart(LineChartData(
        axisTitleData: FlAxisTitleData(
            show: true,
            bottomTitle: AxisTitle(textStyle: TextStyle(color: Colors.red))),
        gridData: FlGridData(
          show: true,
          verticalInterval: 20,
          drawHorizontalLine: false,
          getDrawingVerticalLine: (value) {
            return FlLine(
              strokeWidth: 1,
              color: Color(0xFF282A2E),
            );
          },
        ),
        minX: 0,
        minY: 0,
        maxX: 100,
        maxY: 10,
        titlesData: FlTitlesData(show: false),
        lineBarsData: [
          LineChartBarData(
              belowBarData: BarAreaData(
                  show: true,
                  colors:
                      gradientColor.map((e) => e.withOpacity(0.2)).toList()),
              spots: [
                FlSpot(0, 2),
                FlSpot(15, 2.3),
                FlSpot(22, 3),
                FlSpot(30, 5),
                FlSpot(35, 5.5),
                FlSpot(40, 5),
                FlSpot(50, 3.5),
                FlSpot(60, 5),
                FlSpot(70, 7),
                FlSpot(80, 6),
                FlSpot(90, 5),
                FlSpot(100, 6.3),
              ],
              isCurved: true,
              barWidth: 3,
              dotData: FlDotData(show: false),
              isStepLineChart: false,
              colors: [Color(0xFF6D75CD), Color(0xFF7398CD)]),
        ],
      )),
    );
  }
}
