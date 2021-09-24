import '../../../../core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  final RadioModel item;
  final Color selectedColor;
  final Color textColor;
  CustomRadio({required this.item, required this.selectedColor, required this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(right: context.lowValue),
      //height: 30.0,
      width: 110.0,
      decoration: BoxDecoration(
        color: item.isSelected
            //? context.appTheme.colorScheme.primary.withOpacity(0.5)
            ? selectedColor
            : Colors.transparent,
        border: Border.all(
            width: 2.0,
            color: context.appTheme.colorScheme.primary.withOpacity(0.2)),
        borderRadius: context.borderRadiusCircularHigh,
      ),
      child: Center(
        child: Text(item.buttonText,
            style: TextStyle(
                color: textColor, fontSize: context.fontNormalSize), textAlign: TextAlign.center),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);

  @override
  String toString() {
    return '{isSelected: $isSelected, buttonText: $buttonText}';
  }
}