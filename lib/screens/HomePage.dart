import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/animations/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[100],
          brightness: Brightness.light,
          leading: Icon(null),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_basket),
              color: Colors.black,
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: FadeAnimation(
                          1,
                          Text(
                            'Food Delivery',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          FadeAnimation(
                              1, CategoryList(isActive: true, title: 'Pizza')),
                          FadeAnimation(1,
                              CategoryList(isActive: false, title: 'Burger')),
                          FadeAnimation(
                              1, CategoryList(isActive: false, title: 'Wings')),
                          FadeAnimation(1,
                              CategoryList(isActive: false, title: 'Desert')),
                          FadeAnimation(
                              1, CategoryList(isActive: true, title: 'Salad')),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              FadeAnimation(
                  1,
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Free Delivery',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FadeAnimation(
                        1.4, makeItem(image: 'assets/images/one.jpg')),
                    FadeAnimation(
                        1.6, makeItem(image: 'assets/images/three.jpg')),
                    FadeAnimation(
                        1.8, makeItem(image: 'assets/images/two.jpg')),
                  ],
                ),
              )),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }

  Widget CategoryList({bool? isActive, String? title}) {
    return AspectRatio(
      aspectRatio: isActive! ? 3 : 2.5 / 1,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: isActive ? Colors.yellow : Colors.white,
            borderRadius: BorderRadius.circular(50)),
        child: Text(
          title!,
          style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[500],
              fontSize: 18,
              fontWeight: isActive! ? FontWeight.bold : FontWeight.w100),
        ),
      ),
    );
  }

  Widget makeItem({String? image}) {
    return AspectRatio(
      aspectRatio: 1 / 1.4,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: AssetImage(image!), fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient:
                    LinearGradient(begin: Alignment.bottomCenter, colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ])),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$ 15.00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Vegetarian Pizza",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
