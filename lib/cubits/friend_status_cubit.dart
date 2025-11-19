import 'package:flutter_bloc/flutter_bloc.dart';

enum FriendStatus {
  notFriend,
  requested
}

class FriendStatusCubit extends Cubit<FriendStatus> {
  FriendStatusCubit() : super(FriendStatus.notFriend);
  
  void toggleFriendStatus() {
    emit(state == FriendStatus.notFriend 
        ? FriendStatus.requested 
        : FriendStatus.notFriend);
  }
}