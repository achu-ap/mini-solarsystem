
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Solarsystem(),
  ));
}

class Solarsystem extends StatefulWidget {
  Solarsystem({super.key});

  @override
  State<Solarsystem> createState() => _SolarsystemState();
}

class _SolarsystemState extends State<Solarsystem> {
  double turns = 0;
  double turns2 = 0;
  void rotate() {
    setState(() {
      turns += 0.2;
      turns2 += 0.4;
    });
    Future.delayed(Duration(seconds: 1), rotate);
  }
  @override
  void initState(){
    super.initState();
    rotate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: AnimatedRotation(
            turns: turns,
            duration: Duration(seconds: 1),
            child: Container(
              height: 600,
              width: 600,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/sun.jpg"),
                      )),
                      SizedBox(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedRotation(
                      turns: turns,
                      duration: Duration(seconds: 1),
                      child: Container(
                        height: 130,
                        width: 130,
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  backgroundImage:AssetImage(
                                    "assets/earth.jpg",
                                  ),
                                  radius: 20,
                                )),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  radius: 15,
                               backgroundImage:AssetImage("assets/moon.jpg"),
                                )),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        // floatingActionButton: ElevatedButton(
        //   onPressed: () {
        //     setState(() {
        //       rotate();
        //     });
        //   },
        //   child: Icon(Icons.add),
        // ),
        );
  }
}
