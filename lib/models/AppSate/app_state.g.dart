// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return AppState(
    counter: json['counter'] == null
        ? null
        : Counter.fromJson(json['counter'] as Map<String, dynamic>),
    secondCounter: json['secondCounter'] == null
        ? null
        : SecondCounter.fromJson(json['secondCounter'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'counter': instance.counter,
      'secondCounter': instance.secondCounter,
    };
