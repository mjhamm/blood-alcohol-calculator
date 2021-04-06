import 'package:bac_calculator/history/history_page.dart';
import 'package:bac_calculator/models/bottom_sheet_help.dart';
import 'package:bac_calculator/models/custom_drawer.dart';
import 'package:bac_calculator/profile%20setup/profile_setup.dart';
import 'package:bac_calculator/start%20page/start_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  // Bottom sheet for Help
  Future<void> showHelpSheet() async {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return BottomSheetHelp();
      }
    );
  }

  int _selectedIndex= 0;
  var startPage = new StartPage();
  var historyPage = new HistoryPage();
  var profileUpdate = new ProfileSetup(update: true,);

  String changeMainText(int _currentIndex) {
    switch(_currentIndex) {
      case 0:
        return 'Home';
        break;
      case 1:
        return 'History';
        break;
      case 2:
        return 'Update Profile';
        break;
      default:
        return 'Home';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white
      ),
      child: SafeArea(
        child: Scaffold(
          drawer: CustomNavigationDrawer((int index) {
            setState(() {
              _selectedIndex = index;
            });
          }, _selectedIndex),
          appBar: AppBar(
            centerTitle: true,
            elevation: 4.0,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(changeMainText(_selectedIndex), style: GoogleFonts.openSans(color: Colors.black),),
            backgroundColor: Colors.white,
            actions: [
              _selectedIndex == 0 ? Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  icon: Icon(CupertinoIcons.question_circle, size: 28, color: Colors.black,),
                  onPressed: () {
                    showHelpSheet();
                  },
                  splashRadius: 26,
                ),
              ) : Container(),
            ] 
          ),
          body: Builder(
            builder: (context) {
              switch(_selectedIndex) {
                case 0:
                  return startPage;
                  break;
                case 1:
                  return historyPage;
                  break;
                case 2:
                  return profileUpdate;
                  break;
                default:
                  return startPage;
                  break;
              }
            },
          ),
        )
      )
    );
  }
}