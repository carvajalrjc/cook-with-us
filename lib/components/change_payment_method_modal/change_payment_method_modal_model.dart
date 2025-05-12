import '/components/payment_method_item/payment_method_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'change_payment_method_modal_widget.dart'
    show ChangePaymentMethodModalWidget;
import 'package:flutter/material.dart';

class ChangePaymentMethodModalModel
    extends FlutterFlowModel<ChangePaymentMethodModalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Model for PaymentMethodItem component.
  late PaymentMethodItemModel paymentMethodItemModel;

  @override
  void initState(BuildContext context) {
    paymentMethodItemModel =
        createModel(context, () => PaymentMethodItemModel());
  }

  @override
  void dispose() {
    paymentMethodItemModel.dispose();
  }
}
