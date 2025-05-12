import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:flutter/material.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navigatorModel.dispose();
  }
}
