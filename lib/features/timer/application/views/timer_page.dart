import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:efecto/core/task_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/task_data_box.dart';

class TimerScreen extends StatefulWidget {
  static String routeName = 'timer-view';
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final CountDownController _controller = CountDownController();
  bool _isRunning = false;

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Access passed data
    final TaskModel task = args['task'];
    return PopScope(
      canPop: !_isRunning,
      onPopInvoked: (canPop) async {
        if (canPop) {
          List<String> times = _controller.getTime()!.split(":");
          int time = int.parse(times[0]);
          if (time != 0) {
            task.duration = (int.parse(times[1]) >= 30) ? time + 1 : time;
            debugPrint(time.toString());
            await TaskDataBox.updateTask(task);
          }
          return;
        }
        // debugPrint((!_isRunning).toString());
        if (_isRunning) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Timer is running'),
              content: const Text(
                  'You cannot minimize the app while the timer is running.'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Circular Countdown Timer'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularCountDownTimer(
              duration: task.duration * 60,
              initialDuration: 0,
              controller: _controller,
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              ringColor: Colors.grey[300]!,
              ringGradient: null,
              fillColor: Colors.purpleAccent[100]!,
              fillGradient: null,
              backgroundColor: Colors.purple[500],
              backgroundGradient: null,
              strokeWidth: 20.0,
              strokeCap: StrokeCap.round,
              textStyle: const TextStyle(
                  fontSize: 33.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textFormat: CountdownTextFormat.MM_SS,
              isReverse: true,
              isReverseAnimation: false,
              isTimerTextShown: true,
              autoStart: false,
              onStart: () {
                debugPrint('Countdown Started');
              },
              onComplete: () async {
                debugPrint('Countdown Ended');
                task.isComplete = true;
                await TaskDataBox.updateTask(task);
              },
              onChange: (String timeStamp) {
                debugPrint('Countdown Changed $timeStamp');
              },
              timeFormatterFunction: (defaultFormatterFunction, duration) {
                if (duration.inSeconds == 0) {
                  return "Complete";
                } else {
                  return Function.apply(defaultFormatterFunction, [duration]);
                }
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? _pauseTimer : _startTimer,
                  child: Text(_isRunning ? 'Pause' : 'Start'),
                ),
                ElevatedButton(
                  onPressed: _stopTimer,
                  child: const Text('Stop'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    _controller.start();
    setState(() {
      _isRunning = true;
    });
  }

  void _pauseTimer() {
    _controller.pause();
    setState(() {
      _isRunning = false;
    });
  }

  void _stopTimer() {
    _controller.reset();
    setState(() {
      _isRunning = false;
    });
  }
}
