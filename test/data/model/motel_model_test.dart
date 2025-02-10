import 'package:flutter_test/flutter_test.dart';
import 'package:gdm_assignment/moteis/data/model/motel_model.dart';

void main() {
  group('MotelModel', () {
    test('parses JSON correctly when all fields are provided', () {
      // Arrange
      final jsonData = {
        "fantasia": "Motel Paradise",
        "logo": "https://example.com/logo.png",
        "bairro": "Centro",
        "distancia": 5.5,
        "qtdFavoritos": 10,
        "suites": [
          {"nome": "Suite A"},
          {"nome": "Suite B"},
        ],
        "qtdAvaliacoes": 25,
        "media": 4.2
      };

      // Act
      final motelModel = MotelModel.fromJson(jsonData);

      // Assert
      expect(motelModel.fantasia, "Motel Paradise");
      expect(motelModel.logo, "https://example.com/logo.png");
      expect(motelModel.bairro, "Centro");
      expect(motelModel.distancia, 5.5);
      expect(motelModel.qtdFavoritos, 10);
      expect(motelModel.suites.length, 2);
      expect(motelModel.qtdAvaliacoes, 25);
      expect(motelModel.media, 4.2);
    });

    test('uses default values when JSON fields are missing', () {
      // Arrange
      final jsonData = {
        "fantasia": "Motel Paradise",
      };

      // Act
      final motelModel = MotelModel.fromJson(jsonData);

      // Assert
      expect(motelModel.fantasia, "Motel Paradise");
      expect(motelModel.logo, "https://picsum.photos/200");
      expect(motelModel.bairro, "Bairro");
      expect(motelModel.distancia, 0.0);
      expect(motelModel.qtdFavoritos, 0);
      expect(motelModel.suites, isEmpty);
      expect(motelModel.qtdAvaliacoes, 0.0);
      expect(motelModel.media, 0.0);
    });

    test('handles empty suites list when JSON does not provide it', () {
      // Arrange
      final jsonData = {"fantasia": "Motel Paradise", "suites": []};

      // Act
      final motelModel = MotelModel.fromJson(jsonData);

      // Assert
      expect(motelModel.suites, isEmpty);
    });

    test('parses suites list correctly from JSON', () {
      // Arrange
      final jsonData = {
        "suites": [
          {"nome": "Suite Deluxe"},
          {"nome": "Suite Economy"}
        ]
      };

      // Act
      final motelModel = MotelModel.fromJson(jsonData);

      // Assert
      expect(motelModel.suites.length, 2);
      expect(motelModel.suites[0].nome, "Suite Deluxe");
      expect(motelModel.suites[1].nome, "Suite Economy");
    });
  });
}
