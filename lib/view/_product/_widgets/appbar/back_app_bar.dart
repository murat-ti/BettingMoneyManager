import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/extension/context_extension.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const BackAppBar({Key? key, required this.title, this.actions}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: context.lowValue,
      backgroundColor: context.appTheme.colorScheme.secondaryVariant,
      leading: IconButton(
        icon: Icon(
          Icons.keyboard_backspace,
          color: context.appTheme.colorScheme.onBackground,
          size: context.iconNormalSize,
        ),
        onPressed: () {
          //viewModel.navigateToHome();
          Navigator.pop(context);
        },
      ),
      //centerTitle: true,
      title: Text(
        title,
        style: context.textTheme.headline6!.copyWith(color: context.appTheme.colorScheme.onBackground),
      ).tr(),
      actions: actions ?? [],
      titleSpacing: 0,
    );
  }
}
