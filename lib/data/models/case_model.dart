class Case{
  final String country;
  final int cases;
  final int deaths;
  final int recovered;
  final int population;
  final String flag;


  Case({
    required this.country,
    required this.cases,
    required this.deaths,
    required this.recovered,
    required this.population,
    required this.flag
  });

  factory Case.fromJson(Map<String, dynamic> json){
    return Case(
      country: json['country'],
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      population: json['population'],
      flag: json['countryInfo']['flag']
    );
  }
}