import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  final bool canGoBack;
  final bool inverted;

  TabTitle(this.title, this.canGoBack, {this.icon, this.onTap, this.inverted = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: canGoBack
          ? IconButton(
              icon: FaIcon(FontAwesomeIcons.chevronLeft),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: inverted ? Colors.white : Colors.black,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
      trailing: onTap != null
          ? IconButton(
              icon: FaIcon(icon),
              onPressed: onTap,
            )
          : null,
    );
  }
}
