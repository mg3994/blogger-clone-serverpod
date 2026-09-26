class CustomRedirect {
  int? id;
  int blogId;
  String fromPath;
  String toPath;
  bool isPermanent;
  DateTime createdAt;

  CustomRedirect({
    this.id,
    required this.blogId,
    required this.fromPath,
    required this.toPath,
    required this.isPermanent,
    required this.createdAt,
  });

  factory CustomRedirect.fromJson(Map<String, dynamic> json) => CustomRedirect(
        id: json['id'],
        blogId: json['blogId'],
        fromPath: json['fromPath'],
        toPath: json['toPath'],
        isPermanent: json['isPermanent'],
        createdAt: DateTime.parse(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'blogId': blogId,
        'fromPath': fromPath,
        'toPath': toPath,
        'isPermanent': isPermanent,
        'createdAt': createdAt.toIso8601String(),
      };
}
