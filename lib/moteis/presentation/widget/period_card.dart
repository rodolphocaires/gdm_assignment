import 'package:flutter/material.dart';
import 'package:gdm_assignment/moteis/domain/entity/suite.dart';
import 'package:intl/intl.dart';

class PeriodCard extends StatelessWidget {
  final Suite suite;
  const PeriodCard({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: suite.periodos.map((periodo) {
        return Card(
          color: Colors.white,
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            title: Text(
              periodo.tempoFormatado,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            subtitle: Text(
              NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                  .format(periodo.valor),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      }).toList(),
    );
  }
}
