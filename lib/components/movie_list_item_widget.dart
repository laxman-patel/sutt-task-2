import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'movie_list_item_model.dart';
export 'movie_list_item_model.dart';

class MovieListItemWidget extends StatefulWidget {
  const MovieListItemWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final dynamic parameter1;
  final dynamic parameter2;
  final dynamic parameter3;

  @override
  State<MovieListItemWidget> createState() => _MovieListItemWidgetState();
}

class _MovieListItemWidgetState extends State<MovieListItemWidget> {
  late MovieListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieListItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          'ItemPage',
          queryParameters: {
            'id': serializeParam(
              widget.parameter3?.toString(),
              ParamType.String,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.leftToRight,
            ),
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Image.network(
              widget.parameter1!.toString(),
              width: 382.0,
              height: 176.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 368.0,
            height: 63.0,
            decoration: BoxDecoration(
              color: Color(0xFF111111),
            ),
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: AutoSizeText(
                      widget.parameter2!.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'felidae',
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 30.0,
                      ),
                      minFontSize: 3.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Color(0xFF111111),
                    borderRadius: 0.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: Color(0xFF111111),
                    icon: Icon(
                      Icons.favorite_border,
                      color: _model.liked!
                          ? Colors.white
                          : FlutterFlowTheme.of(context).error,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      setState(() {
                        _model.liked = !_model.liked!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
