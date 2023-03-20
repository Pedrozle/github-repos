class Repositorio {
  String? name, user, avatar, description;

  Repositorio({
    this.name,
    this.user,
    this.avatar,
    this.description,
  });

  Repositorio.fromJson(Map<String, dynamic> json) {
    name = json['full_name'];
    user = json['owner']['login'];
    avatar = json['owner']['avatar_url'];
    description = json['description'];
  }
}