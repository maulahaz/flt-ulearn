import 'package:flt_ulearn/providers/counter_prv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Consumer(
            builder: (context, wiRef,child) {
              int valCounter = wiRef.watch(counterNotifierProvider);
              return Text('$valCounter');
            }
          ),
        ),
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(counterNotifierProvider.notifier).DoDecrease();
            },
            heroTag: 'Decrease',
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterNotifierProvider.notifier).DoIncrease();
            },
            heroTag: 'Increase',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
