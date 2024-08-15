import 'package:flutter/material.dart';
import 'package:my_bookly/features/auth/domain/entities/user_entity.dart';

@immutable
abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}

final class LoginSuccess extends LoginState {
  final UserEntity user;

  LoginSuccess({required this.user});
}
