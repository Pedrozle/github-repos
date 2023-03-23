import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_repos/models/repositorio.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const String usuarioNaoEncontrado =
    "Usuário \${widget.username} não encontrado!";

class ReposList extends StatefulWidget {
  final String username;
  const ReposList({super.key, required this.username});

  @override
  State<ReposList> createState() => _ReposListState();
}

class _ReposListState extends State<ReposList> {
  List<Repositorio> repositorios = [];

  bool carregando = true;
  bool naoExiste = false;

  loadRepositories() async {
    try {
      final resposta =
          await Dio().get("https://api.github.com/${widget.username}/repos");
      if (resposta.data != null) {
        setState(
          () {
            naoExiste = false;
            carregando = false;
            repositorios = List<Repositorio>.from(resposta.data.map(
                (repositorioJson) => Repositorio.fromJson(repositorioJson)));
          },
        );
      }
    } on DioError catch (err) {
      debugPrint(err.toString());
      setState(() {
        carregando = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadRepositories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: carregando
          ? Center(
              child: LoadingAnimationWidget.newtonCradle(
                  color: Colors.cyan, size: 100),
            )
          : naoExiste
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        usuarioNaoEncontrado,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      LoadingAnimationWidget.newtonCradle(
                          color: Colors.cyan, size: 100),
                    ],
                  ),
                )
              : SafeArea(
                  minimum: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const Text("GitHub",
                          style: TextStyle(
                            fontFamily: 'Montserrat-Bold',
                            fontWeight: FontWeight.bold,
                            fontSize: 42,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(8),
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://github.com/${widget.username}.png"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Text(widget.username,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  )),
    );
  }
}
