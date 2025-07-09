import 'package:flutter/cupertino.dart';

class ProgressIndicatorView extends StatelessWidget {
  const ProgressIndicatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
            onPressed: () {},
            child: const Text("CupertinoActivityIndicator"),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Cupertino activity indicator with default properties.
              CupertinoActivityIndicator(),
              SizedBox(height: 10),
              Text('Default'),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Cupertino activity indicator with custom radius and color.
              CupertinoActivityIndicator(radius: 20.0, color: CupertinoColors.activeBlue),
              SizedBox(height: 10),
              Text(
                'radius: 20.0\ncolor: CupertinoColors.activeBlue',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Cupertino activity indicator with custom radius and disabled
              // animation.
              CupertinoActivityIndicator(radius: 20.0, animating: false),
              SizedBox(height: 10),
              Text('radius: 20.0\nanimating: false', textAlign: TextAlign.center),
            ],
          ),
        ],
      ),
    );
  }
}
