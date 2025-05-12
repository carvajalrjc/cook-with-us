import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'security_widget.dart' show SecurityWidget;
import 'package:flutter/material.dart';

class SecurityModel extends FlutterFlowModel<SecurityWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    navigatorModel.dispose();
  }
}
