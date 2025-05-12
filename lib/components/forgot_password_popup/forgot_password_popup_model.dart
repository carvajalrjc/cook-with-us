import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_password_popup_widget.dart' show ForgotPasswordPopupWidget;
import 'package:flutter/material.dart';

class ForgotPasswordPopupModel
    extends FlutterFlowModel<ForgotPasswordPopupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode;
  TextEditingController? userNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userNameTextFieldFocusNode?.dispose();
    userNameTextFieldTextController?.dispose();
  }
}
