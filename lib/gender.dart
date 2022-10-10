import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  Gender();

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  double borderWidthMale = 0;
  double borderWidthFemale = 0;
  Color fboxColor = Color.fromARGB(0, 158, 158, 158);
  Color mboxColor = Color.fromARGB(0, 158, 158, 158);

  bool male = false;
  bool female = false;

  @override
  void _propertyChange() {
    if (male == true && female == false) {
      setState(() {
        mboxColor = Colors.white;
        fboxColor = Color.fromARGB(0, 158, 158, 158);
        borderWidthMale = 3;
        borderWidthFemale = 0;
      });
    }
    if (female == true && male == false) {
      setState(() {
        fboxColor = Colors.white;
        mboxColor = Color.fromARGB(0, 158, 158, 158);
        borderWidthFemale = 3;
        borderWidthMale = 0;
      });
    }
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            male = true;
            female = false;
            _propertyChange();
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.22,
            width: MediaQuery.of(context).size.width * 0.4,
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
                border: Border.all(
                  width: borderWidthMale,
                  color: mboxColor,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/male.png',
                  height: 60,
                  width: 60,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Male',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            female = true;
            male = false;
            _propertyChange();
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.22,
            width: MediaQuery.of(context).size.width * 0.4,
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
                border: Border.all(
                  width: borderWidthFemale,
                  color: fboxColor,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/female.png',
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Female',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
