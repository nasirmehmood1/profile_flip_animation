import 'dart:math';

import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeWidget();
  }
}

class _HomeWidget extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationFlipFirst;
  late Animation<double> _animationFlipSecond;
  late Animation<double> _animationScale;



  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if(status==AnimationStatus.completed){
              _animationController.reverse();
            }
            setState(() {});
          });
     _animationScale = Tween<double>(begin: 0.0, end: pi*0.32).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.0, 0.3)));
    _animationFlipFirst = Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.4, 0.6)));
    _animationFlipSecond = Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.6, 0.8)));
  }

  void _startAnimation() {
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Personal Data'),
      ),
      body: Center(
        child: Transform(transform: Matrix4.identity()..scale(_animationScale.value),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: const Alignment(-0.45, 0),
                child: Container(
                  height: height * 0.2,
                  width: width * 0.1,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.pinkAccent, Colors.orangeAccent])),
                  alignment: Alignment.center,
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(_animationFlipSecond.value * 3.14 / 2),
                alignment: Alignment.center,
                child: Align(
                  alignment: const Alignment(-0.05, 0),
                  child: Container(
                      height: height * 0.2,
                      width: width * 0.25,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                spreadRadius: 3,
                                blurStyle: BlurStyle.inner,
                                offset: Offset(-1, -1))
                          ],
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(5, 5))),
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Email: ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('Imnasir549@gmail.com'),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'phone Number: ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('098765432'),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(_animationFlipFirst.value * 3.14 / 2),
                alignment: Alignment.center,
                child: Align(
                  alignment: const Alignment(0.64, 0),
                  child: Container(
                      height: height * 0.2,
                      width: width * 0.25,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                spreadRadius: 3,
                                blurStyle: BlurStyle.inner,
                                offset: Offset(-1, -1))
                          ],
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(5, 5))),
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Designation: ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('App developer'),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Project: ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('Cofee Grain App'),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
      FloatingActionButton(
        onPressed: _startAnimation,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      

    );
  }
}
