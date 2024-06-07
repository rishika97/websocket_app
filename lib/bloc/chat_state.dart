part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoaded extends ChatState {
  final List<dynamic> messages;

  const ChatLoaded(this.messages);

  @override
  List<Object> get props => [messages];
}
