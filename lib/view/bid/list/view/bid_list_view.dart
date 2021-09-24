import 'package:flutter/cupertino.dart';

import '../../../_product/_widgets/ads/baner_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../_product/_widgets/loading/page_loading.dart';
import '../../../_product/_widgets/page/text_with_image_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../service/bid_list_service.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../_product/button/fab_button.dart';
import '../../../../core/constants/enums/date_time_enum.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../_product/_widgets/chip/choice_chip_btn.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/view/base_widget.dart';
import '../viewmodel/bid_list_view_model.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/extension/int_extension.dart';

class BidListView extends StatelessWidget {
  const BidListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<BidListViewModel>(
      viewModel: BidListViewModel(BidListService()),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.dispose();
      },
      onPageBuilder: (BuildContext context, BidListViewModel viewModel) => Scaffold(
        backgroundColor: context.colorScheme.primaryVariant,
        appBar: buildAppBar(context, viewModel),
        body: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Observer(
              builder: (_) => viewModel.isPageLoading
                  ? PageLoading()
                  : viewModel.bidList.isEmpty
                      ? buildNoDataPage(viewModel, context)
                      : Column(
                          children: [
                            buildHeader(context, viewModel),
                            buildRows(context, viewModel),
                            BannerView(anchoredBanner: viewModel.anchoredBanner),
                          ],
                        ),
            ),
            fab(viewModel)
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, BidListViewModel viewModel) {
    return AppBar(
      backgroundColor: context.colorScheme.secondaryVariant,
      elevation: 0,
      title: Row(
        children: [
          buildMonthChangeButton(context, viewModel, -1),
          Observer(builder: (_) => buildDateButton(context, viewModel)),
          buildMonthChangeButton(context, viewModel, 1),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.settings, color: context.colorScheme.onBackground),
          onPressed: () {
            viewModel.openPage(NavigationConstants.SETTINGS_VIEW);
          },
        )
      ],
      //titleSpacing: 0,
    );
  }

  Widget buildMonthChangeButton(BuildContext context, BidListViewModel viewModel, int step) {
    return SizedBox(
      height: 40.0,
      width: 25.0,
      child: IconButton(
        padding: EdgeInsets.zero,
        color: context.appTheme.colorScheme.primaryVariant,
        iconSize: context.iconNormalSize,
        icon: Icon((step < 0) ? Icons.chevron_left : Icons.chevron_right, color: context.colorScheme.onBackground),
        onPressed: () {
          viewModel.changeMonth(step);
        },
      ),
    );
  }

  TextButton buildDateButton(BuildContext context, BidListViewModel viewModel) {
    return TextButton(
      onPressed: () {
        viewModel.showDatepicker(
          context,
          SfDateRangePicker(
            monthFormat: 'MMM',
            controller: viewModel.datePickerController,
            view: DateRangePickerView.year,
            allowViewNavigation: false,
            showNavigationArrow: true,
            //initialSelectedDate: viewModel.dateTime,
            onSelectionChanged: viewModel.onSelectionChanged,
            selectionMode: DateRangePickerSelectionMode.single,
          ),
        );
      },
      child: Text('${viewModel.month.shortMonthTitle()} ${viewModel.year}',
          style: context.textTheme.headline6!.copyWith(color: context.colorScheme.onBackground)),
    );
  }

  Container buildHeader(BuildContext context, BidListViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(color: context.colorScheme.primary.withOpacity(0.3), blurRadius: 10.0, offset: Offset(0.75, 0.75))
        ],
        color: context.colorScheme.primaryVariant,
      ),
      height: 58,
      width: context.width,
      padding: context.horizontalPaddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Observer(
              builder: (_) =>
                  headerColumn(context, LocaleKeys.bid_cash_flow.tr(), viewModel.monthAmount.toStringAsFixed(2))),
          Observer(
              builder: (_) => headerColumn(context, LocaleKeys.bid_roi.tr(), viewModel.monthRoi.toStringAsFixed(2))),
          Observer(
              builder: (_) =>
                  headerColumn(context, LocaleKeys.bid_profit.tr(), viewModel.monthProfit.toStringAsFixed(2))),
        ],
      ),
    );
  }

  Widget headerColumn(BuildContext context, String text1, String text2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(text1,
            style: context.textTheme.caption?.copyWith(
                fontSize: context.fontExtraLowSize, color: context.appTheme.colorScheme.primary.withOpacity(0.5))),
        Text(
          text2,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          textAlign: TextAlign.center,
          style: context.textTheme.headline6?.copyWith(
              fontSize: context.fontNormalSize,
              fontWeight: FontWeight.bold,
              color: context.appTheme.colorScheme.primary),
        ),
      ],
    );
  }

  Widget buildRows(BuildContext context, BidListViewModel viewModel) {
    return Expanded(
      child: ListView.builder(
        itemCount: viewModel.bidList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              showGroup(viewModel, context, index),
              ListItem(context, viewModel, index),
              //SizedBox(height: 20)
            ],
          );
        },
      ),
    );
  }

  Widget showGroup(BidListViewModel viewModel, BuildContext context, int index) {
    if (index > viewModel.showedIndex) {
      //go ahead
      viewModel.showedIndex = index;
      if (viewModel.date == '' || viewModel.date != viewModel.bidList[index].date) {
        viewModel.date = viewModel.bidList[index].date ?? '';
        viewModel.showedDates[index] = viewModel.date;
        return Column(
          children: [
            (index > 0) ? Container(color: context.colorScheme.primary.withOpacity(0.5)) : SizedBox(),
            showDate(viewModel, context, viewModel.date, index),
          ],
        );
      } else {
        return SizedBox();
      }
    } else {
      //go back
      if (viewModel.showedDates.containsKey(index)) {
        return Column(
          children: [
            (index > 0) ? Container(color: context.colorScheme.primary.withOpacity(0.5)) : SizedBox(),
            showDate(viewModel, context, viewModel.showedDates[index] ?? '', index),
          ],
        );
      } else {
        return SizedBox();
      }
    }
  }

  Widget showDate(BidListViewModel viewModel, BuildContext context, String date, int index) {
    return Container(
      child: Column(
        children: [
          (index > 0)
              ? Container(color: context.appTheme.colorScheme.primary.withOpacity(0.1), height: context.height * 0.02)
              : SizedBox(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.lowValue, horizontal: context.normalValue),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 12,
                  child: Row(
                    children: [
                      Text(
                        date.substring(0, 2),
                        style: context.textTheme.bodyText1
                            ?.copyWith(fontSize: context.fontLowSize, color: context.appTheme.colorScheme.primary),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: context.appTheme.colorScheme.primary.withOpacity(0.4),
                          border: Border.all(width: 1.0, color: context.appTheme.colorScheme.primary.withOpacity(0.2)),
                          borderRadius: context.borderRadiusCircularLow,
                        ),
                        padding: context.horizontalPaddingLow * 0.8,
                        margin: context.horizontalPaddingLow * 0.6,
                        child: Text(date.shortWeekdayTitle(DateTimeType.NOT_PARSED_DATE.format) ?? '',
                            style: context.textTheme.caption
                                ?.copyWith(color: context.appTheme.colorScheme.primaryVariant)),
                      ),
                      Text(
                        date.substring(3),
                        style: context.textTheme.caption?.copyWith(
                            fontSize: context.fontExtraLowSize,
                            color: context.appTheme.colorScheme.primary.withOpacity(0.6)),
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(LocaleKeys.bid_total.tr(),
                            textAlign: TextAlign.start,
                            style: context.textTheme.caption?.copyWith(fontSize: context.fontExtraLowSize)),
                        Observer(
                            builder: (_) => Text(
                                (viewModel.bidHeaderDate[date] != null)
                                    ? viewModel.bidHeaderDate[date]['amount'].toString()
                                    : '',
                                style: context.textTheme.bodyText1)),
                      ],
                    )),
                //Spacer(flex: 5),
                Expanded(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(LocaleKeys.bid_payouts.tr(),
                            style: context.textTheme.caption?.copyWith(fontSize: context.fontExtraLowSize)),
                        Text(
                            (viewModel.bidHeaderDate[date] != null)
                                ? viewModel.bidHeaderDate[date]['paymentAmount'].toString()
                                : '',
                            style: context.textTheme.bodyText1),
                      ],
                    )),
              ],
            ),
          ),
          Container(color: context.colorScheme.surface, height: context.height * 0.002)
        ],
      ),
    );
  }

  Widget ListItem(BuildContext context, BidListViewModel viewModel, int index) {
    return InkWell(
      onTap: () {
        viewModel.openPage(NavigationConstants.CREATE_VIEW, data: viewModel.bidList[index]);
      },
      child: Container(
        //color: (index % 2 == 0) ? context.colorScheme.primaryVariant : context.colorScheme.surface.withOpacity(0.3),
        padding: context.horizontalPaddingNormal,
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: buildBookmakerTypeSport(context, viewModel, index),
            ),
            Expanded(
                flex: 12,
                child: buildColorText(context, viewModel.bidList[index].event, viewModel.bidList[index].result ?? 0,
                    maxLines: 3)),
            Expanded(
                flex: 5,
                child: buildColorText(
                    context, viewModel.bidList[index].amount.toString(), viewModel.bidList[index].result ?? 0,
                    maxLines: 3, textAlign: TextAlign.end)),
            Expanded(
                flex: 5,
                child: buildColorText(
                    context, viewModel.bidList[index].rate.toString(), viewModel.bidList[index].result ?? 0,
                    textAlign: TextAlign.end)),
            Expanded(
                flex: 5,
                child: buildColorText(context, viewModel.countPaymentAmount(viewModel.bidList[index]).toString(),
                    viewModel.bidList[index].result ?? 0,
                    maxLines: 3, textAlign: TextAlign.end)),
          ],
        ),
      ),
    );
  }

  Container buildBookmakerTypeSport(BuildContext context, BidListViewModel viewModel, int index) {
    return Container(
      padding: context.verticalPaddingLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (viewModel.bidList[index].bookmakerId != null &&
                  viewModel.bookmakerList[viewModel.bidList[index].bookmakerId] != null)
              ? Text(viewModel.bookmakerList[viewModel.bidList[index].bookmakerId],
                  maxLines: 1,
                  style: context.textTheme.caption!
                      .copyWith(color: context.colorScheme.onPrimary, fontSize: context.fontExtraLowSize))
              : SizedBox(),
          Padding(
            padding: context.verticalPaddingLow * 0.4,
            child: ChoiceChipBtn(
              label: (viewModel.bidList[index].type == 0)
                  ? LocaleKeys.bid_bid_type_pre.tr()
                  : LocaleKeys.bid_bid_type_live.tr(),
              padding: EdgeInsets.symmetric(vertical: context.height * 0.001, horizontal: context.width * 0.015),
              bgColor: (viewModel.bidList[index].type == 0)
                  ? context.colorScheme.onPrimary
                  : context.colorScheme.onSecondary,
              labelColor: (viewModel.bidList[index].type == 0)
                  ? context.appTheme.colorScheme.onBackground
                  : context.appTheme.colorScheme.onError,
            ),
          ),
          (viewModel.bidList[index].bookmakerId != null &&
                  viewModel.sportList[viewModel.bidList[index].sportId] != null)
              ? Text(viewModel.sportList[viewModel.bidList[index].sportId],
                  maxLines: 1, style: context.textTheme.caption!.copyWith(fontSize: context.fontExtraLowSize))
              : SizedBox(),
        ],
      ),
    );
  }

  Widget buildColorText(BuildContext context, String? text, int result,
      {int maxLines = 1, dynamic textAlign = TextAlign.start}) {
    return Text(
      text ?? '',
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.subtitle2!.copyWith(
        color: (result == 0) ? context.appTheme.colorScheme.secondary : context.appTheme.colorScheme.secondaryVariant,
        //fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget fab(BidListViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: FabButton(
        icon: Icons.add,
        onPressed: () {
          viewModel.openPage(NavigationConstants.CREATE_VIEW);
        },
      ),
    );
  }

  Widget buildNoDataPage(BidListViewModel viewModel, BuildContext context) {
    return TextWithImagePage(
      onPressed: () {},
    );
  }
}
