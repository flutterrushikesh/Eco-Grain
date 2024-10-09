import 'package:flutter/material.dart';
import 'package:grain_dispenser/Controller/Profile_Screen_Controller/profile_image_controller.dart';
import 'package:grain_dispenser/View/ui_helper/responsive_screen_height.dart';

import 'package:grain_dispenser/View/ui_helper/responsive_screen_width.dart';

import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Your Profile",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                foregroundImage: FileImage(
                  Provider.of<ProfileImageController>(context)
                      .selectedProfilePic!,
                ),
                backgroundColor: Colors.white,
                radius: screenWidth(context: context, responsive: 0.15),
              ),
              Positioned(
                top: 95,
                left: 210,
                child: GestureDetector(
                  onTap: () {
                    Provider.of<ProfileImageController>(context, listen: false)
                        .pickUpProfilePicture();
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      top: screenHeight(context: context, responsive: 0.005),
                      bottom: screenHeight(context: context, responsive: 0.005),
                      right: screenWidth(context: context, responsive: 0.02),
                      left: screenWidth(context: context, responsive: 0.02),
                    ),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 30,
                          ),
                        ]),
                    child: Provider.of<ProfileImageController>(context)
                                .selectedProfilePic !=
                            null
                        ? Icon(
                            Icons.edit,
                            color: Theme.of(context).secondaryHeaderColor,
                            // size: 15,
                          )
                        : Icon(
                            Icons.add,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
