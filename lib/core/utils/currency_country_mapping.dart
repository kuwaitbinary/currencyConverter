const Map<String, String> currencyToCountryCode = {
  'AED': 'ae', // United Arab Emirates Dirham
  'AFN': 'af', // Afghan Afghani
  'ALL': 'al', // Albanian Lek
  'AMD': 'am', // Armenian Dram
  'ANG': 'an', // Netherlands Antillean Guilder
  'AOA': 'ao', // Angolan Kwanza
  'ARS': 'ar', // Argentine Peso
  'AUD': 'au', // Australian Dollar
  'AWG': 'aw', // Aruban Florin
  'AZN': 'az', // Azerbaijani Manat
  'BAM': 'ba', // Bosnia-Herzegovina Convertible Mark
  'BBD': 'bb', // Barbadian Dollar
  'BDT': 'bd', // Bangladeshi Taka
  'BGN': 'bg', // Bulgarian Lev
  'BHD': 'bh', // Bahraini Dinar
  'BIF': 'bi', // Burundian Franc
  'BMD': 'bm', // Bermudian Dollar
  'BND': 'bn', // Brunei Dollar
  'BOB': 'bo', // Bolivian Boliviano
  'BRL': 'br', // Brazilian Real
  'BSD': 'bs', // Bahamian Dollar
  'BTN': 'bt', // Bhutanese Ngultrum
  'BWP': 'bw', // Botswanan Pula
  'BYN': 'by', // Belarusian Ruble
  'BZD': 'bz', // Belize Dollar
  'CAD': 'ca', // Canadian Dollar
  'CDF': 'cd', // Congolese Franc
  'CHF': 'ch', // Swiss Franc
  'CLP': 'cl', // Chilean Peso
  'CNY': 'cn', // Chinese Yuan
  'COP': 'co', // Colombian Peso
  'CRC': 'cr', // Costa Rican Colón
  'CUC': 'cu', // Cuban Convertible Peso
  'CUP': 'cu', // Cuban Peso
  'CVE': 'cv', // Cape Verdean Escudo
  'CZK': 'cz', // Czech Republic Koruna
  'DJF': 'dj', // Djiboutian Franc
  'DKK': 'dk', // Danish Krone
  'DOP': 'do', // Dominican Peso
  'DZD': 'dz', // Algerian Dinar
  'EGP': 'eg', // Egyptian Pound
  'ERN': 'er', // Eritrean Nakfa
  'ETB': 'et', // Ethiopian Birr
  'EUR': 'eu', // Euro
  'FJD': 'fj', // Fijian Dollar
  'FKP': 'fk', // Falkland Islands Pound
  'FOK': 'fo', // Faroese Króna
  'GBP': 'gb', // British Pound Sterling
  'GEL': 'ge', // Georgian Lari
  'GGP': 'gg', // Guernsey Pound
  'GHS': 'gh', // Ghanaian Cedi
  'GIP': 'gi', // Gibraltar Pound
  'GMD': 'gm', // Gambian Dalasi
  'GNF': 'gn', // Guinean Franc
  'GTQ': 'gt', // Guatemalan Quetzal
  'GYD': 'gy', // Guyanaese Dollar
  'HKD': 'hk', // Hong Kong Dollar
  'HNL': 'hn', // Honduran Lempira
  'HRK': 'hr', // Croatian Kuna
  'HTG': 'ht', // Haitian Gourde
  'HUF': 'hu', // Hungarian Forint
  'IDR': 'id', // Indonesian Rupiah
  'IMP': 'im', // Isle of Man Pound
  'INR': 'in', // Indian Rupee
  'IQD': 'iq', // Iraqi Dinar
  'IRR': 'ir', // Iranian Rial
  'ISK': 'is', // Icelandic Króna
  'JEP': 'je', // Jersey Pound
  'JMD': 'jm', // Jamaican Dollar
  'JOD': 'jo', // Jordanian Dinar
  'JPY': 'jp', // Japanese Yen
  'KES': 'ke', // Kenyan Shilling
  'KGS': 'kg', // Kyrgystani Som
  'KHR': 'kh', // Cambodian Riel
  'KID': 'ki', // Kiribati Dollar
  'KMF': 'km', // Comorian Franc
  'KRW': 'kr', // South Korean Won
  'KWD': 'kw', // Kuwaiti Dinar
  'KYD': 'ky', // Cayman Islands Dollar
  'KZT': 'kz', // Kazakhstani Tenge
  'LAK': 'la', // Laotian Kip
  'LBP': 'lb', // Lebanese Pound
  'LKR': 'lk', // Sri Lankan Rupee
  'LRD': 'lr', // Liberian Dollar
  'LSL': 'ls', // Lesotho Loti
  'LYD': 'ly', // Libyan Dinar
  'MAD': 'ma', // Moroccan Dirham
  'MDL': 'md', // Moldovan Leu
  'MGA': 'mg', // Malagasy Ariary
  'MKD': 'mk', // Macedonian Denar
  'MMK': 'mm', // Myanma Kyat
  'MNT': 'mn', // Mongolian Tugrik
  'MOP': 'mo', // Macanese Pataca
  'MRU': 'mr', // Mauritanian Ouguiya
  'MUR': 'mu', // Mauritian Rupee
  'MVR': 'mv', // Maldivian Rufiyaa
  'MWK': 'mw', // Malawian Kwacha
  'MXN': 'mx', // Mexican Peso
  'MYR': 'my', // Malaysian Ringgit
  'MZN': 'mz', // Mozambican Metical
  'NAD': 'na', // Namibian Dollar
  'NGN': 'ng', // Nigerian Naira
  'NIO': 'ni', // Nicaraguan Córdoba
  'NOK': 'no', // Norwegian Krone
  'NPR': 'np', // Nepalese Rupee
  'NZD': 'nz', // New Zealand Dollar
  'OMR': 'om', // Omani Rial
  'PAB': 'pa', // Panamanian Balboa
  'PEN': 'pe', // Peruvian Nuevo Sol
  'PGK': 'pg', // Papua New Guinean Kina
  'PHP': 'ph', // Philippine Peso
  'PKR': 'pk', // Pakistani Rupee
  'PLN': 'pl', // Polish Zloty
  'PYG': 'py', // Paraguayan Guarani
  'QAR': 'qa', // Qatari Rial
  'RON': 'ro', // Romanian Leu
  'RSD': 'rs', // Serbian Dinar
  'RUB': 'ru', // Russian Ruble
  'RWF': 'rw', // Rwandan Franc
  'SAR': 'sa', // Saudi Riyal
  'SBD': 'sb', // Solomon Islands Dollar
  'SCR': 'sc', // Seychellois Rupee
  'SDG': 'sd', // Sudanese Pound
  'SEK': 'se', // Swedish Krona
  'SGD': 'sg', // Singapore Dollar
  'SHP': 'sh', // Saint Helena Pound
  'SLL': 'sl', // Sierra Leonean Leone
  'SOS': 'so', // Somali Shilling
  'SRD': 'sr', // Surinamese Dollar
  'SSP': 'ss', // South Sudanese Pound
  'STN': 'st', // São Tomé and Príncipe Dobra
  'SYP': 'sy', // Syrian Pound
  'SZL': 'sz', // Swazi Lilangeni
  'THB': 'th', // Thai Baht
  'TJS': 'tj', // Tajikistani Somoni
  'TMT': 'tm', // Turkmenistani Manat
  'TND': 'tn', // Tunisian Dinar
  'TOP': 'to', // Tongan Pa'anga
  'TRY': 'tr', // Turkish Lira
  'TTD': 'tt', // Trinidad and Tobago Dollar
  'TVD': 'tv', // Tuvaluan Dollar
  'TWD': 'tw', // New Taiwan Dollar
  'TZS': 'tz', // Tanzanian Shilling
  'UAH': 'ua', // Ukrainian Hryvnia
  'UGX': 'ug', // Ugandan Shilling
  'USD': 'us', // United States Dollar
  'UYU': 'uy', // Uruguayan Peso
  'UZS': 'uz', // Uzbekistan Som
  'VES': 've', // Venezuelan Bolívar Soberano
  'VND': 'vn', // Vietnamese Dong
  'VUV': 'vu', // Vanuatu Vatu
  'WST': 'ws', // Samoan Tala
  'XAF': 'cm', // Central African CFA Franc (used in multiple countries)
  'XCD': 'ag', // East Caribbean Dollar (used in multiple countries)
  'XOF': 'sn', // West African CFA Franc (used in multiple countries)
  'XPF': 'pf', // CFP Franc (used in multiple countries)
  'YER': 'ye', // Yemeni Rial
  'ZAR': 'za', // South African Rand
  'ZMW': 'zm', // Zambian Kwacha
  'ZWL': 'zw', // Zimbabwean Dollar
};
