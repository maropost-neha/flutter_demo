import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationDemoSate();
  }
}

class AnimationDemoSate extends State<MyApp> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        value: 50.0,
        lowerBound: 50.0,
        upperBound: 320.0,
        duration: Duration(seconds: 3),
        vsync: this);
  }

  @override
  Widget build(context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Animation Demo'),
          ),
          body: GestureDetector(
            onTap: () {
              final status = animationController.status;
              if (status == AnimationStatus.completed) {
                animationController.reverse();
              } else {
                animationController.animateTo(320.0, curve: Curves.bounceIn);
              }
            },
            child: Center(
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return Container(
                    child: child,
                    height: animationController.value,
                    width: animationController.value,
                  );
                },
                child: Container(
                  color: Colors.red,
                  constraints: BoxConstraints.expand(),
                ),
              ),
            ),
          ),
        ));
  }
}
