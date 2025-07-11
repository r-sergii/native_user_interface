import 'package:fluent_ui/fluent_ui.dart';
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
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Slider"),
              Slider(
                label: '${state.currentSliderValue.value.toInt()}',
                value: state.currentSliderValue.value,
                onChanged: (v) {
                  state.currentSliderValue.value = v;
                },
              ),
              Slider(
                vertical: true,
                label: '${state.currentSliderValue.value.toInt()}',
                value: state.currentSliderValue.value,
                onChanged: (v) {
                  state.currentSliderValue.value = v;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
