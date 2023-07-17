import 'package:climhard_soft/utils.dart';
import 'package:climhard_soft/views/about.dart';
import 'package:climhard_soft/views/simulations.dart';
import 'package:climhard_soft/views/nouveau.dart';
import 'package:climhard_soft/views/projets.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  List<Widget> body = [
    const NouvellSimulation(),
    const SimulationPage(),
    const ProjetsSiulation(),
    const AboutUs()
  ];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarX(
            controller: SidebarXController(
                selectedIndex: selectedindex, extended: true),
            theme: SidebarXTheme(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              hoverColor: Color.fromARGB(255, 101, 154, 233),
              selectedTextStyle: const TextStyle(color: Colors.white),
              itemTextPadding: const EdgeInsets.only(left: 30),
              selectedItemTextPadding: const EdgeInsets.only(left: 30),
              itemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: const Color.fromARGB(255, 23, 87, 184)),
              ),
              selectedItemDecoration: BoxDecoration(
                color: const Color.fromARGB(255, 23, 87, 184),
                borderRadius: BorderRadius.circular(10),
              ),
              iconTheme: const IconThemeData(
                size: 25,
              ),
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 20,
              ),
            ),
            extendedTheme: const SidebarXTheme(
              width: 200,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            footerDivider: Divider(),
            headerBuilder: (context, extended) {
              return SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('assets/climhard1.png'),
                ),
              );
            },
            items: [
              SidebarXItem(
                label: "Nouveau",
                icon: Icons.add_circle_outline,
                onTap: () {
                  setState(() {
                    selectedindex = 0;
                  });
                },
              ),
              SidebarXItem(
                label: "Simulation",
                icon: Icons.trending_up_sharp,
                onTap: () {
                  setState(() {
                    selectedindex = 1;
                  });
                },
              ),
              SidebarXItem(
                label: "Projets",
                icon: Icons.bookmark_border,
                onTap: () {
                  setState(() {
                    selectedindex = 2;
                  });
                },
              ),
              SidebarXItem(
                label: "Apropos",
                icon: Icons.info_outline,
                onTap: () {
                  setState(() {
                    selectedindex = 3;
                  });
                },
              ),
            ],
          ),
          // SidebarX(
          //   controller: SidebarXController(
          //       selectedIndex: selectedindex, extended: true),
          //   headerBuilder: (context, index) =>
          //       Image.asset('assets/climhard1.png'),
          //   separatorBuilder: (context, index) => const Divider(thickness: 1.5),
          //   theme: SidebarXTheme(
          //       width: 100,
          //       margin: const EdgeInsets.all(10),
          //       decoration: BoxDecoration(
          //         color: Color.fromARGB(255, 173, 177, 173),
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       hoverColor: Colors.blue,
          //       textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          //       selectedTextStyle: const TextStyle(color: Colors.white),
          //       itemTextPadding: const EdgeInsets.only(left: 30),
          //       selectedItemTextPadding: const EdgeInsets.only(left: 30),
          //       itemDecoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         border: Border.all(color: Colors.white),
          //       ),
          //       selectedItemDecoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           border: Border.all(
          //             color: Colors.red,
          //           ))),
          //   // theme: SidebarXTheme(

          //   // ),
          //   // controller: SidebarXController(selectedIndex: selectedindex),
          //   // headerBuilder: (context, index) =>
          //   //     Image.asset('assets/climhard1.png'),
          //   // separatorBuilder: (context, index) => const Divider(thickness: 1.5),
          //   items: [

          //   ],
          // ),
          Expanded(
            child: body[selectedindex],
          )
        ],
      )),
    );
  }
}
