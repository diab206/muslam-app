import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslam_app/my_theme.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class HadethNameDetails extends StatefulWidget {
  static const String routeName = '/hadethNameItem';

  @override
  State<HadethNameDetails> createState() => HadethNameDetailsState();
}

class HadethNameDetailsState extends State<HadethNameDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as hadethDetialsArgs;
    if (verses.isEmpty) {
      loadHadethFile(args.index);
    }
    return Stack(
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
          body: verses.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: MyThemeData.colorGold,
                    thickness: 1,
                    endIndent: 30,
                    indent: 30,
                  ),
                  itemCount: verses.length,
                  itemBuilder: (context, index) {
                    return Text(
                      verses[index],
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: MyThemeData.colorBlack,
                            letterSpacing: 0.45,
                          ),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
        ),
      ],
    );
  }

  void loadHadethFile(int index) async {
    var content = await rootBundle.loadString('assets/hadeth/${index + 1}.txt');
    List<String> lines = content.split('\n');

    // Skip the first line
    if (lines.isNotEmpty) {
      lines = lines.sublist(1); // Remove the first line
    }

    setState(() {
      verses = lines;
    });
  }
}

// ignore: camel_case_types
class hadethDetialsArgs {
  String name;
  int index;
  hadethDetialsArgs(this.name, this.index);
}