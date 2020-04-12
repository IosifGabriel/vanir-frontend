
import 'package:flutter/material.dart';

class PlaceholderTab extends StatelessWidget {
  final String name;

  PlaceholderTab(this.name);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(name, textAlign: TextAlign.center),
    );
  }
}
