import 'dart:convert';

import 'package:ace/models/mogak/badge_model.dart';

class Author {
  final String id;
  final String? avatar; // 아바타 이미지 URL
  final String nickname;
  final Badge? badge;

  Author(
      {required this.id,
      required this.avatar,
      required this.nickname,
      required this.badge});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'avatar': avatar,
      'nickname': nickname,
      'badge': badge?.toMap(),
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
      id: map['id'] as String,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      nickname: map['nickname'] as String,
      badge: map['badge'] != null
          ? Badge.fromMap(map['badge'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Author.fromJson(String source) =>
      Author.fromMap(json.decode(source) as Map<String, dynamic>);
}
