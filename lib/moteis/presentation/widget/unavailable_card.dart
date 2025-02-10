import 'package:flutter/material.dart';

class UnavailableCard extends StatelessWidget {
  const UnavailableCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'indisponível no app',
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.w500,
              ),
            ),
            FilledButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.purple),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "avise-me",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
