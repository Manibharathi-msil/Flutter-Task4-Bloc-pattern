import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

@immutable
abstract class UserState extends Equatable {}
//data loading state
class UserLoadingState extends UserState {
  //Equatable contains the get props method
  @override
  //here we are not passing any data, so it is empty
  List<Object?> get props => [];
}
//data is loaded from the server
class UserLoadedState extends UserState {
  final List<UserModel> users;
  UserLoadedState(this.users);
  @override
  List<Object?> get props => [users];
}
//data loading error state
class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}