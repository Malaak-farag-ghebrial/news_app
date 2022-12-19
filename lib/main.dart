import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'component/constant.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'layout_screens/home_layout.dart';
import 'network/cache_helper.dart';
import 'network/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBool(key: 'isDark') == null? false : CacheHelper.getBool(key: 'isDark');
  runApp(MyApp(isDark));

}

class MyApp extends StatelessWidget {
  bool? isDark2;
  MyApp(this.isDark2);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsCubit(NewsInitialState())..getBusiness()..changeThemeMode(dark: isDark2!),
      child: BlocConsumer< NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state)=>MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black38
                ),
              ),
              appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white70,
                      statusBarIconBrightness: Brightness.dark
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                  iconTheme: IconThemeData(
                      color: Colors.black
                  )
              ),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.deepOrange,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                // elevation: 0
              ),
              primarySwatch: Colors.deepOrange
          ),
          darkTheme: ThemeData(
              appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black12,
                      statusBarIconBrightness: Brightness.light
                  ),
                  backgroundColor: Colors.black38,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                  iconTheme: IconThemeData(
                      color: Colors.white
                  )
              ),
              scaffoldBackgroundColor: Colors.black26,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                unselectedItemColor: Colors.white30,
                selectedItemColor: Colors.deepOrange,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,
                // elevation: 0
              ),
              primarySwatch: Colors.deepOrange,
              iconTheme:const IconThemeData(
                  color: Colors.grey
              ) ,
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70
                ),
              )
          ),
          themeMode: NewsCubit.get(context).isDark?  ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: NewsLayout(),
        ),
      ),
    );
  }
}
