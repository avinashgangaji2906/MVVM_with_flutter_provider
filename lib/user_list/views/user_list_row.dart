import 'package:flutter/material.dart';
import 'package:mvvm_provider/user_list/models/user_model.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final Function onTap;
  const UserListRow({super.key, required this.userModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        userModel.name ?? '',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        userModel.email ?? '',
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
      onTap: () => onTap(),
    );
  }
}
