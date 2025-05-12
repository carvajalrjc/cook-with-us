import '/components/favorite_item/favorite_item_widget.dart';
import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'favorite_widget.dart' show FavoriteWidget;
import 'package:flutter/material.dart';

class FavoriteModel extends FlutterFlowModel<FavoriteWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for FavoriteItem component.
  late FavoriteItemModel favoriteItemModel;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    favoriteItemModel = createModel(context, () => FavoriteItemModel());
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    favoriteItemModel.dispose();
    navigatorModel.dispose();
  }
}
