import 'package:flutter/material.dart';

class MotelFilters extends StatelessWidget {
  const MotelFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.all(16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Row(
              spacing: 6,
              children: [
                Icon(Icons.filter, size: 16),
                Text(
                  'filtros',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Text(
              'com desconto',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Text(
              'disponíveis',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Text(
              'hidro',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Text(
              'piscina',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Text(
              'sauna',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Text(
              'ofurô',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Text(
              'decoração erótica',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Text(
              'decoração temática',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Text(
              'cadeira erótica',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Text(
              'pista de dança',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Text(
              'garagem privativa',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Text(
              'internet wi-fi',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Text(
              'suite para festas',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
          FilterChip(
            onSelected: (value) {},
            visualDensity: VisualDensity.compact,
            label: Text(
              'suite com acessibilidade',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
