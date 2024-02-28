import '/backend/api_requests/api_calls.dart';
import '/components/movie_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isLoading = true;
      });
      _model.result = await GetMoviesCall.call();
      if ((_model.result?.succeeded ?? true)) {
        setState(() {
          _model.movieList = getJsonField(
            (_model.result?.jsonBody ?? ''),
            r'''$.movies''',
          );
        });
        setState(() {
          _model.isLoading = false;
        });
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        backgroundColor: Color(0xFFFFE500),
        appBar: AppBar(
          backgroundColor: Color(0xFFFFE500),
          automaticallyImplyLeading: false,
          title: Text(
            'LA LA FILM',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Manrope',
                  color: Color(0xFF111111),
                  fontSize: 29.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                child: Text(
                  'INFO',
                  textAlign: TextAlign.justify,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Color(0xFF111111),
                        fontSize: 14.0,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Opacity(
                opacity: 0.8,
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      Duration(milliseconds: 2000),
                      () async {
                        _model.searchedMovie = await SearchMoviesCall.call(
                          query: _model.textController.text,
                        );
                        if ((_model.searchedMovie?.succeeded ?? true)) {
                          setState(() {
                            _model.movieList = getJsonField(
                              (_model.searchedMovie?.jsonBody ?? ''),
                              r'''$.contents''',
                            );
                          });
                        }

                        setState(() {});
                      },
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Search...',
                      labelStyle: GoogleFonts.getFont(
                        'Manrope',
                        color: Color(0xFF111111),
                      ),
                      alignLabelWithHint: false,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE4CF12),
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      filled: true,
                      fillColor: Color(0xFFE4CF12),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      suffixIcon: Icon(
                        Icons.search_outlined,
                        color: Color(0xFF111111),
                        size: 20.0,
                      ),
                    ),
                    style: GoogleFonts.getFont(
                      'Manrope',
                      color: Color(0xFF111111),
                    ),
                    textAlign: TextAlign.justify,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
              if (_model.isLoading == false)
                Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Builder(
                        builder: (context) {
                          final movieListNew = getJsonField(
                            _model.movieList,
                            r'''$''',
                          ).toList();
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: movieListNew.length,
                            separatorBuilder: (_, __) => SizedBox(height: 20.0),
                            itemBuilder: (context, movieListNewIndex) {
                              final movieListNewItem =
                                  movieListNew[movieListNewIndex];
                              return MovieListItemWidget(
                                key: Key(
                                    'Keyum5_${movieListNewIndex}_of_${movieListNew.length}'),
                                parameter1: getJsonField(
                                  movieListNewItem,
                                  r'''$.backdrop_path''',
                                ),
                                parameter2: getJsonField(
                                  movieListNewItem,
                                  r'''$.title''',
                                ),
                                parameter3: getJsonField(
                                  movieListNewItem,
                                  r'''$._id''',
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
