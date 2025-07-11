import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/home/home.service.dart';

class SliderView extends StatelessWidget {
  const SliderView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeService>(context, listen: false);

    return ValueListenableBuilder<double>(
      valueListenable: state.currentSliderValue,
      builder: (_, mode, __) {
        return ValueListenableBuilder<double>(
          valueListenable: state.currentDiscreteSliderValue,
          builder: (_, mode, __) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Slider"),
                  Slider(
                    value: state.currentSliderValue.value,
                    max: 100,
                    onChanged: (double value) {
                      state.currentSliderValue.value = value;
                    },
                  ),
                  Slider(
                    value: state.currentDiscreteSliderValue.value,
                    max: 100,
                    divisions: 5,
                    label: state.currentDiscreteSliderValue.value.round().toString(),
                    onChanged: (double value) {
                      state.currentDiscreteSliderValue.value = value;
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
