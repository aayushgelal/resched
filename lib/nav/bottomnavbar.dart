import 'package:flutter/material.dart';

var bottomnavbar=BottomNavigationBar(items: [
  BottomNavigationBarItem(label: "My Task",icon: Icon(Icons.check_circle)),
  BottomNavigationBarItem(label: "Menu",icon: Icon(Icons.dashboard)),
  BottomNavigationBarItem(label: "Quick",icon: Icon(Icons.list_alt_rounded)),
  BottomNavigationBarItem(label: "Profile",icon: Icon(Icons.person)),



],type:BottomNavigationBarType.fixed ,);
var bottomappbar=BottomAppBar(
);