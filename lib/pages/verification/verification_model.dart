import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'verification_widget.dart' show VerificationWidget;
import 'package:flutter/material.dart';

class VerificationModel extends FlutterFlowModel<VerificationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    navigatorModel.dispose();
  }
}
