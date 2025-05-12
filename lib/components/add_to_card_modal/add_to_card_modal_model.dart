import '/components/add_extra_item/add_extra_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_to_card_modal_widget.dart' show AddToCardModalWidget;
import 'package:flutter/material.dart';

class AddToCardModalModel extends FlutterFlowModel<AddToCardModalWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for AddExtraItem component.
  late AddExtraItemModel addExtraItemModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    addExtraItemModel = createModel(context, () => AddExtraItemModel());
  }

  @override
  void dispose() {
    addExtraItemModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
