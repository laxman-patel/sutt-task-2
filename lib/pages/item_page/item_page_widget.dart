import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_page_model.dart';
export 'item_page_model.dart';

class ItemPageWidget extends StatefulWidget {
  const ItemPageWidget({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<ItemPageWidget> createState() => _ItemPageWidgetState();
}

class _ItemPageWidgetState extends State<ItemPageWidget> {
  late ItemPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(17.0, 0.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Text(
                  'BACK',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Color(0xFF111111),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'LA LA FILM',
              style: GoogleFonts.getFont(
                'Manrope',
                color: Color(0xFF111111),
                fontWeight: FontWeight.w600,
                fontSize: 29.0,
              ),
            ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                child: Text(
                  'INFO',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Color(0xFF111111),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FutureBuilder<ApiCallResponse>(
              future: GetMovieDetailsCall.call(
                id: widget.id,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                final columnGetMovieDetailsResponse = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.network(
                          getJsonField(
                            GetMovieDetailsCall.movie(
                              columnGetMovieDetailsResponse.jsonBody,
                            ),
                            r'''$.poster_path''',
                          ).toString(),
                          width: 340.0,
                          height: 323.0,
                          fit: BoxFit.cover,
                          alignment: Alignment(-1.0, -1.0),
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.png',
                            width: 340.0,
                            height: 323.0,
                            fit: BoxFit.cover,
                            alignment: Alignment(-1.0, -1.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 343.0,
                      height: 31.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                getJsonField(
                                  GetMovieDetailsCall.movie(
                                    columnGetMovieDetailsResponse.jsonBody,
                                  ),
                                  r'''$.release_date''',
                                )?.toString(),
                                'year',
                              ),
                              style: GoogleFonts.getFont(
                                'Inter',
                                color: Color(0xFF111111),
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              getJsonField(
                                GetMovieDetailsCall.movie(
                                  columnGetMovieDetailsResponse.jsonBody,
                                ),
                                r'''$.vote_average''',
                              )?.toString(),
                              'rating',
                            ),
                            style: GoogleFonts.getFont(
                              'Inter',
                              color: Color(0xFF111111),
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                      child: AutoSizeText(
                        valueOrDefault<String>(
                          getJsonField(
                            GetMovieDetailsCall.movie(
                              columnGetMovieDetailsResponse.jsonBody,
                            ),
                            r'''$.title''',
                          )?.toString(),
                          'loading...',
                        ),
                        textAlign: TextAlign.justify,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'felidae',
                              color: Color(0xFF111111),
                              fontSize: 36.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 40.0, 24.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          getJsonField(
                            GetMovieDetailsCall.movie(
                              columnGetMovieDetailsResponse.jsonBody,
                            ),
                            r'''$.overview''',
                          )?.toString(),
                          'it\'s fine.',
                        ),
                        textAlign: TextAlign.justify,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: Color(0xFF111111),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await launchURL(getJsonField(
                              GetMovieDetailsCall.movie(
                                columnGetMovieDetailsResponse.jsonBody,
                              ),
                              r'''$.youtube_trailer''',
                            ).toString());
                          },
                          text: 'WATCH TRAILER',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.87,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF111111),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Manrope',
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
