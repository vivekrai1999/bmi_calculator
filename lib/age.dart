import 'package:flutter/material.dart';

class Age extends StatefulWidget {
  const Age();

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  @override
  int counter = 0;
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

  Widget build(BuildContext context) {
    return Container(
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
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Age',
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
                    color: Colors.white),
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
                    color: const Color.fromRGBO(48, 51, 107, 1),
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                    color: Colors.white,
                    onPressed: decCounter,
                    icon: Icon(Icons.remove)),
              ),
              const SizedBox(
                width: 15,
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
                    color: const Color.fromRGBO(48, 51, 107, 1),
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                    color: Colors.white,
                    onPressed: incCounter,
                    icon: const Icon(Icons.add)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
