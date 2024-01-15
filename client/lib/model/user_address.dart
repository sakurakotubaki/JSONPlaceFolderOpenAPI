//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserAddress {
  /// Returns a new [UserAddress] instance.
  UserAddress({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? street;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? suite;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? city;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? zipcode;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UserAddressGeo? geo;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserAddress &&
    other.street == street &&
    other.suite == suite &&
    other.city == city &&
    other.zipcode == zipcode &&
    other.geo == geo;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (street == null ? 0 : street!.hashCode) +
    (suite == null ? 0 : suite!.hashCode) +
    (city == null ? 0 : city!.hashCode) +
    (zipcode == null ? 0 : zipcode!.hashCode) +
    (geo == null ? 0 : geo!.hashCode);

  @override
  String toString() => 'UserAddress[street=$street, suite=$suite, city=$city, zipcode=$zipcode, geo=$geo]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.street != null) {
      json[r'street'] = this.street;
    } else {
      json[r'street'] = null;
    }
    if (this.suite != null) {
      json[r'suite'] = this.suite;
    } else {
      json[r'suite'] = null;
    }
    if (this.city != null) {
      json[r'city'] = this.city;
    } else {
      json[r'city'] = null;
    }
    if (this.zipcode != null) {
      json[r'zipcode'] = this.zipcode;
    } else {
      json[r'zipcode'] = null;
    }
    if (this.geo != null) {
      json[r'geo'] = this.geo;
    } else {
      json[r'geo'] = null;
    }
    return json;
  }

  /// Returns a new [UserAddress] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserAddress? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserAddress[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserAddress[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserAddress(
        street: mapValueOfType<String>(json, r'street'),
        suite: mapValueOfType<String>(json, r'suite'),
        city: mapValueOfType<String>(json, r'city'),
        zipcode: mapValueOfType<String>(json, r'zipcode'),
        geo: UserAddressGeo.fromJson(json[r'geo']),
      );
    }
    return null;
  }

  static List<UserAddress> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserAddress>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserAddress.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserAddress> mapFromJson(dynamic json) {
    final map = <String, UserAddress>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserAddress.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserAddress-objects as value to a dart map
  static Map<String, List<UserAddress>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserAddress>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserAddress.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

