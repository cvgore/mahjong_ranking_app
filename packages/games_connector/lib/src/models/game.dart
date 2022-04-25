import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid_json/uuid_json.dart';

import 'json_map.dart';
import 'models.dart';

part 'game.g.dart';

@immutable
@JsonSerializable()
class Game extends Equatable {
  Game({
    required this.id,
    required this.players,
    required this.wind,
    required this.round,
    required this.finished,
    required this.startedAt,
    required this.scores,
  }) : super();

  @UuidValueJsonConverter()
  final UuidValue id;
  final List<Player> players;
  final Wind wind;
  final int round;
  final bool finished;
  final DateTime startedAt;
  final List<int> scores;

  Game copyWith({
    required UuidValue id,
    required List<Player> players,
    required Wind wind,
    required int round,
    required bool finished,
    required DateTime startedAt,
    required List<int> scores,
  }) {
    return Game(
        id: id,
        players: players,
        wind: wind,
        round: round,
        finished: finished,
        startedAt: startedAt,
        scores: scores
    );
  }

  static Game fromJson(JsonMap json) => _$GameFromJson(json);

  JsonMap toJson() => _$GameToJson(this);

  @override
  List<Object> get props => [id, players];
}
