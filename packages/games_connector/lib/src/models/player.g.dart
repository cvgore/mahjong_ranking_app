// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      id: const UuidValueJsonConverter().fromJson(json['id'] as String),
      displayName: json['displayName'] as String,
      usmaId: json['usmaId'] as String,
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'id': const UuidValueJsonConverter().toJson(instance.id),
      'displayName': instance.displayName,
      'usmaId': instance.usmaId,
    };
