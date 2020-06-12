import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

class GenerateQRWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GenerateScreenStateWidget();
}

class GenerateScreenStateWidget extends State<GenerateQRWidget> {
  static const double _topSectionTopPadding = 50.0;
  static const double _topSectionBottomPadding = 20.0;
  static const double _topSectionHeight = 50.0;
  GlobalKey globalKey = new GlobalKey();
  String _dataString = "1";
  String _inputErrorText;
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return Container(
        height: 0.5 * bodyHeight,
        color: const Color(0xFFF3F5F7),
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: _topSectionTopPadding,
              bottom: _topSectionBottomPadding,
            ),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: 0.4 * bodyHeight,
             
                child: Center(
                  child: RepaintBoundary(
                    key: globalKey,
                      child: QrImage(
                        padding:EdgeInsets.symmetric(horizontal: 45),
                        data: _dataString,
                        size: bodyHeight,
                    ),
                  ),
                ),
            
            ),
          ),
        ]));
  }
}
