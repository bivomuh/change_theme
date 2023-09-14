import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ChangeThemeEvent>(
      (event, emit) {
        if (event.isChange == true) {
          emit(state.copyWith(appTheme: MyAppTheme.light));
        } else {
          emit(state.copyWith(appTheme: MyAppTheme.dark));
        }
      },
    );
  }
}
