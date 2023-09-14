part of 'theme_bloc.dart';

enum MyAppTheme { light, dark }

class ThemeState extends Equatable {
  final MyAppTheme appTheme;
  const ThemeState({this.appTheme = MyAppTheme.light});

  factory ThemeState.initial() {
    return const ThemeState();
  }

  @override
  List<Object?> get props => [appTheme];

  @override
  bool? get stringify => true;

  ThemeState copyWith({MyAppTheme? appTheme}) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }
}
