import 'dart:convert';
import 'dart:math' as math;

import 'package:climhard_soft/Pdf/pdf.dart';
import 'package:climhard_soft/Pdf/pdf_api.dart';
import 'package:climhard_soft/UI/providers/apport2provider.dart';
import 'package:climhard_soft/UI/providers/apport3provider.dart';
import 'package:climhard_soft/UI/providers/apport4provider.dart';
import 'package:climhard_soft/UI/providers/apport5provider.dart';
import 'package:climhard_soft/UI/providers/apport6provider.dart';
import 'package:climhard_soft/UI/providers/apport8provider.dart';
import 'package:climhard_soft/UI/providers/dataproviders.dart';
import 'package:climhard_soft/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'providers/apport7provider.dart';

class BarChartSample7 extends StatefulWidget {
  final String name;
  final String projet;
  final DateTime date;
  BarChartSample7({
    super.key,
    required this.name,
    required this.projet,
    required this.date,
    // required double data,
    // required double apport1,
    // required double apport2,
    // required double apport3,
    // required double apport4,
    // required double apport5,
    // required double apport6,
    // required double apport7,
    // required double apport8,
    // required double apport9,
  });

  @override
  State<BarChartSample7> createState() => _BarChartSample7State();
}

class _BarChartSample7State extends State<BarChartSample7> {
  String typeClim = "";

  List<String> listClim = [
    'climatiseur murale',
    'climatiseur cassette',
    'climatiseur armoire',
    'climatiseur Gainable'
  ];
  final shadowColor = const Color(0xFFCCCCCC);
  final dataList = [
    const _BarData(Colors.yellow, 18, 18),
    const _BarData(Colors.green, 17, 8),
    const _BarData(Colors.orange, 10, 15),
    const _BarData(Colors.pink, 2.5, 5),
    const _BarData(Colors.blue, 2, 2.5),
    const _BarData(Colors.red, 10, 13),
    const _BarData(Colors.brown, 10, 13),
    const _BarData(Colors.black, 10, 13),
  ];
  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
    double shadowValue,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 20,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: shadowColor,
          width: 20,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;
  Map<String, dynamic> mapFinal = {};
  Future<void> saveData(
    val1,
    val2,
    val3,
    val4,
    val5,
    val6,
    val7,
    val8,
  ) async {
    final pref = await SharedPreferences.getInstance();
    final int id = DateTime.now().millisecondsSinceEpoch;
    Map<String, dynamic> mapUtils = {
      'id': id,
      "val1": val1,
      "val2": val2,
      "val3": val3,
      "val4": val4,
      "val5": val5,
      "val6": val6,
      "val7": val7,
      "val8": val8,
      'clim': typeClim,
      "name": widget.name,
      "projet": widget.projet,
      "date": DateFormat('EEEE dd MMM y').format(widget.date),
    };
    mapFinal = mapUtils;
    final list = pref.getStringList(database) ?? [];
    list.add(jsonEncode(mapUtils));

    await pref.setStringList(database, list);
  }

  @override
  Widget build(BuildContext context) {
    final transproviderQ = context.watch<DataProviderQ>();
    final providerApport2 = context.watch<Apport2Provider>();
    final providerApport3 = context.watch<Apport3Provider>();
    final providerApport4 = context.watch<Apport4Provider>();
    final providerApport5 = context.watch<Apport5Provider>();
    final providerApport6 = context.watch<Apport6Provider>();
    final providerApport7 = context.watch<Apport7Provider>();
    final providerApport8 = context.watch<Apport8Provider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 23, 87, 184),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'G R A P H I Q U E',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.9,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceBetween,
                      borderData: FlBorderData(
                        show: true,
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: Colors.blue.withOpacity(0.2),
                          ),
                        ),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        leftTitles: AxisTitles(
                          drawBelowEverything: true,
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 60,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toInt().toString(),
                                textAlign: TextAlign.left,
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 36,
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();
                              return SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: _IconWidget(
                                  color: dataList[index].color,
                                  isSelected: touchedGroupIndex == index,
                                ),
                              );
                            },
                          ),
                        ),
                        rightTitles: AxisTitles(),
                        topTitles: AxisTitles(),
                      ),
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: Colors.blue.withOpacity(0.2),
                          strokeWidth: 1,
                        ),
                      ),
                      barGroups: [
                        _BarData(Colors.yellow, transproviderQ.sommeTrans, 18),
                        _BarData(Colors.green, providerApport2.sommeApport2, 8),
                        _BarData(
                            Colors.orange, providerApport3.sommeApport3, 15),
                        _BarData(Colors.pink, providerApport4.sommeApport4, 5),
                        _BarData(
                            Colors.blue, providerApport5.sommeApport5, 2.5),
                        _BarData(Colors.red, providerApport6.sommeApport6, 13),
                        _BarData(
                            Colors.brown, providerApport7.sommeApport7, 13),
                        _BarData(
                            Colors.black, providerApport8.sommeApport8, 13),
                      ].asMap().entries.map((e) {
                        final index = e.key;
                        final data = e.value;
                        return generateBarGroup(
                          index,
                          data.color,
                          data.value,
                          data.shadowValue,
                        );
                      }).toList(),
                      maxY: (transproviderQ.sommeTrans +
                          providerApport2.sommeApport2 +
                          providerApport3.sommeApport3 +
                          providerApport4.sommeApport4 +
                          providerApport5.sommeApport5 +
                          providerApport6.sommeApport6 +
                          providerApport7.sommeApport7 +
                          providerApport8.sommeApport8),
                      barTouchData: BarTouchData(
                        enabled: true,
                        handleBuiltInTouches: false,
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.transparent,
                          tooltipMargin: 0,
                          getTooltipItem: (
                            BarChartGroupData group,
                            int groupIndex,
                            BarChartRodData rod,
                            int rodIndex,
                          ) {
                            return BarTooltipItem(
                              rod.toY.toString(),
                              TextStyle(
                                fontWeight: FontWeight.bold,
                                color: rod.color,
                                fontSize: 18,
                                shadows: const [
                                  Shadow(
                                    color: Colors.black26,
                                    blurRadius: 12,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        touchCallback: (event, response) {
                          if (event.isInterestedForInteractions &&
                              response != null &&
                              response.spot != null) {
                            setState(() {
                              touchedGroupIndex =
                                  response.spot!.touchedBarGroupIndex;
                            });
                          } else {
                            setState(() {
                              touchedGroupIndex = -1;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              spacerheight(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Type de climatisuer : $typeClim ", style: styletitle),
                  Text(
                      "La charge thermique a vaincre est de : ${transproviderQ.sommeTrans + providerApport2.sommeApport2 + providerApport3.sommeApport3 + providerApport4.sommeApport4 + providerApport5.sommeApport5 + providerApport6.sommeApport6 + providerApport7.sommeApport7 + providerApport8.sommeApport8}",
                      style: styletitle),
                ],
              ),
              spacerheight(30),
              Row(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                        onPressed: () async {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (dialcontext) => StatefulBuilder(
                              builder: (stfcontext, stfState) => AlertDialog(
                                title: Text("choisir le type de climatiseur",
                                    style: styletitle),
                                contentPadding: const EdgeInsets.all(20),
                                actions: [
                                  ...listClim
                                      .map(
                                        (e) => RadioListTile(
                                          value: e,
                                          title: Text(e, style: police),
                                          groupValue: typeClim,
                                          onChanged: (String? val) {
                                            typeClim = val!;
                                            stfState(() {});
                                          },
                                        ),
                                      )
                                      .toList(),
                                  spacerheight(20),
                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          stfState(() => typeClim = "");
                                          Navigator.pop(context);
                                        },
                                        child:
                                            Text('Annuler', style: styletitle),
                                      ),
                                      const SizedBox(width: 30),
                                      typeClim.trim().isNotEmpty
                                          ? TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Valider',
                                                  style: styletitle),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Choisir le type de climatiseur',
                          style: police,
                        )),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: typeClim.isEmpty
                                ? Colors.grey.withOpacity(0.5)
                                : Colors.blueAccent),
                        onPressed: () async {
                          if (typeClim.trim().isEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) => SimpleDialog(
                                title: Text(
                                  "climhard_soft",
                                  style: styletitle,
                                ),
                                contentPadding: const EdgeInsets.all(20),
                                children: [
                                  Text(
                                    "Veillez choisir un type de climatiseur",
                                    style: police,
                                  )
                                ],
                              ),
                            );
                          } else {
                            await saveData(
                              transproviderQ.sommeTrans,
                              providerApport2.sommeApport2,
                              providerApport3.sommeApport3,
                              providerApport4.sommeApport4,
                              providerApport5.sommeApport5,
                              providerApport6.sommeApport6,
                              providerApport7.sommeApport7,
                              providerApport8.sommeApport8,
                            );
                            final pdfFile =
                                await PdfParagraphApi.generate(data: mapFinal);

                            PdfApi.openFile(pdfFile);
                          }
                        },
                        child: Text(
                          'Générer la fiche',
                          style: police,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BarData {
  const _BarData(this.color, this.value, this.shadowValue);
  final Color color;
  final double value;
  final double shadowValue;
}

class _IconWidget extends ImplicitlyAnimatedWidget {
  const _IconWidget({
    required this.color,
    required this.isSelected,
  }) : super(duration: const Duration(milliseconds: 300));
  final Color color;
  final bool isSelected;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _IconWidgetState();
}

class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
  Tween<double>? _rotationTween;

  @override
  Widget build(BuildContext context) {
    final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
    final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
    return Transform(
      transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
      origin: const Offset(14, 14),
      child: Icon(
        widget.isSelected ? Icons.face_retouching_natural : Icons.face,
        color: widget.color,
        size: 28,
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rotationTween = visitor(
      _rotationTween,
      widget.isSelected ? 1.0 : 0.0,
      (dynamic value) => Tween<double>(
        begin: value as double,
        end: widget.isSelected ? 1.0 : 0.0,
      ),
    ) as Tween<double>?;
  }
}
