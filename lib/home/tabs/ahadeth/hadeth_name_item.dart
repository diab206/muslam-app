import 'package:flutter/material.dart';
import 'package:muslam_app/home/hadeth_name_details/hadeth_name_details.dart';

// ignore: camel_case_types, use_key_in_widget_constructors, must_be_immutable
class HadethNameItem extends StatelessWidget {
  String name;
  int index;
  // ignore: use_key_in_widget_constructors
  HadethNameItem(this.name,this.index);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
      Navigator.pushNamed(context, HadethNameDetails.routeName,arguments: hadethDetialsArgs(name,index));
      },
      child: Text(name,
      textAlign: TextAlign.center, 
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),),
    );
  }
}