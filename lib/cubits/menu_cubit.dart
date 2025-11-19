import 'package:flutter_bloc/flutter_bloc.dart';

enum MenuType {
  profile,
  hobbies,
  skills,
  contact
}

class MenuCubit extends Cubit<MenuType> {
  MenuCubit() : super(MenuType.profile);
  
  void changeMenu(MenuType menu) {
    emit(menu);
  }
}