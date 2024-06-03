// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PeopleModel {
  String name;
  String image;
  String message;
  num unread_message_count;
  String date;
  PeopleModel({
    required this.name,
    required this.image,
    required this.message,
    required this.unread_message_count,
    required this.date,
  });

  PeopleModel copyWith({
    String? name,
    String? image,
    String? message,
    num? unread_message_count,
    String? date,
  }) {
    return PeopleModel(
      name: name ?? this.name,
      image: image ?? this.image,
      message: message ?? this.message,
      unread_message_count: unread_message_count ?? this.unread_message_count,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'message': message,
      'unread_message_count': unread_message_count,
      'date': date,
    };
  }

  factory PeopleModel.fromMap(Map<String, dynamic> map) {
    return PeopleModel(
      name: map['name'] as String,
      image: map['image'] as String,
      message: map['message'] as String,
      unread_message_count: map['unread_message_count'] as num,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PeopleModel.fromJson(String source) => PeopleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PeopleModel(name: $name, image: $image, message: $message, unread_message_count: $unread_message_count, date: $date)';
  }

  @override
  bool operator ==(covariant PeopleModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image &&
      other.message == message &&
      other.unread_message_count == unread_message_count &&
      other.date == date;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      image.hashCode ^
      message.hashCode ^
      unread_message_count.hashCode ^
      date.hashCode;
  }
}
