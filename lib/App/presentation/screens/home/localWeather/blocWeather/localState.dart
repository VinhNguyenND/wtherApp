import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../../Domain/Entities/location_weather.dart';

enum Status { initial, loading, success, failure }

class LocalState extends Equatable {
  LocalState({this.list = const [], this.status = Status.initial});

  final List<weatherLocation> list;
  final Status status;

  LocalState copyWith({List<weatherLocation>? list, Status? status}) {
    return LocalState(
      status: status??this.status,
      list: list??this.list
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [list,status];
}
