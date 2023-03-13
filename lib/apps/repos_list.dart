import 'package:flutter/material.dart';

class ReposList extends StatefulWidget {
  const ReposList({super.key});

  @override
  State<ReposList> createState() => _ReposListState();
}

class _ReposListState extends State<ReposList> {
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
                            'https://avatars.githubusercontent.com/u/61695553?v=4'),
                        fit: BoxFit.fill),
                  ),
                ),
                const Text("Pedrozle",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Nome do repo"),
                        Text(
                            "lorem ipsum dolor sit amet draco dormmmen nunquan tintilantus")
                      ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
