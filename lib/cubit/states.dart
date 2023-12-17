abstract class NewsStates{}
class NewsInitialState extends NewsStates{}
class NewsBtmNavState extends NewsStates{}
class SelectCountryState extends NewsStates{}

class NewsLoadingState extends NewsStates{}
class NewsGetSuccessState extends NewsStates{}
class NewsGetErrorState extends NewsStates{
  final String error;
  NewsGetErrorState(this.error);
}
class NewsBusinessLoadingState extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsSportsLoadingState extends NewsStates{}
class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsScienceLoadingState extends NewsStates{}
class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsThemeModeState extends NewsStates{}
class SearchNavState extends NewsStates{}


class NewsSearchLoadingState extends NewsStates{}
class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates{
  final String error;
  NewsGetSearchErrorState(this.error);
}





// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca