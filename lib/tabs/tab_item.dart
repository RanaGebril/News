import 'package:flutter/material.dart';
import 'package:news/APPColors.dart';
import 'package:news/SourceResponse.dart';
import 'package:news/my_theme_data.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isSelected;
  TabItem({required this.source,required this.isSelected ,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8),
      child: Text(source.name!,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: isSelected?AppColors.white:AppColors.primary
      ),),
      decoration: BoxDecoration(
        color: isSelected?AppColors.primary:Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColors.primary
        )
      ),
    );
  }
}
