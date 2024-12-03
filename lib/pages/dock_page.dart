import 'package:dock_app/pages/dock_controller.dart';
import 'package:dock_app/widgets/dock_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DockPage extends GetView<DockController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(
                () => Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.dockButtons
                    .asMap()
                    .entries
                    .map((entry) {
                  final index = entry.key;
                  final button = entry.value;
                  return DragTarget<int>(
                    onWillAcceptWithDetails: (draggedIndex) => draggedIndex != index,
                    onAcceptWithDetails: (draggedIndex) {
                      controller.swapButtons(draggedIndex.data, index);
                    },
                    builder: (context, candidateData, rejectedData) {
                      return DockButtonWidget(
                        index: index,
                        icon: button.icon,
                        label: button.label,
                        onDragStarted: () => index,
                        onDragEnd: (details) {},
                        onTap: () {
                          Get.toNamed('/${button.label.toLowerCase()}');
                        },
                      );
                    },
                  );
                })
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}