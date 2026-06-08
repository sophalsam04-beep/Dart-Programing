import 'counter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import 'package:demo_2/counter_event.dart';
import 'package:demo_2/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    // increment
    on<IncrementCounter>((event, emit) {
      emit(CounterState(state.counter + 1));
    });

    // decrement
    on<DecrementCounter>((event, emit) {
      emit(CounterState(state.counter - 1));
    });

    // reset
    on<ResetCounter>((event, emit) {
      emit(CounterState(state.counter * 3));
    });
  }
}




class CounterState{
    final int counter;

    CounterState(this.counter);
    
}



abstract class CounterEvent{}

class IncrementCounter extends CounterEvent{}
class DecrementCounter extends CounterEvent{}
class ResetCounter extends CounterEvent{}

void main(List<String> args) {
  runApp(BlocProvider(create: (context) => CounterBloc(), child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bloc in flutter",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text("${state.counter}");
          },
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => bloc.add(IncrementCounter()),
            child: Text("+"),
          ),

          FloatingActionButton(
            onPressed: () => bloc.add(DecrementCounter()),
            child: Text("-"),
          ),

          FloatingActionButton(
            onPressed: () => bloc.add(ResetCounter()),
            child: Text("@"),
          ),
        ],
      ),
    );
  }
}
