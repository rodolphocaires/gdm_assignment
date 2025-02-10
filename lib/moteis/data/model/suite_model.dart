import 'package:gdm_assignment/moteis/domain/entity/suite.dart';

class SuiteModel extends Suite {
  const SuiteModel({
    required super.nome,
    required super.qtd,
    required super.exibirQtdDisponiveis,
    required super.fotos,
    required super.itens,
    required super.categoriaItens,
    required super.periodos,
  });

  factory SuiteModel.fromJson(Map<String, dynamic> json) => SuiteModel(
        nome: json["nome"] ?? "Suite",
        qtd: json["qtd"] ?? 0,
        exibirQtdDisponiveis: json["exibirQtdDisponiveis"] ?? true,
        fotos: json["fotos"] != null ? List<String>.from(json["fotos"]) : [],
        itens: json["itens"] != null
            ? List<SuiteItem>.from(json["itens"].map(
                (item) => SuiteItemModel.fromJson(item),
              ))
            : [],
        categoriaItens: json["categoriaItens"] != null
            ? List<CategoriaItem>.from(
                json["categoriaItens"]
                    .map((item) => CategoriaItemModel.fromJson(item)),
              )
            : [],
        periodos: json["periodos"] != null
            ? List<Periodo>.from(
                json["periodos"].map((item) => PeriodoModel.fromJson(item)),
              )
            : [],
      );
}

class SuiteItemModel extends SuiteItem {
  SuiteItemModel({required super.nome});

  factory SuiteItemModel.fromJson(Map<String, dynamic> json) => SuiteItemModel(
        nome: json["nome"] ?? "Item",
      );
}

class CategoriaItemModel extends CategoriaItem {
  CategoriaItemModel({
    required super.nome,
    required super.icone,
  });

  factory CategoriaItemModel.fromJson(Map<String, dynamic> json) =>
      CategoriaItemModel(
        nome: json["nome"] ?? "Categoria",
        icone: json["icone"] ?? "https://picsum.photos/48",
      );
}

class PeriodoModel extends Periodo {
  PeriodoModel({
    required super.tempoFormatado,
    required super.tempo,
    required super.valor,
    required super.valorTotal,
    required super.temCortesia,
    required super.desconto,
  });

  factory PeriodoModel.fromJson(Map<String, dynamic> json) => PeriodoModel(
        tempoFormatado: json["tempoFormatado"] ?? "Período",
        tempo: json["tempo"] ?? "Tempo",
        valor: json["valor"] != null ? json["valor"].toDouble() : 0.0,
        valorTotal:
            json["valorTotal"] != null ? json["valorTotal"].toDouble() : 0.0,
        temCortesia: json["temCortesia"] ?? true,
        desconto: json["desconto"] != null
            ? json["desconto"]["desconto"].toDouble()
            : null,
      );
}
