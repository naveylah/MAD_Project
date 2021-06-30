import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad_mad/screens/messagePage.dart';

import '../screens/edit _profile.dart';

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => EditProfilePage()),
      );
      break;
    case 1:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MessagePage()),
      );

      break;
  }
}
