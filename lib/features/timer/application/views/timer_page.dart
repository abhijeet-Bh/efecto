import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:efecto/core/task_model.dart';
import 'package:efecto/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/assets.dart';
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
        backgroundColor: AppTheme.primaryLightColor,
        appBar: AppBar(
          backgroundColor: AppTheme.primaryLightColor,
          // title: const Text('Circular Countdown Timer'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              task.title,
              style: AppTheme.primaryHeadingTextLarge,
            ),
            Text(
              '${task.duration} minutes',
              style: AppTheme.primaryBodyTextLarge.copyWith(
                color: AppTheme.secondaryLightColor,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            CircularCountDownTimer(
              duration: task.duration * 60,
              initialDuration: 0,
              controller: _controller,
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              ringColor: Colors.grey[300]!,
              ringGradient: null,
              fillColor: AppTheme.primaryColor,
              fillGradient: null,
              backgroundColor: AppTheme.primaryLightColor,
              backgroundGradient: null,
              strokeWidth: 20.0,
              strokeCap: StrokeCap.round,
              textStyle: const TextStyle(
                  fontSize: 33.0,
                  color: AppTheme.primaryColor,
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
                task.duration = 0;
                _isRunning = false;
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
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: _stopTimer,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppTheme.secondaryLightColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Icon(
                            size: 40,
                            Icons.stop_rounded,
                            color: AppTheme.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "stop timer",
                      style: AppTheme.primaryBodyTextSmall
                          .copyWith(color: AppTheme.secondaryColor),
                    )
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: _isRunning ? _pauseTimer : _startTimer,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppTheme.secondaryLightColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Icon(
                            size: 40,
                            (_isRunning)
                                ? Icons.play_arrow_rounded
                                : Icons.pause_rounded,
                            color: AppTheme.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      (_isRunning) ? "Pause" : "Start",
                      style: AppTheme.primaryBodyTextSmall
                          .copyWith(color: AppTheme.secondaryColor),
                    )
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: _stopTimer,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppTheme.secondaryLightColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: SvgPicture.asset(Assets.breakIcon),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Take a Break",
                      style: AppTheme.primaryBodyTextSmall
                          .copyWith(color: AppTheme.secondaryColor),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              "“Procrastination is the thief of time, collar him.”\n-Charles Dickens, David Copperfield",
              style: AppTheme.primaryBodyTextLarge.copyWith(
                color: AppTheme.secondaryLightColor,
              ),
              textAlign: TextAlign.center,
            )
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
