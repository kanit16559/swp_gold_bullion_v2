part of 'intro_cubit.dart';


final class IntroState extends Equatable {
  final bool isCheckRadioIntro;

  const IntroState({required this.isCheckRadioIntro});

  IntroState copyWith({bool? isCheckRadioIntro}) {
    return IntroState(
      isCheckRadioIntro: isCheckRadioIntro ?? this.isCheckRadioIntro,
    );
  }

  @override
  List<Object?> get props => [
    isCheckRadioIntro
  ];
}