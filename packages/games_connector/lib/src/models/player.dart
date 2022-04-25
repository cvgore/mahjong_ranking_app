import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid_json/uuid_json.dart';

import 'json_map.dart';

part 'player.g.dart';

@immutable
@JsonSerializable()
class Player extends Equatable {
  Player({
    required this.id,
    required this.displayName,
    required this.usmaId,
  }) : super();

  @UuidValueJsonConverter()
  final UuidValue id;

  final String displayName;

  final String usmaId;

  copyWith({
    required UuidValue id,
    required String displayName,
    required String usmaId,
  }) {
    return Player(
      id: id,
      displayName: displayName,
      usmaId: usmaId,
    );
  }

  static Player fromJson(JsonMap json) => _$PlayerFromJson(json);

  JsonMap toJson() => _$PlayerToJson(this);

  @override
  List<Object> get props => [id, displayName, usmaId];
}
