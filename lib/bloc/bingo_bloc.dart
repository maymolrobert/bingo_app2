import 'bloc_event.dart';
import 'bloc_state.dart';
import 'package:bloc/bloc.dart';
class BingoBloc extends Bloc<BingoEvent, BingoState> {
  List userSelectedList = [];
  final List numbersList = List.generate(25, (int index) => '');
  int number = 0;
  BingoBloc() : super(BingoInitialState()) {
    on<BingoAddNumberEvent>((event, emit) {
      addToUserSelectedList(event.userIndexValue);
      emit(BingoAddNumberState(numbersList));
    });
  }
  void addToUserSelectedList(int index) {
    if (number == 25) {
      numbersList[index] = 'X';
    } else {
      if (userSelectedList.contains(index)) {
      } else {
        number = number + 1;
        userSelectedList.add(index);
        numbersList[index] = number;
      }
    }
  }
}
