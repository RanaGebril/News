import 'package:flutter/material.dart';
import 'package:news/API_manger.dart';
import 'package:news/APPColors.dart';
import 'package:news/SourceResponse.dart';

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
          body: FutureBuilder<SourceResponse?>(
            future: ApiManger.getSources(), // the function returns future object
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              }
              else if(snapshot.hasError){// catch client error in parsing
                return Column(
                  children: [
                    Text("Something went error"),
                    ElevatedButton(onPressed: (){},
                        child: Text("Try again"))
                  ],
                );
              }


              //response => success , error
              //error
              if(snapshot.data!.status != "ok"){  //server error
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.message!),
                    ElevatedButton(onPressed: (){},
                        child: Text("Try again"))
                  ],
                );
              }

              //success
              var sorcesList = snapshot.data!.sources!;
              return ListView.builder(itemBuilder: (context, index) {
                return Text(sorcesList[index].name??"");
              },
              itemCount: sorcesList.length,);
            },

          ),
        )
      ],
    );
  }
}
