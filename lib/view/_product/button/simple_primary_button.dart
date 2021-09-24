import 'package:flutter/material.dart';
import '../../../../core/extension/context_extension.dart';

class SimplePrimaryButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const SimplePrimaryButton({Key? key, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.colorScheme.primaryVariant),
          foregroundColor: MaterialStateProperty.all(context.colorScheme.primary),
          //shape: MaterialStateProperty.all(context.roundedRectangleAllBorderLow),
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: context.fontLowSize, fontWeight: FontWeight.normal))
      ),
      onPressed: onPressed,
      child: Center(
        child: Padding(
          padding: EdgeInsets.zero,
          child: Text(title ?? '', maxLines: 2),
        ),
      ),
    );
  }
}
