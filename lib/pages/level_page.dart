import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LevelPage extends StatefulWidget {
  LevelPage({Key? key}) : super(key: key);

  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  double shipPosition = 145;
  double rocketPosition = 550;

  bool rocketAux = false;

  final _random = Random();

  double b1 = 360;
  double b2 = 410;
  double b3 = 500;
  double b4 = 440;
  double b5 = 360;
  double b6 = 560;
  double c1 = -60;
  double c2 = -60;
  double c3 = -60;

  late Timer timer;
  late Timer timerRocket;

  int timeMinute = 2;
  int timeSeconds = 60;

  int record = 0;

  @override
  void initState() {
    // Reloj
    timer = Timer.periodic(Duration(seconds: 1), (time) {
      setState(() {
        timeSeconds -= 1;
        if (timeMinute == 0 && timeSeconds == 0) {
          time.cancel();
          Navigator.pop(context);
        } else {
          if (timeSeconds == 0) {
            timeMinute -= 1;
            timeSeconds = 60;
          }
        }
      });
    });
    // Balloon
    Timer.periodic(Duration(milliseconds: 6), (timer) {
      rocketAux ? rocketPosition -= 5 : rocketPosition = 550;

      if (rocketPosition == -20) {
        rocketAux = false;
        rocketPosition = 550;
      }

      if ((rocketPosition < 95 && rocketPosition > 55) &&
          (c1 < shipPosition + 20 && c1 > shipPosition - 20)) {
        c1 = -60;
        rocketAux = false;
        rocketPosition = 550;
        if (record >= 10) {
          record -= 10;
        }
        if (record == 5) {
          record -= 5;
        }
      }

      if ((rocketPosition < 390 && rocketPosition > 350) &&
          (c2 < shipPosition + 20 && c2 > shipPosition - 20)) {
        c2 = -60;
        rocketAux = false;
        rocketPosition = 550;
        if (record >= 10) {
          record -= 10;
        } else if (record == 5) {
          record -= 5;
        }
      }

      if ((rocketPosition < 230 && rocketPosition > 190) &&
          (c3 < shipPosition + 20 && c2 > shipPosition - 20)) {
        c3 = -60;
        rocketAux = false;
        rocketPosition = 550;
        if (record >= 10) {
          record -= 10;
        } else if (record == 5) {
          record -= 5;
        }
      }

      if ((rocketPosition < 60 && rocketPosition > 20) &&
          (b1 < shipPosition + 20 && b1 > shipPosition - 20)) {
        b1 = 360;
        rocketAux = false;
        rocketPosition = 550;
        record += 5;
      }

      if ((rocketPosition < 170 && rocketPosition > 110) &&
          (b2 < shipPosition + 20 && b2 > shipPosition - 20)) {
        b2 = 410;
        rocketAux = false;
        rocketPosition = 550;
        record += 5;
      }

      if ((rocketPosition < 260 && rocketPosition > 220) &&
          (b3 < shipPosition + 20 && b3 > shipPosition - 20)) {
        b3 = 500;
        rocketAux = false;
        rocketPosition = 550;
        record += 5;
      }

      if ((rocketPosition < 320 && rocketPosition > 260) &&
          (b4 < shipPosition + 20 && b4 > shipPosition - 20)) {
        b4 = 440;
        rocketAux = false;
        rocketPosition = 550;
        record += 5;
      }

      if ((rocketPosition < 356 && rocketPosition > 296) &&
          (b5 < shipPosition + 20 && b5 > shipPosition - 20)) {
        b5 = 360;
        rocketAux = false;
        rocketPosition = 550;
        record += 5;
      }

      if ((rocketPosition < 476 && rocketPosition > 436) &&
          (b6 < shipPosition + 20 && b6 > shipPosition - 20)) {
        b6 = 560;
        rocketAux = false;
        rocketPosition = 550;
        record += 5;
      }

      if (c1 < 400) {
        c1 += (record > 50) ? 2.0 : 1.5;
      } else {
        c1 = -50;
      }
      if (c2 < 400) {
        c2 += (record > 50) ? 2.0 : 1.1;
      } else {
        c2 = -50;
      }
      if (c3 < 400) {
        c3 += (record > 50) ? 2.3 : 1.3;
      } else {
        c3 = -50;
      }
      if (b1 > -60) {
        b1 -= (record > 50) ? 2.0 : 0.9;
      } else {
        b1 = 360;
      }
      if (b2 > -60) {
        b2 -= (record > 50) ? 2.0 : 1.05;
      } else {
        b2 = 410;
      }
      if (b3 > -60) {
        b3 -= (record > 50) ? 2.0 : 1;
      } else {
        b3 = 500;
      }
      if (b4 > -60) {
        b4 -= (record > 50) ? 2.0 : 0.95;
      } else {
        b4 = 440;
      }
      if (b5 > -60) {
        b5 -= (record > 50) ? 2.0 : 1.3;
      } else {
        b5 = 360;
      }
      if (b6 > -60) {
        b6 -= (record > 50) ? 2.0 : 1;
      } else {
        b6 = 560;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
            colorFilter: (record > 50)
                ? ColorFilter.mode(
                    Colors.grey.withOpacity(0.7),
                    BlendMode.color,
                  )
                : null,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: rocketPosition,
              top: shipPosition + 18,
              child: Container(
                height: 50,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Image.asset("assets/rockets.png"),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: shipPosition,
              child: Container(
                height: 80,
                child: Image.asset("assets/ufo.png"),
              ),
            ),
            Positioned(
              right: 35,
              top: 5,
              child: Container(
                height: MediaQuery.of(context).size.width / 1.85,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Slider(
                    activeColor: Colors.transparent,
                    inactiveColor: Colors.transparent,
                    thumbColor: Colors.transparent,
                    value: shipPosition,
                    min: 0,
                    max: 280,
                    onChanged: (value) {
                      setState(() {
                        shipPosition = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            balloon(b1, 40, "b1"),
            balloon(b2, 140, "b2"),
            balloon(b3, 220, "b3"),
            balloon(b4, 290, "b4"),
            balloon(b5, 326, "b5"),
            balloon(b6, 456, "b6"),
            cake(c1, 75),
            cake(c2, 370),
            cake(c3, 210),
            Positioned(
              top: 10,
              right: 30,
              child: Container(
                height: 60,
                child: Text(
                  timeMinute.toString() + ":" + timeSeconds.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 20,
              child: Container(
                height: 60,
                child: Text(
                  record.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: GestureDetector(
                  onTap: () {
                    rocketAux = true;
                  },
                  onDoubleTap: () {
                    rocketAux = false;
                  },
                  child: Container(
                    child: Icon(
                      Icons.filter_center_focus_rounded,
                      color: Colors.black,
                      size: 90,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 130,
              bottom: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: GestureDetector(
                  child: Container(
                    child: Icon(
                      Icons.pause,
                      color: Colors.black,
                      size: 45,
                    ),
                  ),
                  onTap: () {
                    timer.cancel();
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Menu',
                            style: TextStyle(
                              fontSize: 25,
                              shadows: [
                                BoxShadow(
                                  blurRadius: 5.0,
                                  color: Colors.black,
                                  offset: Offset(0.0, 0.0),
                                ),
                              ],
                            ),
                          ),
                          backgroundColor: Color.fromRGBO(65, 139, 167, 1),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                ElevatedButton(
                                  child: Text(
                                    'Reanudar',
                                    style: TextStyle(
                                      fontSize: 20,
                                      shadows: [
                                        BoxShadow(
                                          blurRadius: 5.0,
                                          color: Colors.black,
                                          offset: Offset(0.0, 0.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blueGrey.withOpacity(0.5),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    timer = Timer.periodic(Duration(seconds: 1),
                                        (time) {
                                      setState(() {
                                        timeSeconds -= 1;
                                        if (timeMinute == 0 &&
                                            timeSeconds == 0) {
                                          time.cancel();
                                          Navigator.pop(context);
                                        } else {
                                          if (timeSeconds == 0) {
                                            timeMinute -= 1;
                                            timeSeconds = 60;
                                          }
                                        }
                                      });
                                    });
                                  },
                                ),
                                ElevatedButton(
                                  child: Text(
                                    'Configuracion',
                                    style: TextStyle(
                                      fontSize: 20,
                                      shadows: [
                                        BoxShadow(
                                          blurRadius: 5.0,
                                          color: Colors.black,
                                          offset: Offset(0.0, 0.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blueGrey.withOpacity(0.5),
                                  ),
                                  onPressed: () {},
                                ),
                                ElevatedButton(
                                  child: Text(
                                    'Salir',
                                    style: TextStyle(
                                      fontSize: 20,
                                      shadows: [
                                        BoxShadow(
                                          blurRadius: 5.0,
                                          color: Colors.black,
                                          offset: Offset(0.0, 0.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blueGrey.withOpacity(0.5),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/Homepage');
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget balloon(double x, double y, String b) {
    return Positioned(
      top: x,
      left: y,
      child: Container(
        height: 60,
        child: Image.asset("assets/balloon.png"),
      ),
    );
  }

  Positioned cake(double x, double y) {
    return Positioned(
      top: x,
      left: y,
      child: Container(
        height: 60,
        child: Image.asset("assets/cake.png"),
      ),
    );
  }
}
