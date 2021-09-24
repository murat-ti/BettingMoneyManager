import '../../../core/constants/image/image_constants.dart';
import '../../../core/constants/image/image_path_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/extension/context_extension.dart';
import '../../_product/bottom_sheet_modal/bottom_sheet_modal.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/base/view/base_widget.dart';
import 'package:flutter/material.dart';
import '../../_product/_widgets/appbar/back_app_bar.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/settings_viewmodel.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SettingsViewModel viewModel) => Scaffold(
        backgroundColor: context.colorScheme.primaryVariant,
        appBar: BackAppBar(title: LocaleKeys.settings_title),
        body: buildBody(context, viewModel),
      ),
    );
  }

  Widget buildBody(BuildContext context, SettingsViewModel viewModel) {
    return ListView(
        padding: context.horizontalPaddingNormal * 2,
        children: ListTile.divideTiles(
          context: context,
          color: context.appTheme.colorScheme.primary.withOpacity(0.5),
          tiles: [
            buildCard(
              context,
              LocaleKeys.settings_language,
              SVGImagePaths.instance.languageSVG,
              Observer(
                builder: (_) {
                  return Image.asset(
                    viewModel.activeLanguagePath,
                    height: 24,
                    width: 24,
                  );
                },
              ),
              () {
                modalBottomSheet(
                  viewModel,
                  context,
                  170,
                  LocaleKeys.settings_language,
                  viewModel.languageList.length,
                  (BuildContext context, int index) {
                    return buildBottomSheetItem(viewModel, context, index, viewModel.languageMap[index], () {
                      viewModel.changeAppLocalization(viewModel.languageList[index]);
                      Navigator.pop(context);
                    }, (viewModel.currentLocale == viewModel.languageList[index]));
                  },
                );
              },
            ),
            buildCard(
              context,
              LocaleKeys.settings_theme,
              SVGImagePaths.instance.themeSVG,
              Image.asset(
                ImageConstants.instance.theme,
                height: 24,
                width: 24,
              ),
              () {
                viewModel.changeAppTheme();
              },
            ),
            buildCard(
              context,
              LocaleKeys.settings_rate_an_app,
              SVGImagePaths.instance.starSVG,
              buildTextButton(context),
              () {
                viewModel.rateApp();
              },
            ),
          ],
        ).toList());
  }

  TextButton buildTextButton(BuildContext context) {
    return TextButton(
      onPressed: null,
      style: TextButton.styleFrom(alignment: Alignment.centerRight, padding: EdgeInsets.zero),
      child: Icon(
        Icons.keyboard_arrow_right_sharp,
        //size: context.iconLowSize,
        color: context.appTheme.colorScheme.primary,
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, String path, Widget trailing, VoidCallback? onTap) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: ListTile(
          leading: buildSvgPicture(context, path),
          title: Text(
            title,
            style: context.appTheme.textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w500, fontSize: context.fontNormalSize),
          ).tr(),
          trailing: trailing,
          onTap: onTap,
        ),
      ),
    );
  }

  Widget buildSvgPicture(BuildContext context, String path) => SvgPicture.asset(path, height: 22, width: 22, color: context.appTheme.colorScheme.primary);
}
