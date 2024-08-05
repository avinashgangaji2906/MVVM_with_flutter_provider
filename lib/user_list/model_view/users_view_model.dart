import 'package:flutter/material.dart';
import 'package:mvvm_provider/user_list/models/user_error.dart';
import 'package:mvvm_provider/user_list/models/user_model.dart';
import 'package:mvvm_provider/user_list/repo/api_status.dart';
import 'package:mvvm_provider/user_list/repo/user_service.dart';

class UserViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError;
  UserModel? _selectedUser;
  UserModel _addingNewUser = UserModel();

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError get userError => _userError ?? UserError();
  UserModel get selectedUser => _selectedUser ?? UserModel();
  UserModel get addingNewUser =>
      _addingNewUser; // storing new user using state management

  UserViewModel() {
    getUsers(); // fetching the users in constructor
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  setSelectedUser(UserModel userModel) {
    _selectedUser = userModel;
  }

  bool addUser() {
    if (!isValid()) {
      return false;
    }
    _userListModel.add(addingNewUser);
    _addingNewUser = UserModel(); // setting newAddingUser to empty
    notifyListeners();
    return true;
  }

  bool isValid() {
    if (addingNewUser.name == null || addingNewUser.name!.isEmpty) {
      return false;
    }
    if (addingNewUser.email == null || addingNewUser.email!.isEmpty) {
      return false;
    }
    return true;
  }

  getUsers() async {
    setLoading(true);
    final response = await UserService.getUserList();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    } else if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse.toString(),
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}
