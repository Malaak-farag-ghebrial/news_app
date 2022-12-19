import 'package:bloc/bloc.dart';
String apiKey = '1db16a48b19a4a5798323fb8eae54f80';
class MyBlocObserver extends BlocObserver{
  @override
  void onCreate(BlocBase bloc){
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }
  @override
  void onChange (BlocBase bloc, Change change){
    super.onChange(bloc,change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }
  @override
  void onError (BlocBase bloc, Object error, StackTrace stackTrace){

    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc,error,stackTrace);
  }
  @override
  void onClose (BlocBase bloc){
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');

  }
}