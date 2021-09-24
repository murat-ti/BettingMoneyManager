import 'package:flutter/material.dart';
import '../../../../core/extension/context_extension.dart';

abstract class AlertDatepickerHelper {
  Future<void> showDatepicker(BuildContext context, Widget body) async {
    // show the dialog
    return await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            padding: context.paddingNormal,
            height: 400,
            width: context.width * 0.9,
            decoration: BoxDecoration(
              color: context.appTheme.colorScheme.primaryVariant,
              border: Border.all(width: 1.0, color: context.appTheme.colorScheme.primary.withOpacity(0.5)),
              borderRadius: context.borderRadiusCircularLow,
            ),
            child: body,
          ),
        );
      },
    );
  }
}