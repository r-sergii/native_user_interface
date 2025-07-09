import 'package:flutter/cupertino.dart';

class MainService extends ChangeNotifier {
  final switchValue = ValueNotifier<bool>(true);
  final textController = TextEditingController(text: 'initial text');
  final currentSliderValue = ValueNotifier<double>(0.0);
  final sliderStatus = ValueNotifier<String>("");

  final date = ValueNotifier<DateTime>(DateTime(2016, 10, 26));
  final time = ValueNotifier<DateTime>(DateTime(2016, 5, 10, 22, 35));
  final dateTime = ValueNotifier<DateTime>(DateTime(2016, 8, 3, 17, 45));

  // final currentSliderValue = ValueNotifier<double>(20);
  final currentDiscreteSliderValue = ValueNotifier<double>(60);
  final year2023 = ValueNotifier<bool>(true);

  final selectedDate = ValueNotifier<DateTime>(DateTime.now());
}
