import 'package:redux_project/models/AppSate/app_state.dart';

AppState counterReducer(AppState prevState, action){
  AppState state = prevState;
  switch (action.type) {
    case 'setCounter':
      state.counter = action.payload['counter'];
      return prevState;
      

    default:
      return prevState;
  }
}