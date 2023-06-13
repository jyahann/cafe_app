import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as log;

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    var r = bloc.state.runtimeType.toString();
    var e = event.runtimeType.toString();
    log.log("OnEvent:\t\t{state: $r, event: $e}", name: 'BlocObserver');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log.log("$error", name: 'BlocObserver2');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log.log("$change", name: 'BlocObserver3');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    var curState = transition.currentState.runtimeType.toString();
    var e = transition.event.runtimeType.toString();
    var ns = transition.nextState.runtimeType.toString();
    log.log(
        "OnTransition:\t{currentState: $curState, event: $e, nextState: $ns}",
        name: 'BlocObserver');
  }
}
