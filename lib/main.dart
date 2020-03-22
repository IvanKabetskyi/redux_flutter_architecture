import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_project/actoins/actions.dart';
import 'package:redux_project/models/Counter/counter_state.dart';
import 'package:redux_project/reducers/counter_reducer.dart';
import 'package:redux_project/reducers/second_counter_reducer.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'models/AppSate/app_state.dart';
import 'models/SecondCounter/second_count_state.dart';


void main() {
  final combined = combineReducers<AppState>([
    counterReducer,
    secondCounterReducer,
  ]);
  final AppState _initialState = AppState(counter: Counter(count: 0), secondCounter: SecondCounter(count: 1));
  final Store<AppState> _store = Store<AppState>(combined, initialState: _initialState, middleware: [thunkMiddleware]);
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) => Text(
                '${state?.counter?.count}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Text(
              'You Second:',
            ),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) => Text(
                '${state?.secondCounter?.count}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => StoreProvider.of<AppState>(context).dispatch(udateCounters),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

