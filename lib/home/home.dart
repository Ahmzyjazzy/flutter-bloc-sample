import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samples/home/cubit/home_cubit.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  // BlocProvider.of<HomeCubit>(context)

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, int>(
      listenWhen: (previous, current) => current % 2 != 0,
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
              BlocBuilder<HomeCubit, int>(
                buildWhen: (previous, current) => current % 2 == 0,
                builder: (context, state) {
                  return Text(
                    '$state',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              Text('${context.read<HomeCubit>().state}'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () => context.read<HomeCubit>().increment(),
                    //BlocProvider.of<HomeCubit>(context).increment(),
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () =>
                        BlocProvider.of<HomeCubit>(context).decrement(),
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
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
