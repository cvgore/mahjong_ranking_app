import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

class UuidValueJsonConverter implements JsonConverter<UuidValue, String> {
  const UuidValueJsonConverter();

  @override
  UuidValue fromJson(String json) {
    return UuidValue(json);
  }

  @override
  String toJson(UuidValue object) {
    return object.uuid;
  }
}

extension UuidValueNull on UuidValue {
  static const String UUID_EMPTY = "00000000-0000-0000-0000-000000000000";

  static get empty => UuidValue(UUID_EMPTY, false);

  get isEmpty => uuid == UUID_EMPTY;
}
