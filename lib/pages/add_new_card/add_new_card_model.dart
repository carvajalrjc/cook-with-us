import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_new_card_widget.dart' show AddNewCardWidget;
import 'package:flutter/material.dart';

class AddNewCardModel extends FlutterFlowModel<AddNewCardWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CardNumberTextField widget.
  FocusNode? cardNumberTextFieldFocusNode;
  TextEditingController? cardNumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      cardNumberTextFieldTextControllerValidator;
  // State field(s) for CardHolderNameTextField widget.
  FocusNode? cardHolderNameTextFieldFocusNode;
  TextEditingController? cardHolderNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      cardHolderNameTextFieldTextControllerValidator;
  // State field(s) for ExpiredTextField widget.
  FocusNode? expiredTextFieldFocusNode1;
  TextEditingController? expiredTextFieldTextController1;
  String? Function(BuildContext, String?)?
      expiredTextFieldTextController1Validator;
  // State field(s) for ExpiredTextField widget.
  FocusNode? expiredTextFieldFocusNode2;
  TextEditingController? expiredTextFieldTextController2;
  String? Function(BuildContext, String?)?
      expiredTextFieldTextController2Validator;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    cardNumberTextFieldFocusNode?.dispose();
    cardNumberTextFieldTextController?.dispose();

    cardHolderNameTextFieldFocusNode?.dispose();
    cardHolderNameTextFieldTextController?.dispose();

    expiredTextFieldFocusNode1?.dispose();
    expiredTextFieldTextController1?.dispose();

    expiredTextFieldFocusNode2?.dispose();
    expiredTextFieldTextController2?.dispose();

    navigatorModel.dispose();
  }
}
