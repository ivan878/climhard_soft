import 'package:climhard_soft/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimulationPage extends StatefulWidget {
  const SimulationPage({super.key});

  @override
  State<SimulationPage> createState() => _HistoriqueSimulationState();
}

class _HistoriqueSimulationState extends State<SimulationPage> {
  TextEditingController controllerPuissance = TextEditingController();
  TextEditingController controllerHeure = TextEditingController();
  double puissance = 0.0;
  double heure = 0.0;

  static double calcul(double puissance, double heure) {
    return puissance * heure * 75.0;
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
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 199, 197, 197)
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                            "Elle permet d'étudier les réactions d'un système à différentes contraintes pour en déduire les résultats recherchés en se basant sur vos données entré \n A noté: \n Ce ci nous donne un résultats approximatif "),
                      ),
                      Image.asset('assets/simulation.jpg'),
                    ],
                  )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Simulation",
                        style: styletitle.copyWith(
                            fontSize: 35, letterSpacing: 4)),

                    /*
                  / Nom diu clien 
                  Premier champ du formulaire 
                   */
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 32, 177, 37),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        '${calcul(puissance, heure)} Fcfa',
                        style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Soit pour le meme temps\n de fonctionnement par mois  ${calcul(puissance, heure) * 30} Fcfa',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      child: Text(
                        "Nombre d'heures",
                        style: police.copyWith(color: Colors.grey.shade500),
                      ),
                    ),
                    spacerheight(10),
                    SizedBox(
                      width: 500,
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                        ],
                        style: police,
                        controller: controllerHeure,
                        onChanged: (val) {
                          try {
                            if (val.trim().isNotEmpty) {
                              var valeur = double.parse(val);
                              heure = valeur;
                              setState(() {
                                calcul(puissance, heure);
                              });
                            }
                          } on FormatException catch (e) {
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('the value must be a number ')));
                          }
                        },
                        decoration: InputDecoration(
                          hintStyle: police,
                          hintText: "Entrer le nombre d'heure",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    spacerheight(30),

                    /*
                  / Titre du projet
                  Deuxième Champs du formulaire
                   */
                    Expanded(
                      child: Column(children: [
                        SizedBox(
                          width: 500,
                          child: Text(
                            "Puissance de l'appareil",
                            style: police.copyWith(color: Colors.grey.shade500),
                          ),
                        ),
                        spacerheight(10),
                        SizedBox(
                          width: 500,
                          child: TextFormField(
                            style: police,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9.]"))
                            ],
                            controller: controllerPuissance,
                            onChanged: (val) {
                              try {
                                if (val.isNotEmpty) {
                                  var valeur = double.parse(val);
                                  puissance = valeur;
                                  setState(() {
                                    calcul(puissance, heure);
                                  });
                                }
                              } on FormatException catch (e) {
                                printer(e);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'the value must be a number ')));
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Something whenT wrong ')));
                              }
                            },
                            decoration: InputDecoration(
                              hintStyle: police,
                              hintText: "Entrer la puissance de l'appareil",
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                        spacerheight(30),
                        /*
                  / Date du Jour
                  Date DU jour
                   */
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
