class Config {
  // Fator de emissão de CO² por litro de etanol queimado.
  double ethanolCarEF = 1.6;

  // Fator de emissão de CO² por litro de gasolina queimada.
  double gasolineCarEF = 2.3;

  // Fator de emissão de CO² por KWh
  double electricityEF = 0.1;

  // Brazil Average Price per KWh - Source: https://www.ngsolar.com.br/single-post/preco-kwh-cpfl#:~:text=A%20tarifa%20teve%20um%20aumento,%24%200%2C74%20por%20KWh.
  double electricityKwhPrice = 0.74;

  // Piped Gas Emission per M³ - Source: 2006 IPCC Guidelines for National Greenhouse Gas Inventories, Volume 2: Energy, Capítulo 2 (Stationary Combustion), Tabela 2.2, onde são listados os valores de emissão de dióxido de carbono (CO₂) para diferentes tipos de combustíveis fósseis.
  double pipedGasEF = 2.16;

  // PipedGas price per M³ - Source: https://www.naturgy.com.br/wp-content/uploads/2023/11/01_NAT_CEGRIO_Atualizacao-tarifa-gas-NOV-2023_GN_laminaA5_fz.pdf
  double pipedGasPrice = 9.23;

  // GLP Gas Cylinder EF - Source:  2006 IPCC Guidelines for National Greenhouse Gas Inventories, Volume 2: Energy, Capítulo 2 (Stationary Combustion), Tabela 2.2.
  double glpPerCylinderEF = 37.8;

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
