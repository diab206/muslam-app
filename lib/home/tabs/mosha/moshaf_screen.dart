import 'package:flutter/material.dart';
import 'package:muslam_app/home/tabs/mosha/sura_name_item.dart';
import 'package:muslam_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class MoshafScreen extends StatelessWidget {
  List  <String> suraName=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
            ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
            ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
            ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
            ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
            ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
            ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
            ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
            ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
            "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return  Container(
      width: double.infinity,
      child: Column(
        children: [
          
          Image.asset(
            'assets/images/moshaf_home.png',
          ),
          Divider(
            color: MyThemeData.colorGold,
            thickness: 2,
          ),
           Text(
  AppLocalizations.of(context)!.suraNameItem,
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
              itemCount: suraName.length,
              itemBuilder: (context, index) {
                // ignore: unnecessary_string_interpolations
                return suraNameItem('${suraName[index]}', index);
              },
            ),
          ),
        ],
      ),
    );
  }
}