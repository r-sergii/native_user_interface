import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '/pages/main/main.service.dart';

class SliderView extends StatelessWidget {
  const SliderView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MainService>(context, listen: false);

    return ValueListenableBuilder<double>(
      valueListenable: state.currentSliderValue,
      builder: (_, mode, __) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(
                onPressed: () {},
                child: const Text("CupertinoSlider"),
              ),
              Text('${state.currentSliderValue.value}'),
              CupertinoSlider(
                key: const Key('slider'),
                value: state.currentSliderValue.value,
                // This allows the slider to jump between divisions.
                // If null, the slide movement is continuous.
                divisions: 5,
                // The maximum slider value
                max: 100,
                activeColor: CupertinoColors.systemPurple,
                thumbColor: CupertinoColors.systemPurple,
                // This is called when sliding is started.
                onChangeStart: (double value) {
                  state.sliderStatus.value = 'Sliding';
                },
                // This is called when sliding has ended.
                onChangeEnd: (double value) {
                  state.sliderStatus.value = 'Finished sliding';
                },
                // This is called when slider value is changed.
                onChanged: (double value) {
                  state.currentSliderValue.value = value;
                },
              ),
              ValueListenableBuilder<String>(
                  valueListenable: state.sliderStatus,
                  builder: (_, mode, __) {
                    return Text(
                      state.sliderStatus.value,
                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 12),
                    );
                  }),
            ],
          ),
        );
      },
    );
  }
}
