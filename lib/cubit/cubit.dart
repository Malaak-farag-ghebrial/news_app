import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/news.dart';


import '../component/constant.dart';
import '../modules/business.dart';
import '../modules/science.dart';
import '../modules/search.dart';
import '../modules/sports.dart';
import '../network/cache_helper.dart';
import '../network/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit(NewsStates initialState) : super(initialState);


 static NewsCubit get(context)=>BlocProvider.of(context);
 int currentIndex =0;
 List <BottomNavigationBarItem> bottomItems = [
   const BottomNavigationBarItem(
       icon: Icon(Icons.newspaper,),
       label:'News'
   ),
   const BottomNavigationBarItem(
       icon: Icon(Icons.business_center,),
       label:'Business'
   ),
   const BottomNavigationBarItem(
       icon: Icon(Icons.sports_football),
   label: 'Sports'
   ),
   const BottomNavigationBarItem(
       icon: Icon(Icons.science),
   label: 'Science'
   ),
 ];

 int selectedCountry = 0;
 List country = [
   'eg',
   'us',
 ];
 List screens = [
   NewsScreen(),
   BusinessScreen(),
   SportsScreen(),
   ScienceScreen(),
   SearchScreen()
 ];

 selectCountry (int index){
   selectedCountry = index;
   emit(SelectCountryState());
   getNews(country[index]);
 }

 changeBtmNavIndex({required int index}){
   currentIndex = index;
   emit(NewsBtmNavState());
   if(index == 0){
     emit(NewsLoadingState());
     getNews(country[selectedCountry]);
   }
   if(index == 1){
     emit(NewsBusinessLoadingState());
     getBusiness();
   }
   if(index == 2) {
     emit(NewsSportsLoadingState());
     getSports();
   }
   if(index == 3){
     emit(NewsScienceLoadingState());
     getScience();
   }
 }

 searchNav({required int i}){
   currentIndex = i;
   emit(SearchNavState());
 }

 List<dynamic> business=[];
 List<dynamic> news=[];
 List<dynamic> sports=[];
 List<dynamic> science=[];
 List<dynamic> search=[];

  void getNews(String country){
    emit(NewsLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines' ,
        query: {
          'country': country,
          'apiKey': apiKey}
      ).then((value) {
        // print(value.data.toString());
        news = value.data['articles'];
        //  print(business);
        emit(NewsGetSuccessState());
      }).catchError((e){
        print('ERROR HAPPENED WHILE GET API IS $e');
        emit(NewsGetErrorState(e.toString()));
      });
  }
 void getBusiness(){
   emit(NewsBusinessLoadingState());
   if(business.isEmpty){
     DioHelper.getData(
       url: 'v2/top-headlines' ,
       query: {
         'country':'eg',
         'category':'business',
         'apiKey': apiKey
       } ,
     ).then((value) {
       // print(value.data.toString());
       business = value.data['articles'];
     //  print(business);
       emit(NewsGetBusinessSuccessState());
     }).catchError((e){
       print('ERROR HAPPENED WHILE GET API IS $e');
       emit(NewsGetBusinessErrorState(e.toString()));
     });
   }
   else{
     emit(NewsGetBusinessSuccessState());
   }
 }
 void getSports(){
   //emit(NewsSportsLoadingState());
  if(sports.isEmpty){
    DioHelper.getData(
      url: 'v2/top-headlines' ,
      query: {
        'country':'eg',
        'category':'sports',
        'apiKey':apiKey
      } ,
    ).then((value) {
      //  print(value.data.toString());
      sports = value.data['articles'];
      //  print(sports);
      emit(NewsGetSportsSuccessState());
    }).catchError((e){
      print('ERROR HAPPENED WHILE GET API IS $e');
      emit(NewsGetSportsErrorState(e.toString()));
    });
  }else{
    emit(NewsGetSportsSuccessState());
  }


 }
 void getScience(){
   // emit( NewsScienceLoadingState());
 if(science.isEmpty){
   DioHelper.getData(
     url: 'v2/top-headlines' ,
     query: {
       'country':'eg',
       'category':'science',
       'apiKey':apiKey
     } ,
   ).then((value) {
     //  print(value.data.toString());
     science = value.data['articles'];
     //  print(science);
     emit(NewsGetScienceSuccessState());
   }).catchError((e){
     print('ERROR HAPPENED WHILE GET API IS $e');
     emit(NewsGetScienceErrorState(e.toString()));
   });
 }else{
   emit(NewsGetScienceSuccessState());
 }
 }

  void getSearch(String value){
    emit(NewsSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything' ,
      query: {
        'q':'$value',
        'apiKey':apiKey
      } ,
    ).then((value) {
      // print(value.data.toString());
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((e){
      print('ERROR HAPPENED WHILE GET API SEARCH IS $e');
      emit(NewsGetSearchErrorState(e.toString()));
    });
  }

 bool isDark = true;

 changeThemeMode({bool? dark}){
   if(dark != null){
     isDark = dark;
     emit(NewsThemeModeState());
   }
   else{
     isDark = !isDark;
     CacheHelper.putBool(key: 'isDark', value: isDark).then((value){
       emit(NewsThemeModeState());
     }).catchError((e)=>print('ERROR HAPPENED WHILE SHAREDPERFERENCE $e  ${CacheHelper.sharedPreferences}'));
   }

 }
}