import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notification_setting_widget.dart' show NotificationSettingWidget;
import 'package:flutter/material.dart';

class NotificationSettingModel
    extends FlutterFlowModel<NotificationSettingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;
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
