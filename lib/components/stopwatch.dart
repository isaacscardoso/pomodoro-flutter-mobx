import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_app/components/custom_text.dart';
import 'package:pomodoro_app/components/stopwatch_button.dart';
import 'package:pomodoro_app/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PomodoroStore pomodoroStore = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (_) => Container(
        color: pomodoroStore.isWorkingTime ? Colors.red : Colors.green,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomText(
              content: pomodoroStore.isWorkingTime
                  ? 'Hora de Estudar'
                  : 'Descansando',
              fontSize: 45,
              textColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomText(
                content:
                    '${pomodoroStore.minutesRemaining.toString().padLeft(2, '0')}:${pomodoroStore.secondsRemaining.toString().padLeft(2, '0')}',
                fontSize: 120,
                textColor: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                !pomodoroStore.started
                    ? StopwatchButton(
                        content: 'Iniciar',
                        onPressed: pomodoroStore.start,
                        icon: Icons.play_arrow,
                      )
                    : StopwatchButton(
                        content: 'Parar',
                        onPressed: pomodoroStore.stop,
                        icon: Icons.stop,
                      ),
                const SizedBox(
                  width: 10,
                ),
                StopwatchButton(
                  content: 'Reiniciar',
                  onPressed: pomodoroStore.reset,
                  icon: Icons.refresh,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
