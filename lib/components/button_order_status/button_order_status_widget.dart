import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'button_order_status_model.dart';
export 'button_order_status_model.dart';

class ButtonOrderStatusWidget extends StatefulWidget {
  const ButtonOrderStatusWidget({super.key});

  @override
  State<ButtonOrderStatusWidget> createState() =>
      _ButtonOrderStatusWidgetState();
}

class _ButtonOrderStatusWidgetState extends State<ButtonOrderStatusWidget> {
  late ButtonOrderStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonOrderStatusModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: FFLocalizations.of(context).getText(
        'eh2zj9q4' /* On Progress */,
      ),
      options: FFButtonOptions(
        height: 24.0,
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primaryBackground,
        textStyle: FlutterFlowTheme.of(context).bodySmall.override(
              font: GoogleFonts.plusJakartaSans(
                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).coralGreen2,
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).coralGreen2,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }
}
