import 'package:flutter/material.dart';
import 'package:github_repos/apps/repos_list.dart';

class Index extends StatefulWidget {
  Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  TextEditingController controller = TextEditingController();

  final String infoSnack = "Por favor, insira o usuário do Github";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("GitHub",
                style: TextStyle(
                  fontFamily: 'Montserrat-Bold',
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                )),
            const Text("Visualizador de Repositórios",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: controller,
              style: const TextStyle(
                fontFamily: 'Montserrat-Thin',
              ),
              decoration: const InputDecoration(
                  hintText: "Usuário",
                  label: Text("usuário do github"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 500,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    backgroundColor: const Color.fromRGBO(65, 107, 171, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                  ),
                  onPressed: () => {
                        if (controller.text.isNotEmpty)
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ReposList(username: controller.text);
                                },
                              ),
                            )
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(infoSnack),
                              ),
                            )
                          }
                      },
                  child: const Text(
                    'Pesquisar Repos',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFFFFFFF),
                        fontFamily: 'Montserrat-Thin'),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
