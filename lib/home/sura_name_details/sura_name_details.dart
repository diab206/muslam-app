// ignore_for_file: unused_local_variable


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslam_app/my_theme.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class SuraNameDetails extends StatefulWidget {
static const String routeName = '/sura_name_details';

  @override
  State<SuraNameDetails> createState() => _SuraNameDetailsState();
}

class _SuraNameDetailsState extends State<SuraNameDetails> {
    List<String> verses=[];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as suraDetialsArgs;
    if(verses.isEmpty){
      loadFile(args.index);
    }
    return  Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Scaffold(
          backgroundColor: Colors.transparent, // Make Scaffold background transparent
          appBar: AppBar(
            leading: null,
            centerTitle: true,
            title: Text(
              args.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body:
          verses.isEmpty?CircularProgressIndicator():   ListView.separated(
            separatorBuilder: (context, index) =>  
            Divider(
              color: MyThemeData.colorGold,
              thickness: 1,
              endIndent: 30,
              indent: 30,
            ),
            itemCount: verses.length,
            itemBuilder: (context,index){
            return Text(verses[index],style: Theme.of(context).textTheme.bodyLarge?.
            copyWith(color:MyThemeData.colorBlack,
            letterSpacing: 0.45
            ),
            textAlign: TextAlign.center,
            
            );
          }),
          )]);
  }

  void loadFile(int index) async {
    var content = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {
      
    });
  }
}

// ignore: camel_case_types
class suraDetialsArgs {
  String name;
  int index;
  suraDetialsArgs(this.name, this.index);
}
