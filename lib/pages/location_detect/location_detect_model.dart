import '/components/line_separator_with_text/line_separator_with_text_widget.dart';
import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'location_detect_widget.dart' show LocationDetectWidget;
import 'package:flutter/material.dart';

class LocationDetectModel extends FlutterFlowModel<LocationDetectWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for lineSeparatorWithText component.
  late LineSeparatorWithTextModel lineSeparatorWithTextModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    lineSeparatorWithTextModel =
        createModel(context, () => LineSeparatorWithTextModel());
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    lineSeparatorWithTextModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navigatorModel.dispose();
  }
}
