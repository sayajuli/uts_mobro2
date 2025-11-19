import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityCubit extends Cubit<bool> {
  // true = visible, false = hidden
  VisibilityCubit() : super(true);
  
  void toggleVisibility() {
    emit(!state);
  }
}