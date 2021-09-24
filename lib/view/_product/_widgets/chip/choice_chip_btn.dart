import 'package:flutter/material.dart';
import '../../../../../core/extension/context_extension.dart';

class ChoiceChipBtn extends StatelessWidget {
  final String label;
  final EdgeInsetsGeometry padding;
  final Color bgColor;
  final Color labelColor;

  const ChoiceChipBtn(
      {Key? key, required this.label, required this.padding, required this.bgColor, required this.labelColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(context.normalRadius),
        boxShadow: <BoxShadow>[
          BoxShadow(color: context.colorScheme.onSurface.withOpacity(0.2), blurRadius: 2.0, offset: Offset(0.75, 0.75))
        ],
        color: bgColor,
      ),
      child: Text(label,
          maxLines: 1, style: context.textTheme.bodyText1!.copyWith(color: labelColor, fontSize: context.fontExtraLowSize)),
    );
  }
}
