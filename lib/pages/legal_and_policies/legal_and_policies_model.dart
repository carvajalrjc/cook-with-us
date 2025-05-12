import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'legal_and_policies_widget.dart' show LegalAndPoliciesWidget;
import 'package:flutter/material.dart';

class LegalAndPoliciesModel extends FlutterFlowModel<LegalAndPoliciesWidget> {
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
