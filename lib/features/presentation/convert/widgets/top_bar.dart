import 'package:flutter/material.dart';

class TopIcon extends StatelessWidget {
  const TopIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIcon(Icons.person_outlined),
        _buildIcon(Icons.info_outline_rounded),
      ],
    );
  }

  Widget _buildIcon(IconData? icon) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80), color: Colors.grey[300]),
      child: Icon(
        icon,
        color: Colors.black,
        size: 26,
      ),
    );
  }
}
