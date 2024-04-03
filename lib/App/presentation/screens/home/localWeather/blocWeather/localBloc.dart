import 'dart:math';

import 'package:bloc/bloc.dart';

import 'package:my_weather/Data/Resource/Dto/Request/weather_request.dart';

import '../../../../../../Domain/Usecases/WeatherUsecase/weather_usecase.dart';
import 'localEvent.dart';
import 'localState.dart';

class LocalBloc extends Bloc<LocationEvent, LocalState> {
  WeatherUseCase useCase;

  LocalBloc({required this.useCase}) : super(LocalState()){
    on<LocalEvent>(_getLocalWeather);
  }

  // Future<void> getLocalWeather(WeatherRequest request) async {
  //   try {
  //     emit(state.copyWith(status: Status.loading));
  //     var response = await useCase.repository.getWeatherLocation(request);
  //     response.fold((left) {
  //       print('left $left');
  //       emit(state.copyWith(status: Status.failure));
  //     }, (right) {
  //       emit(state.copyWith(status: Status.success, list: right.data));
  //     });
  //   } catch (e) {
  //     emit(state.copyWith(status: Status.failure));
  //   }
  // }

  Future<void> _getLocalWeather(LocalEvent event, Emitter<LocalState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      var response = await useCase.repository.getWeatherLocation(event.request!);
      response.fold((left) {
        print('left $left');
        emit(state.copyWith(status: Status.failure));
      }, (right) {
        emit(state.copyWith(status: Status.success, list: right.data));
      });
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
