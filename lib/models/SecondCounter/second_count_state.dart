import 'package:json_annotation/json_annotation.dart';

part 'second_count_state.g.dart';

@JsonSerializable()
class SecondCounter {
  int count;

  SecondCounter({this.count});

  factory SecondCounter.fromJson(Map<String, dynamic> json) =>
      _$SecondCounterFromJson(json);

  Map<String, dynamic> toJson() => _$SecondCounterToJson(this);
}