import 'package:flutter/material.dart';

class SheetContent extends StatefulWidget {
  double height;
  int weight;
  SheetContent(this.height, this.weight);

  @override
  State<SheetContent> createState() => _SheetContentState();
}

class _SheetContentState extends State<SheetContent> {
  int weightm = 0;
  double heightm = 0;
  double bmi = 0;
  var result;
  var desc;

  void initState() {
    super.initState();
    weightm = widget.weight;
    heightm = widget.height;

    bmi = weightm / (heightm * heightm);
    if (bmi < 18.5) {
      result = "(Underweight)";
      desc =
          "BMI of less than 18.5 indicates that you are underweight, so you may need to put on some weight. You are recommended to ask your doctor or a dietitian for advice.";
    } else if (18.5 < bmi && bmi < 24.9) {
      result = "(Healthy)";
      desc =
          "BMI of 18.5-24.9 indicates that you are at a healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.";
    } else if (25.0 < bmi && bmi < 29.9) {
      result = "(Overweight)";
      desc =
          "BMI of 25-29.9 indicates that you are slightly overweight. You may be advised to lose some weight for health reasons. You are recommended to talk to your doctor or a dietitian for advice.";
    } else {
      result = "(Obese)";
      desc =
          "BMI of over 30 indicates that you are heavily overweight. Your health may be at risk if you do not lose weight. You are recommended to talk to your doctor or a dietitian for advice.";
    }
  }

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Your BMI is',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(bmi.toStringAsFixed(1) + ' kg/m²',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(
              height: 10,
            ),
            Text(result,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(desc,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(Icons.share)),
                IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(Icons.replay)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
