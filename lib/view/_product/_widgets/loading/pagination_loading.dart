import '../../../../core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class PaginationLoading extends StatelessWidget {
  final bool showLoading;

  const PaginationLoading({required this.showLoading, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showLoading
        ? Container(
            height: 63,
            padding: context.verticalPaddingNormal,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(context.colorScheme.secondaryVariant),
              ),
            ),
          )
        : Container();
  }
}
