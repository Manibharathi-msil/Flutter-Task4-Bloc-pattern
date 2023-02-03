import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

//We are not going to change the property of the class, so it is immutable
@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}