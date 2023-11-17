import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Counter extends HookWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    var counter = useState(0);
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        width: 300,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Flutter Counter'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Text(
                counter.value.toString(),
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const CircleBorder(),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.blue[900],
                    ),
                  ),
                  onPressed: () {
                    counter.value += 1;
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.blue.shade900),
                  ),
                  onPressed: () {
                    counter.value -= 1;
                  },
                  child: Icon(
                    Icons.remove,
                    color: Colors.blue[900],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
