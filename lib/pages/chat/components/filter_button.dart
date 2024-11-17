import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String label;

  const FilterButton({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}
