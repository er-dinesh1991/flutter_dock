

import 'package:flutter/material.dart';

class DockButtonWidget extends StatelessWidget {
  final int index;
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final void Function() onDragStarted;
  final void Function(DraggableDetails details) onDragEnd;

  const DockButtonWidget({
    required this.index,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.onDragStarted,
    required this.onDragEnd,
  });

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<int>(
      data: index,
      feedback: _buildDockButton(icon, label, isDragging: true),
      childWhenDragging: Opacity(opacity: 0.5, child: _buildDockButton(icon, label)),
      onDragStarted: onDragStarted,
      onDragEnd: onDragEnd,
      child: GestureDetector(
        onTap: onTap,
        child: _buildDockButton(icon, label),
      ),
    );
  }

  Widget _buildDockButton(IconData icon, String label, {bool isDragging = false}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: isDragging ? 50 : 40, color: Colors.white),
          if (!isDragging)
            Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
        ],
      ),
    );
  }
}