import 'package:bac_calculator/colors/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavigationDrawer extends StatelessWidget {

  final Function onIndexChanged;
  final int _currentIndex;

  CustomNavigationDrawer(this.onIndexChanged, this._currentIndex);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.grey[100]
            ),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(child: Text('BAC Calculator'),),
            )
          ),
          ListTile(
            selected: _currentIndex == 0,
            selectedTileColor: CustomColors.primary,
            leading: Icon(CupertinoIcons.home, color: _currentIndex == 0 ? Colors.white : Colors.grey,),
            title: Text('Home', style: TextStyle(color: _currentIndex == 0 ? Colors.white : Colors.black),),
            onTap: () {
              onIndexChanged(0);
              Navigator.pop(context);
            },
          ),
          Divider(
            height: 1,
          ),
          ListTile(
            selected: _currentIndex == 1,
            selectedTileColor: CustomColors.primary,
            leading: Icon(CupertinoIcons.square_list, color: _currentIndex == 1 ? Colors.white : Colors.grey,),
            title: Text('History', style: TextStyle(color: _currentIndex == 1 ? Colors.white : Colors.black),),
            onTap: () {
              onIndexChanged(1);
              Navigator.pop(context);
            },
          ),
          Divider(
            height: 1,
          ),
          ListTile(
            selected: _currentIndex == 2,
            selectedTileColor: CustomColors.primary,
            leading: Icon(CupertinoIcons.person_circle, color: _currentIndex == 2 ? Colors.white : Colors.grey,),
            title: Text('Profile', style: TextStyle(color: _currentIndex == 2 ? Colors.white : Colors.black),),
            onTap: () {
              onIndexChanged(2);
              Navigator.pop(context);
            },
          ),
          Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}