import 'package:flutter/material.dart';
import 'package:food_delivery/animations/FadeAnimation.dart';
import 'package:food_delivery/screens/HomePage.dart';
import 'package:page_transition/page_transition.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({Key? key}) : super(key: key);

  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  late Animation<double> animation;
  bool _textVisible = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation =
        Tween<double>(begin: 0.0, end: 25.0).animate(_animationController!);
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });
    _animationController!.forward().then((value) => Navigator.push(context,
        PageTransition(child: HomePage(), type: PageTransitionType.fade)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/starter-image.jpg'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(.2),
          ])),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                  .5,
                  Text(
                    'Taking Order For Delivery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                  1,
                  Text(
                    "See restaurants nearby by\nadding location",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                FadeAnimation(
                  1.7,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [Colors.yellow, Colors.orange])),
                    child: MaterialButton(
                      onPressed: () {
                        _onTap();
                      },
                      minWidth: double.infinity,
                      child: Text(
                        'Start',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                    1.7,
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Now Deliver To Your Door 24/7',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
