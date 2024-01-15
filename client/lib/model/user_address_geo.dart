//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserAddressGeo {
  /// Returns a new [UserAddressGeo] instance.
  UserAddressGeo({
    this.lat,
    this.lng,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lat;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lng;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserAddressGeo &&
    other.lat == lat &&
    other.lng == lng;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (lat == null ? 0 : lat!.hashCode) +
    (lng == null ? 0 : lng!.hashCode);

  @override
  String toString() => 'UserAddressGeo[lat=$lat, lng=$lng]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.lat != null) {
      json[r'lat'] = this.lat;
    } else {
      json[r'lat'] = null;
    }
    if (this.lng != null) {
      json[r'lng'] = this.lng;
    } else {
      json[r'lng'] = null;
    }
    return json;
  }

  /// Returns a new [UserAddressGeo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserAddressGeo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserAddressGeo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserAddressGeo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserAddressGeo(
        lat: mapValueOfType<String>(json, r'lat'),
        lng: mapValueOfType<String>(json, r'lng'),
      );
    }
    return null;
  }

  static List<UserAddressGeo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserAddressGeo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserAddressGeo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserAddressGeo> mapFromJson(dynamic json) {
    final map = <String, UserAddressGeo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserAddressGeo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserAddressGeo-objects as value to a dart map
  static Map<String, List<UserAddressGeo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserAddressGeo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserAddressGeo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

