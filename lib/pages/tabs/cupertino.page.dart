import 'package:flutter/cupertino.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        // return Center(
        //   // Add your tab content here based on the index
        //   child: Text('Tab $index Content'),
        // );
        final navigator = Navigator.of(context);
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                  leading: CupertinoButton(
                    child: const Icon(CupertinoIcons.left_chevron),
                    onPressed: () {
                      navigator.pop();
                    },
                  ),
                  middle: const Text('Tabs Page')),
              child: Center(
                child: Text('Tab $index Content')
              ),
            );
          },
        );
      },
    );
  }
}
