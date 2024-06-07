import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<LoadChat>((event, emit) {
      emit(const ChatLoaded([]));
    });

    on<SendMessage>((event, emit) {
      if (state is ChatLoaded) {
        final updatedMessages = List.from((state as ChatLoaded).messages)
          ..add(event.message);
        emit(ChatLoaded(updatedMessages));
      }
    });

    on<ReceiveMessage>((event, emit) {
      if (state is ChatLoaded) {
        final updatedMessages = List.from((state as ChatLoaded).messages)
          ..add(event.message);
        emit(ChatLoaded(updatedMessages));
      }
    });
  }
}
