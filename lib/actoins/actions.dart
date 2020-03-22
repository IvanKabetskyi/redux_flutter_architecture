import 'package:redux/redux.dart';
import 'package:redux_project/models/AppSate/app_state.dart';
import 'package:redux_project/models/Counter/counter_state.dart';
import 'package:redux_project/models/SecondCounter/second_count_state.dart';
import 'package:redux_thunk/redux_thunk.dart';

class Actions {
  String type;
  Map<String, dynamic> payload;

  Actions({this.payload, this.type});
}

ThunkAction<AppState> udateCounters = (Store<AppState> store) async {
  int count = store.state.counter.count;
  int secondCount = store.state.secondCounter.count;
  Counter counter = new Counter(count: count + 1);
  SecondCounter secondCounter = new SecondCounter(count: count + secondCount);

  store.dispatch(new Actions(type: 'setCounter', payload: {
    'counter': counter,
  }));

  store.dispatch(new Actions(type: 'setSecondCounter', payload: {
    'secondCounter': secondCounter,
  }));
};