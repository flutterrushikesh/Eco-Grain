import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ListOfNavIcon {
  List<PersistentBottomNavBarItem> listOfItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(Iconsax.home),
      activeColorPrimary: const Color.fromRGBO(76, 119, 102, 1),
      inactiveColorPrimary: const Color.fromRGBO(76, 119, 102, 0.6),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.history),
      activeColorPrimary: const Color.fromRGBO(76, 119, 102, 1),
      inactiveColorPrimary: const Color.fromRGBO(76, 119, 102, 0.6),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Iconsax.user),
      activeColorPrimary: const Color.fromRGBO(76, 119, 102, 1),
      inactiveColorPrimary: const Color.fromRGBO(76, 119, 102, 0.6),
    ),
  ];
}
