import 'package:flutter/material.dart';
import 'package:github_repos/apps/repos_list.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
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
            const TextField(
              style: TextStyle(
                fontFamily: 'Montserrat-Thin',
              ),
              decoration: InputDecoration(
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
                        Navigator.push(
                          context,
                          // https://api.github.com/users/{username}/repos
                          MaterialPageRoute(
                              builder: (context) => const ReposList()),
                        )
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
