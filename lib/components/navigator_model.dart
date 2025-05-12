import '/flutter_flow/flutter_flow_util.dart';
import 'navigator_widget.dart' show NavigatorWidget;
import 'package:flutter/material.dart';

class NavigatorModel extends FlutterFlowModel<NavigatorWidget> {
  ///  Local state fields for this component.

  bool expanded = false;

  bool hide = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
