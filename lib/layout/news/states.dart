
abstract class NewsStates {}

class InitialState extends NewsStates{}

class ChangeBotNavBar extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}
class GetBusinessError extends NewsStates{
  final String error;
  GetBusinessError(this.error);
}
class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetSportSuccessState extends NewsStates{}
class GetSportError extends NewsStates{
  final String error;
  GetSportError(this.error);
}
class NewsGetSportLoadingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}
class GetScienceError extends NewsStates{
  final String error;
  GetScienceError(this.error);
}
class NewsGetScienceLoadingState extends NewsStates{}

class NewsGetSearchSuccessState extends NewsStates{}
class GetSearchError extends NewsStates{
  final String error;
  GetSearchError(this.error);
}
class NewsGetSearchLoadingState extends NewsStates{}