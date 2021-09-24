import 'package:betting_money_manager/core/constants/app/app_constants.dart';

import '../service/create_service.dart';
import '../../../_product/button/simple_red_button.dart';
import '../../../../core/constants/enums/date_time_enum.dart';
import '../../../_product/_widgets/form/custom_text_input.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../_product/_widgets/form/custom_radio.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/base/view/base_widget.dart';
import '../../../_product/_widgets/appbar/back_app_bar.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/create_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/extension/string_extension.dart';

enum BidCreateRows { RESULT, DATE, TYPE, BOOKMAKER, SPORT, EVENT, TOTAL, COEFICIENT, SUBMIT }

class CreateView extends StatelessWidget {
  final data;

  const CreateView({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CreateViewModel>(
      viewModel: CreateViewModel(CreateService(), data),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, CreateViewModel viewModel) => Scaffold(
        backgroundColor: context.colorScheme.primaryVariant,
        key: viewModel.scaffoldState,
        appBar: BackAppBar(
          title: LocaleKeys.bid_bid,
          actions: [
            (data != null)
                ? IconButton(
                    icon: Icon(Icons.delete, color: context.colorScheme.onBackground),
                    onPressed: () {
                      viewModel.removeService();
                    },
                  )
                : SizedBox()
          ],
        ),
        body: Form(
          key: viewModel.formState,
          //autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: context.paddingNormal,
            child: ListView.separated(
              itemCount: BidCreateRows.values.length,
              itemBuilder: (BuildContext context, int index) {
                return buildRow(context, viewModel, BidCreateRows.values[index].index);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: context.appTheme.colorScheme.primary.withOpacity(0.2),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(BuildContext context, CreateViewModel viewModel, int index) {
    return SizedBox(
      child: (BidCreateRows.SUBMIT.index == index)
          ? buildButtonSave(viewModel)
          : Row(
              children: [
                whatTitle(context, index) ?? SizedBox(),
                Expanded(
                  child: whatValue(viewModel, context, index) ?? SizedBox(),
                ),
              ],
            ),
    );
  }

  Widget? whatTitle(BuildContext context, int value) {
    if (BidCreateRows.RESULT.index == value) {
      return buildTitleColumn(context, LocaleKeys.bid_result);
    } else if (BidCreateRows.DATE.index == value) {
      return buildTitleColumn(context, LocaleKeys.bid_date);
    } else if (BidCreateRows.TYPE.index == value) {
      return buildTitleColumn(context, LocaleKeys.bid_bid_type);
    } else if (BidCreateRows.BOOKMAKER.index == value) {
      return buildTitleColumn(context, LocaleKeys.bid_bookmaker);
    } else if (BidCreateRows.SPORT.index == value) {
      return buildTitleColumn(context, LocaleKeys.bid_sport);
    } else if (BidCreateRows.EVENT.index == value) {
      return buildTitleColumn(context, LocaleKeys.bid_event);
    } else if (BidCreateRows.TOTAL.index == value) {
      return buildTitleColumn(context, LocaleKeys.bid_total);
    } else if (BidCreateRows.COEFICIENT.index == value) {
      return buildTitleColumn(context, LocaleKeys.bid_coefficient);
    }
  }

  Widget? whatValue(CreateViewModel viewModel, BuildContext context, int value) {
    if (BidCreateRows.RESULT.index == value) {
      return buildListResult(viewModel, context, viewModel.resultData);
    } else if (BidCreateRows.DATE.index == value) {
      return Observer(
        builder: (_) => buildSelectButton(
          context,
          viewModel.bidModel.date?.dtFormat(DateTimeType.SERVER_DATE.format, DateTimeType.NOT_PARSED_DATE.format) ?? '',
          () {
            viewModel.showDatepicker(
              context,
              SfDateRangePicker(
                //backgroundColor: context.appTheme.colorScheme.primaryVariant,
                showNavigationArrow: true,
                initialSelectedDate: viewModel.dateTime,
                //onSelectionChanged: viewModel.onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.single,
                showActionButtons: true,
                onSubmit: (Object value) {
                  viewModel.dateChanged(value as DateTime);
                  Navigator.pop(context);
                },
                onCancel: () {
                  Navigator.pop(context);
                },
              ),
            );
          },
        ),
      );
    } else if (BidCreateRows.TYPE.index == value) {
      return buildListResult(viewModel, context, viewModel.typeData);
    } else if (BidCreateRows.BOOKMAKER.index == value) {
      return Observer(
        builder: (_) => buildSelectButton(
          context,
          viewModel.bookmakerTitle,
          () {
            viewModel.showSelectorDialog(context, viewModel.bookmakerList, viewModel);
          },
        ),
      );
    } else if (BidCreateRows.SPORT.index == value) {
      return Observer(
        builder: (_) => buildSelectButton(
          context,
          viewModel.sportTitle,
          () {
            viewModel.showSelectorDialog(context, viewModel.sportList, viewModel);
          },
        ),
      );
    } else if (BidCreateRows.EVENT.index == value) {
      return buildEventInput(context, viewModel);
    } else if (BidCreateRows.TOTAL.index == value) {
      return buildPaymentAmountInput(context, viewModel);
    } else if (BidCreateRows.COEFICIENT.index == value) {
      return buildRateInput(context, viewModel);
    }
  }

  Widget buildListResult(CreateViewModel viewModel, BuildContext context, List<RadioModel> data) {
    return Container(
      margin: context.verticalPaddingLow,
      height: 34,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            borderRadius: context.borderRadiusCircularHigh,
            onTap: () {
              if (data == viewModel.typeData) {
                viewModel.changeType(index);
              } else {
                viewModel.changeResult(index);
              }
            },
            child: Observer(
              builder: (_) => CustomRadio(
                  item: (data == viewModel.typeData) ? viewModel.typeData[index] : viewModel.resultData[index],
                  selectedColor: (data == viewModel.typeData)
                      ? (index == 0)
                          ? context.appTheme.colorScheme.onPrimary
                          : context.appTheme.colorScheme.onSecondary
                      : (index == 1)
                          ? context.appTheme.colorScheme.secondaryVariant
                          : context.appTheme.colorScheme.secondary,
                  textColor: (data == viewModel.typeData)
                      ? (index == 0 && viewModel.typeData[index].isSelected)
                          ? context.appTheme.colorScheme.onBackground
                          : context.appTheme.colorScheme.primary
                      : viewModel.resultData[index].isSelected
                          ? context.appTheme.colorScheme.onBackground
                          : context.appTheme.colorScheme.primary),
            ),
          );
        },
      ),
    );
  }

  Widget buildSelectButton(BuildContext context, String text, VoidCallback onTap) {
    return SizedBox(
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size(double.infinity, 48)),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: context.appTheme.textTheme.subtitle1!.copyWith(
              fontSize: context.fontNormalSize,
              color: context.appTheme.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitleColumn(BuildContext context, String title) {
    return Container(
      width: context.width * 0.3,
      child: Text(
        title,
        style: context.appTheme.textTheme.subtitle1!.copyWith(
          fontSize: context.fontNormalSize,
          color: context.appTheme.colorScheme.primary.withOpacity(0.7),
        ),
      ).tr(),
    );
  }

  Widget buildEventInput(BuildContext context, CreateViewModel viewModel) {
    return CustomTextInput(
        controller: viewModel.event,
        hintText: 'Real Madrid - Barcelona',
        inputFormatters: [LengthLimitingTextInputFormatter(50)],
        validator: (value) {
          if (value != null) {
            if (value.isEmpty) {
              return LocaleKeys.form_validator_required.tr();
            }
          }
          return null;
        },
        focusNode: viewModel.focusNodes[0],
        onEditingComplete: () {
          viewModel.setFocusNode(1);
        });
  }

  Widget buildPaymentAmountInput(BuildContext context, CreateViewModel viewModel) {
    return CustomTextInput(
        controller: viewModel.amount,
        keyboardType: TextInputType.number,
        hintText: '100.00',
        inputFormatters: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.allow(RegExp(RegexConstants.DIGIT_REGEX))],
        validator: (value) {
          if (value != null) {
            if (value.isEmpty) {
              return LocaleKeys.form_validator_required.tr();
            }
          }
          return null;
        },
        focusNode: viewModel.focusNodes[1],
        onEditingComplete: () {
          viewModel.setFocusNode(2);
        });
  }

  Widget buildRateInput(BuildContext context, CreateViewModel viewModel) {
    return CustomTextInput(
      controller: viewModel.rate,
      keyboardType: TextInputType.number,
      hintText: '2.50',
      inputFormatters: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.allow(RegExp(RegexConstants.DIGIT_REGEX))],
      validator: (value) {
        if (value != null) {
          if (value.isEmpty) {
            return LocaleKeys.form_validator_required.tr();
          }
        }
        return null;
      },
      focusNode: viewModel.focusNodes[2],
    );
  }

  Widget buildButtonSave(CreateViewModel viewModel) {
    return Observer(
      builder: (_) {
        return SimpleRedButton(
          title: LocaleKeys.action_save.tr(),
          onPressed: viewModel.isLoading
              ? null
              : () {
                  viewModel.saveService();
                },
        );
      },
    );
  }
}
