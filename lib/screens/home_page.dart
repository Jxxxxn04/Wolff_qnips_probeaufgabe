import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:qnips_probeaufgabe/models/response.dart';
import 'package:qnips_probeaufgabe/services/api_service.dart';
import 'package:qnips_probeaufgabe/widgets/product_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<String> days = [
    "Montag",
    "Dienstag",
    "Mittwoch",
    "Donnerstag",
    "Freitag",
    "Samstag",
    "Sonntag"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          FutureBuilder(
            future: ApiService.getResponse(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final map = jsonDecode(snapshot.data?.body ?? "");
                final response = Response.fromJson(map);

                return SafeArea(
                    child: Table(
                        border: TableBorder.all(),
                        defaultVerticalAlignment:
                        TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                            children: [
                              const Text(""),
                              ...days
                                  .map((day) => Text(day))
                                  .toList(),
                            ],
                          ),
                          for (final row in response.rows)
                            TableRow(children: [
                              Text(row.name),
                              ...days.mapIndexed(
                                    (index, _) =>
                                    ProductWidget(
                                      productIds: row.days
                                          .firstWhereOrNull(
                                              (day) => day.weekday == index)
                                          ?.getIds() ??
                                          [],
                                      responseBody: response,
                                    ),
                              ),
                            ])
                        ]));
              }
              if (snapshot.hasError) {
                return const SafeArea(
                  child: Text("Fehler"),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child:
                  Text("Tap on a specific product to get a better view!")))
        ],
      ),
    );
  }

}