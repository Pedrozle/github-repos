import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_repos/constants/colors.dart';
import 'package:github_repos/models/repositorio.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

const String usuarioNaoEncontrado = "Usuário não encontrado!";

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
      final resposta = await Dio().get("https://api.github.com/users/${widget.username}/repos");
      if (resposta.data != null) {
        setState(
          () {
            naoExiste = false;
            carregando = false;
            repositorios =
                List<Repositorio>.from(resposta.data.map((repositorioJson) => Repositorio.fromJson(repositorioJson)));
          },
        );
      }
    } on DioError catch (err) {
      debugPrint(err.toString());
      setState(() {
        carregando = false;
        naoExiste = true;
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
              child: LoadingAnimationWidget.prograssiveDots(color: const Color(ColorsEnum.secondaryColor), size: 100),
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
                      LoadingAnimationWidget.fourRotatingDots(color: const Color(ColorsEnum.error), size: 100),
                    ],
                  ),
                )
              : SafeArea(
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
                                image: NetworkImage("https://github.com/${widget.username}.png"), fit: BoxFit.fill),
                          ),
                        ),
                        Text(repositorios[0].user!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(color: Color.fromARGB(255, 175, 184, 202)),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...repositorios.map(
                                (e) {
                                  return Card(
                                    elevation:
                                        1, // apesar de ser usado para sombreamento, é necessário atenção por se tratar dos níveis que o card será trazido para frente
                                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: ListTile(
                                        title: Text(
                                          e.name!.split('/')[1],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: 'Ubuntu',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.25,
                                          ),
                                        ),
                                        subtitle: Column(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(top: 10, bottom: 5),
                                              child: Text(
                                                e.description ?? 'Sem descrição',
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  height: 1.25,
                                                ),
                                              ),
                                            ),
                                            ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(16))),
                                                backgroundColor: const Color(
                                                    ColorsEnum.secondaryColor), //const Color.fromRGBO(65, 107, 171, 1),
                                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                              ),
                                              onPressed: () {
                                                launchUrl(Uri.parse(e.repoUrl ?? ""));
                                              },
                                              label: const Text(
                                                "Abrir repositorio",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              icon: const Icon(Icons.link),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
    );
  }
}
