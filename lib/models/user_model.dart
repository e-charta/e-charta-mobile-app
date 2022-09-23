import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? adress;
  final String? photo;

  const User({
    required this.id,
    this.adress,
    this.email,
    this.firstName,
    this.lastName,
    this.photo,
  });

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, id, firstName, lastName, photo, adress];
}
