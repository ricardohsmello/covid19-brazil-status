class Constants {
  static const String confirmed = 'Confirmados';
  static const String recovered = 'Recuperados';
  static const String deaths = 'Mortes';
  static const String suspects = 'Suspeitos';
  static const String discard = 'Descartados';
  static const String appName = 'COVID-19 Status Brasil';
  static const String last_update = 'Última atualização: ';
  static const String filter_by_state = 'Filtrar por estado: ';
  static const String msg_loading_states = 'Carregando estados..';
  static const String msg_loading_countries = 'Carregando dados do país..';

  static const String baseURL =
      "https://covid19-brazil-api.now.sh/api/report/v1/brazil";

  static const String help = 'Ajuda';
  static const String msg_help =
      'Dados coletados do Centro de Ciência e Engenharia de Sistemas (CSSE)';

  static const String err_occurred_country = 'Ocorreu um erro ao obter os dados dos países';
  static const String err_occurred_states = 'Ocorreu um erro ao obter os dados dos estados';

  static const Map<String, String> states = {
    'Acre': 'AC',
    'Alagoas': 'AL',
    'Amapá': 'AP',
    'Amazonas': 'AM',
    'Bahia': 'BA',
    'Ceará': 'CE',
    'Distrito Federal': 'DF',
    'Espírito Santo': 'ES',
    'Goiás': 'GO',
    'Maranhão': 'MA',
    'Mato Grosso': 'MT',
    'Mato Grosso do Sul': 'MS',
    'Minas Gerais': 'MG',
    'Pará': 'PA',
    'Paraíba': 'PB',
    'Paraná': 'PR',
    'Pernambuco': 'PE',
    'Piauí': 'PI',
    'Rio de Janeiro': 'RJ',
    'Rio Grande do Norte': 'RN',
    'Rio Grande do Sul': 'RS',
    'Rondônia': 'RO',
    'Roraima': 'RR',
    'Santa Catarina': 'SC',
    'São Paulo': 'SP',
    'Sergipe': 'SE',
    'Tocantins': 'TO',
  };
}
