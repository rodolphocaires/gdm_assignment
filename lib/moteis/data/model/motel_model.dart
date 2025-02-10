import 'package:gdm_assignment/moteis/data/model/suite_model.dart';
import 'package:gdm_assignment/moteis/domain/entity/motel.dart';

class MotelModel extends Motel {
  const MotelModel({
    required super.fantasia,
    required super.logo,
    required super.bairro,
    required super.distancia,
    required super.qtdFavoritos,
    required super.suites,
    required super.qtdAvaliacoes,
    required super.media,
  });

  factory MotelModel.fromJson(Map<String, dynamic> json) => MotelModel(
        fantasia: json["fantasia"] ?? "Motel",
        logo: json["logo"] ?? "https://picsum.photos/200",
        bairro: json["bairro"] ?? "Bairro",
        distancia: json["distancia"] ?? 0.0,
        qtdFavoritos: json["qtdFavoritos"] ?? 0,
        suites: json["suites"] != null
            ? List<SuiteModel>.from(
                json["suites"].map((item) => SuiteModel.fromJson(item)),
              )
            : [],
        qtdAvaliacoes: json["qtdAvaliacoes"] != null
            ? json["qtdAvaliacoes"].toDouble()
            : 0.0,
        media: json["media"] ?? 0.0,
      );
}
