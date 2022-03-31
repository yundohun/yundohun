import 'dart:convert';

class ClosetInfo {
  String? id;
  String url;
  String path;
  String nm;
  String fullPath;

  ClosetInfo({
    this.id,
    required this.url,
    required this.path,
    required this.nm,
    required this.fullPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'path': path,
      'nm': nm,
      'fullPath': fullPath,
    };
  }

  factory ClosetInfo.fromMap(String id, Map<String, dynamic> map) {
    return ClosetInfo(
      id: id,
      url: map['url'] ?? '',
      path: map['path'] ?? '',
      nm: map['nm'] ?? '',
      fullPath: map['fullPath'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ClosetInfo.fromJson(String id, String source) =>
      ClosetInfo.fromMap(id, json.decode(source));
}
