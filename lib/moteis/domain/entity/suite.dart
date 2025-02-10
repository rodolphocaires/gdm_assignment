import 'package:equatable/equatable.dart';

class Suite extends Equatable {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<SuiteItem> itens;
  final List<CategoriaItem> categoriaItens;
  final List<Periodo> periodos;

  const Suite({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  Suite copyWith({
    String? nome,
    int? qtd,
    bool? exibirQtdDisponiveis,
    List<String>? fotos,
    List<SuiteItem>? itens,
    List<CategoriaItem>? categoriaItens,
    List<Periodo>? periodos,
  }) {
    return Suite(
      nome: nome ?? this.nome,
      qtd: qtd ?? this.qtd,
      exibirQtdDisponiveis: exibirQtdDisponiveis ?? this.exibirQtdDisponiveis,
      fotos: fotos ?? this.fotos,
      itens: itens ?? this.itens,
      categoriaItens: categoriaItens ?? this.categoriaItens,
      periodos: periodos ?? this.periodos,
    );
  }

  @override
  List<Object?> get props => [nome];
}

class SuiteItem extends Equatable {
  final String nome;

  const SuiteItem({required this.nome});

  SuiteItem copyWith({String? nome}) {
    return SuiteItem(
      nome: nome ?? this.nome,
    );
  }

  @override
  List<Object?> get props => [nome];
}

class CategoriaItem extends Equatable {
  final String nome;
  final String icone;

  const CategoriaItem({required this.nome, required this.icone});

  CategoriaItem copyWith({
    String? nome,
    String? icone,
  }) {
    return CategoriaItem(
      nome: nome ?? this.nome,
      icone: icone ?? this.icone,
    );
  }

  @override
  List<Object?> get props => [nome, icone];
}

class Periodo {
  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final double? desconto;

  const Periodo({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    required this.desconto,
  });

  Periodo copyWith({
    String? tempoFormatado,
    String? tempo,
    double? valor,
    double? valorTotal,
    bool? temCortesia,
    double? desconto,
  }) {
    return Periodo(
      tempoFormatado: tempoFormatado ?? this.tempoFormatado,
      tempo: tempo ?? this.tempo,
      valor: valor ?? this.valor,
      valorTotal: valorTotal ?? this.valorTotal,
      temCortesia: temCortesia ?? this.temCortesia,
      desconto: desconto ?? this.desconto,
    );
  }
}
