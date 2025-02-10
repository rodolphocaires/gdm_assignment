import 'package:flutter_test/flutter_test.dart';
import 'package:gdm_assignment/moteis/data/model/suite_model.dart';

void main() {
  group('SuiteModel Tests', () {
    test('parses JSON correctly when all fields are provided', () {
      final jsonData = {
        "nome": "Luxury Suite",
        "qtd": 3,
        "exibirQtdDisponiveis": false,
        "fotos": [
          "https://example.com/photo1.jpg",
          "https://example.com/photo2.jpg"
        ],
        "itens": [
          {"nome": "Jacuzzi"},
          {"nome": "King Size Bed"}
        ],
        "categoriaItens": [
          {"nome": "Amenities", "icone": "https://example.com/icon.png"}
        ],
        "periodos": [
          {
            "tempoFormatado": "2 hours",
            "tempo": "120 minutes",
            "valor": 150.0,
            "valorTotal": 200.0,
            "temCortesia": true,
            "desconto": {"desconto": 10.0}
          }
        ]
      };

      final suiteModel = SuiteModel.fromJson(jsonData);

      expect(suiteModel.nome, "Luxury Suite");
      expect(suiteModel.qtd, 3);
      expect(suiteModel.exibirQtdDisponiveis, false);
      expect(suiteModel.fotos.length, 2);
      expect(suiteModel.itens.length, 2);
      expect(suiteModel.itens[0].nome, "Jacuzzi");
      expect(suiteModel.categoriaItens.length, 1);
      expect(suiteModel.categoriaItens[0].nome, "Amenities");
      expect(suiteModel.periodos.length, 1);
      expect(suiteModel.periodos[0].tempoFormatado, "2 hours");
      expect(suiteModel.periodos[0].valor, 150.0);
      expect(suiteModel.periodos[0].desconto, 10.0);
    });

    test('handles default values when JSON fields are missing', () {
      final jsonData = {
        "nome": "Standard Suite",
      };

      final suiteModel = SuiteModel.fromJson(jsonData);

      expect(suiteModel.nome, "Standard Suite");
      expect(suiteModel.qtd, 0);
      expect(suiteModel.exibirQtdDisponiveis, true);
      expect(suiteModel.fotos, isEmpty);
      expect(suiteModel.itens, isEmpty);
      expect(suiteModel.categoriaItens, isEmpty);
      expect(suiteModel.periodos, isEmpty);
    });

    test('handles nested item parsing in SuiteItemModel', () {
      final jsonData = {
        "itens": [
          {"nome": "Jacuzzi"},
          {"nome": "King Size Bed"}
        ]
      };

      final suiteModel = SuiteModel.fromJson(jsonData);

      expect(suiteModel.itens.length, 2);
      expect(suiteModel.itens[0].nome, "Jacuzzi");
      expect(suiteModel.itens[1].nome, "King Size Bed");
    });

    test('handles nested period parsing in PeriodoModel', () {
      final jsonData = {
        "periodos": [
          {
            "tempoFormatado": "2 hours",
            "valor": 150.0,
            "temCortesia": true,
            "desconto": {"desconto": 5.0}
          }
        ]
      };

      final suiteModel = SuiteModel.fromJson(jsonData);

      expect(suiteModel.periodos.length, 1);
      expect(suiteModel.periodos[0].tempoFormatado, "2 hours");
      expect(suiteModel.periodos[0].valor, 150.0);
      expect(suiteModel.periodos[0].temCortesia, true);
      expect(suiteModel.periodos[0].desconto, 5.0);
    });
  });
}
