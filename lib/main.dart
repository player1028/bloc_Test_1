import 'package:bloc_test_1/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: MyHomePage(),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        if(state.wasIncremented){
          final snackBar = SnackBar(
            content: Text('Incremented'),
            duration: Duration(milliseconds: 1000),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          final snackBar = SnackBar(
            content: Text('Decremented'),
            duration: Duration(milliseconds: 1000),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            }, icon: Icon(Icons.add)),
            IconButton(onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            }, icon: Icon(Icons.remove)),
          ],
        ),
        body: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                '${state.count}', style: TextStyle(
                  fontSize: 33
              ),
              );
            },
          ),
        ),
      ),
    );
  }
}

