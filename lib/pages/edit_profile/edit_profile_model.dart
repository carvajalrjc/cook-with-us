import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for UserNameUpdate widget.
  FocusNode? userNameUpdateFocusNode;
  TextEditingController? userNameUpdateTextController;
  String? Function(BuildContext, String?)?
      userNameUpdateTextControllerValidator;
  // State field(s) for EmailTextUpdate widget.
  FocusNode? emailTextUpdateFocusNode1;
  TextEditingController? emailTextUpdateTextController1;
  String? Function(BuildContext, String?)?
      emailTextUpdateTextController1Validator;
  // State field(s) for EmailTextUpdate widget.
  FocusNode? emailTextUpdateFocusNode2;
  TextEditingController? emailTextUpdateTextController2;
  String? Function(BuildContext, String?)?
      emailTextUpdateTextController2Validator;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    userNameUpdateFocusNode?.dispose();
    userNameUpdateTextController?.dispose();

    emailTextUpdateFocusNode1?.dispose();
    emailTextUpdateTextController1?.dispose();

    emailTextUpdateFocusNode2?.dispose();
    emailTextUpdateTextController2?.dispose();

    navigatorModel.dispose();
  }
}
