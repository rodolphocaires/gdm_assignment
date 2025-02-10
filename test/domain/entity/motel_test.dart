import 'package:flutter_test/flutter_test.dart';
import 'package:gdm_assignment/moteis/domain/entity/motel.dart';
import 'package:gdm_assignment/moteis/domain/entity/suite.dart';

void main() {
  group('Motel Entity', () {
    late Motel originalMotel;

    setUp(() {
      originalMotel = Motel(
        fantasia: 'Motel Fantasia',
        logo: 'https://example.com/logo.png',
        bairro: 'Bairro Teste',
        distancia: 15.5,
        qtdFavoritos: 10,
        suites: const [],
        qtdAvaliacoes: 20,
        media: 4.3,
      );
    });

    test('copyWith without parameters returns identical object', () {
      final copiedMotel = originalMotel.copyWith();
      expect(copiedMotel, originalMotel);
    });

    test('copyWith with fantasia parameter should update fantasia', () {
      final updatedMotel = originalMotel.copyWith(fantasia: 'Updated Fantasia');
      expect(updatedMotel.fantasia, 'Updated Fantasia');
      expect(updatedMotel.logo, originalMotel.logo);
    });

    test('copyWith with multiple parameters should update all specified fields',
        () {
      final updatedMotel = originalMotel.copyWith(
        fantasia: 'Updated Fantasia',
        bairro: 'New Bairro',
        distancia: 10.0,
      );

      expect(updatedMotel.fantasia, 'Updated Fantasia');
      expect(updatedMotel.bairro, 'New Bairro');
      expect(updatedMotel.distancia, 10.0);

      expect(updatedMotel.logo, originalMotel.logo);
      expect(updatedMotel.qtdFavoritos, originalMotel.qtdFavoritos);
    });

    test('copyWith should handle updating suites list', () {
      final newSuites = [
        Suite(
            nome: 'Suite 1',
            qtd: 1,
            exibirQtdDisponiveis: true,
            fotos: [],
            itens: [],
            categoriaItens: [],
            periodos: [])
      ];

      final updatedMotel = originalMotel.copyWith(suites: newSuites);
      expect(updatedMotel.suites, newSuites);
    });
  });
}
