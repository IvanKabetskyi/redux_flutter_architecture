import 'package:json_annotation/json_annotation.dart';

part 'counter_state.g.dart';

@JsonSerializable()
class Counter {
  int count;

  Counter({this.count});

  factory Counter.fromJson(Map<String, dynamic> json) =>
      _$CounterFromJson(json);

  Map<String, dynamic> toJson() => _$CounterToJson(this);
}