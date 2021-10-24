import 'dart:async';
import 'package:fun_project/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  //bloc input is called a sink
  StreamSink<int> get _inCounter => _counterStateController.sink;
  //bloc outputs the data into the stream, they come fromthe sink.
  // The stream is where the widgets dump the input to through the sink
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;
  //we have to connect the event sink to the state stream
  // events come in here and the counter value comes out there

  CounterBloc() {
    //whatever is input to it will be dumped through that sink we made
    //basically were catching whatever is dumped into that upper stream sink
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
