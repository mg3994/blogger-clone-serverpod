import 'dart:convert';

class FollowedBlog {
  int? id;
  int userId;
  int blogId;
  String blogTitle;
  String blogUrl;
  DateTime followedAt;

  FollowedBlog({
    this.id,
    required this.userId,
    required this.blogId,
    required this.blogTitle,
    required this.blogUrl,
    required this.followedAt,
  });

  factory FollowedBlog.fromJson(Map<String, dynamic> json) => FollowedBlog(
        id: json['id'],
        userId: json['userId'],
        blogId: json['blogId'],
        blogTitle: json['blogTitle'],
        blogUrl: json['blogUrl'],
        followedAt: DateTime.parse(json['followedAt']),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'userId': userId,
        'blogId': blogId,
        'blogTitle': blogTitle,
        'blogUrl': blogUrl,
        'followedAt': followedAt.toIso8601String(),
      };
}

class BlogTheme {
  int? id;
  int blogId;
  String themeName;
  String primaryColor;
  String fontFamily;
  String? customCss;
  String layoutVariant;
  DateTime updatedAt;

  BlogTheme({
    this.id,
    required this.blogId,
    required this.themeName,
    required this.primaryColor,
    required this.fontFamily,
    this.customCss,
    required this.layoutVariant,
    required this.updatedAt,
  });

  factory BlogTheme.fromJson(Map<String, dynamic> json) => BlogTheme(
        id: json['id'],
        blogId: json['blogId'],
        themeName: json['themeName'],
        primaryColor: json['primaryColor'],
        fontFamily: json['fontFamily'],
        customCss: json['customCss'],
        layoutVariant: json['layoutVariant'],
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'blogId': blogId,
        'themeName': themeName,
        'primaryColor': primaryColor,
        'fontFamily': fontFamily,
        if (customCss != null) 'customCss': customCss,
        'layoutVariant': layoutVariant,
        'updatedAt': updatedAt.toIso8601String(),
      };
}
