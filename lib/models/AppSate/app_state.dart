import 'package:redux_project/models/Counter/counter_state.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:redux_project/models/SecondCounter/second_count_state.dart';

part 'app_state.g.dart';

@JsonSerializable()
class AppState {
  Counter counter;
  SecondCounter secondCounter;

  AppState({this.counter, this.secondCounter});

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);
}