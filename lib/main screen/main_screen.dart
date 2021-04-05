import 'package:bac_calculator/colors/custom_colors.dart';
import 'package:bac_calculator/models/bottom_sheet_help.dart';
import 'package:bac_calculator/models/custom_drawer.dart';
import 'package:bac_calculator/profile%20setup/profile_setup.dart';
import 'package:bac_calculator/start%20page/start_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: CustomColors.primary
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
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(changeMainText(_selectedIndex), style: TextStyle(color: Colors.black),),
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
                  return Placeholder(color: Colors.blue,);
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