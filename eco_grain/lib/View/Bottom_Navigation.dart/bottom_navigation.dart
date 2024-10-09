import 'package:flutter/material.dart';
import 'package:grain_dispenser/Controller/Bottom_Nav_Controller/list_of_nav_icon_controller.dart';
import 'package:grain_dispenser/Controller/Bottom_Nav_Controller/list_of_screen_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      backgroundColor: Theme.of(context).primaryColor,
      items: List.generate(
        Provider.of<ListOfNavIcon>(context).listOfItems.length,
        (index) => Provider.of<ListOfNavIcon>(context).listOfItems[index],
      ),
      navBarStyle: NavBarStyle.style3,
      screens: Provider.of<ListoFScreen>(context).listoFScreen,
    );
  }
}
