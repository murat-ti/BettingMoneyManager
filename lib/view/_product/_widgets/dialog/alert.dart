import '../../../../core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/extension/context_extension.dart';

abstract class AlertHelper {
  Future<void> showMessageDialog(BuildContext context, String? header, Widget body, VoidCallback okPressed, VoidCallback cancelPressed) async {
    Widget okButton = TextButton(
      /*onPressed: () {
        Navigator.pop(context);
      },*/
      onPressed: okPressed,
      child: Text(LocaleKeys.action_continue, style: TextStyle(fontSize: context.fontNormalSize, fontWeight: FontWeight.w500)).tr(),
    );

    Widget cancelButton = TextButton(
      style: TextButton.styleFrom(
        textStyle: TextStyle(fontSize: context.fontNormalSize, fontWeight: FontWeight.w500),
      ),
      onPressed: cancelPressed,
      child: Text(LocaleKeys.action_cancel).tr(),
    );

    var alert = AlertDialog(
      contentPadding: context.horizontalPaddingNormal,
      titlePadding: context.paddingLow,
      title: Text(header ?? ''),
      content: body,
      actions: [
        cancelButton,
        okButton
      ],
      shape: context.roundedRectangleAllBorderNormal,
    );
    // show the dialog
    return await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}