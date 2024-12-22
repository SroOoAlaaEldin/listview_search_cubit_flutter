import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'myfriends_state.dart';

class MyfriendsCubit extends Cubit<MyfriendsState> {
  MyfriendsCubit() : super(MyfriendsInitialState(Friends));

  //Search Of Filter
  void FilterFriend(String name) {
    if (name.isEmpty) {
      emit(MyfriendsInitialState(Friends));
    } else {
      final filterListed = Friends.where((friend) => friend['name']
          .toString()
          .toLowerCase()
          .contains(name.toLowerCase())).toList();
      emit(MyfriendsFilterSearch(filterListed));
    }
  }
}
