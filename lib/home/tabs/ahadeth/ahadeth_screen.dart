import 'package:flutter/material.dart';
import 'package:muslam_app/home/tabs/ahadeth/hadeth_name_item.dart';
import 'package:muslam_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class AhadethScreen extends StatelessWidget {
   List  <String> hadethName=
[
  'الحديث الاول', 'الحديث الثاني', 'الحديث الثالث', 'الحديث الرابع', 'الحديث الخامس',
  'الحديث السادس', 'الحديث السابع', 'الحديث الثامن', 'الحديث التاسع', 'الحديث العاشر',
  'الحديث الحادي عشر', 'الحديث الثاني عشر', 'الحديث الثالث عشر', 'الحديث الرابع عشر', 'الحديث الخامس عشر',
  'الحديث السادس عشر', 'الحديث السابع عشر', 'الحديث الثامن عشر', 'الحديث التاسع عشر', 'الحديث العشرون',
  'الحديث الحادي والعشرون', 'الحديث الثاني والعشرون', 'الحديث الثالث والعشرون', 'الحديث الرابع والعشرون', 'الحديث الخامس والعشرون',
  'الحديث السادس والعشرون', 'الحديث السابع والعشرون', 'الحديث الثامن والعشرون', 'الحديث التاسع والعشرون', 'الحديث الثلاثون',
  'الحديث الحادي والثلاثون', 'الحديث الثاني والثلاثون', 'الحديث الثالث والثلاثون', 'الحديث الرابع والثلاثون', 'الحديث الخامس والثلاثون',
  'الحديث السادس والثلاثون', 'الحديث السابع والثلاثون', 'الحديث الثامن والثلاثون', 'الحديث التاسع والثلاثون', 'الحديث الأربعون',
  'الحديث الحادي والأربعون', 'الحديث الثاني والأربعون', 'الحديث الثالث والأربعون', 'الحديث الرابع والأربعون', 'الحديث الخامس والأربعون',
  'الحديث السادس والأربعون', 'الحديث السابع والأربعون', 'الحديث الثامن والأربعون', 'الحديث التاسع والأربعون', 'الحديث الخمسون'
];


  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return  Container(
      width: double.infinity,
      child: Column(
        children: [
          
          Image.asset(
            'assets/images/hadeth_home.png',
          ),
          Divider(
            color: MyThemeData.colorGold,
            thickness: 2,
          ),
          Text(
  AppLocalizations.of(context)!.ahadethNameItem,
  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: MyThemeData.colorGold),
),
           Divider(
            color: MyThemeData.colorGold,
            thickness: 2,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) =>  Divider(
                endIndent: 30,
                indent: 30,
                color: MyThemeData.colorGold,
                thickness: 2,
              ),  
              itemCount: hadethName.length,
              itemBuilder: (context, index) {
                // ignore: unnecessary_string_interpolations
                return HadethNameItem('${hadethName[index]}', index);
              },
            ),
          ),
        ],
      ),
    );
  }
}