import 'package:flutter/material.dart';
import '../../../../core/extension/context_extension.dart';

class MakeActionButton extends StatelessWidget {
  final IconData icon;
  const MakeActionButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: context.colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: context.highBorderRadius,
      ),
      child: Padding(
        padding: context.paddingLow,
        /*child: Icon(icon,
            color: context.colorScheme.onBackground, size: context.iconLowSize),*/
        child: (icon == Icons.phone) ? Transform.rotate(
          angle: 36,
          child:
          Icon(icon, color: context.colorScheme.onBackground, size: context.iconLowSize))
          : Icon(icon, color: context.colorScheme.onBackground, size: context.iconLowSize),
      ),
    );
  }
}
