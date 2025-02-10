import 'package:equatable/equatable.dart';
import 'package:gdm_assignment/moteis/domain/entity/suite.dart';

class Motel extends Equatable {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final List<Suite> suites;
  final double qtdAvaliacoes;
  final double media;

  const Motel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.suites,
    required this.qtdAvaliacoes,
    required this.media,
  });

  Motel copyWith({
    String? fantasia,
    String? logo,
    String? bairro,
    double? distancia,
    int? qtdFavoritos,
    List<Suite>? suites,
    double? qtdAvaliacoes,
    double? media,
  }) {
    return Motel(
      fantasia: fantasia ?? this.fantasia,
      logo: logo ?? this.logo,
      bairro: bairro ?? this.bairro,
      distancia: distancia ?? this.distancia,
      qtdFavoritos: qtdFavoritos ?? this.qtdFavoritos,
      suites: suites ?? this.suites,
      qtdAvaliacoes: qtdAvaliacoes ?? this.qtdAvaliacoes,
      media: media ?? this.media,
    );
  }

  @override
  List<Object?> get props => [fantasia, bairro];
}
