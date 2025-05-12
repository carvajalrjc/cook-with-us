import '/flutter_flow/flutter_flow_util.dart';
import 'new_password_modal_widget.dart' show NewPasswordModalWidget;
import 'package:flutter/material.dart';

class NewPasswordModalModel extends FlutterFlowModel<NewPasswordModalWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode1;
  TextEditingController? userNameTextFieldTextController1;
  late bool userNameTextFieldVisibility1;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextController1Validator;
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode2;
  TextEditingController? userNameTextFieldTextController2;
  late bool userNameTextFieldVisibility2;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextController2Validator;

  @override
  void initState(BuildContext context) {
    userNameTextFieldVisibility1 = false;
    userNameTextFieldVisibility2 = false;
  }

  @override
  void dispose() {
    userNameTextFieldFocusNode1?.dispose();
    userNameTextFieldTextController1?.dispose();

    userNameTextFieldFocusNode2?.dispose();
    userNameTextFieldTextController2?.dispose();
  }
}
