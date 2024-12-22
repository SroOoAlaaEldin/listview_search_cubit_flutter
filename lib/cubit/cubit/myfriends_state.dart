part of 'myfriends_cubit.dart';

class MyfriendsState {}

// List of Names my Friends
final List<Map<String, dynamic>> Friends = [
  {"name": "Mohamed", "country": "India"},
  {"name": "Asma", "country": "India"},
  {"name": "Muna", "country": "India"},
  {"name": "Omer", "country": "India"},
  {"name": "Ahmed", "country": "India"},
  {"name": "Ekram", "country": "India"},
  {"name": "Mostafa", "country": "London"},
  {"name": "Khaild", "country": "India"},
  {"name": "AboBaker", "country": "Egypt"},
  {"name": "Esam", "country": "Egypt"},
];

//Get All of List Names
final class MyfriendsInitialState extends MyfriendsState {
  final List<Map<String, dynamic>> friends;
  MyfriendsInitialState(this.friends);
}

//Search
class MyfriendsFilterSearch extends MyfriendsState {
  final List<Map<String, dynamic>> filterFriends;
  MyfriendsFilterSearch(this.filterFriends);
}
