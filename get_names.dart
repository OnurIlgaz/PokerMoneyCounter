import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poker/main.dart';
import 'package:poker/providers/player_state.dart';

class GetNames extends ConsumerWidget {
  GetNames({super.key});
  final List<TextEditingController> names = List.generate(9, (_) => TextEditingController());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrapper(
      child: Column(children: [
        for(int i = 1; i <= 8; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: names[i],
              decoration: InputDecoration(
                labelText: 'Player $i name',
              ),
            ),
          ),
          const SizedBox(height: 8,),
          Row(children: [
            const Spacer(),
            ElevatedButton(onPressed: (){
              List <String> stringNames = names.map((controller) => controller.text).toList();
              for(int i = 1; i <= 8; i++) {
                ref.read(playerStateProvider.notifier).init(stringNames);
              }
              Navigator.of(context).pop();
            }, child: const Text("Done")),
            const SizedBox(width: 16,),
          ],)
      ],)
    );
  }

}