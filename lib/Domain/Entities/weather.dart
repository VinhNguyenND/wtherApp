import 'package:equatable/equatable.dart';
class Weather extends Equatable{
  String description;
  int code;
  String icon;
  Weather( this.description,  this.code,  this.icon);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}