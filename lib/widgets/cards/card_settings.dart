import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vanir_app/services/cards_service.dart';
import 'package:vanir_app/widgets/custom_dialog.dart';
import 'package:vanir_app/widgets/error.dart';
import 'package:vanir_app/widgets/loader.dart';
import 'package:vanir_app/widgets/success.dart';

class CardSettings extends StatelessWidget {
  final int cardId;
  final Function callback;

  CardSettings(this.cardId, {this.callback});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        SettingTile("Freeze card", FontAwesomeIcons.shieldAlt, false),
        SettingTile("Contactless payments", FontAwesomeIcons.wifi, true),
        SettingTile("ATM withdrawls", FontAwesomeIcons.print, false),
        SettingTile("Online transactions", FontAwesomeIcons.globe, true),
        SettingTile("Remove card", FontAwesomeIcons.trash, true, () {
          showDialog(
            context: context,
            child: CustomDialog(
              "Remove card",
              "Are you sure you want to remove this card?",
              "Remove",
              () async {
                var result = await _deleteCard(context, cardId);
                if (result) {
                  Future.delayed(
                    Duration(seconds: 2, milliseconds: 250),
                    () {
                      Navigator.pop(context);
                      callback();
                    },
                  );
                }
              },
            ),
          );
        }),
      ],
    );
  }

  Future<bool> _deleteCard(BuildContext context, int cardId) async {
    var confirmed = CardsService.deleteCard(cardId);
    showDialog(
      context: context,
      child: CustomDialog.fromWidget(FutureBuilder<bool>(
        future: confirmed,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Future.delayed(Duration(seconds: 2), () {
              Navigator.pop(context);
            });
            if (snapshot.data == false) return ErrorView();
            return SuccessView();
          } else if (snapshot.hasError) {
            return ErrorView();
          }
          return Loader();
        },
      )),
    );
    return confirmed;
  }
}

class SettingTile extends StatefulWidget {
  final String name;
  final IconData icon;
  final bool defaultValue;
  final Function onTap;

  SettingTile(this.name, this.icon, [this.defaultValue, this.onTap]);

  @override
  _SettingTileState createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
  bool isActive;

  @override
  @override
  void initState() {
    super.initState();
    isActive = widget.defaultValue;
  }

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
