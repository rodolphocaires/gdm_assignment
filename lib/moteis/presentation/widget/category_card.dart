import 'package:flutter/material.dart';
import 'package:gdm_assignment/moteis/domain/entity/suite.dart';

class CategoryCard extends StatelessWidget {
  final Suite suite;
  const CategoryCard({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    final categories = suite.categoriaItens;

    return Card(
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...categories.take(4).map((categoria) => _buildIcon(categoria)),
            GestureDetector(
              onTap: () => _showCategoryModal(
                  context, categories, suite.itens, suite.nome),
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      "ver\ntodos",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.keyboard_arrow_down, size: 12)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(CategoriaItem categoria) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Image.network(categoria.icone, width: 36, height: 36),
    );
  }

  void _showCategoryModal(BuildContext context, List<CategoriaItem> categorias,
      List<SuiteItem> itens, String name) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Text(
                          "principais itens",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: categorias
                        .map(
                          (categoria) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 4,
                              children: [
                                Image.network(
                                  categoria.icone,
                                  height: 36,
                                  width: 36,
                                ),
                                Text(categoria.nome),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Text(
                          "tem também",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      itens.map((item) => item.nome).join(", "),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
