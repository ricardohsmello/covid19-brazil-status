class Constants {
  static const String confirmed = 'Confirmados';
  static const String recovered = 'Recuperados';
  static const String deaths = 'Mortes';
  static const String suspects = 'Suspeitos';
  static const String discard = 'Descartados';
  static const String appName = 'COVID19 - Brasil Status';
  static const String last_update = 'Última atualização: ';
  static const String filter_by_state = 'Filtrar por estado: ';
  static const String twitter_page = 'https://www.twitter.com/ricardohsmello';
  static const String facebook_page = 'https://www.facebook.com/ricardohsmello';
  static const String insta_page = 'https://www.instagram.com/ricardohsmello';
  static const String gmail_page = 'E-mail: ricardohsmello@gmail.com';
  static const String linkedin_page ='https://www.linkedin.com/in/ricardo-mello-ba76baa2/';
  static const String github_page = 'https://github.com/ricardohsmello';
  static const String my_github_page = 'https://ricardohsmello.github.io/';
  static const String arcgis_page = 'https://www.arcgis.com/apps/opsdashboard/index.html#/85320e2ea5424dfaaa75ae62e5c06e61';

  static const String msg_numbers = 'Total de casos no País';
  static const String msg_loading_states = 'Carregando estados..';
  static const String msg_loading_countries = 'Carregando dados do país..';
  static const String msg_about_data = 'Os dados são coletados do Centro de Ciência e engenharia (CSSE) da universidade de Johns Hopkins. Após isso, é convertido pela Api covid19-brazil-api-docs.now.sh '
      'e por fim interpretado e exibido por este aplicativo. ';
  static const String msg_more = 'O aplicativo atualiza os dados automaticamente de acordo com a fonte de dados. Você pode também conferir as mesmas informações através de nossa página online.';
  static const String msg_more_to_know= 'Saiba mais';
  static const String msg_page_on = 'Acessar página';

  static const String init = 'Início';
  static const String about_app = 'Sobre a aplicação';
  static const String about_dev = 'Sobre o autor';

  static const String fragment_author_about_dev =
      'Ricardo Mello é programador Java 8 certificado pela Oracle com experiência no desenvolvimento de aplicativos Web e Mobile';
   static const String  author_picture_link = 'https://i.imgur.com/jzuJw0x.jpg';

  static const String  app_picture_link = 'https://i.imgur.com/k7HV2mJ.png';
  static const String  app_version = 'App Version';
  static const String  build_number = 'Build Number';

  static const String baseURL = "https://covid19-brazil-api.now.sh/api/report/v1/brazil";

  static const String help = 'Ajuda';

  static const String data_from =
      'De onde este app busca os dados?';

  static const String more =
      'Como os dados são atualizados? ';

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
