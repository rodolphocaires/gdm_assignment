import 'package:flutter/material.dart';
import 'package:gdm_assignment/moteis/domain/entity/suite.dart';

class SuiteCard extends StatelessWidget {
  final Suite suite;
  const SuiteCard({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                suite.fotos.first,
                fit: BoxFit.cover,
                height: 180,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  Text(
                    suite.nome,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  if (suite.exibirQtdDisponiveis)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.alarm,
                          color: Colors.red,
                          size: 13,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'só mais ${suite.qtd} pelo app',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
