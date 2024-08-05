import 'package:flutter/material.dart';
import 'package:mvvm_provider/user_list/model_view/users_view_model.dart';
import 'package:mvvm_provider/user_list/models/user_model.dart';
import 'package:mvvm_provider/user_list/views/user_list_row.dart';
import 'package:mvvm_provider/utils/app_navigation.dart';
import 'package:mvvm_provider/widgets/app_error.dart';
import 'package:mvvm_provider/widgets/app_loader.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: const Text('Users-List'),
        actions: [
          IconButton(
            onPressed: () async {
              openAddUser(context);
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
          IconButton(
            onPressed: () async {
              userViewModel.getUsers();
            },
            icon: const Icon(
              Icons.refresh,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [_ui(userViewModel)],
        ),
      ),
    );
  }

  Widget _ui(UserViewModel userViewModel) {
    if (userViewModel.loading) {
      return const AppLoader();
    } else if (userViewModel.userError.code != null) {
      return AppError(
          errortxt: userViewModel.userError.message ?? 'Something went wrong');
    }
    return Expanded(
      child: ListView.separated(
        itemCount: userViewModel.userListModel.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          UserModel userModel = userViewModel.userListModel[index];
          return UserListRow(
            userModel: userModel,
            onTap: () async {
              userViewModel.setSelectedUser(userModel);
              openUserDetails(context);
            },
          );
        },
      ),
    );
  }
}
