class Compass
  BOX = [
    {
      'point': 'North',
      'abbreviation': 'N',
      'wind': 'Tramontana',
      'minimum': 354.38,
      'middle': 0.00,
      'maximum': 5.62,
    },
    {
      'point': 'North by east',
      'abbreviation': 'NbE',
      'wind': 'Quarto di Tramontana verso Greco',
      'minimum': 5.63,
      'middle': 11.25,
      'maximum': 16.87,
    },
    {
      'point': 'North-northeast',
      'abbreviation': 'NNE',
      'wind': 'Greco-Tramontana',
      'minimum': 16.88,
      'middle': 22.50,
      'maximum': 28.12,
    },
    {
      'point': 'Northeast by north',
      'abbreviation': 'NEbN',
      'wind': 'Quarto di Greco verso Tramontana',
      'minimum': 28.13,
      'middle': 33.75,
      'maximum': 39.37,
    },
    {
      'point': 'Northeast',
      'abbreviation': 'NE',
      'wind': 'Greco',
      'minimum': 39.38,
      'middle': 45.00,
      'maximum': 50.62,
    },
    {
      'point': 'Northeast by east',
      'abbreviation': 'NEbE',
      'wind': 'Quarto di Greco verso Levante',
      'minimum': 50.63,
      'middle': 56.25,
      'maximum': 61.87,
    },
    {
      'point': 'East-northeast',
      'abbreviation': 'ENE',
      'wind': 'Greco-Levante',
      'minimum': 61.88,
      'middle': 67.50,
      'maximum': 73.12,
    },
    {
      'point': 'East by north',
      'abbreviation': 'EbN',
      'wind': 'Quarto di Levante verso Greco',
      'minimum': 73.13,
      'middle': 78.75,
      'maximum': 84.37,
    },
    {
      'point': 'East',
      'abbreviation': 'E',
      'wind': 'Levante',
      'minimum': 84.38,
      'middle': 90.00,
      'maximum': 95.62,
    },
    {
      'point': 'East by south',
      'abbreviation': 'EbS',
      'wind': 'Quarto di Levante verso Scirocco',
      'minimum': 95.63,
      'middle': 101.25,
      'maximum': 106.87,
    },
    {
      'point': 'East-southeast',
      'abbreviation': 'ESE',
      'wind': 'Levante-Scirocco',
      'minimum': 106.88,
      'middle': 112.50,
      'maximum': 118.12,
    },
    {
      'point': 'Southeast by east',
      'abbreviation': 'SEbE',
      'wind': 'Quarto di Scirocco verso Levante',
      'minimum': 118.13,
      'middle': 123.75,
      'maximum': 129.37,
    },
    {
      'point': 'Southeast',
      'abbreviation': 'SE',
      'wind': 'Scirocco',
      'minimum': 129.38,
      'middle': 135.00,
      'maximum': 140.62,
    },
    {
      'point': 'Southeast by south',
      'abbreviation': 'SEbS',
      'wind': 'Quarto di Scirocco verso Ostro',
      'minimum': 140.63,
      'middle': 146.25,
      'maximum': 151.87,
    },
    {
      'point': 'South-southeast',
      'abbreviation': 'SSE',
      'wind': 'Ostro-Scirocco',
      'minimum': 151.88,
      'middle': 157.50,
      'maximum': 163.12,
    },
    {
      'point': 'South by east',
      'abbreviation': 'SbE',
      'wind': 'Quarto di Ostro verso Scirocco',
      'minimum': 163.13,
      'middle': 168.75,
      'maximum': 174.37,
    },
    {
      'point': 'South',
      'abbreviation': 'S',
      'wind': 'Ostro',
      'minimum': 174.38,
      'middle': 180.00,
      'maximum': 185.62,
    },
    {
      'point': 'South by west',
      'abbreviation': 'SbW',
      'wind': 'Quarto di Ostro verso Libeccio',
      'minimum': 185.63,
      'middle': 191.25,
      'maximum': 196.87,
    },
    {
      'point': 'South-southwest',
      'abbreviation': 'SSW',
      'wind': 'Ostro-Libeccio',
      'minimum': 196.88,
      'middle': 202.50,
      'maximum': 208.12,
    },
    {
      'point': 'Southwest by south',
      'abbreviation': 'SWbS',
      'wind': 'Quarto di Libeccio verso Ostro',
      'minimum': 208.13,
      'middle': 213.75,
      'maximum': 219.37,
    },
    {
      'point': 'Southwest',
      'abbreviation': 'SW',
      'wind': 'Libeccio',
      'minimum': 219.38,
      'middle': 225.00,
      'maximum': 230.62,
    },
    {
      'point': 'Southwest by west',
      'abbreviation': 'SWbW',
      'wind': 'Quarto di Libeccio verso Ponente',
      'minimum': 230.63,
      'middle': 236.25,
      'maximum': 241.87,
    },
    {
      'point': 'West-southwest',
      'abbreviation': 'WSW',
      'wind': 'Ponente-Libeccio',
      'minimum': 241.88,
      'middle': 247.50,
      'maximum': 253.12,
    },
    {
      'point': 'West by south',
      'abbreviation': 'WbS',
      'wind': 'Quarto di Ponente verso Libeccio',
      'minimum': 253.13,
      'middle': 258.75,
      'maximum': 264.37,
    },
    {
      'point': 'West',
      'abbreviation': 'W',
      'wind': 'Ponente',
      'minimum': 264.38,
      'middle': 270.00,
      'maximum': 275.62,
    },
    {
      'point': 'West by north',
      'abbreviation': 'WbN',
      'wind': 'Quarto di Ponente verso Maestro',
      'minimum': 275.63,
      'middle': 281.25,
      'maximum': 286.87,
    },
    {
      'point': 'West-northwest',
      'abbreviation': 'WNW',
      'wind': 'Maestro-Ponente',
      'minimum': 286.88,
      'middle': 292.50,
      'maximum': 298.12,
    },
    {
      'point': 'Northwest by west',
      'abbreviation': 'NWbW',
      'wind': 'Quarto di Maestro verso Ponente',
      'minimum': 298.13,
      'middle': 303.75,
      'maximum': 309.37,
    },
    {
      'point': 'Northwest',
      'abbreviation': 'NW',
      'wind': 'Maestro',
      'minimum': 309.38,
      'middle': 315.00,
      'maximum': 320.62,
    },
    {
      'point': 'Northwest by north',
      'abbreviation': 'NWbN',
      'wind': 'Quarto di Maestro verso Tramontana',
      'minimum': 320.63,
      'middle': 326.25,
      'maximum': 331.87,
    },
    {
      'point': 'North-northwest',
      'abbreviation': 'NNW',
      'wind': 'Maestro-Tramontana',
      'minimum': 331.88,
      'middle': 337.50,
      'maximum': 343.12,
    },
    {
      'point': 'North by west',
      'abbreviation': 'NbW',
      'wind': 'Quarto di Tramontana verso Maestro',
      'minimum': 343.13,
      'middle': 348.75,
      'maximum': 354.37,
    }
  ]

  class << self
    def nearest(heading)
      BOX.find { |point| heading >= point[:minimum] && heading <= point[:maximum] } ||
      BOX.find { |point| heading >= point[:minimum] } ||
      BOX.find { |point| heading <= point[:maximum] }
    end
  end
end
