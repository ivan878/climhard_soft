// import 'package:climhard_soft/UI/home.dart';
import 'package:climhard_soft/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//

import 'package:climhard_soft/UI/chart.dart';
import 'package:climhard_soft/UI/controllers/trans2_controller.dart';
import 'package:climhard_soft/UI/controllers/trans3_controller.dart';
import 'package:climhard_soft/UI/controllers/trans5_controller.dart';
import 'package:climhard_soft/UI/controllers/trans6_controller.dart';
import 'package:climhard_soft/UI/controllers/trans7_controller.dart';
import 'package:climhard_soft/UI/controllers/trans8_controller.dart';
import 'package:climhard_soft/UI/models/trans2.dart';
import 'package:climhard_soft/UI/models/trans4.dart';
import 'package:climhard_soft/UI/models/trans5.dart';
import 'package:climhard_soft/UI/models/trans6.dart';
import 'package:climhard_soft/UI/models/trans7.dart';
import 'package:climhard_soft/UI/models/trans8.dart';
import 'package:climhard_soft/UI/providers/apport2provider.dart';
import 'package:climhard_soft/UI/providers/apport3provider.dart';
import 'package:climhard_soft/UI/providers/apport4provider.dart';
import 'package:climhard_soft/UI/providers/apport5provider.dart';
import 'package:climhard_soft/UI/providers/apport6provider.dart';
import 'package:climhard_soft/UI/providers/apport7provider.dart';
import 'package:climhard_soft/UI/providers/apport8provider.dart';
import 'package:climhard_soft/UI/providers/dataproviders.dart';
import 'package:climhard_soft/UI/widget.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import '../UI/controllers/trans4_controller.dart';
import '../UI/controllers/trans_controller.dart';
import '../UI/models/trans.dart';
import '../UI/models/trans3.dart';
//

class NouvellSimulation extends StatefulWidget {
  const NouvellSimulation({super.key});

  @override
  State<NouvellSimulation> createState() => _NouvellSimulationState();
}

class _NouvellSimulationState extends State<NouvellSimulation> {
  // Les variables

  DateTime? dateprojet;
  TextEditingController controllerClient = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerProjet = TextEditingController();
  TextEditingController controllerOe = TextEditingController();
  TextEditingController controllerOi = TextEditingController();
  TextEditingController controllerH = TextEditingController();
  TextEditingController controllerL = TextEditingController();
  TextEditingController controllerK = TextEditingController();
  TextEditingController controllerQ1a = TextEditingController();
  TextEditingController controllerOe2 = TextEditingController();
  TextEditingController controllerOi2 = TextEditingController();
  TextEditingController controllerH2 = TextEditingController();
  TextEditingController controllerL2 = TextEditingController();
  TextEditingController controllerK2 = TextEditingController();
  TextEditingController controllerQ1b = TextEditingController();

  TextEditingController controlleraOi = TextEditingController();
  TextEditingController controlleraOe = TextEditingController();
  TextEditingController controlleraH = TextEditingController();
  TextEditingController controlleraL = TextEditingController();
  TextEditingController controlleraK = TextEditingController();
  TextEditingController controlleraQ1AA = TextEditingController();

  //controller de Q1c
  TextEditingController controllerOe3 = TextEditingController();
  TextEditingController controllerOi3 = TextEditingController();
  TextEditingController controllerH3 = TextEditingController();
  TextEditingController controllerL3 = TextEditingController();
  TextEditingController controllerK3 = TextEditingController();
  TextEditingController controllerQ1c = TextEditingController();
  //controller de Q1d
  TextEditingController controllerOe4 = TextEditingController();
  TextEditingController controllerOi4 = TextEditingController();
  TextEditingController controllerH4 = TextEditingController();
  TextEditingController controllerL4 = TextEditingController();
  TextEditingController controllerK4 = TextEditingController();
  TextEditingController controllerQ1d = TextEditingController();
  //controller de champs Q5a pour planché bas
  TextEditingController controllerOe5 = TextEditingController();
  TextEditingController controllerOi5 = TextEditingController();
  TextEditingController controllerH5 = TextEditingController();
  TextEditingController controllerL5 = TextEditingController();
  TextEditingController controllerK5 = TextEditingController();
  TextEditingController controllerQ1e = TextEditingController();
  //controller de champs Q6a pour planché haut
  TextEditingController controllerOe6 = TextEditingController();
  TextEditingController controllerOi6 = TextEditingController();
  TextEditingController controllerH6 = TextEditingController();
  TextEditingController controllerL6 = TextEditingController();
  TextEditingController controllerK6 = TextEditingController();
  TextEditingController controllerQ1f = TextEditingController();
  //controller de Q1g
  TextEditingController controllerOe7 = TextEditingController();
  TextEditingController controllerOi7 = TextEditingController();
  TextEditingController controllerH7 = TextEditingController();
  TextEditingController controllerL7 = TextEditingController();
  TextEditingController controllerK7 = TextEditingController();
  TextEditingController controllerQ1g = TextEditingController();
  //controller de Q1h
  TextEditingController controllerOe8 = TextEditingController();
  TextEditingController controllerOi8 = TextEditingController();
  TextEditingController controllerH8 = TextEditingController();
  TextEditingController controllerL8 = TextEditingController();
  TextEditingController controllerK8 = TextEditingController();
  TextEditingController controllerQ1h = TextEditingController();

  //
  Trans transA = Trans();

  Trans transB = Trans();
  Trans transC = Trans();
  Trans transD = Trans();
  Trans transE = Trans();
  Trans transF = Trans();
  Trans transG = Trans();
  Trans transH = Trans();

  Trans2 trans2A = Trans2();
  Trans2 trans2B = Trans2();
  Trans2 trans2C = Trans2();
  Trans2 trans2D = Trans2();

  Trans3 trans3A = Trans3();
  Trans3 trans3B = Trans3();
  Trans3 trans3C = Trans3();
  Trans3 trans3D = Trans3();

  Trans4 trans4 = Trans4();

  Trans5 trans5 = Trans5();

  Trans6 trans6 = Trans6();

  Trans7 trans7 = Trans7();

  Trans8 trans8 = Trans8();
  Trans8 trans8B = Trans8();
//variable pour le calcul de q2a tous initialisé a 0.0
  double E = 0.0;
  double S = 0.0;
  double Rm = 0.0;
  double F = 0.0;
  double q2a = 0.0;
  //variable pour le calcul de q2b tous initialisé a 0.0
  double E2 = 0.0;
  double S2 = 0.0;
  double Rm2 = 0.0;
  double F2 = 0.0;
  double q2b = 0.0;
  //variable pour le calcul de q2c tous initialisé a 0.0
  double E3 = 0.0;
  double S3 = 0.0;
  double Rm3 = 0.0;
  double F3 = 0.0;
  double q2c = 0.0;
  //variable pour le calcul de q2d tous initialisé a 0.0
  double E4 = 0.0;
  double S4 = 0.0;
  double Rm4 = 0.0;
  double F4 = 0.0;
  double q2d = 0.0;

  //Cas du troisième apport listes des variables nécéssaire
  //
  // ------------etre minutieux sur les variables car ce ressemble-------------------
  //
  //nous allons suivre meme procédé que la première étapes
  //variable pour le calcul de q3a tous initialisé a 0.0
  double Ev = 0.0;
  double Sv = 0.0;
  double Rv = 0.0;
  double Gv = 0.0;
  double q3a = 0.0;
  //variable pour le calcul de q3b tous initialisé a 0.0
  double Ev2 = 0.0;
  double Sv2 = 0.0;
  double Rv2 = 0.0;
  double Gv2 = 0.0;
  double q3b = 0.0;
  //variable pour le calcul de q3c tous initialisé a 0.0
  double Ev3 = 0.0;
  double Sv3 = 0.0;
  double Rv3 = 0.0;
  double Gv3 = 0.0;
  double q3c = 0.0;
  //variable pour le calcul de q3c tous initialisé a 0.0
  double Ev4 = 0.0;
  double Sv4 = 0.0;
  double Rv4 = 0.0;
  double Gv4 = 0.0;
  double q3d = 0.0;

  //Cas du quatrième apport listes des variables nécéssaire
  //
  // ------------etre minutieux sur les variables car ce ressemble-------------------
  //
  //nous allons suivre meme procédé que la première étapes
  //variable pour le calcul de q4 tous initialisé a 0.0
  double Qv = 0.0;
  double OOe = 0.0;
  double OOi = 0.0;
  double Q4 = 0.0;

  //Cas du cinquième apport listes des variables nécéssaire
  //
  // ------------etre minutieux sur les variables car ce ressemble-------------------
  //
  //nous allons suivre meme procédé que la première étapes
  //variable pour le calcul de q5a tous initialisé a 0.0
  double QQv = 0.0;
  double We = 0.0;
  double Wi = 0.0;
  double CCon = 0.0;
  double q5a = 0.0;

  //Cas du sixième apport listes des variables nécéssaire
  //
  // ------------etre minutieux sur les variables car ce ressemble-------------------
  //
  //nous allons suivre meme procédé que la première étapes
  //variable pour le calcul de q6a tous initialisé a 0.0
  double Delc = 0.0;
  double Sp = 0.0;
  double q6a = 0.0;

  //Cas du septième apport listes des variables nécéssaire
  //
  // ------------etre minutieux sur les variables car ce ressemble-------------------
  //
  //nous allons suivre meme procédé que la première étapes
  //variable pour le calcul de q7a tous initialisé a 0.0
  double N = 0.0;
  double Cocc = 0.0;
  double Cs = 0.0;
  double Cl = 0.0;
  double q7a = 0.0;

  //Cas du Huitième apport listes des variables nécéssaire
  //
  // ------------etre minutieux sur les variables car ce ressemble-------------------
  //
  //nous allons suivre meme procédé que la première étapes
  //variable pour le calcul de q8a tous initialisé a 0.0
  double No = 0.0;
  double Cu = 0.0;
  double CCs = 0.0;
  double CCl = 0.0;
  double q8a = 0.0;

  //variable pour le calcul de q8b tous initialisé a 0.0
  double No2 = 0.0;
  double Cu2 = 0.0;
  double CCs2 = 0.0;
  double CCl2 = 0.0;
  double q8a2 = 0.0;

//Partie des controllers des champs d'entrée

  //Controllers pour le deuxième cas soit Q2
  //---------😊😊😊-------------
  //repété le processus

  //controller de Q2a
  TextEditingController controllerE = TextEditingController();
  TextEditingController controllerS = TextEditingController();
  TextEditingController controllerRm = TextEditingController();
  TextEditingController controllerF = TextEditingController();
  TextEditingController controllerQ2a = TextEditingController();
  //controller de Q2b
  TextEditingController controllerE2 = TextEditingController();
  TextEditingController controllerS2 = TextEditingController();
  TextEditingController controllerRm2 = TextEditingController();
  TextEditingController controllerF2 = TextEditingController();
  TextEditingController controllerQ2b = TextEditingController();
  //controller de Q2c
  TextEditingController controllerE3 = TextEditingController();
  TextEditingController controllerS3 = TextEditingController();
  TextEditingController controllerRm3 = TextEditingController();
  TextEditingController controllerF3 = TextEditingController();
  TextEditingController controllerQ2c = TextEditingController();
  //controller de Q2d
  TextEditingController controllerE4 = TextEditingController();
  TextEditingController controllerS4 = TextEditingController();
  TextEditingController controllerRm4 = TextEditingController();
  TextEditingController controllerF4 = TextEditingController();
  TextEditingController controllerQ2d = TextEditingController();

  //Controllers pour le deuxième cas soit Q3
  //---------😊😊😊-------------
  //repété le processus
  //controller de Q3a
  TextEditingController controllerEv = TextEditingController();
  TextEditingController controllerSv = TextEditingController();
  TextEditingController controllerRv = TextEditingController();
  TextEditingController controllerGv = TextEditingController();
  TextEditingController controllerQ3a = TextEditingController();
  //controller de Q3b
  TextEditingController controllerEv2 = TextEditingController();
  TextEditingController controllerSv2 = TextEditingController();
  TextEditingController controllerRv2 = TextEditingController();
  TextEditingController controllerGv2 = TextEditingController();
  TextEditingController controllerQ3b = TextEditingController();
  //controller de Q3c
  TextEditingController controllerEv3 = TextEditingController();
  TextEditingController controllerSv3 = TextEditingController();
  TextEditingController controllerRv3 = TextEditingController();
  TextEditingController controllerGv3 = TextEditingController();
  TextEditingController controllerQ3c = TextEditingController();
  //controller de Q3d
  TextEditingController controllerEv4 = TextEditingController();
  TextEditingController controllerSv4 = TextEditingController();
  TextEditingController controllerRv4 = TextEditingController();
  TextEditingController controllerGv4 = TextEditingController();
  TextEditingController controllerQ3d = TextEditingController();

  //Controllers pour le deuxième cas soit Q4
  //---------😊😊😊-------------
  //repété le processus
  //controller de Q4
  TextEditingController controllerQv = TextEditingController();
  TextEditingController controllerOOi = TextEditingController();
  TextEditingController controllerOOe = TextEditingController();
  TextEditingController controllerQ4 = TextEditingController();

  //Controllers pour le deuxième cas soit Q5
  //---------😊😊😊-------------
  //repété le processus
  //controller de Q5a
  TextEditingController controllerQQv = TextEditingController();
  TextEditingController controllerWi = TextEditingController();
  TextEditingController controllerWe = TextEditingController();
  TextEditingController controllerQ5 = TextEditingController();

  //Controllers pour le  cas soit Q6
  //---------😊😊😊-------------
  //repété le processus
  //controller de Q6a
  TextEditingController controllerDelc = TextEditingController();
  TextEditingController controllerSp = TextEditingController();
  TextEditingController controllerQ6 = TextEditingController();

  //Controllers pour le  cas soit Q7
  //---------😊😊😊-------------
  //repété le processus
  //controller de Q7a
  TextEditingController controllerN = TextEditingController();
  TextEditingController controllerCocc = TextEditingController();
  TextEditingController controllerCs = TextEditingController();
  TextEditingController controllerCl = TextEditingController();
  TextEditingController controllerQ7 = TextEditingController();

  //Controllers pour le  cas soit Q8
  //---------😊😊😊-------------
  //repété le processus
  //controller de Q8a
  TextEditingController controllerNo = TextEditingController();
  TextEditingController controllerCu = TextEditingController();
  TextEditingController controllerCCs = TextEditingController();
  TextEditingController controllerCCl = TextEditingController();
  TextEditingController controllerQ8 = TextEditingController();
  //controller de Q8b
  TextEditingController controllerNo2 = TextEditingController();
  TextEditingController controllerCu2 = TextEditingController();
  TextEditingController controllerCCs2 = TextEditingController();
  TextEditingController controllerCCl2 = TextEditingController();
  TextEditingController controllerQ8b = TextEditingController();

  void initControllers() {
    // Initialisation des controllers dans la inistate cas 1
    controllerOi.text = transA.oi.toString();
    controllerOe.text = transA.oe.toString();
    controllerH.text = transA.h.toString();
    controllerL.text = transA.l.toString();
    controllerK.text = transA.k.toString();
    // Initialisation des controllers dans la inistate cas 2
    controllerOi2.text = transB.oi.toString();
    controllerOe2.text = transB.oe.toString();
    controllerH2.text = transB.h.toString();
    controllerL2.text = transB.l.toString();
    controllerK2.text = transB.k.toString();

    // Initialisation des controllers dans la inistate cas 3
    controllerOi3.text = transC.oi.toString();
    controllerOe3.text = transC.oe.toString();
    controllerH3.text = transC.h.toString();
    controllerL3.text = transC.l.toString();
    controllerK3.text = transC.k.toString();
    // Initialisation des controllers dans la inistate cas 4
    controllerOi4.text = transB.oi.toString();
    controllerOe4.text = transB.oe.toString();
    controllerH4.text = transD.h.toString();
    controllerL4.text = transD.l.toString();
    controllerK4.text = transD.k.toString();
    // Initialisation des controllers dans la inistate cas 5
    controllerOi5.text = transC.oi.toString();
    controllerOe5.text = transC.oe.toString();
    controllerH5.text = transC.h.toString();
    controllerL5.text = transC.l.toString();
    controllerK5.text = transC.k.toString();
    // Initialisation des controllers dans la inistate cas 6
    controllerOi6.text = transC.oi.toString();
    controllerOe6.text = transC.oe.toString();
    controllerH6.text = transC.h.toString();
    controllerL6.text = transC.l.toString();
    controllerK6.text = transC.k.toString();
    // Initialisation des controllers dans la inistate cas 7
    controllerOe7.text = transC.oi.toString();
    controllerOi7.text = transC.oe.toString();
    controllerH7.text = transC.h.toString();
    controllerL7.text = transC.l.toString();
    controllerK7.text = transC.k.toString();
    // Initialisation des controllers dans la inistate cas 8
    controllerOi8.text = transC.oi.toString();
    controllerOe8.text = transC.oe.toString();
    controllerH8.text = transC.h.toString();
    controllerL8.text = transC.l.toString();
    controllerK8.text = transC.k.toString();

    setState(() {});
  }

  //deuxième fonction déinitialisation pour Q2
  void initControllers2() {
    // Initialisation des controllers dans la inistate cas q2a
    controllerE.text = E.toString();
    controllerF.text = F.toString();
    controllerS.text = S.toString();
    controllerRm.text = Rm.toString();
    // Initialisation des controllers dans la inistate cas q2b
    controllerE2.text = E2.toString();
    controllerF2.text = F2.toString();
    controllerS2.text = S2.toString();
    controllerRm2.text = Rm2.toString();
    // Initialisation des controllers dans la inistate cas q2c
    controllerE3.text = E3.toString();
    controllerF3.text = F3.toString();
    controllerS3.text = S3.toString();
    controllerRm3.text = Rm3.toString();
    // Initialisation des controllers dans la inistate cas q2d
    controllerE4.text = E4.toString();
    controllerF4.text = F4.toString();
    controllerS4.text = S4.toString();
    controllerRm4.text = Rm4.toString();

    setState(() {});
  }

  void initControllers3() {
    // Initialisation des controllers dans la inistate cas q3a
    controllerEv.text = Ev.toString();
    controllerSv.text = Sv.toString();
    controllerRv.text = Rv.toString();
    controllerGv.text = Gv.toString();
    // Initialisation des controllers dans la inistate cas q3b
    controllerEv2.text = Ev2.toString();
    controllerSv2.text = Sv2.toString();
    controllerRv2.text = Rv2.toString();
    controllerGv2.text = Gv2.toString();
    // Initialisation des controllers dans la inistate cas q3c
    controllerEv3.text = Ev3.toString();
    controllerSv3.text = Sv3.toString();
    controllerRv3.text = Rv3.toString();
    controllerGv3.text = Gv3.toString();
    // Initialisation des controllers dans la inistate cas q3d
    controllerEv4.text = Ev4.toString();
    controllerSv4.text = Sv4.toString();
    controllerRv4.text = Rv4.toString();
    controllerGv4.text = Gv4.toString();

    setState(() {});
  }

  //FONCTION DE L4INITIALISATION DE Q4
  void initControllers4() {
    controllerOOe.text = OOe.toString();
    controllerOOi.text = OOi.toString();
    controllerQv.text = Qv.toString();
    controllerQ4.text = Q4.toString();

    setState(() {});
  }

  //fonction pour l' initialisation pour q5
  void initControllers5() {
    controllerQQv.text = QQv.toString();
    controllerWi.text = Wi.toString();
    controllerWe.text = We.toString();

    setState(() {});
  }

  //fonction pour l' initialisation pour q6
  void initControllers6() {
    controllerDelc.text = Delc.toString();
    controllerSp.text = Sp.toString();
    controllerQ6.text = q6a.toString();

    setState(() {});
  }

  //fonction pour l' initialisation pour q7
  void initControllers7() {
    controllerN.text = N.toString();
    controllerCocc.text = Cocc.toString();
    controllerCs.text = Cs.toString();
    controllerCl.text = Cl.toString();
    controllerQ7.text = q7a.toString();

    setState(() {});
  }

  //fonction pour l' initialisation pour q8
  void initControllers8() {
    controllerNo.text = N.toString();
    controllerCu.text = Cocc.toString();
    controllerCCs.text = Cs.toString();
    controllerCCl.text = Cl.toString();
    controllerQ8.text = q8a.toString();

    controllerNo2.text = N.toString();
    controllerCu2.text = Cocc.toString();
    controllerCCs2.text = Cs.toString();
    controllerCCl2.text = Cl.toString();
    controllerQ8b.text = q8a2.toString();

    setState(() {});
  }

  @override
  void initState() {
    initControllers();
    initControllers2();
    initControllers3();
    initControllers4();
    initControllers5();
    initControllers6();
    initControllers7();
    initControllers8();
    // _tabController = TabController(length: 2, vsync: this);
    super.initState();
    super.initState();
  }

  //partie por la tabbar
  // late TabController _tabController;

  @override
  void dispose() {
    super.dispose();
    // _tabController.dispose();
  }

  //
  final keyform = GlobalKey<FormState>();
  //

  List<Step> steppList() => [
        Step(
            title: Text('1- Apport thermique par transmission par les parois'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Orientation Nord'),
                Row(
                  children: [
                    Input2('Oe', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transA.oe = valeur;
                          // q1a = (oe - oi) * l * h * k;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransA(transA);

                          setState(() {
                            controllerQ1a.text = TransController.calculResult(
                                    transproviderQ.transA)
                                .toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerOe),

                    Wspace(10),
                    Input2(
                      'Oi',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerOi,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            transA.oi = valeur;

                            final transproviderQ =
                                context.read<DataProviderQ>();
                            transproviderQ.changeTransA(transA);

                            setState(() {
                              controllerQ1a.text = TransController.calculResult(
                                      transproviderQ.transA)
                                  .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2('h', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transA.h = valeur;

                          // q1a = (oe - oi) * l * h * k;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransA(transA);

                          setState(() {
                            controllerQ1a.text = TransController.calculResult(
                                    transproviderQ.transA)
                                .toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerH),
                    Wspace(10),
                    Input2('l', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transA.l = valeur;

                          // q1a = (oe - oi) * l * h * k;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransA(transA);

                          setState(() {
                            controllerQ1a.text = TransController.calculResult(
                                    transproviderQ.transA)
                                .toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerL),
                    Wspace(10),
                    Input2('k', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transA.k = valeur;

                          // q1a = (oe - oi) * l * h * k;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransA(transA);

                          setState(() {
                            controllerQ1a.text = TransController.calculResult(
                                    transproviderQ.transA)
                                .toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerK),
                    Wspace(10),

                    //  Text({'$controllerQ1a'}.toString()),
                    Input2(
                        'Q1a', 'resultat', 100, Color.fromARGB(255, 2, 243, 62),
                        controller: controllerQ1a),
                  ],
                ),
                Hspace(15),
                const Text('Orientation Sud'),
                Row(
                  children: [
                    Input2('Oe', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transB.oe = valeur;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransB(transB);
                          setState(() {
                            controllerQ1b.text =
                                TransController.calculResult(transB).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerOe2),

                    Wspace(10),
                    Input2(
                      'Oi',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerOi2,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            transB.oi = valeur;

                            // q1b = (oe2 - oi2) * l2 * h2 * k2;
                            final transproviderQ =
                                context.read<DataProviderQ>();
                            transproviderQ.changeTransB(transB);
                            setState(() {
                              controllerQ1b.text = controllerQ1b.text =
                                  TransController.calculResult(transB)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2('h', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transB.h = valeur;

                          // q1b = (oe2 - oi2) * l2 * h2 * k2;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransB(transB);
                          setState(() {
                            controllerQ1b.text = controllerQ1b.text =
                                TransController.calculResult(transB).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerH2),
                    Wspace(10),
                    Input2('l', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transB.l = valeur;

                          // q1b = (oe2 - oi2) * l2 * h2 * k2;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransB(transB);
                          setState(() {
                            controllerQ1b.text = controllerQ1b.text =
                                TransController.calculResult(transB).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerL2),
                    Wspace(10),
                    Input2('k', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transB.k = valeur;

                          // q1b = (oe2 - oi2) * l2 * h2 * k2;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransB(transB);
                          setState(() {
                            controllerQ1b.text = controllerQ1b.text =
                                TransController.calculResult(transB).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerK2),
                    Wspace(10),

                    //  Text({'$controllerQ1a'}.toString()),
                    Input2(
                        'Q1b', 'resultat', 100, Color.fromARGB(255, 2, 243, 62),
                        controller: controllerQ1b),
                  ],
                ),
                Hspace(15),
                const Text('Orientation Ouest'),
                Row(
                  children: [
                    Input2('Oe', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transC.oe = valeur;

                          // q1c = (oe3 - oi3) * l3 * h3 * k3;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransC(transC);
                          setState(() {
                            controllerQ1c.text = controllerQ1c.text =
                                TransController.calculResult(transC).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerOe3),

                    Wspace(10),
                    Input2(
                      'Oi',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerOi3,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            transC.oi = valeur;

                            // q1c = (oe3 - oi3) * l3 * h3 * k3;
                            final transproviderQ =
                                context.read<DataProviderQ>();
                            transproviderQ.changeTransC(transC);
                            setState(() {
                              controllerQ1c.text = controllerQ1c.text =
                                  TransController.calculResult(transC)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2('h', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transC.h = valeur;

                          // q1c = (oe3 - oi3) * l3 * h3 * k3;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransC(transC);
                          setState(() {
                            controllerQ1c.text = controllerQ1c.text =
                                TransController.calculResult(transC).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerH3),
                    Wspace(10),
                    Input2('l', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transC.l = valeur;

                          // q1c = (oe3 - oi3) * l3 * h3 * k3;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransC(transC);
                          setState(() {
                            controllerQ1c.text = controllerQ1c.text =
                                TransController.calculResult(transC).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerL3),
                    Wspace(10),
                    Input2('k', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transC.k = valeur;

                          // q1c = (oe3 - oi3) * l3 * h3 * k3;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransC(transC);
                          setState(() {
                            controllerQ1c.text = controllerQ1c.text =
                                TransController.calculResult(transC).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerK3),
                    Wspace(10),

                    //  Text({'$controllerQ1a'}.toString()),
                    Input2(
                        'Q1c', 'resultat', 100, Color.fromARGB(255, 2, 243, 62),
                        controller: controllerQ1c),
                  ],
                ),
                Hspace(15),
                const Text('Orientation Est'),
                Row(
                  children: [
                    Input2('Oe', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transD.oe = valeur;

                          // q1d = (oe4 - oi4) * l4 * h4 * k4;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransD(transD);

                          setState(() {
                            controllerQ1d.text = controllerQ1b.text =
                                TransController.calculResult(transD).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerOe4),

                    Wspace(10),
                    Input2(
                      'Oi',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerOi4,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            transD.oi = valeur;

                            // q1d = (oe4 - oi4) * l4 * h4 * k4;
                            final transproviderQ =
                                context.read<DataProviderQ>();
                            transproviderQ.changeTransD(transD);

                            setState(() {
                              controllerQ1d.text = controllerQ1b.text =
                                  TransController.calculResult(transD)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2('h', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transD.h = valeur;

                          // q1d = (oe4 - oi4) * l4 * h4 * k4;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransD(transD);

                          setState(() {
                            controllerQ1d.text = controllerQ1b.text =
                                TransController.calculResult(transD).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerH4),
                    Wspace(10),
                    Input2('l', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transD.l = valeur;

                          // q1d = (oe4 - oi4) * l4 * h4 * k4;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransD(transD);

                          setState(() {
                            controllerQ1d.text = controllerQ1b.text =
                                TransController.calculResult(transD).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerL4),
                    Wspace(10),
                    Input2('k', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transD.k = valeur;

                          // q1d = (oe4 - oi4) * l4 * h4 * k4;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransD(transD);

                          setState(() {
                            controllerQ1d.text = controllerQ1b.text =
                                TransController.calculResult(transD).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerK4),
                    Wspace(10),

                    //  Text({'$controllerQ1a'}.toString()),
                    Input2(
                        'Q1d', 'resultat', 100, Color.fromARGB(255, 2, 243, 62),
                        controller: controllerQ1d),
                  ],
                ),
                Hspace(15),
                const Text('Planché bas'),
                Row(
                  children: [
                    Input2('Oe', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transE.oe = valeur;

                          // q1e = (oe5 - oi5) * l5 * h5 * k5;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransE(transE);

                          setState(() {
                            controllerQ1e.text = controllerQ1b.text =
                                TransController.calculResult(transE).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerOe5),

                    Wspace(10),
                    Input2(
                      'Oi',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerOi5,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            transE.oi = valeur;

                            // q1e = (oe5 - oi5) * l5 * h5 * k5;
                            final transproviderQ =
                                context.read<DataProviderQ>();
                            transproviderQ.changeTransE(transE);

                            setState(() {
                              controllerQ1e.text = controllerQ1b.text =
                                  TransController.calculResult(transE)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2('h', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transE.h = valeur;

                          // q1e = (oe5 - oi5) * l5 * h5 * k5;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransE(transE);

                          setState(() {
                            controllerQ1e.text = controllerQ1b.text =
                                TransController.calculResult(transE).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerH5),
                    Wspace(10),
                    Input2('l', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transE.l = valeur;

                          // q1e = (oe5 - oi5) * l5 * h5 * k5;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransE(transE);

                          setState(() {
                            controllerQ1e.text = controllerQ1b.text =
                                TransController.calculResult(transE).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerL5),
                    Wspace(10),
                    Input2('k', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transE.k = valeur;

                          // q1e = (oe5 - oi5) * l5 * h5 * k5;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransE(transE);

                          setState(() {
                            controllerQ1e.text = controllerQ1b.text =
                                TransController.calculResult(transE).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerK5),
                    Wspace(10),

                    //  Text({'$controllerQ1a'}.toString()),
                    Input2(
                        'Q1e', 'resultat', 100, Color.fromARGB(255, 2, 243, 62),
                        controller: controllerQ1e),
                  ],
                ),
                Hspace(15),
                const Text('Planché haut'),
                Row(
                  children: [
                    Input2('Oe', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transF.oe = valeur;

                          // q1f = (oe6 - oi6) * l6 * h6 * k6;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransF(transF);

                          setState(() {
                            controllerQ1f.text = controllerQ1b.text =
                                TransController.calculResult(transF).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerOe6),

                    Wspace(10),
                    Input2(
                      'Oi',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerOi6,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            transF.oi = valeur;

                            // q1f = (oe6 - oi6) * l6 * h6 * k6;
                            final transproviderQ =
                                context.read<DataProviderQ>();
                            transproviderQ.changeTransF(transF);

                            setState(() {
                              controllerQ1f.text = controllerQ1b.text =
                                  TransController.calculResult(transF)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2('h', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transF.h = valeur;

                          // q1f = (oe6 - oi6) * l6 * h6 * k6;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransF(transF);

                          setState(() {
                            controllerQ1f.text = controllerQ1b.text =
                                TransController.calculResult(transF).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerH6),
                    Wspace(10),
                    Input2('l', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transF.l = valeur;

                          // q1f = (oe6 - oi6) * l6 * h6 * k6;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransF(transF);

                          setState(() {
                            controllerQ1f.text = controllerQ1b.text =
                                TransController.calculResult(transF).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerL6),
                    Wspace(10),
                    Input2('k', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transF.k = valeur;

                          // q1f = (oe6 - oi6) * l6 * h6 * k6;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransF(transF);

                          setState(() {
                            controllerQ1f.text = controllerQ1b.text =
                                TransController.calculResult(transF).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerK6),
                    Wspace(10),

                    //  Text({'$controllerQ1a'}.toString()),
                    Input2(
                        'Q1f', 'resultat', 100, Color.fromARGB(255, 2, 243, 62),
                        controller: controllerQ1f),
                  ],
                ),
                Hspace(15),
                const Text('Vitrage'),
                Row(
                  children: [
                    Input2('Oe', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transG.oe = valeur;

                          // q1g = (oe7 - oi7) * l7 * h7 * k7;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransG(transG);

                          setState(() {
                            controllerQ1g.text = controllerQ1b.text =
                                TransController.calculResult(transG).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerOe7),

                    Wspace(10),
                    Input2(
                      'Oi',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerOi7,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            transG.oi = valeur;

                            // q1g = (oe7 - oi7) * l7 * h7 * k7;
                            final transproviderQ =
                                context.read<DataProviderQ>();
                            transproviderQ.changeTransG(transG);

                            setState(() {
                              controllerQ1g.text = controllerQ1b.text =
                                  TransController.calculResult(transG)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2('h', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transG.h = valeur;

                          // q1g = (oe7 - oi7) * l7 * h7 * k7;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransG(transG);

                          setState(() {
                            controllerQ1g.text = controllerQ1b.text =
                                TransController.calculResult(transG).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerH7),
                    Wspace(10),
                    Input2('l', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transG.l = valeur;

                          // q1g = (oe7 - oi7) * l7 * h7 * k7;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransG(transG);

                          setState(() {
                            controllerQ1g.text = controllerQ1b.text =
                                TransController.calculResult(transG).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerL7),
                    Wspace(10),
                    Input2('k', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transG.k = valeur;

                          // q1g = (oe7 - oi7) * l7 * h7 * k7;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransG(transG);

                          setState(() {
                            controllerQ1g.text = controllerQ1b.text =
                                TransController.calculResult(transG).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerK7),
                    Wspace(10),

                    //  Text({'$controllerQ1a'}.toString()),
                    Input2(
                        'Q1g', 'resultat', 100, Color.fromARGB(255, 2, 243, 62),
                        controller: controllerQ1g),
                  ],
                ),
                Hspace(15),
                const Text('Porte'),
                Row(
                  children: [
                    Input2('Oe', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transH.oe = valeur;

                          // q1h = (oe8 - oi8) * l8 * h8 * k8;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransH(transH);

                          setState(() {
                            controllerQ1h.text = controllerQ1b.text =
                                TransController.calculResult(transH).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerOe8),
                    Wspace(10),
                    Input2(
                      'Oi',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerOi8,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            transH.oi = valeur;

                            // q1h = (oe8 - oi8) * l8 * h8 * k8;
                            final transproviderQ =
                                context.read<DataProviderQ>();
                            transproviderQ.changeTransH(transH);

                            setState(() {
                              controllerQ1h.text =
                                  TransController.calculResult(transH)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2('h', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transH.h = valeur;

                          // q1h = (oe8 - oi8) * l8 * h8 * k8;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransH(transH);

                          setState(() {
                            controllerQ1h.text =
                                TransController.calculResult(transH).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerH8),
                    Wspace(10),
                    Input2('l', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transH.l = valeur;

                          // q1h = (oe8 - oi8) * l8 * h8 * k8;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransH(transH);

                          setState(() {
                            controllerQ1h.text =
                                TransController.calculResult(transH).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerL8),
                    Wspace(10),
                    Input2('k', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          transH.k = valeur;

                          // q1h = (oe8 - oi8) * l8 * h8 * k8;
                          final transproviderQ = context.read<DataProviderQ>();
                          transproviderQ.changeTransH(transH);

                          setState(() {
                            controllerQ1h.text =
                                TransController.calculResult(transH).toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerK8),
                    Wspace(10),
                    Input2(
                        'Q1h', 'resultat', 100, Color.fromARGB(255, 2, 243, 62),
                        controller: controllerQ1h),
                  ],
                ),
              ],
            )),
        Step(
            title: const Text(
                '2- Apport de chaleur par Rayonnement solaire a travers les parois'),
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Orientation nord'),
                  Row(
                    children: [
                      Input2('Alpha', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2A.alpha = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransA(trans2A);
                            setState(() {
                              controllerQ2a.text =
                                  TransController2.calculResult2(trans2A)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerE),

                      Wspace(10),
                      Input2('F', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2A.f = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransA(trans2A);
                            setState(() {
                              controllerQ2a.text =
                                  TransController2.calculResult2(trans2A)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerF),

                      Wspace(10),
                      Input2('S', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2A.s = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransA(trans2A);
                            setState(() {
                              controllerQ2a.text =
                                  TransController2.calculResult2(trans2A)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerS),

                      Wspace(10),

                      Input2('Rm', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2A.Rm = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransA(trans2A);
                            setState(() {
                              controllerQ2a.text =
                                  TransController2.calculResult2(trans2A)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerRm),
                      Wspace(10),

                      //  Text({'$controllerQ1a'}.toString()),
                      Input2('Q2a', 'resultat', 100,
                          Color.fromARGB(255, 2, 243, 62),
                          controller: controllerQ2a),
                    ],
                  ),
                  Hspace(15),
                  const Text('Orientation Sud'),
                  Row(
                    children: [
                      Input2('Alpha', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2B.alpha = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransB(trans2B);
                            setState(() {
                              controllerQ2b.text =
                                  TransController2.calculResult2(trans2B)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerE2),

                      Wspace(10),
                      Input2('F', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2B.f = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransB(trans2B);
                            setState(() {
                              controllerQ2b.text =
                                  TransController2.calculResult2(trans2B)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerF2),

                      Wspace(10),
                      Input2('S', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2B.s = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransB(trans2B);
                            setState(() {
                              controllerQ2b.text =
                                  TransController2.calculResult2(trans2B)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerS2),

                      Wspace(10),

                      Input2('Rm', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2B.Rm = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransB(trans2B);
                            setState(() {
                              controllerQ2b.text =
                                  TransController2.calculResult2(trans2B)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerRm2),
                      Wspace(10),

                      //  Text({'$controllerQ1a'}.toString()),
                      Input2('Q2b', 'resultat', 100,
                          Color.fromARGB(255, 2, 243, 62),
                          controller: controllerQ2b),
                    ],
                  ),
                  Hspace(15),
                  const Text('Orientation Est'),
                  Row(
                    children: [
                      Input2('Alpha', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2C.alpha = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransC(trans2C);
                            setState(() {
                              controllerQ2c.text =
                                  TransController2.calculResult2(trans2C)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerE3),

                      Wspace(10),
                      Input2('F', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2C.f = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransC(trans2C);
                            setState(() {
                              controllerQ2c.text =
                                  TransController2.calculResult2(trans2C)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerF3),

                      Wspace(10),
                      Input2('S', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2C.s = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransC(trans2C);
                            setState(() {
                              controllerQ2c.text =
                                  TransController2.calculResult2(trans2C)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerS3),

                      Wspace(10),

                      Input2('Rm', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2C.Rm = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransC(trans2C);
                            setState(() {
                              controllerQ2c.text =
                                  TransController2.calculResult2(trans2C)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerRm3),
                      Wspace(10),

                      //  Text({'$controllerQ1a'}.toString()),
                      Input2('Q2b', 'resultat', 100,
                          Color.fromARGB(255, 2, 243, 62),
                          controller: controllerQ2c),
                    ],
                  ),
                  Hspace(15),
                  const Text('Orientation Ouest'),
                  Row(
                    children: [
                      Input2('Alpha', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2D.alpha = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransD(trans2D);
                            setState(() {
                              controllerQ2d.text =
                                  TransController2.calculResult2(trans2D)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerE4),

                      Wspace(10),
                      Input2('F', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2D.f = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransD(trans2D);
                            setState(() {
                              controllerQ2d.text =
                                  TransController2.calculResult2(trans2D)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerF4),

                      Wspace(10),
                      Input2('S', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2D.s = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransD(trans2D);
                            setState(() {
                              controllerQ2d.text =
                                  TransController2.calculResult2(trans2D)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerS4),

                      Wspace(10),

                      Input2('Rm', 'hint', 70, Colors.blue.shade100,
                          onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans2D.Rm = valeur;
                            final apport2 = context.read<Apport2Provider>();
                            apport2.setTransD(trans2D);
                            setState(() {
                              controllerQ2d.text =
                                  TransController2.calculResult2(trans2D)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      }, controller: controllerRm4),
                      Wspace(10),

                      //  Text({'$controllerQ1a'}.toString()),
                      Input2('Q2b', 'resultat', 100,
                          Color.fromARGB(255, 2, 243, 62),
                          controller: controllerQ2d),
                    ],
                  ),
                ],
              ),
            )),
        Step(
            title: const Text(
                '3- Apport de chaleur par Rayonnement solaire a travers les vitrages'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Vitrage nord'),
                Row(
                  children: [
                    Input2(
                      'Alpha',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerEv,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3A.Ev = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransA(trans3A);
                            setState(() {
                              controllerQ3a.text =
                                  TransController3.calculResult3(trans3A)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2(
                      'g',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerGv,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3A.gV = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransA(trans3A);
                            setState(() {
                              controllerQ3a.text =
                                  TransController3.calculResult3(trans3A)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2(
                      'S',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerSv,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3A.sV = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransA(trans3A);
                            setState(() {
                              controllerQ3a.text =
                                  TransController3.calculResult3(trans3A)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2(
                      'Rm',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerRm,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3A.RmV = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransA(trans3A);
                            setState(() {
                              controllerQ3a.text =
                                  TransController3.calculResult3(trans3A)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    //  Text({'$controllerQ1a'}.toString()),
                    Input2(
                        'Q3a', 'resultat', 100, Color.fromARGB(255, 6, 218, 20),
                        controller: controllerQ3a),
                  ],
                ),
                Hspace(15),
                const Text('Vitrage Sud'),
                Row(
                  children: [
                    Input2(
                      'Alpha',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerEv2,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3B.Ev = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransB(trans3B);
                            setState(() {
                              controllerQ3b.text =
                                  TransController3.calculResult3(trans3B)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2(
                      'g',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerGv2,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3B.gV = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransB(trans3B);
                            setState(() {
                              controllerQ3b.text =
                                  TransController3.calculResult3(trans3B)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2(
                      'S',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerSv2,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3B.sV = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransB(trans3B);
                            setState(() {
                              controllerQ3b.text =
                                  TransController3.calculResult3(trans3B)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2(
                      'Rm',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerRm2,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3B.RmV = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransB(trans3B);
                            setState(() {
                              controllerQ3b.text =
                                  TransController3.calculResult3(trans3B)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    //  Text({'$controllerQ1a'}.toString()),
                    Input2(
                        'Q3a', 'resultat', 100, Color.fromARGB(255, 0, 240, 4),
                        controller: controllerQ3b),
                  ],
                ),
                Hspace(15),
                const Text('Vitrage Est'),
                Row(
                  children: [
                    Input2(
                      'Alpha',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerEv3,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3C.Ev = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransC(trans3C);
                            setState(() {
                              controllerQ3c.text =
                                  TransController3.calculResult3(trans3C)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2(
                      'g',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerGv3,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3C.gV = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransC(trans3C);
                            setState(() {
                              controllerQ3c.text =
                                  TransController3.calculResult3(trans3C)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2(
                      'S',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerSv3,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3C.sV = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransC(trans3C);
                            setState(() {
                              controllerQ3c.text =
                                  TransController3.calculResult3(trans3C)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2(
                      'Rm',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerRm3,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3C.RmV = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransC(trans3C);
                            setState(() {
                              controllerQ3c.text =
                                  TransController3.calculResult3(trans3C)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    //  Text({'$controllerQ1a'}.toString()),
                    Input2(
                        'Q3c', 'resultat', 100, Color.fromARGB(255, 2, 218, 49),
                        controller: controllerQ3c),
                  ],
                ),
                Hspace(15),
                const Text('Vitrage Ouest'),
                Row(
                  children: [
                    Input2(
                      'Alpha',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerEv4,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3D.Ev = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransD(trans3D);
                            setState(() {
                              controllerQ3d.text =
                                  TransController3.calculResult3(trans3D)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2(
                      'g',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerGv4,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3D.gV = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransD(trans3D);
                            setState(() {
                              controllerQ3d.text =
                                  TransController3.calculResult3(trans3D)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2(
                      'S',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerSv4,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3D.sV = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransD(trans3D);
                            setState(() {
                              controllerQ3d.text =
                                  TransController3.calculResult3(trans3D)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2(
                      'Rm',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerRm4,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans3D.RmV = valeur;
                            final apport2 = context.read<Apport3Provider>();
                            apport2.setTransD(trans3D);
                            setState(() {
                              controllerQ3d.text =
                                  TransController3.calculResult3(trans3D)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    //  Text({'$controllerQ1a'}.toString()),
                    Input2(
                        'Q3d', 'resultat', 100, Color.fromARGB(255, 7, 233, 18),
                        controller: controllerQ3d),
                  ],
                ),
              ],
            )),
        Step(
            title: const Text(
                "4- Apport de chaleur  sensible par renouvellement  d'air "),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Input2(
                      'Oe',
                      'hint',
                      70,
                      Colors.blue.shade100,
                      controller: controllerOOe,
                      onChanged: (val) {
                        try {
                          if (val.trim().isNotEmpty) {
                            var valeur = double.parse(val);
                            trans4.Oe = valeur;
                            final apport2 = context.read<Apport4Provider>();
                            apport2.setTransA(trans4);
                            setState(() {
                              controllerQ4.text =
                                  TransController4.calculResult4(trans4)
                                      .toString();
                            });
                          }
                        } on FormatException catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('the value must be a number ')));
                        } catch (e) {
                          printer(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Somthing whent wrong ')));
                        }
                      },
                    ),
                    Wspace(10),
                    Input2('Oi', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          trans4.Oi = valeur;
                          final apport2 = context.read<Apport4Provider>();
                          apport2.setTransA(trans4);
                          setState(() {
                            controllerQ4.text =
                                TransController4.calculResult4(trans4)
                                    .toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerOi),
                    Wspace(10),
                    Input2('Qv', 'hint', 70, Colors.blue.shade100,
                        onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          trans4.Qv = valeur;
                          final apport2 = context.read<Apport4Provider>();
                          apport2.setTransA(trans4);
                          setState(() {
                            controllerQ4.text =
                                TransController4.calculResult4(trans4)
                                    .toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    }, controller: controllerQv),
                    Wspace(10),

                    //  Text({'$controllerQ1a'}.toString()),
                    Input2(
                        'Q4', 'resultat', 100, Color.fromARGB(255, 2, 215, 41),
                        controller: controllerQ4),
                  ],
                ),
              ],
            )),
//
        Step(
          title: const Text(
              '5- Apport de chaleur  latente par renouvellement d air '),
          content: Row(
            children: [
              Input2(
                'We',
                'hint',
                70,
                Colors.blue.shade100,
                controller: controllerWe,
                onChanged: (val) {
                  try {
                    if (val.trim().isNotEmpty) {
                      var valeur = double.parse(val);
                      trans5.We = valeur;
                      final apport5 = context.read<Apport5Provider>();
                      apport5.setTrans(trans5);

                      setState(() {
                        controllerQ5.text =
                            TransController5.calculResult5(trans5).toString();
                      });
                    }
                  } on FormatException catch (e) {
                    printer(e);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('the value must be a number ')));
                  } catch (e) {
                    printer(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Somthing whent wrong ')));
                  }
                },
              ),
              Wspace(10),
              Input2('Wi', 'hint', 70, Colors.blue.shade100, onChanged: (val) {
                try {
                  if (val.trim().isNotEmpty) {
                    var valeur = double.parse(val);
                    trans5.Wi = valeur;
                    final apport5 = context.read<Apport5Provider>();
                    apport5.setTrans(trans5);

                    setState(() {
                      controllerQ5.text =
                          TransController5.calculResult5(trans5).toString();
                    });
                  }
                } on FormatException catch (e) {
                  printer(e);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('the value must be a number ')));
                } catch (e) {
                  printer(e);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Somthing whent wrong ')));
                }
              }, controller: controllerWi),
              Wspace(10),
              Input2('Qv', 'hint', 70, Colors.blue.shade100, onChanged: (val) {
                try {
                  if (val.trim().isNotEmpty) {
                    var valeur = double.parse(val);
                    trans5.Qv = valeur;

                    final apport5 = context.read<Apport5Provider>();
                    apport5.setTrans(trans5);

                    setState(() {
                      controllerQ5.text =
                          TransController5.calculResult5(trans5).toString();
                    });
                  }
                } on FormatException catch (e) {
                  printer(e);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('the value must be a number ')));
                } catch (e) {
                  printer(e);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Somthing whent wrong ')));
                }
              }, controller: controllerQQv),
              Wspace(10),

              //  Text({'$controllerQ1a'}.toString()),
              Input2(
                  'Q4',
                  'resultat',
                  100,
                  Color.fromARGB(
                    255,
                    0,
                    223,
                    41,
                  ),
                  controller: controllerQ5),
            ],
          ),
        ),
//
        Step(
          title: const Text('6- Apport de chaleur sensible par éclairage '),
          content: Row(
            children: [
              Wspace(10),
              Input2('Délc / n', 'hint', 70, Colors.blue.shade100,
                  onChanged: (val) {
                try {
                  if (val.trim().isNotEmpty) {
                    var valeur = double.parse(val);
                    trans6.Delec = valeur;

                    final apport6 = context.read<Apport6Provider>();
                    apport6.setTransA(trans6);

                    setState(() {
                      controllerQ6.text =
                          TransController6.calculResult6(trans6).toString();
                    });
                  }
                } on FormatException catch (e) {
                  printer(e);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('the value must be a number ')));
                } catch (e) {
                  printer(e);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Somthing whent wrong ')));
                }
              }, controller: controllerDelc),
              Wspace(10),
              Input2('Sp / P', 'hint', 70, Colors.blue.shade100,
                  onChanged: (val) {
                try {
                  if (val.trim().isNotEmpty) {
                    var valeur = double.parse(val);
                    trans6.Sp = valeur;

                    final apport6 = context.read<Apport6Provider>();
                    apport6.setTransA(trans6);
                    setState(() {
                      controllerQ6.text =
                          TransController6.calculResult6(trans6).toString();
                    });
                  }
                } on FormatException catch (e) {
                  printer(e);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('the value must be a number ')));
                } catch (e) {
                  printer(e);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Somthing whent wrong ')));
                }
              }, controller: controllerSp),
              Wspace(10),

              //  Text({'$controllerQ1a'}.toString()),=
              Input2(
                  'Q6a', 'resultat', 100, const Color.fromARGB(255, 2, 243, 62),
                  controller: controllerQ6),
            ],
          ),
        ),

        Step(
          title: const Text('7- Apport de chaleur du au occupant'),
          content: Row(
            children: [
              Input2(
                'N',
                'hint',
                70,
                Colors.blue.shade100,
                controller: controllerN,
                onChanged: (val) {
                  try {
                    if (val.trim().isNotEmpty) {
                      var valeur = double.parse(val);
                      trans7.N = valeur;
                      final apport7 = context.read<Apport7Provider>();
                      apport7.setTransA(trans7);

                      setState(() {
                        controllerQ7.text =
                            TransController7.calculResult7(trans7).toString();
                      });
                    }
                  } on FormatException catch (e) {
                    printer(e);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('the value must be a number ')));
                  } catch (e) {
                    printer(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Somthing whent wrong ')));
                  }
                },
              ),
              Wspace(15),
              Input2(
                'Cocc',
                'hint',
                70,
                Colors.blue.shade100,
                controller: controllerCocc,
                onChanged: (val) {
                  try {
                    if (val.trim().isNotEmpty) {
                      var valeur = double.parse(val);
                      trans7.Cocc = valeur;
                      final apport7 = context.read<Apport7Provider>();
                      apport7.setTransA(trans7);

                      setState(() {
                        controllerQ7.text =
                            TransController7.calculResult7(trans7).toString();
                      });
                    }
                  } on FormatException catch (e) {
                    printer(e);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('the value must be a number ')));
                  } catch (e) {
                    printer(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Somthing whent wrong ')));
                  }
                },
              ),
              Wspace(10),
              Input2(
                'Cs',
                'hint',
                70,
                Colors.blue.shade100,
                controller: controllerCs,
                onChanged: (val) {
                  try {
                    if (val.trim().isNotEmpty) {
                      var valeur = double.parse(val);
                      trans7.Cs = valeur;
                      final apport7 = context.read<Apport7Provider>();
                      apport7.setTransA(trans7);
                      setState(() {
                        controllerQ7.text =
                            TransController7.calculResult7(trans7).toString();
                      });
                    }
                  } on FormatException catch (e) {
                    printer(e);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('the value must be a number ')));
                  } catch (e) {
                    printer(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Somthing whent wrong ')));
                  }
                },
              ),
              Wspace(10),
              Input2(
                ' Cl',
                'hint',
                70,
                Colors.blue.shade100,
                controller: controllerCl,
                onChanged: (val) {
                  try {
                    if (val.trim().isNotEmpty) {
                      var valeur = double.parse(val);
                      trans7.Cl = valeur;
                      final apport7 = context.read<Apport7Provider>();
                      apport7.setTransA(trans7);
                      setState(() {
                        controllerQ7.text =
                            TransController7.calculResult7(trans7).toString();
                      });
                    }
                  } on FormatException catch (e) {
                    printer(e);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('the value must be a number ')));
                  } catch (e) {
                    printer(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Somthing whent wrong ')));
                  }
                },
              ),
              Wspace(10),

              //  Text({'$controllerQ1a'}.toString()),
              Input2('Q7a', 'resultat', 100, Color.fromARGB(255, 0, 238, 44),
                  controller: controllerQ7),
            ],
          ),
        ),
        Step(
          title: const Text('8- Apport de chaleur du au machines et appareils'),
          content: Column(
            children: [
              Row(
                children: [
                  Wspace(10),
                  Input2(
                    'N',
                    'hint',
                    70,
                    Colors.blue.shade100,
                    controller: controllerNo,
                    onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          trans8.No = valeur;

                          final apport8 = context.read<Apport8Provider>();
                          apport8.setTransA(trans8);

                          setState(() {
                            controllerQ8.text =
                                TransController8.calculResult8(trans8)
                                    .toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    },
                  ),
                  Wspace(10),
                  Input2(
                    'Cu',
                    'hint',
                    70,
                    Colors.blue.shade100,
                    controller: controllerCu,
                    onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          trans8.Cu = valeur;

                          final apport8 = context.read<Apport8Provider>();
                          apport8.setTransA(trans8);

                          setState(() {
                            controllerQ8.text =
                                TransController8.calculResult8(trans8)
                                    .toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    },
                  ),
                  Wspace(10),
                  Input2(
                    'Cs',
                    'hint',
                    70,
                    Colors.blue.shade100,
                    controller: controllerCCs,
                    onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          trans8.Cs = valeur;

                          setState(() {
                            controllerQ8.text =
                                TransController8.calculResult8(trans8)
                                    .toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    },
                  ),
                  Wspace(10),

                  Input2(
                    'Cl',
                    'hint',
                    70,
                    Colors.blue.shade100,
                    controller: controllerCCl,
                    onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          trans8.Cl = valeur;

                          setState(() {
                            controllerQ8.text =
                                TransController8.calculResult8(trans8)
                                    .toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    },
                  ),

                  Wspace(10),

                  //  Text({'$controllerQ1a'}.toString()),
                  Input2('Q8', 'resultat', 100, Color.fromARGB(255, 3, 239, 74),
                      controller: controllerQ8),
                ],
              ),
              Row(
                children: [
                  Wspace(10),
                  Input2(
                    'N',
                    'hint',
                    70,
                    Colors.blue.shade100,
                    controller: controllerNo2,
                    onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          trans8B.No = valeur;

                          final apport8 = context.read<Apport8Provider>();
                          apport8.setTransB(trans8B);

                          setState(() {
                            controllerQ8b.text =
                                TransController8.calculResult8(trans8B)
                                    .toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    },
                  ),
                  Wspace(10),
                  Input2(
                    'Cu',
                    'hint',
                    70,
                    Colors.blue.shade100,
                    controller: controllerCu2,
                    onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          trans8B.Cu = valeur;

                          final apport8 = context.read<Apport8Provider>();
                          apport8.setTransB(trans8B);

                          setState(() {
                            controllerQ8b.text =
                                TransController8.calculResult8(trans8B)
                                    .toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    },
                  ),
                  Wspace(10),
                  Input2(
                    'Cs',
                    'hint',
                    70,
                    Colors.blue.shade100,
                    controller: controllerCCs2,
                    onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          trans8B.Cs = valeur;

                          final apport8 = context.read<Apport8Provider>();
                          apport8.setTransB(trans8B);

                          setState(() {
                            controllerQ8b.text =
                                TransController8.calculResult8(trans8B)
                                    .toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    },
                  ),
                  Wspace(10),

                  Input2(
                    'Cl',
                    'hint',
                    70,
                    Colors.blue.shade100,
                    controller: controllerCCl2,
                    onChanged: (val) {
                      try {
                        if (val.trim().isNotEmpty) {
                          var valeur = double.parse(val);
                          trans8B.Cl = valeur;

                          final apport8 = context.read<Apport8Provider>();
                          apport8.setTransB(trans8B);

                          setState(() {
                            controllerQ8b.text =
                                TransController8.calculResult8(trans8B)
                                    .toString();
                          });
                        }
                      } on FormatException catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('the value must be a number ')));
                      } catch (e) {
                        printer(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Somthing whent wrong ')));
                      }
                    },
                  ),

                  Wspace(10),

                  //  Text({'$controllerQ1a'}.toString()),
                  Input2(
                      'Q8b', 'resultat', 100, Color.fromARGB(255, 2, 243, 62),
                      controller: controllerQ8b),
                ],
              ),
            ],
          ),
        )
        //
      ];
  int currentstep = 0;
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
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bienvenu sur Climhard",
                      style:
                          styletitle.copyWith(fontSize: 35, letterSpacing: 4)),
                  spacerheight(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Form(
                          key: keyform,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 500,
                                child: Text(
                                  "Nom du client",
                                  style: police.copyWith(
                                      color: Colors.grey.shade500),
                                ),
                              ),
                              spacerheight(5),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  style: police,
                                  controller: controllerClient,
                                  validator: (val) {
                                    if (val == null || val.trim().isEmpty) {
                                      return "Champ obligatoire";
                                    } else if (val.length < 3) {
                                      return "Valeur invalide";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintStyle: police,
                                    hintText: "Entrer le nom du client",
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ),
                              ),
                              spacerheight(20),
                              SizedBox(
                                width: 500,
                                child: Text(
                                  "Titre du projet  ",
                                  style: police.copyWith(
                                      color: Colors.grey.shade500),
                                ),
                              ),
                              spacerheight(5),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  style: police,
                                  validator: (val) {
                                    if (val == null || val.trim().isEmpty) {
                                      return "Champ obligatoire";
                                    } else if (val.length < 3) {
                                      return "Valeur invalide";
                                    }
                                    return null;
                                  },
                                  controller: controllerProjet,
                                  decoration: InputDecoration(
                                    hintStyle: police,
                                    hintText: "Le titre du projet",
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ),
                              ),
                              spacerheight(20),
                              SizedBox(
                                width: 500,
                                child: Text(
                                  "Date du projet",
                                  style: police.copyWith(
                                      color: Colors.grey.shade500),
                                ),
                              ),
                              spacerheight(10),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  style: police,
                                  validator: (val) {
                                    if (val == null ||
                                        val.trim().isEmpty ||
                                        dateprojet == null) {
                                      return "Champ obligatoire";
                                    }
                                    return null;
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[0-9/-]"))
                                  ],
                                  controller: controllerDate,
                                  onTap: () async {
                                    await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2999))
                                        .then((value) {
                                      if (value != null) {
                                        setState(() {
                                          dateprojet = value;
                                          controllerDate.text =
                                              Utils.formatDate(value);
                                        });
                                      }
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintStyle: police,
                                    hintText: "Choisi la date",
                                    suffixIcon: const Icon(
                                      Icons.date_range_outlined,
                                      size: 35,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ),
                              ),

                              /**
                       * Bouton de la fin du projet 
                           */
                            ],
                          )),
                      Container(
                          height: 300,
                          width: 400,
                          child: Image.asset(
                            'assets/home2.jpg',
                          ))
                    ],
                  ),
                  spacerheight(30),
                  Text(
                    "Remplir les champs suivant pour le calcul des apports",
                    style: styletitle.copyWith(fontSize: 20),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  spacerheight(30),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: Stepper(
                      currentStep: currentstep,
                      onStepTapped: (value) => setState(() {
                        currentstep = value;
                      }),
                      onStepContinue: () {
                        if (currentstep < steppList().length - 1) {
                          setState(() {
                            currentstep++;
                          });
                        }
                      },
                      onStepCancel: () {
                        if (currentstep > 0) {
                          setState(() {
                            currentstep--;
                          });
                        }
                      },
                      steps: steppList(),
                    ),
                  ),
                  spacerheight(30),
                  SizedBox(
                    width: 500,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: OutlinedButton(
                        onPressed: () {
                          if (keyform.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BarChartSample7(
                                  name: controllerClient.text,
                                  projet: controllerProjet.text,
                                  date: dateprojet!,
                                ),
                              ),
                            );
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Suivant',
                          style: styletitle,
                        ),
                      ),
                    ),
                  ),
                  spacerheight(40)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
