import 'package:flutter/material.dart';
import '../../../../core/extension/context_extension.dart';

class FabButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const FabButton({Key? key, required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal * 2,
      child: FloatingActionButton(
        backgroundColor: context.colorScheme.secondaryVariant,
        onPressed: onPressed,
        child: Icon(icon, color: context.colorScheme.onBackground),
      ),
    );
  }
}
