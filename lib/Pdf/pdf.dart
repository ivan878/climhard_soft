import 'dart:io';

import 'package:climhard_soft/Pdf/pdf_api.dart';
import 'package:climhard_soft/utils.dart';
import 'package:flutter/material.dart' as material;
// import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfParagraphApi {
  static Future<File> generate({required data}) async {
    final pdf = Document();

    //  final imageA = PdfImage.file(
    //   pdf.document,
    //   bytes: File('assets/climhard.png').readAsBytesSync(),
    // );
    var assetImage = MemoryImage(
      (await rootBundle.load('assets/climhard1.png')).buffer.asUint8List(),
    );
    //   var assetImage = MemoryImage(
    //   (await rootBundle.load('assets/climhard1.png')).buffer.asUint8List(),
    // );

    pdf.addPage(
      MultiPage(
        build: (context) {
          var textStyle = TextStyle(
              fontWeight: FontWeight.bold, fontBold: Font.timesBold());
          return <Widget>[
            buildCustomHeader("Fiche Technique CLIMHARD"),
            SizedBox(height: 0.7 * PdfPageFormat.cm),
            Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          listTile('Name :', data['name']),
                          SizedBox(height: 0.4 * PdfPageFormat.cm),
                          listTile('Date :', data['date']),
                          SizedBox(height: 0.4 * PdfPageFormat.cm),
                          listTile('Projet :', data['projet']),
                          SizedBox(height: 0.4 * PdfPageFormat.cm),
                          listTile('Type de climatiseur :', data['clim']),
                        ],
                      ),
                      Container(
                        height: PdfPageFormat.cm * 7,
                        child: Image(assetImage),
                      ),
                    ])),

            Container(
                height: 0.1 * PdfPageFormat.cm,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: PdfColors.grey500,
                    borderRadius: BorderRadius.circular(0.5))),
            SizedBox(height: 1 * PdfPageFormat.cm),

            //   Column(children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: PdfColors.grey400),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Center(child: Text('APPORTS'))),
                    Expanded(child: Center(child: Text('VALEURS')))
                  ]),
            ),
            SizedBox(height: 0.3 * PdfPageFormat.cm),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Text('Apport thermique par transmission par les parois',
                    style: textStyle),
              ),
              Expanded(
                  child: Center(
                child: Text(data['val1'].toString(), style: policePdf),
              ))
            ]),
            line(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                      'Apport de chaleur par Rayonnement solaire a travers les parois:',
                      style: textStyle),
                ),
                Expanded(
                  child: Center(
                      child: Text(data['val2'].toString(), style: policePdf)),
                )
              ],
            ),
            line(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Text(
                    'Apport de chaleur par Rayonnement solaire a travers les vitrages',
                    style: textStyle),
              ),
              Expanded(
                child: Center(
                    child: Text(data['val3'].toString(), style: policePdf)),
              )
            ]),
            line(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Text(
                    'Apport de chaleur  sensible par renouvellement  d\'air',
                    style: textStyle),
              ),
              Expanded(
                child: Center(
                    child: Text(data['val4'].toString(), style: policePdf)),
              )
            ]),
            line(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Text(
                    'Apport de chaleur  latente par renouvellement d air',
                    style: textStyle),
              ),
              Expanded(
                child: Center(child: Text('${data['val5']}', style: policePdf)),
              )
            ]),
            line(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Text('Apport de chaleur sensible par éclairage',
                    style: textStyle),
              ),
              Expanded(
                child: Center(child: Text('${data['val6']}', style: policePdf)),
              )
            ]),
            line(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child:
                    Text('Apport de chaleur du au occupant', style: textStyle),
              ),
              Expanded(
                child: Center(child: Text('${data['val7']}', style: policePdf)),
              )
            ]),
            line(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Text('Apport de chaleur du au machines et appareils',
                    style: textStyle),
              ),
              Expanded(
                child: Center(child: Text('${data['val8']}', style: policePdf)),
              )
            ]),

            //     SizedBox(height: 15),
            //     Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: []),
            //     SizedBox(height: 5),
            //     Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [Text('2'), Text('75 003.25')]),
            //     Row(children: [
            //
            //       Container(
            //         height: PdfPageFormat.cm * 3,
            //         child: Text('description'),
            //       ),
            //     ]),
            //   ]),
          ];
        },
        footer: (context) {
          final text = 'Page ${context.pageNumber} of ${context.pagesCount}';

          return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1 * PdfPageFormat.cm),
            child: Text(
              text,
              style: const TextStyle(color: PdfColors.black),
            ),
          );
        },
      ),
    );
    return PdfApi.saveDocument(name: 'Climhard.pdf', pdf: pdf);
  }

  static Widget buildCustomHeader(String name) => Container(
        padding: const EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
        ),
        child: Row(
          children: [
            PdfLogo(),
            SizedBox(width: 0.5 * PdfPageFormat.cm),
            Text(
              name,
              style: TextStyle(fontSize: 20, color: PdfColors.blue),
            ),
          ],
        ),
      );

  static Widget buildCustomHeadline() => Header(
        child: Text(
          'FICHE DE PROJET',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: PdfColors.white,
          ),
        ),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(color: PdfColors.red),
      );

  static Widget buildLink() => UrlLink(
        destination: 'https://flutter.dev',
        child: Text(
          'Go to flutter.dev',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: PdfColors.blue,
          ),
        ),
      );

  static List<Widget> buildBulletPoints() => [
        Bullet(text: 'First Bullet'),
        Bullet(text: 'Second Bullet'),
        Bullet(text: 'Third Bullet'),
      ];
}

Widget listTile(String title, String subtitle) =>
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: styletitlePdf),
      SizedBox(height: 3),
      Text(subtitle, style: policePdf)
    ]);
TextStyle policePdf = const TextStyle(color: PdfColors.grey700);
TextStyle styletitlePdf =
    TextStyle(fontWeight: FontWeight.bold, color: PdfColors.blueGrey500);

Widget line() => Column(children: [
      Container(
          margin: const EdgeInsets.all(1),
          height: 0.01 * PdfPageFormat.cm,
          width: double.infinity,
          decoration: BoxDecoration(
              color: PdfColors.grey500,
              borderRadius: BorderRadius.circular(0.5))),
    ]);
