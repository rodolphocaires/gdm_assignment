import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:gdm_assignment/moteis/domain/entity/motel.dart';
import 'package:gdm_assignment/moteis/presentation/state/home_provider.dart';
import 'package:gdm_assignment/moteis/presentation/widget/category_card.dart';
import 'package:gdm_assignment/moteis/presentation/widget/period_card.dart';
import 'package:gdm_assignment/moteis/presentation/widget/suite_card.dart';
import 'package:gdm_assignment/moteis/presentation/widget/unavailable_card.dart';
import 'package:provider/provider.dart';

class MotelCard extends StatelessWidget {
  final Motel motel;

  const MotelCard({super.key, required this.motel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(motel.logo),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      motel.fantasia,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "${motel.distancia}km - ${motel.bairro}",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 4,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.amber,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 12,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "${motel.media}",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12),
                        Row(
                          children: [
                            Text(
                              "${motel.qtdAvaliacoes.toInt()} avaliações",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              IconButton(
                key: Key('toggle-favorite'),
                onPressed: () => context.read<HomeProvider>().toggleFavorite(),
                icon: Icon(
                  Icons.favorite,
                  color: context.watch<HomeProvider>().isFavorite
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
        _buildSuitesCarousel(context),
      ],
    );
  }

  Widget _buildSuitesCarousel(BuildContext context) {
    if (motel.suites.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(10),
        child: Text("Nenhuma suíte disponível"),
      );
    }

    return ExpandablePageView.builder(
      itemCount: context.watch<HomeProvider>().filteredSuites.length,
      itemBuilder: (context, index) {
        final suite = context.watch<HomeProvider>().filteredSuites[index];
        return Column(
          children: [
            SuiteCard(suite: suite),
            CategoryCard(suite: suite),
            if (!suite.exibirQtdDisponiveis) UnavailableCard(),
            PeriodCard(suite: suite),
          ],
        );
      },
      controller: PageController(viewportFraction: .95),
    );
  }
}
