import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroState(
    isCheckRadioIntro: false
  ));

  void onChangeRadio(){
    bool getState = state.isCheckRadioIntro;
    emit(state.copyWith(
      isCheckRadioIntro: !getState
    ));
  }
}
