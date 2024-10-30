class Config {
  // Fator de emissão de CO² por litro de etanol queimado.
  final double ethanolCarEF = 1.6;

  // Fator de emissão de CO² por litro de gasolina queimada.
  final double gasolineCarEF = 2.3;

  // Fator de emissão de CO² por KWh
  final double electricityEF = 0.1;

  // Brazil Average Price per KWh - Source: https://www.ngsolar.com.br/single-post/preco-kwh-cpfl#:~:text=A%20tarifa%20teve%20um%20aumento,%24%200%2C74%20por%20KWh.
  final double electricityKwhPrice = 0.74;

  ///
  ///
  ///
  static final Config _instance = Config._internal();

  ///
  ///
  ///
  factory Config() {
    return _instance;
  }

  ///
  ///
  ///
  Config._internal();
}
