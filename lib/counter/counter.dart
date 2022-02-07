import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samples/counter/bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, CounterState>(
      // listenWhen: (previous, current) => current.value % 2 != 0,
      listener: (context, state) {
        print(state);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterBloc, CounterState>(
                // buildWhen: (previous, current) => current.value % 2 == 0,
                builder: (context, state) {
                  return Text(
                    '${state.value}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              const SizedBox(height: 20),
              Text('${context.read<CounterBloc>().state.value}'),
              const SizedBox(height: 20),
              BlocSelector<CounterBloc, CounterState, bool>(
                selector: (state) {
                  return state.eat;
                },
                builder: (context, state) {
                  print('eating has changed');
                  return Text('${context.read<CounterBloc>().state.eat}');
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () =>
                        context.read<CounterBloc>().add(Increment()),
                    //BlocProvider.of<CounterBloc>(context).increment(),
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () =>
                        BlocProvider.of<CounterBloc>(context).add(Decrement()),
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      return FloatingActionButton(
                        onPressed: () => BlocProvider.of<CounterBloc>(context)
                            .add(Eaten(!state.eat)),
                        tooltip: state.eat ? 'Full' : 'Hungry',
                        child: Icon(state.eat ? Icons.food_bank : Icons.people),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
