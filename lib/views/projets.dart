import 'dart:convert';

import 'package:climhard_soft/UI/chart_historique.dart';
import 'package:climhard_soft/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjetsSiulation extends StatefulWidget {
  const ProjetsSiulation({super.key});

  @override
  State<ProjetsSiulation> createState() => _ProjetsSiulationState();
}

class _ProjetsSiulationState extends State<ProjetsSiulation> {
  List<Map<String, dynamic>> liste = [];
  bool loading = true;

  void getList() async {
    final pref = await SharedPreferences.getInstance();
    final list = pref.getStringList(database) ?? [];
    for (var element in list) {
      liste.add(jsonDecode(element));
    }
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 23, 87, 184),
        toolbarHeight: 100,
        elevation: 0,
        actions: [
          const Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/user.jpg'),
              ),
              SizedBox(width: 10),
              Text(
                'A D M I N',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Historique des projets',
                    style: styletitle.copyWith(fontSize: 35),
                  ),
                  // Text('searh')
                  Container(
                    width: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 214, 212, 212)),
                    child: const Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 25,
              ),
              loading
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2.2,
                      ),
                    )
                  : GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      padding: EdgeInsets.all(10.0),
                      children: liste
                          .map(
                            (e) => SizedBox(
                                width: 300,
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  elevation: 2,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChartHistorique(data: e)));
                                    },
                                    child: Container(
                                      height: 180,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blue, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  e['projet'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  e['name'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  e['date'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 130,
                                            child: Image.asset(
                                                'assets/climhard1.png'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          )
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
