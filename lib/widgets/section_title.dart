import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Function onExpand;

  SectionTitle(this.title, {this.onExpand});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          onExpand != null
              ? GestureDetector(
                  onTap: onExpand,
                  child: Text(
                    "View All",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
