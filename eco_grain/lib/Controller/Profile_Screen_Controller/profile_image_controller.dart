import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageController extends ChangeNotifier {
  File? selectedProfilePic;

  void pickUpProfilePicture() async {
    XFile? pickUpProfilePic = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      // imageQuality: 50,
      maxWidth: 150,
    );

    if (pickUpProfilePic != null) {
      selectedProfilePic = File(pickUpProfilePic.path);
    }
    notifyListeners();
  }
}
