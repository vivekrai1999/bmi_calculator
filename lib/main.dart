import 'package:bmi_calculator/sheetContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './gender.dart';

import './sheetContent.dart';
import './age.dart';

void main() {
  runApp(BmiCalculator());
}

class BmiCalculator extends StatefulWidget {
  BmiCalculator();

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int counter = 0;
  double feet = 0;
  double inch = 0;

  void _showmodalbottomsheet(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        backgroundColor: const Color.fromRGBO(41, 128, 185, 1.0),
        context: context,
        builder: (_) {
          return SheetContent((feet / 3.281) + (inch / 39.37), counter);
        });
  }

  void incCounter() {
    setState(() {
      counter += 1;
    });
  }

  void decCounter() {
    setState(() {
      if (counter > 0) {
        counter -= 1;
      }
    });
  }

  void icnFeet() {
    setState(() {
      if (feet < 10) {
        feet += 1;
      }
    });
  }

  void decFeet() {
    setState(() {
      if (feet > 0) {
        feet -= 1;
      }
    });
  }

  void incinch() {
    setState(() {
      if (inch < 12) {
        inch += 1;
      }
    });
  }

  void decinch() {
    setState(() {
      if (inch > 0) {
        inch -= 1;
      }
    });
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Ubuntu',
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(19, 15, 64, 1),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromRGBO(19, 15, 64, 0.4),
          ),
          backgroundColor: Color.fromRGBO(19, 15, 64, 1),
          elevation: 0,
          title: const Text(
            'BMI Calculator',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Gender(),
                const SizedBox(
                  height: 15,
                ),
                Builder(builder: (context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          offset: Offset(-6.0, -6.0),
                          blurRadius: 16.0,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: Offset(6.0, 6.0),
                          blurRadius: 16.0,
                        ),
                      ],
                      color: Color.fromRGBO(48, 51, 107, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Feet',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              feet.toStringAsFixed(0),
                              style: const TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.1),
                                          offset: Offset(-6.0, -6.0),
                                          blurRadius: 16.0,
                                        ),
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          offset: Offset(6.0, 6.0),
                                          blurRadius: 16.0,
                                        ),
                                      ],
                                      color: Color.fromRGBO(48, 51, 107, 1),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: IconButton(
                                    onPressed: () {
                                      decFeet();
                                    },
                                    icon: const Icon(Icons.remove),
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.1),
                                          offset: Offset(-6.0, -6.0),
                                          blurRadius: 16.0,
                                        ),
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          offset: Offset(6.0, 6.0),
                                          blurRadius: 16.0,
                                        ),
                                      ],
                                      color:
                                          const Color.fromRGBO(48, 51, 107, 1),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: IconButton(
                                    onPressed: () {
                                      icnFeet();
                                    },
                                    icon: const Icon(Icons.add),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Inch',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              inch.toStringAsFixed(0),
                              style: const TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.1),
                                          offset: Offset(-6.0, -6.0),
                                          blurRadius: 16.0,
                                        ),
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          offset: const Offset(6.0, 6.0),
                                          blurRadius: 16.0,
                                        ),
                                      ],
                                      color:
                                          const Color.fromRGBO(48, 51, 107, 1),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: IconButton(
                                    onPressed: decinch,
                                    icon: const Icon(Icons.remove),
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.1),
                                          offset: const Offset(-6.0, -6.0),
                                          blurRadius: 16.0,
                                        ),
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          offset: const Offset(6.0, 6.0),
                                          blurRadius: 16.0,
                                        ),
                                      ],
                                      color:
                                          const Color.fromRGBO(48, 51, 107, 1),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: IconButton(
                                    onPressed: incinch,
                                    icon: const Icon(Icons.add),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Builder(builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.22,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.1),
                              offset: const Offset(-6.0, -6.0),
                              blurRadius: 16.0,
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              offset: const Offset(6.0, 6.0),
                              blurRadius: 16.0,
                            ),
                          ],
                          color: const Color.fromRGBO(48, 51, 107, 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Weight (in Kg)',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: 40,
                              child: Center(
                                child: Text(
                                  counter.toString(),
                                  style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.1),
                                          offset: const Offset(-6.0, -6.0),
                                          blurRadius: 16.0,
                                        ),
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          offset: const Offset(6.0, 6.0),
                                          blurRadius: 16.0,
                                        ),
                                      ],
                                      color:
                                          const Color.fromRGBO(48, 51, 107, 1),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: decCounter,
                                      icon: const Icon(Icons.remove)),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.1),
                                          offset: Offset(-6.0, -6.0),
                                          blurRadius: 16.0,
                                        ),
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          offset: Offset(6.0, 6.0),
                                          blurRadius: 16.0,
                                        ),
                                      ],
                                      color: Color.fromRGBO(48, 51, 107, 1),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: IconButton(
                                      onPressed: incCounter,
                                      color: Colors.white,
                                      icon: const Icon(Icons.add)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                    Age(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Builder(builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          offset: Offset(-6.0, -6.0),
                          blurRadius: 16.0,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: Offset(6.0, 6.0),
                          blurRadius: 16.0,
                        ),
                      ],
                    ),
                    height: 80,
                    width: 80,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(48, 51, 107, 1),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(24),
                        ),
                        onPressed: () {
                          _showmodalbottomsheet(context);
                        },
                        child: const Text('BMI')),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
