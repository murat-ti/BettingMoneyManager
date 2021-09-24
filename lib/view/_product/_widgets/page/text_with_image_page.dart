import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/extension/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextWithImagePage extends StatelessWidget {
  final String? title;
  final Widget? icon;
  final VoidCallback onPressed;

  const TextWithImagePage({Key? key, this.title, this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: icon ?? Icon(Icons.info_rounded),
              onPressed: onPressed,
              iconSize: context.width * 0.2,
              color: context.appTheme.colorScheme.primary.withOpacity(0.3)),
          Text(
            title ?? LocaleKeys.info_empty,
            textAlign: TextAlign.center,
            style: context.textTheme.subtitle1!.copyWith(color: context.colorScheme.primary.withOpacity(0.6)),
          ).tr()
        ],
      ),
    );
  }
}
