import '../../_product/_widgets/loading/page_loading.dart';
import '../../_product/button/simple_red_button.dart';
import '../../_product/_widgets/form/custom_text_input.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import '../../_product/_widgets/page/text_with_image_page.dart';
import '../service/bookmaker_service.dart';
import '../../_product/_widgets/appbar/back_app_bar.dart';
import '../../../../core/extension/context_extension.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/base/view/base_widget.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/bookmaker_view_model.dart';
import 'package:flutter/material.dart';

class BookmakerView extends StatelessWidget {
  final data;
  const BookmakerView({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<BookmakerViewModel>(
      viewModel: BookmakerViewModel(BookmakerService(), data),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, BookmakerViewModel viewModel) => Scaffold(
        key: viewModel.scaffoldState,
        appBar: BackAppBar(title: LocaleKeys.bid_bookmaker, actions: [addItem(context, viewModel, -1)]),
        body: buildBody(viewModel, context),
      ),
    );
  }

  Widget buildBody(BookmakerViewModel viewModel, BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          color: context.colorScheme.primaryVariant,
          padding: EdgeInsets.zero,
          child: viewModel.isPageLoading
              ? PageLoading()
              : viewModel.bookmakerList.isEmpty
                  ? buildNoDataPage(viewModel, context)
                  : buildReorderableListView(viewModel, context),
        );
      },
    );
  }

  Widget buildReorderableListView(BookmakerViewModel viewModel, BuildContext context) {
    return ReorderableListView.builder(
      itemCount: viewModel.bookmakerList.length,
      itemBuilder: (context, index) {
        return ListTile(
          key: ValueKey(viewModel.bookmakerList[index]),
          contentPadding: EdgeInsets.zero,
          leading: removeItem(context, viewModel, index),
          title: Text(
            viewModel.bookmakerList[index].bookmakerTitle ?? '',
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

  IconButton addItem(BuildContext context, BookmakerViewModel viewModel, int index) {
    return IconButton(
      icon: Icon(Icons.add, color: context.appTheme.colorScheme.onBackground),
      onPressed: () {
        _displayInputDialog(context, viewModel, index);
      },
    );
  }

  IconButton removeItem(BuildContext context, BookmakerViewModel viewModel, int index) {
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

  IconButton reOrderItem(BuildContext context, BookmakerViewModel viewModel) {
    return IconButton(
      icon: Icon(
        Icons.drag_handle,
        size: context.iconNormalSize,
      ),
      onPressed: null,
    );
  }

  IconButton editItem(BuildContext context, BookmakerViewModel viewModel, int index) {
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

  Widget buildNoDataPage(BookmakerViewModel viewModel, BuildContext context) {
    return TextWithImagePage(
      onPressed: () {},
    );
  }

  Future<void> _displayInputDialog(BuildContext context, BookmakerViewModel viewModel, int index) async {
    await viewModel.setBookmakerModel(index);
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

  Widget buildEventInput(BuildContext context, BookmakerViewModel viewModel) {
    return CustomTextInput(
        autofocus: true,
        controller: viewModel.bookmakerTitle,
        hintText: LocaleKeys.bid_bookmaker.tr(),
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

  Widget buildButtonSave(BuildContext context, BookmakerViewModel viewModel) {
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
