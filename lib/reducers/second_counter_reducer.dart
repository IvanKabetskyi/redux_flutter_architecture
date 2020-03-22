import 'package:redux_project/models/AppSate/app_state.dart';

AppState secondCounterReducer(AppState prevState, action){
  AppState state = prevState;
  switch (action.type) {
    case 'setSecondCounter':
      state.secondCounter = action.payload['secondCounter'];
      return prevState;
    default:
      return prevState;
  }
}