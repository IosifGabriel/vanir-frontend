import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vanir_app/widgets/custom_dialog.dart';

class CardSettings extends StatelessWidget {
  final int index;

  CardSettings(this.index);

  @override
  Widget build(BuildContext context) {
    print('settings for ' + index.toString());
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        SettingTile("Freeze card", FontAwesomeIcons.shieldAlt),
        SettingTile("Contactless payments", FontAwesomeIcons.wifi),
        SettingTile("ATM withdrawls", FontAwesomeIcons.print),
        SettingTile("Online transactions", FontAwesomeIcons.globe),
        SettingTile("Remove card", FontAwesomeIcons.trash, () {
          showDialog(
            context: context,
            child: CustomDialog(
              "Remove card",
              "Are you sure you want to remove this card?",
              "Remove",
              () => print("Card removed"),
            ),
          );
        }),
      ],
    );
  }
}

class SettingTile extends StatefulWidget {
  final String name;
  final IconData icon;
  final Function onTap;

  SettingTile(this.name, this.icon, [this.onTap]);

  @override
  _SettingTileState createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: ListTile(
          title: Text(
            widget.name,
            style: TextStyle(fontSize: 16.0, letterSpacing: 0.6),
          ),
          leading: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor
                ],
              ),
            ),
            child: Center(
              child: FaIcon(
                widget.icon,
                size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
          trailing: widget.onTap == null
              ? Switch(
                  value: isActive,
                  onChanged: (value) => setState(() => isActive = value),
                  activeColor: Theme.of(context).primaryColor,
                )
              : null,
        ),
      ),
    );
  }
}
