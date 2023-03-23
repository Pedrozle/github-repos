class Repositorio {
  String? name, user, repoUrl, description;

  Repositorio({
    this.name,
    this.user,
    this.description,
    this.repoUrl,
  });

  Repositorio.fromJson(Map<String, dynamic> json) {
    name = json['full_name'];
    user = json['owner']['login'];
    description = json['description'];
    repoUrl = json['html_url'];
  }
}
