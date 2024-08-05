import 'package:flutter/material.dart';
import 'package:mvvm_provider/user_list/model_view/users_view_model.dart';
import 'package:mvvm_provider/utils/app_navigation.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: const Text('User Details'),
        actions: [
          IconButton(
              onPressed: () => openAddUser(context),
              icon: const Icon(
                Icons.add,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userViewModel.selectedUser.name!),
            Text(userViewModel.selectedUser.email!),
          ],
        ),
      ),
    );
  }
}
