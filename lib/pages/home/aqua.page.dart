import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:provider/provider.dart';

import 'sidemenu/aqua.widget.dart';
import 'sidemenu/sidemenu.service.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SideMenuService>(context, listen: false);

    return ValueListenableBuilder<int>(
      valueListenable: state.selectedIndex,
      builder: (_, mode, __) {
        return PlatformMenuBar(
          menus: menuBarItems(),
          child: MacosWindow(
            sidebar: Sidebar(
              top: SizedBox(
                // color: appTheme.color,
                // width: 200,
                height: 80,
                child: ListView(children: const [
                  // SizedBox(height: 20),
                  Row(children: [
                    SizedBox(width: 5),
                    Icon(FontAwesomeIcons.apple, size: 48),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Native UI", style: TextStyle(fontSize: 26))
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    SizedBox(width: 20),
                    Text("Version 0.0.1", style: TextStyle(fontSize: 14)),
                  ]),
                  // SizedBox(
                  //   height: 30,
                  // ),
                ]),
              ),
              // top: SizedBox(
              //   // color: appTheme.color,
              //   // width: 200,
              //   height: 100,
              //   child: ListView(
              //     children: const [
              //       SizedBox(height: 20),
              //       Row(children: [
              //         SizedBox(width: 10),
              //         Icon(FontAwesomeIcons.appleWhole, size: 48),
              //         SizedBox(
              //           width: 20,
              //         ),
              //         Text("Native UI", style: TextStyle(fontSize: 26))
              //       ]),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       Row(children: [
              //         SizedBox(width: 20),
              //         Text("Version 0.0.1", style: TextStyle(fontSize: 14)),
              //       ]),
              //       SizedBox(
              //         height: 30,
              //       ),
              //     ],
              //   ),
              // ),
              // top: MacosSearchField(
              //   placeholder: 'Search',
              //   controller: searchFieldController,
              //   onResultSelected: (result) {
              //     switch (result.searchKey) {
              //       case 'Buttons':
              //         setState(() {
              //           state.selectedIndex.value = 0;
              //           searchFieldController.clear();
              //         });
              //         break;
              //       case 'Indicators':
              //         setState(() {
              //           state.selectedIndex.value = 1;
              //           searchFieldController.clear();
              //         });
              //         break;
              //       case 'Fields':
              //         setState(() {
              //           state.selectedIndex.value = 2;
              //           searchFieldController.clear();
              //         });
              //         break;
              //       case 'Colors':
              //         setState(() {
              //           state.selectedIndex.value = 3;
              //           searchFieldController.clear();
              //         });
              //         break;
              //       case 'Dialogs and Sheets':
              //         setState(() {
              //           state.selectedIndex.value = 4;
              //           searchFieldController.clear();
              //         });
              //         break;
              //       case 'Toolbar':
              //         setState(() {
              //           state.selectedIndex.value = 6;
              //           searchFieldController.clear();
              //         });
              //         break;
              //       case 'ResizablePane':
              //         setState(() {
              //           state.selectedIndex.value = 7;
              //           searchFieldController.clear();
              //         });
              //         break;
              //       case 'Selectors':
              //         setState(() {
              //           state.selectedIndex.value = 8;
              //           searchFieldController.clear();
              //         });
              //         break;
              //       default:
              //         searchFieldController.clear();
              //     }
              //   },
              // results: const [
              //   SearchResultItem('Buttons'),
              //   SearchResultItem('Indicators'),
              //   SearchResultItem('Fields'),
              //   SearchResultItem('Colors'),
              //   SearchResultItem('Dialogs and Sheets'),
              //   SearchResultItem('Toolbar'),
              //   SearchResultItem('ResizablePane'),
              //   SearchResultItem('Selectors'),
              // ],
              // ),
              minWidth: 200,
              builder: (context, scrollController) {
                return SidebarItems(
                  currentIndex: state.selectedIndex.value,
                  onChanged: (i) {
                    // if (kIsWeb && i == 10) {
                    //   launchUrl(
                    //     Uri.parse(
                    //       'https://www.figma.com/file/IX6ph2VWrJiRoMTI1Byz0K/Apple-Design-Resources---macOS-(Community)?node-id=0%3A1745&mode=dev',
                    //     ),
                    //   );
                    // } else {
                    //   setState(() => state.selectedIndex.value = i);
                    // }
                    state.selectedIndex.value = i;
                  },
                  scrollController: scrollController,
                  itemSize: SidebarItemSize.large,
                  items: const [
                    SidebarItem(
                      leading: MacosImageIcon(
                        AssetImage('assets/sf_symbols/button_programmable_2x.png'),
                      ),
                      label: Text('Buttons'),
                    ),
                    SidebarItem(
                      leading: MacosImageIcon(
                        AssetImage(
                          'assets/sf_symbols/lines_measurement_horizontal_2x.png',
                        ),
                      ),
                      label: Text('Indicators'),
                    ),
                    SidebarItem(
                      leading: MacosImageIcon(
                        AssetImage(
                          'assets/sf_symbols/character_cursor_ibeam_2x.png',
                        ),
                      ),
                      label: Text('Fields'),
                    ),
                    SidebarItem(
                      leading: MacosImageIcon(
                        AssetImage('assets/sf_symbols/rectangle_3_group_2x.png'),
                      ),
                      label: Text('Colors'),
                    ),
                    SidebarItem(
                      leading: MacosIcon(CupertinoIcons.square_on_square),
                      label: Text('Dialogs & Sheets'),
                    ),
                    SidebarItem(
                      leading: MacosImageIcon(
                        AssetImage(
                          'assets/sf_symbols/macwindow.on.rectangle_2x.png',
                        ),
                      ),
                      label: Text('Layout'),
                      disclosureItems: [
                        SidebarItem(
                          leading: MacosIcon(CupertinoIcons.macwindow),
                          label: Text('Toolbar'),
                        ),
                        SidebarItem(
                          leading: MacosImageIcon(
                            AssetImage(
                              'assets/sf_symbols/menubar.rectangle_2x.png',
                            ),
                          ),
                          label: Text('SliverToolbar'),
                        ),
                        SidebarItem(
                          leading: MacosIcon(CupertinoIcons.uiwindow_split_2x1),
                          label: Text('TabView'),
                        ),
                        SidebarItem(
                          leading: MacosIcon(CupertinoIcons.rectangle_split_3x1),
                          label: Text('ResizablePane'),
                        ),
                      ],
                    ),
                    SidebarItem(
                      leading: MacosImageIcon(
                        AssetImage('assets/sf_symbols/filemenu_and_selection_2x.png'),
                      ),
                      label: Text('Selectors'),
                    ),
                    SidebarItem(
                      leading: MacosIcon(CupertinoIcons.textformat_size),
                      label: Text('Typography'),
                    ),
                  ],
                );
              },
              bottom: const MacosListTile(
                leading: MacosIcon(CupertinoIcons.profile_circled),
                title: Text('Tim Apple'),
                subtitle: Text('tim@apple.com'),
              ),
            ),
            endSidebar: Sidebar(
              startWidth: 200,
              minWidth: 200,
              maxWidth: 300,
              shownByDefault: false,
              builder: (context, _) {
                return const Center(
                  child: Text('End Sidebar'),
                );
              },
            ),
            child: [
              // CupertinoTabView(builder: (_) => const ButtonsPage()),
              // const IndicatorsPage(),
              // const FieldsPage(),
              // const ColorsPage(),
              // const DialogsPage(),
              // const ToolbarPage(),
              // const SliverToolbarPage(isVisible: !kIsWeb),
              // const TabViewPage(),
              // const ResizablePanePage(),
              // const SelectorsPage(),
              // const TypographyPage(),
              CupertinoTabView(builder: (_) => const Page()),
              const Page2(),
              const Page3(),
              const Page(),
              const Page2(),
              const Page3(),
              const Page(),
              const Page2(),
              const Page3(),
              const Page(),
              const Page2(),
            ][state.selectedIndex.value],
          ),
        );
      },
    );
  }
}

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("AAA");
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("BBB");
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("CCC");
  }
}
