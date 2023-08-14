import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollOffset {
  int scrollOfsetValue;
  ScrollOffset({required this.scrollOfsetValue});

  ScrollOffset copyWith(int scrollOfsetValue) {
    return ScrollOffset(scrollOfsetValue: scrollOfsetValue);
  }
}
class DisplayOffset extends Cubit<ScrollOffset>{

  DisplayOffset(ScrollOffset display) : super(display);

  void changeDisplayOffset(int value){
    
    emit(state.copyWith(value));
  }


}