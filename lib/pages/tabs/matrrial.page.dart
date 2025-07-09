import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  TabsPageState createState() => TabsPageState();
}

class TabsPageState extends State<TabsPage> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // leading: ,
        title: const Text("Tabs"),
        // bottom: const TabBar(
        //   dividerColor: Colors.transparent,
        //   tabs: <Widget>[
        //     Tab(text: 'Flights', icon: Icon(Icons.flight)),
        //     Tab(text: 'Trips', icon: Icon(Icons.luggage)),
        //     Tab(text: 'Explore', icon: Icon(Icons.explore)),
        //   ],
        // ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          Center(child: Text('Home')),
          Center(child: Text('Search')),
          Center(child: Text('Settings')),
        ],
      ),
      bottomNavigationBar: TabBar(
        dividerColor: Colors.transparent,
        tabs: const [
          Tab(text: 'Home', icon: Icon(Icons.home)),
          Tab(text: 'Search', icon: Icon(Icons.search)),
          Tab(text: 'Settings', icon: Icon(Icons.settings)),
        ],
        controller: controller,
      ),
    );
  }
}
