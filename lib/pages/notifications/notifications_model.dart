import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:flutter/material.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  State fields for stateful widgets in this page.

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
