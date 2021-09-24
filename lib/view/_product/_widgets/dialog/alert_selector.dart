import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../_model/bookmaker_model.dart';
import '../../_model/sport_model.dart';
import '../../button/simple_primary_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/extension/context_extension.dart';

abstract class AlertSelectorHelper {
  Future<void> showSelectorDialog(BuildContext context, var data, var viewModel) async {
    var alert = AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: context.roundedRectangleAllBorderLow,
      backgroundColor: context.colorScheme.secondaryVariant,
      title: Container(
        width: context.width,
        padding: context.paddingLow,
        decoration: BoxDecoration(
          color: context.appTheme.colorScheme.secondaryVariant,
          borderRadius: BorderRadius.vertical(top: context.lowRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: context.horizontalPaddingNormal,
              child: Text(
                (data is List<BookmakerModel>) ? LocaleKeys.bid_bookmaker : LocaleKeys.bid_sport,
                style: context.textTheme.subtitle1!.copyWith(color: context.appTheme.colorScheme.onBackground),
              ).tr(),
            ),
            IconButton(
              icon: Icon(
                Icons.edit,
                color: context.appTheme.colorScheme.onBackground,
                size: context.iconLowSize,
              ),
              onPressed: () {
                Navigator.pop(context);
                if (data is List<BookmakerModel>) {
                  viewModel.openPage(NavigationConstants.BOOKMAKER_LIST_VIEW);
                }
                if (data is List<SportModel>) {
                  viewModel.openPage(NavigationConstants.SPORT_LIST_VIEW);
                }
              },
            )
          ],
        ),
      ),
      content: Container(
        color: context.appTheme.colorScheme.surface,
        padding: context.paddingLow * 0.3,
        width: context.width,
        height: 300,
        child: (data.isEmpty)
            ? Center(child: Text(LocaleKeys.info_empty).tr())
            : GridView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) => SimplePrimaryButton(
            title: (data is List<BookmakerModel>) ? data[index].bookmakerTitle : data[index].sportTitle,
            onPressed: () {
              if (data is List<BookmakerModel>) {
                viewModel.changeBookmaker(data[index]);
                Navigator.pop(context);
              }

              if (data is List<SportModel>) {
                viewModel.changeSport(data[index]);
                Navigator.pop(context);
              }
            },
          ),
          //padding: const EdgeInsets.all(2),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: context.width / (context.height / 4),
          ),
        ),
      ),
    );
    // show the dialog
    return await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}