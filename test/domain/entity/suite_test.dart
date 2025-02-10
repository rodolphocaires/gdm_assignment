import 'package:flutter_test/flutter_test.dart';
import 'package:gdm_assignment/moteis/domain/entity/suite.dart';

void main() {
  group('Suite Entity', () {
    late Suite suite;

    setUp(() {
      suite = Suite(
        nome: 'Suite 1',
        qtd: 2,
        exibirQtdDisponiveis: true,
        fotos: ['photo1.png'],
        itens: [SuiteItem(nome: 'Item 1')],
        categoriaItens: [CategoriaItem(nome: 'Category 1', icone: 'icon1')],
        periodos: [
          Periodo(
            tempoFormatado: '2h',
            tempo: '120min',
            valor: 100.0,
            valorTotal: 120.0,
            temCortesia: true,
            desconto: 10.0,
          )
        ],
      );
    });

    test('copyWith without parameters returns identical object', () {
      final copiedSuite = suite.copyWith();
      expect(copiedSuite, suite);
    });

    test('copyWith should update nome and qtd fields', () {
      final updatedSuite = suite.copyWith(nome: 'Updated Suite', qtd: 5);
      expect(updatedSuite.nome, 'Updated Suite');
      expect(updatedSuite.qtd, 5);
      expect(updatedSuite.exibirQtdDisponiveis, suite.exibirQtdDisponiveis);
    });

    test('copyWith should update list fields correctly', () {
      final updatedSuite = suite.copyWith(
        fotos: ['new_photo1.png', 'new_photo2.png'],
      );
      expect(updatedSuite.fotos, ['new_photo1.png', 'new_photo2.png']);
    });

    test('copyWith should handle list and boolean updates', () {
      final updatedSuite = suite.copyWith(
        itens: [SuiteItem(nome: 'New Item')],
        exibirQtdDisponiveis: false,
      );
      expect(updatedSuite.itens.first.nome, 'New Item');
      expect(updatedSuite.exibirQtdDisponiveis, isFalse);
    });
  });
  group('SuiteItem Entity', () {
    test('copyWith without parameters returns identical object', () {
      final item = SuiteItem(nome: 'Item 1');
      final copiedItem = item.copyWith();
      expect(copiedItem, item);
    });

    test('copyWith should update nome correctly', () {
      final item = SuiteItem(nome: 'Item 1');
      final updatedItem = item.copyWith(nome: 'Updated Item');
      expect(updatedItem.nome, 'Updated Item');
      expect(updatedItem, isNot(equals(item)));
    });
  });

  group('CategoriaItem Entity', () {
    test('copyWith without parameters returns identical object', () {
      final categoryItem = CategoriaItem(nome: 'Category 1', icone: 'icon1');
      final copiedCategoryItem = categoryItem.copyWith();
      expect(copiedCategoryItem, categoryItem);
    });

    test('copyWith should update nome and icone correctly', () {
      final categoryItem = CategoriaItem(nome: 'Category 1', icone: 'icon1');
      final updatedCategoryItem = categoryItem.copyWith(
        nome: 'Updated Category',
        icone: 'new_icon',
      );
      expect(updatedCategoryItem.nome, 'Updated Category');
      expect(updatedCategoryItem.icone, 'new_icon');
      expect(updatedCategoryItem, isNot(equals(categoryItem)));
    });

    test('copyWith should update only icone when provided', () {
      final categoryItem = CategoriaItem(nome: 'Category 1', icone: 'icon1');
      final updatedCategoryItem = categoryItem.copyWith(icone: 'updated_icon');
      expect(updatedCategoryItem.nome, categoryItem.nome);
      expect(updatedCategoryItem.icone, 'updated_icon');
    });
  });

  group('Periodo Entity', () {
    test('copyWith should update period and discount fields', () {
      final periodo = Periodo(
        tempoFormatado: '2h',
        tempo: '120min',
        valor: 100.0,
        valorTotal: 120.0,
        temCortesia: true,
        desconto: 10.0,
      );
      final updatedPeriodo = periodo.copyWith(
        tempo: '150min',
        desconto: 15.0,
      );
      expect(updatedPeriodo.tempo, '150min');
      expect(updatedPeriodo.desconto, 15.0);
    });

    test('copyWith should maintain original fields when not updated', () {
      final periodo = Periodo(
        tempoFormatado: '2h',
        tempo: '120min',
        valor: 100.0,
        valorTotal: 120.0,
        temCortesia: true,
        desconto: 10.0,
      );
      final updatedPeriodo = periodo.copyWith(valor: 200.0);
      expect(updatedPeriodo.valor, 200.0);
      expect(updatedPeriodo.tempo, periodo.tempo);
    });
  });
}
