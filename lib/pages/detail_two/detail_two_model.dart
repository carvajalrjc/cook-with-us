import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detail_two_widget.dart' show DetailTwoWidget;
import 'package:flutter/material.dart';

class DetailTwoModel extends FlutterFlowModel<DetailTwoWidget> {
  ///  Local state fields for this page.

  bool liked = false;

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
