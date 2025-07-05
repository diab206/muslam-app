import 'package:flutter/material.dart';
import 'package:muslam_app/home/sura_name_details/sura_name_details.dart';

// ignore: camel_case_types, use_key_in_widget_constructors, must_be_immutable
class suraNameItem extends StatelessWidget {
  String name;
  int index;
  // ignore: use_key_in_widget_constructors
  suraNameItem(this.name,this.index);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
      Navigator.pushNamed(context, SuraNameDetails.routeName,arguments: suraDetialsArgs(name,index));
      },
      child: Text(name,
      textAlign: TextAlign.center, 
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),),
    );
  }
}