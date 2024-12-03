import 'package:dock_app/widgets/dock_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DockController extends GetxController {
  var dockButtons = <DockButton>[
    DockButton(Icons.home, "Home"),
    DockButton(Icons.search, "Search"),
    DockButton(Icons.settings, "Settings"),
    DockButton(Icons.person, "Profile"),
  ].obs;

  void swapButtons(int oldIndex, int newIndex) {
    final button = dockButtons.removeAt(oldIndex);
    dockButtons.insert(newIndex, button);
  }
}