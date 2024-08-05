import 'package:flutter/material.dart';
import 'package:mvvm_provider/user_list/model_view/users_view_model.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserViewModel usersViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: const Text('Add User'),
        actions: [
          IconButton(
              onPressed: () async {
                bool userAdded = usersViewModel.addUser();
                if (!userAdded) {
                  return;
                }
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.check_circle_outline,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Name'),
              onChanged: (val) async {
                usersViewModel.addingNewUser.name = val;
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
              onChanged: (val) async {
                usersViewModel.addingNewUser.email = val;
              },
            )
          ],
        ),
      ),
    );
  }
}
