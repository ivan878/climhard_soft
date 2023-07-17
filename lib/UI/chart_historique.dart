import 'package:climhard_soft/Pdf/pdf.dart';
import 'package:climhard_soft/Pdf/pdf_api.dart';
import 'package:climhard_soft/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ChartHistorique extends StatefulWidget {
  final Map<String, dynamic> data;
  const ChartHistorique({super.key, required this.data});

  @override
  State<ChartHistorique> createState() => _ChartHistoriqueState();
}

class _ChartHistoriqueState extends State<ChartHistorique> {
  late Map<String, dynamic> data;

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

  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data['projet'],
                    style: styletitle.copyWith(fontSize: 25),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 217, 215, 215)),
                    child: IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                      'Impossible d effectuer la suppression ')));
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 25,
                          color: Colors.red,
                        )),
                  )
                ],
              ),
              spacerheight(30),
              ListTile(
                title: Text(data['name'], style: styletitle),
                subtitle: Text(data['date'], style: police),
              ),
              spacerheight(10),
              Text('Type de climatiseur : ${data['clim']}', style: styletitle),
              spacerheight(50),
              Center(
                child: Column(
                  children: [
                    Container(
                      child: const CircularProgressIndicator(
                        strokeWidth: 5.2,
                      ),
                    ),
                    const Text('Pas de connexion')
                  ],
                ),
              ),
              spacerheight(50),
              // Container(
              //   height: 50,
              //   child: CircularProgressIndicator(),
              // ),
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
