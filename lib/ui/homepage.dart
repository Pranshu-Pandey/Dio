import 'package:demo/data/Model/model.dart';
import 'package:demo/data/network/Repository/userrepo.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserRepository userRepository = UserRepository();

  Future<List<UserModel>> getUsers() async {
    final users = await userRepository.getUsersRequested();
    print(users);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User model list"),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const NewUserPage()),
              // );
            },
            icon: Icon(
              Icons.supervised_user_circle_rounded,
              size: 30,
            ),
          )
        ],
      ),
      // floatingActionButton: AddUser(),
      body: Container(
        child: FutureBuilder<List<UserModel>>(
          future: getUsers(), // Fetch users asynchronously
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                      CircularProgressIndicator()); // Show loading indicator while fetching data
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No users found.'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final user = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        color: Colors.amber,
                        child: ListTile(
                          title: Text(user.lastName.toString()),
                          subtitle: Text(user.email.toString()),
                          leading: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(user.avatar.toString()),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
