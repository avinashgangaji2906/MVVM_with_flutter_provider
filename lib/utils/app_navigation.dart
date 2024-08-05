import 'package:flutter/material.dart';
import 'package:mvvm_provider/user_list/views/add_user_screen.dart';
import 'package:mvvm_provider/user_list/views/user_details.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const UserDetails(),
    ),
  );
}

void openAddUser(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const AddUserScreen(),
    ),
  );
}
