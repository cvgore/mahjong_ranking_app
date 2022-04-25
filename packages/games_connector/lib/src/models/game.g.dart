// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      id: const UuidValueJsonConverter().fromJson(json['id'] as String),
      players: (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      wind: $enumDecode(_$WindEnumMap, json['wind']),
      round: json['round'] as int,
      finished: json['finished'] as bool,
      startedAt: DateTime.parse(json['startedAt'] as String),
      scores: (json['scores'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': const UuidValueJsonConverter().toJson(instance.id),
      'players': instance.players,
      'wind': _$WindEnumMap[instance.wind],
      'round': instance.round,
      'finished': instance.finished,
      'startedAt': instance.startedAt.toIso8601String(),
      'scores': instance.scores,
    };

const _$WindEnumMap = {
  Wind.east: 'east',
  Wind.south: 'south',
  Wind.west: 'west',
  Wind.north: 'north',
};
