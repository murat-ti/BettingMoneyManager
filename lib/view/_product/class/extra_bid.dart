import 'package:flutter/material.dart';
import '../_model/bid_model.dart';

class ExtraBid {
  BidModel? model;
  VoidCallback callback;

  ExtraBid({this.model, required this.callback});
}