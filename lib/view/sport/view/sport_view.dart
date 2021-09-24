import '../../_product/_widgets/loading/page_loading.dart';
import '../../_product/button/simple_red_button.dart';
import '../../_product/_widgets/form/custom_text_input.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import '../../_product/_widgets/page/text_with_image_page.dart';
import '../service/sport_service.dart';
import '../../_product/_widgets/appbar/back_app_bar.dart';
import '../../../../core/extension/context_extension.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/base/view/base_widget.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/sport_view_model.dart';
import 'package:flutter/material.dart';

class SportView extends StatelessWidget {
  final data;
  const SportView({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SportViewModel>(
      viewModel: SportViewModel(SportService(), data),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SportViewModel viewModel) => Scaffold(
        key: viewModel.scaffoldState,
        appBar: BackAppBar(title: LocaleKeys.bid_sport, actions: [addItem(context, viewModel, -1)]),
        body: buildBody(viewModel, context),
      ),
    );
  }

  Widget buildBody(SportViewModel viewModel, BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          color: context.colorScheme.primaryVariant,
          padding: EdgeInsets.zero,
          child: viewModel.isPageLoading
              ? PageLoading()
              : viewModel.sportList.isEmpty
                  ? buildNoDataPage(viewModel, context)
                  : buildReorderableListView(viewModel, context),
        );
      },
    );
  }

  Widget buildReorderableListView(SportViewModel viewModel, BuildContext context) {
    return ReorderableListView.builder(
      itemCount: viewModel.sportList.length,
      itemBuilder: (context, index) {
        return ListTile(
          key: ValueKey(viewModel.sportList[index]),
          contentPadding: EdgeInsets.zero,
          leading: removeItem(context, viewModel, index),
          title: Text(
            viewModel.sportList[index].sportTitle ?? '',
            style: TextStyle(fontSize: context.fontNormalSize),
          ),
          trailing: Container(
            //color: Colors.yellow,
            width: 100,
            child: Row(
              children: [
                editItem(context, viewModel, index),
                reOrderItem(context, viewModel)
              ],
            ),
          ),
          onTap: () {},
        );
      },
      // The reorder function
      onReorder: (oldIndex, newIndex) {
        viewModel.onReorder(oldIndex, newIndex);
      },
    );
  }

  IconButton addItem(BuildContext context, SportViewModel viewModel, int index) {
    return IconButton(
      icon: Icon(Icons.add, color: context.appTheme.colorScheme.onBackground),
      onPressed: () {
        _displayInputDialog(context, viewModel, index);
      },
    );
  }

  IconButton removeItem(BuildContext context, SportViewModel viewModel, int index) {
    return IconButton(
      icon: Icon(
        Icons.remove_circle,
        color: context.appTheme.colorScheme.secondaryVariant,
        size: context.iconNormalSize,
      ),
      onPressed: () {
        viewModel.removeService(index);
      },
    );
  }

  IconButton reOrderItem(BuildContext context, SportViewModel viewModel) {
    return IconButton(
      icon: Icon(
        Icons.drag_handle,
        size: context.iconNormalSize,
      ),
      onPressed: null,
    );
  }

  IconButton editItem(BuildContext context, SportViewModel viewModel, int index) {
    return IconButton(
      icon: Icon(
        Icons.edit,
        color: context.appTheme.colorScheme.primary,
        size: context.iconLowSize,
      ),
      onPressed: () {
        _displayInputDialog(context, viewModel, index);
      },
    );
  }

  Widget buildNoDataPage(SportViewModel viewModel, BuildContext context) {
    return TextWithImagePage(
      onPressed: () {},
    );
  }

  Future<void> _displayInputDialog(BuildContext context, SportViewModel viewModel, int index) async {
    await viewModel.setSportModel(index);
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: context.colorScheme.surface,
          content: Container(
            color: Colors.transparent,
            width: context.width * 0.9,
            child: Form(
              key: viewModel.formState,
              child: buildEventInput(context, viewModel),
            ),
          ),
          actions: <Widget>[buildButtonSave(context, viewModel)],
        );
      },
    );
  }

  Widget buildEventInput(BuildContext context, SportViewModel viewModel) {
    return CustomTextInput(
        autofocus: true,
        controller: viewModel.sportTitle,
        hintText: LocaleKeys.bid_sport.tr(),
        inputFormatters: [LengthLimitingTextInputFormatter(50)],
        validator: (value) {
          if (value != null) {
            if (value.isEmpty) {
              return LocaleKeys.form_validator_required.tr();
            }
          }
          return null;
        });
  }

  Widget buildButtonSave(BuildContext context, SportViewModel viewModel) {
    return Observer(
      builder: (_) {
        return Padding(
          padding: context.paddingNormal,
          child: SimpleRedButton(
            title: LocaleKeys.action_save.tr(),
            onPressed: viewModel.isPageLoading
                ? null
                : () {
                    viewModel.saveService();
                  },
          ),
        );
      },
    );
  }
}
