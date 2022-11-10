import 'package:equatable/equatable.dart';

class Todo extends Equatable{
  final String name;
  final String description;

  const Todo({required this.name, required this.description});

  @override
  List<Object> get props => [name, description];
}