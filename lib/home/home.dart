import 'package:flutter/material.dart';
import 'package:muslam_app/home/tabs/ahadeth/ahadeth_screen.dart';
import 'package:muslam_app/home/tabs/sebha/sebha_screen.dart';
import 'package:muslam_app/home/tabs/settings/settings.dart';
import 'package:muslam_app/my_theme.dart';
import 'package:muslam_app/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'tabs/mosha/moshaf_screen.dart';
import 'tabs/radio/radio_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  // ignore: library_private_types_in_public_api
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  // Define the content for each tab
  final List<Widget> children = [
    MoshafScreen(), // Replace with your actual widget for Moshaf
    AhadethScreen(), // Replace with your actual widget for Ahadeth
    SebhaScreen(), 
    RadioScreen(),
    SettingsScreen(), 
  ];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.getBackgroundColor(),
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent, // Make Scaffold background transparent
          appBar: AppBar(
            leading: null,
            centerTitle: true,
           title: Text(AppLocalizations.of(context)!.appBarTitle,style: Theme.of(context).textTheme.bodyLarge,),
        backgroundColor: Colors.transparent,
      ),
          
          body: children[currentIndex], // Display the selected content
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex, // Set the current index
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                                backgroundColor: MyThemeData.colorGold,
                icon: ImageIcon(AssetImage('assets/images/moshaf.png')),
                label: 'Moshaf',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/ahadeth.png')),
                label: 'Ahadeth',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                label: 'Sebha',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/radio.png')),
                label: 'Radio',
              ),
               BottomNavigationBarItem(
                                backgroundColor: MyThemeData.colorGold,
                icon:Icon( Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

