import 'package:flutter/material.dart';
import 'package:news/APPColors.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName="home";
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
          ),
          child: Image.asset("assets/images/pattern.png",
          fit: BoxFit.cover
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("News App"),
          ),
          drawer: Drawer(),
        )
      ],
    );
  }
}
