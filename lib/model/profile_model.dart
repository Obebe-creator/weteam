class ProfileModel {
  String? imageUrl; // 프로필 사진
  String? organization; // 소속

  ProfileModel({
    this.imageUrl,
    this.organization,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      imageUrl: json['imageUrl'],
      organization: json['organization'],
    );
  }

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'organization': organization,
      };
}
