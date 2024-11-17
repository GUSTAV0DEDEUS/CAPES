import 'package:flutter/material.dart';

class ReusableItem extends StatelessWidget {
  final String title;

  const ReusableItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.book, color: Colors.red),
        title: Text(title),
        subtitle: Text("Periódico"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                icon: Icon(Icons.download, color: Colors.red),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.link, color: Colors.blue), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
