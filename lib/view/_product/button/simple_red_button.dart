import 'package:flutter/material.dart';
import '../../../../core/extension/context_extension.dart';

class SimpleRedButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const SimpleRedButton({Key? key, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.appTheme.colorScheme.secondaryVariant),
        foregroundColor: MaterialStateProperty.all(context.appTheme.colorScheme.onBackground),
        side: MaterialStateProperty.all(BorderSide(width: 1.0, color: context.appTheme.colorScheme.secondaryVariant)),
        shape: MaterialStateProperty.all(context.roundedRectangleAllBorderNormal),
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: context.fontNormalSize, fontWeight: FontWeight.w500)),
      ),
      onPressed: onPressed,
      child: Center(
        child: Padding(
          padding: context.paddingNormal,
          child: Text(title ?? ''),
        ),
      ),
    );
  }
}
