import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/extension/context_extension.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController? controller;

  //final String? initialValue;
  final bool? autofocus;
  final TextInputType? keyboardType;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;

  const CustomTextInput({
    Key? key,
    this.autofocus,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.inputFormatters,
    this.validator,
    this.focusNode,
    this.onEditingComplete,
    this.onChanged,
    //this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus ?? false,
      controller: controller,
      //initialValue: controller != null ? controller!.text : (initialValue ?? ''),
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText ?? '',
        //labelText: LocaleKeys.add_contact_business_name.tr(),
        contentPadding: EdgeInsets.zero,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colorScheme.primaryVariant),
          borderRadius: context.borderRadiusCircularNormal,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colorScheme.primaryVariant),
          borderRadius: context.borderRadiusCircularNormal,
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colorScheme.primaryVariant),
          borderRadius: context.borderRadiusCircularNormal,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colorScheme.primaryVariant),
          borderRadius: context.borderRadiusCircularNormal,
        ),
      ),
      inputFormatters: inputFormatters ?? [],
      validator: validator,
      focusNode: focusNode,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      style: context.appTheme.textTheme.subtitle1!.copyWith(
        fontSize: context.fontNormalSize,
        color: context.appTheme.colorScheme.primary,
      ),
    );
  }
}
