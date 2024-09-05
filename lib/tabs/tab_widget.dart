import 'package:flutter/material.dart';
import 'package:news/API_manger.dart';
import 'package:news/APPColors.dart';
import 'package:news/SourceResponse.dart';
import 'package:news/tabs/tab_item.dart';

class TabWidget extends StatefulWidget {
  TabWidget({super.key});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int slectedTabIndex=0;

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourceResponse?>(
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
        return DefaultTabController(
            length: sorcesList.length,
            child:TabBar(
             onTap: (index) {
               slectedTabIndex=index;
               //print(slectedTabIndex);
               setState(() {

               });
             },
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                tabs:
                //to convert from source to widget
                sorcesList.map((s) => TabItem(source: s,
                  isSelected: sorcesList.elementAt(slectedTabIndex)==s
                      ?true
                  :false,
                )).toList()
            )
        );
      },

    );
  }
}
