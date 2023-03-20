import 'package:flutter/material.dart';

class ReposList extends StatefulWidget {
  ReposList({super.key, required this.username});

  String username = "Pedrozle Test";
  String avatarUrl = "";

  @override
  State<ReposList> createState() => _ReposListState();
}

class _ReposListState extends State<ReposList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://avatars.githubusercontent.com/u/61695553?v=4'),
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
              FutureBuilder(
                //future: ApiService.getRepositories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var repositories = snapshot.data;
                    return ListView.separated(
                      itemCount: 1, // repositories.length,
                      itemBuilder: (context, index) {
                        // var repository = repositories[index];

                        return ListTile(
                          dense: true,
                          title: Text(
                            "repo1", //repository!.name.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                              "repo details"), //repository!.description.toString()),
                          leading: CircleAvatar(
                            radius: 48.0,
                            backgroundImage:
                                NetworkImage(""), //repository?.avatar),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          )),
    );
  }
}
