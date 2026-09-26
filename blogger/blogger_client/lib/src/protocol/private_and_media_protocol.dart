class BlogMember {
  int? id;
  int blogId;
  int userId;
  String userEmail;
  String role;
  String status;
  DateTime joinedAt;

  BlogMember({
    this.id,
    required this.blogId,
    required this.userId,
    required this.userEmail,
    required this.role,
    required this.status,
    required this.joinedAt,
  });

  factory BlogMember.fromJson(Map<String, dynamic> json) => BlogMember(
        id: json['id'],
        blogId: json['blogId'],
        userId: json['userId'],
        userEmail: json['userEmail'],
        role: json['role'],
        status: json['status'],
        joinedAt: DateTime.parse(json['joinedAt']),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'blogId': blogId,
        'userId': userId,
        'userEmail': userEmail,
        'role': role,
        'status': status,
        'joinedAt': joinedAt.toIso8601String(),
      };
}

class MediaItem {
  int? id;
  int blogId;
  String filename;
  String url;
  String mimeType;
  int sizeInBytes;
  DateTime uploadedAt;

  MediaItem({
    this.id,
    required this.blogId,
    required this.filename,
    required this.url,
    required this.mimeType,
    required this.sizeInBytes,
    required this.uploadedAt,
  });

  factory MediaItem.fromJson(Map<String, dynamic> json) => MediaItem(
        id: json['id'],
        blogId: json['blogId'],
        filename: json['filename'],
        url: json['url'],
        mimeType: json['mimeType'],
        sizeInBytes: json['sizeInBytes'],
        uploadedAt: DateTime.parse(json['uploadedAt']),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'blogId': blogId,
        'filename': filename,
        'url': url,
        'mimeType': mimeType,
        'sizeInBytes': sizeInBytes,
        'uploadedAt': uploadedAt.toIso8601String(),
      };
}

class EmailSubscriber {
  int? id;
  int blogId;
  String email;
  bool isConfirmed;
  DateTime subscribedAt;

  EmailSubscriber({
    this.id,
    required this.blogId,
    required this.email,
    required this.isConfirmed,
    required this.subscribedAt,
  });

  factory EmailSubscriber.fromJson(Map<String, dynamic> json) => EmailSubscriber(
        id: json['id'],
        blogId: json['blogId'],
        email: json['email'],
        isConfirmed: json['isConfirmed'],
        subscribedAt: DateTime.parse(json['subscribedAt']),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'blogId': blogId,
        'email': email,
        'isConfirmed': isConfirmed,
        'subscribedAt': subscribedAt.toIso8601String(),
      };
}
