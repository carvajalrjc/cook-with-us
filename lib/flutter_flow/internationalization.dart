import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
  }) =>
      [enText, esText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Onboarding
  {
    'f9al2jiq': {
      'en': 'Discover Unique Culinary Experiences',
      'es': 'Descubre experiencias gastronómicas únicas',
      'fr': 'Découvrez des expériences culinaires uniques',
    },
    'q7mzy88d': {
      'en':
          'Explore, book, and learn from local chefs. Immerse yourself in traditional cuisine and discover authentic regional recipes.',
      'es':
          'Explora, reserva y aprende con chefs locales. Sumérgete en la cocina tradicional y descubre recetas auténticas de cada región.',
      'fr':
          'Explorez, réservez et apprenez avec des chefs locaux. Plongez dans la cuisine traditionnelle et découvrez des recettes authentiques de chaque région.',
    },
    '2egoby3b': {
      'en': ' Learn to Cook with Top Chefs',
      'es': 'Aprende a cocinar con los mejores chefs',
      'fr': 'Apprenez à cuisiner avec les meilleurs chefs',
    },
    'neuxxcug': {
      'en':
          'Join live classes and tutorials with culinary experts. Enjoy an interactive experience from anywhere.',
      'es':
          'Accede a clases en vivo y tutoriales con expertos en gastronomía. Disfruta una experiencia interactiva desde cualquier lugar.',
      'fr':
          'Participez à des cours en direct et à des tutoriels avec des experts en gastronomie. Profitez d’une expérience interactive où que vous soyez.',
    },
    'rijctza1': {
      'en': 'Explore the Gastronomic Culture of Each Region',
      'es': 'Explora la cultura gastronómica de cada región',
      'fr': 'Explorez la culture gastronomique de chaque région',
    },
    '5cdcpcqz': {
      'en':
          'Discover traditional dishes and immerse yourself in the history and authentic flavors of different countries.',
      'es': 'Descubre platos y  los sabores de diferentes países.',
      'fr':
          'Découvrez des plats traditionnels et plongez dans l’histoire et les saveurs authentiques de différents pays.',
    },
    '2044raxp': {
      'en': 'Create Account',
      'es': 'Crear Cuenta',
      'fr': 'Créer un compte',
    },
    'kvk96b9a': {
      'en': 'Already have an account? Log In',
      'es': '¿Ya tienes una cuenta? Iniciar Sesión',
      'fr': 'Vous avez déjà un compte ? Se connecter',
    },
    'e9n9xv7z': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CreateAccount
  {
    'fqhfxosd': {
      'en': 'Join Cook W/ Us',
      'es': 'Únete a Cook W/ Us',
      'fr': 'Rejoignez Cook W/ Us',
    },
    '8r2ftoyt': {
      'en': 'Learn, cook, and enjoy with expert chefs in local gastronomy.',
      'es':
          'Aprende, cocina y disfruta con chefs expertos en gastronomía local.',
      'fr':
          'Apprenez, cuisinez et profitez avec des chefs experts en gastronomie locale.',
    },
    'vw4cjh03': {
      'en': 'Name',
      'es': 'Nombre',
      'fr': 'Nom',
    },
    'td8evcbf': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'qyz8jn8k': {
      'en': 'Write your name',
      'es': 'Escribe tu nombre',
      'fr': 'Écris ton nom',
    },
    '2c1b74k0': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'fm372kcx': {
      'en': 'Enter your email',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    '5ejt2igx': {
      'en': 'Phone number',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    '1k2s07d4': {
      'en': 'Enter your phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    '8hrnyurr': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    '5ta75wx9': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    '9rr5k6j7': {
      'en': 'Confirm your password',
      'es': 'Confirme su contraseña',
      'fr': 'Confirmez votre mot de passe',
    },
    'k95kcd4l': {
      'en': 'Confirm your password',
      'es': 'Confirme su contraseña ',
      'fr': 'Confirmez votre mot de passe',
    },
    '7318gst0': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    'eqdiv2sl': {
      'en': 'Or using another method',
      'es': 'O usando otro método',
      'fr': 'Ou en utilisant une autre méthode',
    },
    'nt2a4i5y': {
      'en': 'Sign up with Google',
      'es': 'Regístrate con Google',
      'fr': 'Inscrivez-vous avec Google',
    },
    '18pahsw4': {
      'en': 'Sign up with Facebook',
      'es': 'Registrate con Facebook',
      'fr': 'Inscrivez-vous avec Facebook',
    },
    'tj5ofugi': {
      'en': 'Already have an account?',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte ?',
    },
    '96k4zm5b': {
      'en': 'Log In',
      'es': 'Iniciar Sesión',
      'fr': 'Se connecter',
    },
    'i6bq0pen': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Verification
  {
    'lnxzjexp': {
      'en': 'Verification',
      'es': 'Verificación',
      'fr': 'Vérification',
    },
    'm8vt32wl': {
      'en': 'Verification Code',
      'es': 'Código de verificación',
      'fr': 'Le code de vérification',
    },
    'j0wt8bqq': {
      'en':
          'We have to sent the code verification 1234, Please enter the code to move forward',
      'es':
          'Tenemos que enviar el código de verificación 1234. Ingrese el código para seguir adelante.',
      'fr':
          'Nous devons envoyer le code de vérification 1234, veuillez entrer le code pour avancer',
    },
    'ou77jxtd': {
      'en': 'demo@email.com',
      'es': 'demostración@correo electrónico.com',
      'fr': 'démo@email.com',
    },
    'vfbmvgvb': {
      'en': 'Verify',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    '5iqum420': {
      'en': 'Didn\'t recceive the code? ',
      'es': '¿No recibiste el código?',
      'fr': 'Vous n\'avez pas reçu le code ?',
    },
    '7axmi8vz': {
      'en': 'Resend',
      'es': 'Reenviar',
      'fr': 'Renvoyer',
    },
    'hvh480nv': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LoginAccount
  {
    'absgjmyr': {
      'en': 'Log in to Cook W/ Us',
      'es': 'Inicia sesión en Cook W/ Us',
      'fr': 'Connectez-vous à Cook W/ Us',
    },
    '7yyc6yio': {
      'en':
          'Access unique culinary experiences and discover the best of local cuisine.',
      'es':
          'Accede a experiencias gastronómicas únicas y descubre lo mejor de la cocina local.',
      'fr':
          'Accédez à des expériences culinaires uniques et découvrez le meilleur de la cuisine locale.',
    },
    '0y1a56v9': {
      'en': 'Email or phone number',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    'xq55heau': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    'iyk0cszg': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'tec1pifi': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    '0c1sk3ec': {
      'en': 'Forgot your password?',
      'es': '¿Has olvidado tu contraseña?',
      'fr': 'Mot de passe oublié?',
    },
    '58ybobvm': {
      'en': 'Log In',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    'cy7y6bn2': {
      'en': 'Or using another method',
      'es': 'O usando otro método',
      'fr': 'Ou en utilisant une autre méthode',
    },
    'qwppiiww': {
      'en': 'Sign in with Google',
      'es': 'Regístrate con Google',
      'fr': 'Inscrivez-vous avec Google',
    },
    'fr9vo6vw': {
      'en': 'Sign in with Facebook',
      'es': 'Registrate con Facebook',
      'fr': 'Inscrivez-vous avec Facebook',
    },
    '9ftxk5xj': {
      'en': 'Don’t have an account yet?',
      'es': '¿Aún no tienes una cuenta?',
      'fr': 'Vous n’avez pas encore de compte ?',
    },
    'jlqha2r3': {
      'en': 'Sign up here',
      'es': 'Regístrate aquí',
      'fr': 'Inscrivez-vous ici',
    },
    '84xsjzjp': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Home
  {
    'nrjkv2kp': {
      'en': 'Special Promotions ',
      'es': 'Promociones Especiales ',
      'fr': 'Promotions Spéciales',
    },
    'qbi76ffw': {
      'en': 'Buy 2,',
      'es': ' Compra 2,',
      'fr': 'Achetez 2,',
    },
    '365znznm': {
      'en': 'Get 3',
      'es': 'lleva 3',
      'fr': 'Recevez 3 ',
    },
    'qc5r40eh': {
      'en': 'Enroll in two classes and get one free.',
      'es': 'Inscríbete en dos clases y obtén una gratis.',
      'fr': 'Inscrivez-vous à deux cours et obtenez-en un gratuit.',
    },
    'blkkfz04': {
      'en': 'Special Promotions',
      'es': 'Promociones Especiales',
      'fr': 'Promotions Spéciales',
    },
    '1t0nwzcg': {
      'en': 'Welcome  ',
      'es': 'Descuento de  ',
      'fr': 'Réduction de  ',
    },
    'jbmkdkf2': {
      'en': 'Discount',
      'es': 'Bienvenida',
      'fr': 'Bienvenue',
    },
    'd0x9cwun': {
      'en': 'Get 20% OFF on your first class.',
      'es': 'Obtén 20% OFF en tu primera clase.',
      'fr': 'Obtenez 20% de réduction sur votre premier cours.',
    },
    'h6jszv9t': {
      'en': 'Special Promotions',
      'es': 'Promociones Especiales',
      'fr': 'Promotions Spéciales',
    },
    'br0vn0os': {
      'en': 'Limited-Time  ',
      'es': 'Promoción por  ',
      'fr': ' Offre à Durée',
    },
    '6fp4t17z': {
      'en': 'Offer',
      'es': 'tiempo limitado',
      'fr': 'Limitée',
    },
    '5q82whxw': {
      'en': 'Only today, 30% OFF on International Cuisine Classes.',
      'es': 'Solo hoy, 30% OFF en Clases de Cocina Internacional.',
      'fr':
          'Aujourd’hui seulement, 30% de réduction sur les cours de Cuisine Internationale.',
    },
    'w8d6d7ou': {
      'en': '5',
      'es': '5',
      'fr': '5',
    },
    'f9v2sphq': {
      'en': 'Current Location',
      'es': 'Ubicación actual',
      'fr': ' Localisation actuelle',
    },
    'tcerl0vq': {
      'en': 'Bogotá, CO',
      'es': 'Bogotá, CO',
      'fr': 'Bogotá, CO',
    },
    '3uolrspq': {
      'en': '3',
      'es': '3',
      'fr': '3',
    },
    'gdd44mmx': {
      'en': 'Find near you...',
      'es': 'Encuentra cerca de ti...',
      'fr': 'Trouvez des chez vous...\n\n',
    },
    'jsoxuaja': {
      'en': '',
      'es': 'Comidas',
      'fr': 'Repas',
    },
    'bswt15yg': {
      'en': 'Featured Experiences🔥',
      'es': 'Experiencias Destacadas🔥',
      'fr': 'Expériences en Vedette  🔥',
    },
    'cksqasks': {
      'en': 'See all',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'x2qjxh38': {
      'en': '4.8',
      'es': '4.5',
      'fr': '4.5',
    },
    'qfj7n8oq': {
      'en': 'The Art of Making Fresh Pasta',
      'es': 'El arte de hacer pasta fresca',
      'fr': 'L\'Art de Faire des Pâtes Fraîches',
    },
    '6wldf8t5': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'u8kx24j8': {
      'en': '15.99',
      'es': '9.67',
      'fr': '9.67',
    },
    'i38mmg9r': {
      'en': '4.7',
      'es': '4.5',
      'fr': '4.5',
    },
    'kowjo7c8': {
      'en': 'Perfect Grilling with Chef Techniques',
      'es': 'Asado perfecto con técnicas de chef',
      'fr': 'Barbecue Parfait avec Techniques de Chef ',
    },
    '2pvz4cev': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    '2aru4znh': {
      'en': '10.99',
      'es': '9.67',
      'fr': '9.67',
    },
    'le0sj93s': {
      'en': 'Most Popular Classes 🔥',
      'es': ' Clases Más Populares🔥',
      'fr': 'Cours les Plus Populaires🔥',
    },
    'a4ybqjxs': {
      'en': 'See all',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'pmjdygbc': {
      'en': '4.9',
      'es': '4.5',
      'fr': '4.5',
    },
    'tflw4s1f': {
      'en': 'Authentic Tacos & Salsas Workshop',
      'es': 'Tacos y Salsas Auténticas',
      'fr': 'Atelier Tacos et Salsas Authentiques',
    },
    '81x8o1sk': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'nbie7pmp': {
      'en': '14.50',
      'es': '9.67',
      'fr': '9.67',
    },
    '31drqw4j': {
      'en': '4.8',
      'es': '4.5',
      'fr': '4.5',
    },
    '5r1ecy1s': {
      'en': 'Japanese Sushi Masterclass',
      'es': 'Masterclass de Sushi Japonés',
      'fr': 'Masterclass Sushi Japonais',
    },
    '7hglunmb': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'wpzk0gvf': {
      'en': '20.00',
      'es': '9.67',
      'fr': '9.67',
    },
    '1bn3tbn9': {
      'en': 'FoodCort  Menu',
      'es': 'Menú de FoodCort',
      'fr': 'Menu FoodCort',
    },
    'oz87q4rw': {
      'en': 'Voucher',
      'es': 'Vale',
      'fr': 'Bon',
    },
    'ftofxth9': {
      'en': '2',
      'es': '2',
      'fr': '2',
    },
    'j4sf6qol': {
      'en': 'Chat',
      'es': 'Charlar',
      'fr': 'Chat',
    },
    'i6gh3ykw': {
      'en': '23',
      'es': '23',
      'fr': '23',
    },
    'o7mngs8h': {
      'en': 'History',
      'es': 'Historia',
      'fr': 'Histoire',
    },
    'ehogrhj6': {
      'en': '14',
      'es': '14',
      'fr': '14',
    },
    'c7qzdrmt': {
      'en': 'Setting',
      'es': 'Configuración',
      'fr': 'Paramètre',
    },
    'f5pkf5oo': {
      'en': '1',
      'es': '1',
      'fr': '1',
    },
    'yivwb9sd': {
      'en': 'Magdalena Succrose',
      'es': 'Magdalena Sacarosa',
      'fr': 'Saccharose Magdalena',
    },
    'q5uurl4d': {
      'en': 'Good Morning',
      'es': 'Buen día',
      'fr': 'Bonjour',
    },
    'nudnmbzx': {
      'en': 'Help',
      'es': 'Ayuda',
      'fr': 'Aide',
    },
    'p3mpfwg4': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    'yuxvfcy0': {
      'en': 'Inicio',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // MyOrder
  {
    'i78vidqg': {
      'en': 'List of Booked Classes',
      'es': 'Lista de Clases Reservadas',
      'fr': 'Liste des Cours Réservés',
    },
    '5dnqugbt': {
      'en': 'Ongoing Classes',
      'es': 'Clases en Proceso',
      'fr': 'Cours en Cours',
    },
    'q1zvqh2a': {
      'en': 'International Cuisine Workshop',
      'es': 'Taller de Cocina Internacional',
      'fr': 'Atelier de Cuisine Internationale',
    },
    'lbkv9pwc': {
      'en': 'On Progress',
      'es': 'En progreso',
      'fr': 'En progrès',
    },
    '1dh22zz4': {
      'en': 'Date',
      'es': 'Fecha',
      'fr': 'Date',
    },
    'ijtq1jlo': {
      'en': '29 Desc 2022',
      'es': '29 dic 2022',
      'fr': '29 décembre 2022',
    },
    'wsvk3s1k': {
      'en': 'Price',
      'es': 'Precio',
      'fr': 'Prix',
    },
    'dczeejli': {
      'en': '\$35.05',
      'es': '\$35.05',
      'fr': '35,05 \$',
    },
    'lg9gdklp': {
      'en': 'Track Class',
      'es': 'Seguir Clase',
      'fr': 'Suivre le Cours',
    },
    'rxja02vl': {
      'en': 'View Classes',
      'es': 'Ver Clases',
      'fr': 'Voir les Cours',
    },
    '42hehwip': {
      'en': 'History',
      'es': ' Historial',
      'fr': 'Histoire',
    },
    'hmdvxxgk': {
      'en': 'Japanese Sushi Masterclass',
      'es': 'Masterclass de Sushi Japonés',
      'fr': 'Masterclass de Sushi Japonais',
    },
    '1jmcs4wg': {
      'en': 'Completada',
      'es': 'Terminado',
      'fr': 'Complété',
    },
    'sbe46auv': {
      'en': 'Date',
      'es': 'Fecha',
      'fr': 'Date',
    },
    'zlzgeed2': {
      'en': '29 dec 2022',
      'es': '29 dic 2022',
      'fr': '29 décembre 2022',
    },
    'patrq0wt': {
      'en': 'Price',
      'es': 'Precio',
      'fr': 'Prix',
    },
    '2ncjg2kj': {
      'en': '\$18.99',
      'es': '\$35.05',
      'fr': '35,05 \$',
    },
    'opi3blqy': {
      'en': 'Track Class',
      'es': 'Seguir Clase',
      'fr': 'Suivre le Cours',
    },
    '10momek7': {
      'en': 'View Classes',
      'es': 'Ver Clases',
      'fr': 'Voir les Cours',
    },
    '460io703': {
      'en': 'Classes',
      'es': 'Clases',
      'fr': 'Cours',
    },
  },
  // Favorite
  {
    '49ybivr1': {
      'en': 'My Favorites',
      'es': 'Mis Favoritos',
      'fr': 'Mes Favoris',
    },
    '62bdi6xm': {
      'en': 'Find the culinary experience you love...',
      'es': 'Encuentra la experiencia gastronómica que te encanta...',
      'fr': 'Trouvez l’expérience culinaire que vous aimez...',
    },
    'kqemfkac': {
      'en': 'Cooking Classes',
      'es': 'Clases de Cocina',
      'fr': 'Cours de Cuisine',
    },
    'r63ieljx': {
      'en': 'Wine Tastings & Pairings',
      'es': 'Catas y Maridajes',
      'fr': 'Dégustations et Accords Mets-Vins',
    },
    'mwcyaiq0': {
      'en': 'Baking & Pastry',
      'es': 'Repostería y Panadería',
      'fr': 'Pâtisserie et Boulangerie',
    },
    'wsvud8bm': {
      'en': 'International Cuisine',
      'es': 'Cocina Internacional',
      'fr': 'Cuisine Internationale',
    },
    'st0s5x2f': {
      'en': 'Authentic Tacos & Salsas Workshop',
      'es': 'Taller de Tacos y Salsas Auténticas',
      'fr': 'Atelier Tacos et Salsas Authentiques',
    },
    'wd86kz7v': {
      'en': '4.7',
      'es': '4.7',
      'fr': '4.7',
    },
    'jr6tfjbn': {
      'en': '1 hour',
      'es': '1 hora',
      'fr': '1 heure',
    },
    'fzq8j4pk': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    '0y5ljcns': {
      'en': '8.20',
      'es': '8.20',
      'fr': '8h20',
    },
    'qtzs7hpk': {
      'en': 'Favorites',
      'es': 'Favoritos',
      'fr': 'Préférés',
    },
  },
  // LocationDetect
  {
    'k4jsump9': {
      'en': 'Location Detection',
      'es': 'Detección de ubicación',
      'fr': 'Détection d\'emplacement',
    },
    'yvc7yjmd': {
      'en': 'Find culinary experiences near you',
      'es': 'Encuentra experiencias gastronómicas cerca de ti',
      'fr': 'Trouvez des expériences culinaires près de chez vous',
    },
    '8jzk2pr6': {
      'en':
          'Locate cooking classes, tastings, and food experiences in your city. Use automatic location detection or manually enter your location to discover events near you.',
      'es':
          'Ubica clases de cocina, catas y experiencias culinarias en tu ciudad. Usa la detección automática de ubicación o ingresa tu ubicación manualmente para descubrir eventos cerca de ti.',
      'fr':
          'Repérez des cours de cuisine, des dégustations et des expériences gastronomiques dans votre ville. Utilisez la détection automatique de localisation ou entrez votre adresse manuellement pour découvrir des événements proches de vous.',
    },
    'a3ezcihm': {
      'en': 'Detect Nearest Location',
      'es': 'Detectar Ubicación Más Cercana',
      'fr': 'Détecter la Localisation la Plus Proche',
    },
    'gvny8nfg': {
      'en': 'Bogotá, Colombia',
      'es': '',
      'fr': '',
    },
    '5lsa42hm': {
      'en': ' Colombian Cuisine Workshop ',
      'es': 'Taller de Cocina Colombiana',
      'fr': 'Atelier de Cuisine Colombienne',
    },
    'j00829xj': {
      'en': '4.8',
      'es': '4.8',
      'fr': '4.8',
    },
    'iysr7r4n': {
      'en': 'Available until 10:45 PM',
      'es': 'Disponible hasta las 10:45 PM',
      'fr': 'Disponible jusqu\'à 22h45',
    },
    'sr0mruju': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Detail
  {
    'mnx04jee': {
      'en': 'Details',
      'es': 'Detalles',
      'fr': 'Détails',
    },
    'djb2f3n5': {
      'en': 'Italian Cuisine',
      'es': 'Cocina Italiana',
      'fr': 'Cuisine Italienne',
    },
    'mtpbo3c3': {
      'en': 'The Art of Making Fresh Pasta',
      'es': 'El arte de hacer pasta fresca',
      'fr': 'L\'Art de Faire des Pâtes Fraîches',
    },
    'vn8tgitw': {
      'en': 'Rating',
      'es': 'Calificación',
      'fr': 'Note',
    },
    '9qydxdue': {
      'en': '4,8',
      'es': '4,8',
      'fr': '4,8',
    },
    't0v4dcf1': {
      'en': 'Difficulty',
      'es': 'Dificultad',
      'fr': 'Difficulté',
    },
    'neg3msns': {
      'en': 'Easy',
      'es': 'Fácil',
      'fr': 'Facile',
    },
    '3arxnrib': {
      'en': 'Duration',
      'es': 'Duración',
      'fr': 'Durée',
    },
    'disilbb6': {
      'en': '1 hour 30 min',
      'es': '1 hora 30 min',
      'fr': '1 heure 30 min',
    },
    'r8xqexim': {
      'en': 'Description',
      'es': 'Descripción',
      'fr': 'Description',
    },
    'tz8hydwz': {
      'en':
          'In this interactive class, you will learn how to make fresh pasta from scratch using authentic Italian techniques. A professional chef will guide you through:\n\n✅ Mixing and kneading the perfect dough.\n✅ Using different types of flour for ideal textures.\n✅ Making homemade pasta like tagliatelle, fettuccine, and ravioli.\n✅ Preparing traditional sauces like pomodoro and alfredo to pair with your pasta.\n\n👨‍🍳 Instructor: Chef Marco Bellini (Italian Cuisine Expert)',
      'es':
          'En esta clase interactiva, aprenderás a preparar pasta fresca desde cero con técnicas auténticas italianas. Un chef experto te enseñará a:\n\n✅ Mezclar y amasar la masa perfecta.\n✅ Usar diferentes tipos de harina para obtener texturas ideales.\n✅ Elaborar pasta artesanal como tagliatelle, fettuccine y ravioli.\n✅ Crear salsas tradicionales como pomodoro y alfredo para acompañar tu pasta.\n\n👨‍🍳 Imparte: Chef Marco Bellini (Especialista en gastronomía italiana)',
      'fr':
          'Dans ce cours interactif, vous apprendrez à préparer des pâtes fraîches maison en utilisant des techniques italiennes authentiques. Un chef professionnel vous guidera pour :\n\n✅ Mélanger et pétrir la pâte parfaite.\n✅ Utiliser différents types de farine pour obtenir la texture idéale.\n✅ Réaliser des pâtes artisanales comme les tagliatelles, fettuccines et raviolis.\n✅ Préparer des sauces traditionnelles comme la sauce pomodoro et l\'alfredo pour accompagner vos pâtes.\n\n👨‍🍳 Chef: Marco Bellini (Spécialiste de la cuisine italienne)',
    },
    'ofiu1ud3': {
      'en': 'Reed m',
      'es': 'Leer más',
      'fr': 'En savoir plus',
    },
    '8u283qs4': {
      'en': 'Ubicación',
      'es': 'Ubicación',
      'fr': 'Lieu',
    },
    'xm7euxs5': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'kjyn3b76': {
      'en': '14.50',
      'es': '35.25',
      'fr': '35h25',
    },
    'xv6cwiei': {
      'en': 'Book Now',
      'es': 'Reservar ahora',
      'fr': 'Réserver maintenant',
    },
    'bzzsk2tt': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // DetailTwo
  {
    'nbdnof56': {
      'en': 'Details',
      'es': 'Detalles',
      'fr': 'Détails',
    },
    'j3p2m3nr': {
      'en': 'Authentic Tacos & Salsas Workshop',
      'es': 'Tacos y Salsas Auténticas',
      'fr': 'Atelier Tacos et Salsas Authentiques',
    },
    'lk71w8zc': {
      'en': '4,8',
      'es': '4,8',
      'fr': '4,8',
    },
    'sh4xuv53': {
      'en': 'Easy',
      'es': 'Fácil',
      'fr': 'Facile',
    },
    'ni88nv7q': {
      'en': '1 hour',
      'es': '1 hora',
      'fr': '1 heure',
    },
    'qp2vwesi': {
      'en': 'Description',
      'es': 'Descripción',
      'fr': 'Description',
    },
    'pmpuc2wi': {
      'en':
          'Discover the authentic taste of Mexican tacos in this hands-on class led by an expert chef. You will learn:\n\n✅ How to make corn tortillas from scratch using traditional masa.\n✅ Marinating and cooking techniques for meats like pastor, asada, and cochinita pibil.\n✅ Preparation of iconic salsas: green salsa, red salsa, and pico de gallo.\n✅ Plating and presentation techniques Mexican-style.\n\n👨‍🍳 Instructor: Chef Alejandro Ramírez (Mexican Cuisine Expert)   ',
      'es':
          'LDescubre el sabor auténtico de los tacos mexicanos con esta clase práctica impartida por un chef experto. Aprenderás:\n\n✅ Cómo hacer tortillas de maíz desde cero con masa tradicional.\n✅ Técnicas para marinar y cocinar carnes como pastor, asada y cochinita pibil.\n✅ Preparación de salsas icónicas: salsa verde, roja y pico de gallo.\n✅ Técnicas de presentación y emplatado al estilo mexicano.\n\n👨‍🍳 Imparte: Chef Alejandro Ramírez (Especialista en gastronomía mexicana)   ',
      'fr':
          'Découvrez le vrai goût des tacos mexicains grâce à ce cours pratique dirigé par un chef expert. Vous apprendrez :\n\n✅ Comment préparer des tortillas de maïs maison avec de la masa traditionnelle.\n✅ Techniques de marinade et de cuisson pour les viandes comme le pastor, l’asada et la cochinita pibil.\n✅ Préparation des sauces emblématiques : salsa verte, salsa rouge et pico de gallo.\n✅ Techniques de présentation et dressage à la mexicaine.\n\n👨‍🍳 Chef: Alejandro Ramírez (Spécialiste de la cuisine mexicaine)   ',
    },
    'un5igpay': {
      'en': 'Read More',
      'es': 'Leer más',
      'fr': 'En savoir plus',
    },
    'dq83u7hh': {
      'en': 'Location',
      'es': 'Ubicación',
      'fr': 'Lieu',
    },
    '0n2lpldx': {
      'en': 'Reviews',
      'es': 'Reseñas',
      'fr': 'Commentaires',
    },
    'vgc5a2nk': {
      'en': 'See all',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'b6kmz9rt': {
      'en':
          '📢 \"Amazing experience! Now I can make authentic tacos at home.\" – Laura G. ⭐⭐⭐⭐⭐\n📢 \"The chef explained everything so well, and the salsa part was fantastic!\" – Juan P. ⭐⭐⭐⭐⭐\n📢 \"Loved the interactive nature of the class, very easy to follow.\" – Ricardo M. ⭐⭐⭐⭐',
      'es':
          '📢 \"Increíble experiencia, ahora puedo hacer tacos auténticos en casa.\" – Laura G. ⭐⭐⭐⭐⭐\n📢 \"El chef explicó muy bien, y la parte de las salsas fue espectacular.\" – Juan P. ⭐⭐⭐⭐⭐\n📢 \"Me encantó la dinámica del curso, muy interactivo y fácil de seguir.\" – Ricardo M. ⭐⭐⭐⭐\n',
      'fr':
          '📢 \"Expérience incroyable ! Maintenant, je peux faire des tacos authentiques chez moi.\" – Laura G. ⭐⭐⭐⭐⭐\n📢 \"Le chef a tout expliqué en détail, et la partie sur les sauces était géniale !\" – Juan P. ⭐⭐⭐⭐⭐\n📢 \"J’ai adoré la dynamique du cours, très interactif et facile à suivre.\" – Ricardo M. ⭐⭐⭐⭐',
    },
    'ckxkhh81': {
      'en': 'Leer más',
      'es': 'Leer más',
      'fr': 'En savoir plus',
    },
    '07lvoimy': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'p7z4pmcv': {
      'en': '14.50',
      'es': '35.25',
      'fr': '35h25',
    },
    '8k65ncpp': {
      'en': 'Reservar ahora',
      'es': 'añadir a la cesta',
      'fr': 'Réserver maintenant',
    },
    'i1oj2yib': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Cart
  {
    '207mlkda': {
      'en': 'My Reservations',
      'es': 'Mis Reservas',
      'fr': 'Mes Réservations',
    },
    '66vsdezz': {
      'en': 'Special Promotion',
      'es': 'Promoción Especial',
      'fr': 'Promotion Spéciale',
    },
    '75x4p2z2': {
      'en': 'Get  ',
      'es': 'Obtén un  ',
      'fr': 'Obtenez  ',
    },
    '22a6bktg': {
      'en': '15%',
      'es': '15%',
      'fr': '15%',
    },
    'htyankjb': {
      'en': '  off on your first class',
      'es': '  de descuento en tu primera clase',
      'fr': '  de réduction sur votre premier cours',
    },
    'rd1249ma': {
      'en': 'Claim the discount',
      'es': 'Reclame el descuento',
      'fr': 'Réclamez la réduction',
    },
    'zy9wy916': {
      'en': 'List of Booked Classes',
      'es': 'Lista de Clases Reservadas',
      'fr': 'Liste des Cours Réservés',
    },
    'y54nx8qv': {
      'en': 'See All',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'epb53p4l': {
      'en': 'Japanese Sushi Masterclass',
      'es': 'Masterclass de Sushi Japonés',
      'fr': 'Masterclass de Sushi Japonais',
    },
    'ntq4kj53': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'f8ym6ksg': {
      'en': '18.99',
      'es': '6.17',
      'fr': '6.17',
    },
    'wjruofus': {
      'en': 'Authentic Tacos & Salsas Workshop',
      'es': 'Taller de Tacos y Salsas Auténticas',
      'fr': 'Atelier Tacos et Salsas Authentiques',
    },
    'ylq55zkc': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'jp6zen4a': {
      'en': '14.50',
      'es': '6.17',
      'fr': '6.17',
    },
    '3wtzgjwj': {
      'en': 'Total',
      'es': 'Total',
      'fr': 'Total',
    },
    'iy8yjyaj': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    '1j0h80j2': {
      'en': '46.48',
      'es': '6.17',
      'fr': '6.17',
    },
    'zianva9b': {
      'en': 'Checkout',
      'es': 'Checkout',
      'fr': 'Paiement',
    },
    '4c4j2qiq': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Checkout
  {
    'obpxi59l': {
      'en': 'Checkout',
      'es': 'Checkout',
      'fr': 'Paiement',
    },
    'itb5cibu': {
      'en': 'Address',
      'es': 'Dirección',
      'fr': 'Adresse',
    },
    'ufb3z8kz': {
      'en': 'Edit',
      'es': 'Editar',
      'fr': 'Modifier',
    },
    '536bmziz': {
      'en': 'Class Location',
      'es': 'Ubicación de la Clase',
      'fr': 'Lieu du Cours',
    },
    'n47csmvi': {
      'en': 'Northern Zone - Usaquén, Bogotá, Colombia',
      'es': 'Zona Norte - Usaquén, Bogotá, Colombia',
      'fr': 'Zone Nord - Usaquén, Bogotá, Colombie',
    },
    'hwp6mses': {
      'en': 'Payment Method',
      'es': 'Método de pago',
      'fr': 'Mode de paiement',
    },
    'ahpgbw52': {
      'en': 'Master Card',
      'es': 'Tarjeta maestra',
      'fr': 'Carte maîtresse',
    },
    'ntrn2nxd': {
      'en': '**** **** 1234',
      'es': '**** **** 1234',
      'fr': '**** **** 1234',
    },
    '5bayq5h5': {
      'en': 'Voucher Code',
      'es': 'Código de cupón',
      'fr': 'Code de réduction',
    },
    'ly0savik': {
      'en': 'Enter voucher code',
      'es': 'Ingrese código de descuento',
      'fr': 'Entrer le code du bon',
    },
    'l8pyfy3g': {
      'en': 'Service fee',
      'es': 'Costo de servicio',
      'fr': 'Frais de service',
    },
    'vjf48y0r': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'rc8svr5j': {
      'en': '5.31',
      'es': '5.31',
      'fr': '5.31',
    },
    'jx806v5n': {
      'en': 'Booking cost',
      'es': ' Costo de la reserva',
      'fr': 'Coût de la réservation',
    },
    'im6mqt0c': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'wlznp75v': {
      'en': '16.00',
      'es': '16.00',
      'fr': '16h00',
    },
    'gzdait6f': {
      'en': 'Total',
      'es': 'Total',
      'fr': 'Total',
    },
    'qosqpewi': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    '5w256x3j': {
      'en': '21.31',
      'es': '21.31',
      'fr': '21h31',
    },
    'udrbhlhk': {
      'en': 'Checkout Now',
      'es': 'Finalizar Reserva',
      'fr': 'Finaliser la Réservation',
    },
    's9adsn9i': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Address
  {
    'urmw7no6': {
      'en': 'Address',
      'es': 'Dirección',
      'fr': 'Adresse',
    },
    'nteubdc4': {
      'en': 'Choose your location',
      'es': 'Elija su ubicación',
      'fr': 'Choisissez votre emplacement',
    },
    '4mrn5ye1': {
      'en':
          'Find the best culinary experience. Select a location to get started.',
      'es':
          'Encuentra la mejor experiencia gastronómica. Selecciona una ubicación para comenzar.',
      'fr':
          'Trouvez la meilleure expérience culinaire. Sélectionnez un emplacement pour commencer.',
    },
    'siafv1qg': {
      'en': 'Bogotá, CO',
      'es': 'Bogotá, CO',
      'fr': 'Bogotá, CO',
    },
    'j66jqcah': {
      'en': 'Payment Method',
      'es': 'Método de pago',
      'fr': 'Mode de paiement',
    },
    '13ahy3hd': {
      'en': 'Master Card',
      'es': 'Tarjeta maestra',
      'fr': 'Carte maîtresse',
    },
    'yxdyjb7k': {
      'en': '**** **** 1234',
      'es': '**** **** 1234',
      'fr': '**** **** 1234',
    },
    'wi0sirhi': {
      'en': 'Select location',
      'es': 'Seleccionar ubicación',
      'fr': 'Sélectionnez l\'emplacement',
    },
    '30qmpqtl': {
      'en': 'Confirm',
      'es': 'Confirmar',
      'fr': 'Confirmer',
    },
    'uta3xo88': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // AddNewCard
  {
    '1fls4zbe': {
      'en': 'Add New Card',
      'es': 'Agregar nueva tarjeta',
      'fr': 'Ajouter une nouvelle carte',
    },
    '8tqeg719': {
      'en': 'Card Number',
      'es': 'Número de tarjeta',
      'fr': 'Numéro de carte',
    },
    'whwwsqyj': {
      'en': 'Enter Card Number',
      'es': 'Ingrese el número de tarjeta',
      'fr': 'Entrez le numéro de carte',
    },
    'e1jkqztn': {
      'en': 'Card Holder Name',
      'es': 'Nombre del titular de la tarjeta',
      'fr': 'Nom du titulaire',
    },
    'qmfbitqj': {
      'en': 'Enter Holder Name',
      'es': 'Ingrese el nombre del titular',
      'fr': 'Entrez le nom du titulaire',
    },
    'z7a2vdhr': {
      'en': 'Expired',
      'es': 'Venció',
      'fr': 'Expiré',
    },
    'itfkuv3g': {
      'en': 'MM/YY',
      'es': 'MM/AA',
      'fr': 'MM/AA',
    },
    '70eg1hir': {
      'en': 'CVV Code',
      'es': 'codigo CVV',
      'fr': 'Code CVV',
    },
    '8bvf8fns': {
      'en': 'CCV',
      'es': 'CCV',
      'fr': 'CVC',
    },
    'v3wjfpim': {
      'en': 'Add Card',
      'es': 'Agregar tarjeta',
      'fr': 'Ajouter une carte',
    },
    '2nfguei3': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Notifications
  {
    '7xeyt3wn': {
      'en': 'Notification',
      'es': 'Notificación',
      'fr': 'Notification',
    },
    'v9zj1lqj': {
      'en': 'Today',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
    },
    'oqbwrpnh': {
      'en': 'Discount voucher!',
      'es': '¡Vale de descuento!',
      'fr': 'Bon de réduction !',
    },
    'h1prwlxt': {
      'en': '5min ago',
      'es': 'Hace 5 minutos',
      'fr': 'il y a 5 minutes',
    },
    'etwd1z7n': {
      'en': 'New update! Ver 1.87',
      'es': '¡Nueva actualización! Versión 1.87',
      'fr': 'Nouvelle mise à jour! Version 1.87',
    },
    'v0ypysbt': {
      'en': '20min ago',
      'es': 'Hace 20 minutos',
      'fr': 'il y a 20 minutes',
    },
    'geyy08x6': {
      'en': 'New message from Chris',
      'es': 'Nuevo mensaje de Chris',
      'fr': 'Nouveau message de Chris',
    },
    'sg7ky4vq': {
      'en': '35min ago',
      'es': 'Hace 35 minutos',
      'fr': 'il y a 35 minutes',
    },
    'lehiwmn2': {
      'en': 'Discount voucher! 50%',
      'es': '¡Vale de descuento! 50%',
      'fr': 'Bon de réduction ! 50%',
    },
    '8ccbuyp1': {
      'en': '2hour 60min ago',
      'es': 'Hace 2 horas 60 minutos',
      'fr': 'il y a 2 heures 60 minutes',
    },
    'wh324nbh': {
      'en': 'Yesterday',
      'es': 'Ayer',
      'fr': 'Hier',
    },
    'k3pnpz7c': {
      'en': 'Discount voucher!',
      'es': '¡Vale de descuento!',
      'fr': 'Bon de réduction !',
    },
    '544pu051': {
      'en': '5min ago',
      'es': 'Hace 5 minutos',
      'fr': 'il y a 5 minutes',
    },
    'a7l0sc65': {
      'en': 'New update! Ver 1.87',
      'es': '¡Nueva actualización! Versión 1.87',
      'fr': 'Nouvelle mise à jour! Version 1.87',
    },
    'g3f0az5d': {
      'en': '20min ago',
      'es': 'Hace 20 minutos',
      'fr': 'il y a 20 minutes',
    },
    '2to6yrso': {
      'en': 'New message from Chris',
      'es': 'Nuevo mensaje de Chris',
      'fr': 'Nouveau message de Chris',
    },
    'o2xb50hb': {
      'en': '35min ago',
      'es': 'Hace 35 minutos',
      'fr': 'il y a 35 minutes',
    },
    '514iimtt': {
      'en': 'Discount voucher! 50%',
      'es': '¡Vale de descuento! 50%',
      'fr': 'Bon de réduction ! 50%',
    },
    'hspwuxdq': {
      'en': '2hour 60min ago',
      'es': 'Hace 2 horas 60 minutos',
      'fr': 'il y a 2 heures 60 minutes',
    },
    'j6d49hyr': {
      'en': 'Discount voucher! 50%',
      'es': '¡Vale de descuento! 50%',
      'fr': 'Bon de réduction ! 50%',
    },
    'fggqlhln': {
      'en': '2hour 60min ago',
      'es': 'Hace 2 horas 60 minutos',
      'fr': 'il y a 2 heures 60 minutes',
    },
    'p9pn3mm5': {
      'en': 'Favorite',
      'es': 'Favorito',
      'fr': 'Préféré',
    },
  },
  // Setting
  {
    '82jnfyxo': {
      'en': 'Setting',
      'es': 'Configuración',
      'fr': 'Paramètre',
    },
    'k9p4o7mq': {
      'en': 'General',
      'es': 'General',
      'fr': 'Général',
    },
    'huf27lxh': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'ds506agm': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    '9b6hsp48': {
      'en': 'Notifications',
      'es': 'Notificaciones',
      'fr': 'Notifications',
    },
    'rnd1sxmy': {
      'en': 'Notification Setting',
      'es': 'Notificación de configuración',
      'fr': 'Paramètre de notification',
    },
    '5981i303': {
      'en': 'Security',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    '3vea7j2p': {
      'en': 'Language',
      'es': 'Idioma',
      'fr': 'Langue',
    },
    'cow5ksut': {
      'en': 'Preferencess',
      'es': 'Preferencias',
      'fr': 'Préférences',
    },
    'ivdshgsr': {
      'en': 'Legal and Policies',
      'es': 'Legales y Políticas',
      'fr': 'Mentions légales et politiques',
    },
    '33gpjjpl': {
      'en': 'Help & Support',
      'es': 'Servicio de asistencia',
      'fr': 'Support d\'aide',
    },
    '4k922abp': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    'ihvwbj05': {
      'en': 'Cook W/us Version 1.0.12 Build 24',
      'es': 'Cook W/us Versión 1.0.12 Compilación 24',
      'fr': 'Cook W/us Version 1.0.12 Build 24',
    },
    'tpcxi4d9': {
      'en': 'Setting',
      'es': 'Configuración',
      'fr': 'Paramètre',
    },
  },
  // EditProfile
  {
    'czlgmhds': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    '36zgxj4d': {
      'en': 'Username',
      'es': 'Nombre de usuario',
      'fr': 'Nom d\'utilisateur',
    },
    '3ia1b2s1': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
      'fr': 'Créez votre nom d\'utilisateur',
    },
    'y62t4x4v': {
      'en': 'Email ',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    'qoq8rd90': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    'frocuyfm': {
      'en': 'Phone Number',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    '2pgtsj9r': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    'vrtr6uvq': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
      'fr': 'Sauvegarder les modifications',
    },
    'ubo5xh9z': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ChangePassword
  {
    'qta47nw1': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    'm44q6y3o': {
      'en': 'New Password',
      'es': 'Nueva contraseña',
      'fr': 'nouveau mot de passe',
    },
    'ytk5ba6l': {
      'en': 'Enter new password',
      'es': 'Ingrese nueva clave',
      'fr': 'Entrez un nouveau mot de passe',
    },
    '8dzaf869': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
    },
    '8q91wovk': {
      'en': 'Confirm your new password',
      'es': 'Confirma tu nueva contraseña',
      'fr': 'Confirmez votre nouveau mot de passe',
    },
    'hi2yymxk': {
      'en': 'Chnage Now',
      'es': 'Cambiar ahora',
      'fr': 'Changement maintenant',
    },
    '92rkz0wl': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Language
  {
    'pw9fhsfe': {
      'en': 'Language',
      'es': 'Idioma',
      'fr': 'Langue',
    },
    '54vikyjk': {
      'en': 'Search language',
      'es': 'Idioma de búsqueda',
      'fr': 'Langue de recherche',
    },
    '6x0nymve': {
      'en': 'English',
      'es': 'Inglés',
      'fr': 'Anglais',
    },
    'lwrdsvca': {
      'en': 'Spanish',
      'es': 'Español',
      'fr': 'Espagnol',
    },
    'h8koak8c': {
      'en': 'French',
      'es': 'Francés',
      'fr': 'Français',
    },
    '3sa48wmg': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // NotificationSetting
  {
    'pv5ygd8b': {
      'en': 'Notifications',
      'es': 'Notificaciones',
      'fr': 'Notifications',
    },
    'inr065ip': {
      'en': 'Payment',
      'es': 'Pago',
      'fr': 'Paiement',
    },
    'ltse1dpj': {
      'en': 'Tracking',
      'es': 'Seguimiento',
      'fr': 'Suivi',
    },
    'ma7hjc40': {
      'en': 'Complete Order',
      'es': 'Orden completa',
      'fr': 'Complétez la commande',
    },
    'ohk8lp29': {
      'en': 'Notification',
      'es': 'Notificación',
      'fr': 'Notification',
    },
    'vmced3si': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Security
  {
    'xsh3ud2y': {
      'en': 'Security',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    '0cxkq1k7': {
      'en': 'Face ID',
      'es': 'identificación facial',
      'fr': 'Identification du visage',
    },
    'vf4xbxza': {
      'en': 'Remember Password',
      'es': 'Recordar contraseña',
      'fr': 'Se souvenir du mot de passe',
    },
    'rhp8x8nn': {
      'en': 'Touch ID',
      'es': 'identifición de toque',
      'fr': 'Toucher l\'identification',
    },
    '9e2s3fhc': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // HelpandSupport
  {
    'pwzylnu2': {
      'en': 'Help and Support',
      'es': 'Ayuda y apoyo',
      'fr': 'Aide et soutien',
    },
    '0hxomwjo': {
      'en': 'Search',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    'u7zay0at': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    'iq6peolc': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'iku16ozk': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    '70iqrdwa': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    '5j0pbo9z': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    'm803mq12': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'dhwvt3h7': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    'bkjcz8kj': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'clq57ljv': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    'vvpixpr1': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'leiu5g56': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LegalAndPolicies
  {
    'vkgb4h04': {
      'en': 'Legal and Policies',
      'es': 'Legales y Políticas',
      'fr': 'Mentions légales et politiques',
    },
    'icfwkxvp': {
      'en': 'Terms',
      'es': 'Términos',
      'fr': 'Termes',
    },
    'd216tz8f': {
      'en':
          '📌 By using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application.\n\nDefinitions:\n\nThe term \"we\" or \"us\" refers to Cook W/ Us, the owner of this application.\nThe term \"you\" refers to the user or viewer of our application.',
      'es':
          '📌 Al utilizar esta aplicación, aceptas cumplir y estar sujeto a los siguientes términos y condiciones. Por favor, léelos detenidamente. Si no estás de acuerdo con estos términos, no debes utilizar esta aplicación.\n\nDefiniciones:\n\nEl término \"nosotros\" o \"nuestro\" se refiere a Cook W/ Us, propietario de esta aplicación.\nEl término \"tú\" se refiere al usuario o visitante de nuestra aplicación.',
      'fr':
          '📌 En utilisant cette application, vous acceptez de vous conformer aux termes et conditions suivants. Veuillez les lire attentivement. Si vous n’acceptez pas ces conditions, vous ne devez pas utiliser cette application.\n\nDéfinitions:\n\nLe terme \"nous\" ou \"notre\" fait référence à Cook W/ Us, propriétaire de cette application.\nLe terme \"vous\" désigne l’utilisateur ou le visiteur de notre application.',
    },
    'mf4seg4j': {
      'en': 'Changes to the Service and/or Terms:',
      'es': 'Cambios al Servicio y/o Términos:',
      'fr': 'Modifications du Service et/ou des Conditions :',
    },
    '4aolvysc': {
      'en':
          'This application is provided \"as is,\" and we make no express or implied warranties regarding its functionality, operability, or use.\n\nWe expressly disclaim any liability for:\n✅ Direct, indirect, or consequential damages.\n✅ Loss of data, revenue, or profits.\n✅ Service interruptions for any reason.\n\n🔸 By continuing to use this application, you accept these terms and policies.',
      'es':
          'sta aplicación se proporciona \"tal cual\" y no ofrecemos garantías expresas o implícitas sobre su funcionalidad, operabilidad o uso.\n\nRenunciamos expresamente a cualquier responsabilidad por:\n✅ Daños directos, indirectos o consecuentes.\n✅ Pérdida de datos, ingresos o beneficios.\n✅ Interrupciones del servicio por cualquier causa.\n\n🔸 Si continúas utilizando esta aplicación, aceptas estos términos y políticas.',
      'fr':
          'Cette application est fournie \"telle quelle\" et nous ne donnons aucune garantie expresse ou implicite quant à sa fonctionnalité, son exploitabilité ou son utilisation.\n\nNous déclinons expressément toute responsabilité pour :\n✅ Dommages directs, indirects ou consécutifs.\n✅ Perte de données, de revenus ou de bénéfices.\n✅ Interruptions de service, quelle qu’en soit la cause.\n\n🔸 En continuant à utiliser cette application, vous acceptez ces termes et politiques.',
    },
    '8uluwyex': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // registerSuccess_modal
  {
    'vkxriblo': {
      'en': 'Registration Completed',
      'es': 'Registro Completado',
      'fr': 'Inscription Terminée',
    },
    'h2xdozlk': {
      'en':
          'Your account has been created successfully.\nNow you can log in and start discovering unique cooking experiences with local chefs.',
      'es':
          'Tu cuenta ha sido creada correctamente.\nAhora puedes iniciar sesión y comenzar a descubrir experiencias culinarias únicas con chefs locales.',
      'fr':
          'Votre compte a été créé avec succès.\nConnectez-vous maintenant pour découvrir des expériences culinaires uniques avec des chefs locaux.',
    },
    't4tt10im': {
      'en': 'Go to Home',
      'es': 'Ir al Inicio',
      'fr': 'Aller à l’Accueil',
    },
  },
  // ForgotPasswordPopup
  {
    '68da8o48': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
    },
    't0wp5kyz': {
      'en': 'Enter youe mail or phone number',
      'es': 'Ingrese su correo o número de teléfono',
      'fr': 'Entrez votre mail ou votre numéro de téléphone',
    },
    'laq1e1na': {
      'en': 'Email or Phone Number',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    '4wi8kjyp': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    '4ligppz0': {
      'en': 'Send Code',
      'es': 'Enviar código',
      'fr': 'Envoyer le code',
    },
  },
  // newPassword_modal
  {
    'rkilnmjw': {
      'en': 'Create New Password',
      'es': 'Crear nueva contraseña',
      'fr': 'Créer un nouveau mot de passe',
    },
    'ud34pzj3': {
      'en': 'Enter youe mail or phone number',
      'es': 'Ingrese su correo o número de teléfono',
      'fr': 'Entrez votre mail ou votre numéro de téléphone',
    },
    '96yt5u83': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    '6xsz8kht': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    'w8i0tlah': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    '667e4ujp': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    'ucakz1il': {
      'en': 'Change Password',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
  },
  // HotDealsCardItem
  {
    '5fyms2xp': {
      'en': '4.9',
      'es': '4.5',
      'fr': '4.5',
    },
    'dxto6avb': {
      'en': 'Creative Pastry: Design Your Own Cake',
      'es': 'Repostería creativa: Diseña tu propio pastel',
      'fr': 'Pâtisserie Créative : Concevez Votre Propre Gâteau',
    },
    '0i4n5ela': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'wsxtfrt1': {
      'en': '12.50',
      'es': '9.67',
      'fr': '9.67',
    },
  },
  // TopOfWeekItem
  {
    'k7parin2': {
      'en': 'Grilled meat with kepunari sauce',
      'es': 'Carne a la parrilla con salsa kepunari',
      'fr': 'Viande grillée à la sauce kepunari',
    },
    'ueizz2wr': {
      'en': '4.4',
      'es': '4.4',
      'fr': '4.4',
    },
    'uwy2rjgg': {
      'en': '12 Minute',
      'es': '12 minutos',
      'fr': '12 minutes',
    },
    'a1nj6sno': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'dswoy0wv': {
      'en': '12.05',
      'es': '12.05',
      'fr': '12.05',
    },
  },
  // FilterPopup
  {
    '8jo71kve': {
      'en': 'San Diego, CA',
      'es': 'San Diego, California, EE.UU.',
      'fr': 'San Diego, Californie',
    },
    '8eo5q4gq': {
      'en': 'Sort by',
      'es': 'Ordenar por',
      'fr': 'Trier par',
    },
    'qm6mzjkr': {
      'en': 'Recommended',
      'es': 'Recomendado',
      'fr': 'Recommandé',
    },
    '2s5gpezj': {
      'en': 'Nearest',
      'es': 'Más cercano',
      'fr': 'La plus proche',
    },
    'iclmvv58': {
      'en': 'Fastest',
      'es': 'Lo más rápido',
      'fr': 'Le plus rapide',
    },
    'ra08b12o': {
      'en': 'Categories',
      'es': 'Categorías',
      'fr': 'Catégories',
    },
    '9f5qk755': {
      'en': 'Hamburgers',
      'es': 'hamburguesas',
      'fr': 'Hamburgers',
    },
    'eicbxmen': {
      'en': 'Pizza',
      'es': 'Pizza',
      'fr': 'Pizza',
    },
    '1wc8f4us': {
      'en': 'Cookies',
      'es': 'Galletas',
      'fr': 'Biscuits',
    },
    'q4amxetw': {
      'en': 'Price Ranges',
      'es': 'Rangos de precios',
      'fr': 'Gammes de prix',
    },
    'hnv04kes': {
      'en': 'Apply Filter',
      'es': 'Aplicar filtro',
      'fr': 'Appliquer le filtre',
    },
  },
  // NearestLocationItem
  {
    'msl8hzk9': {
      'en': 'Delaska RIsaka',
      'es': 'Delaska RIsaka',
      'fr': 'Delaska RIsaka',
    },
    '5kn33zd0': {
      'en': '4.8',
      'es': '4.8',
      'fr': '4.8',
    },
    '0lvbcm6x': {
      'en': 'Close 10.45 PM',
      'es': 'Cierre 22:45',
      'fr': 'Fermeture à 22h45',
    },
  },
  // confirm_modal
  {
    'wss38bpn': {
      'en': 'Are you sure you want to activate your location?',
      'es': '¿Estás seguro de que quieres activar tu ubicación?',
      'fr': 'Etes-vous sûr de vouloir activer votre localisation ?',
    },
    '29xlhpns': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'zuga39cj': {
      'en': 'Yes, Enable',
      'es': 'Sí, habilitar',
      'fr': 'Oui, activer',
    },
  },
  // addToCard_modal
  {
    'lqsllr27': {
      'en': 'Pasta',
      'es': 'Pasta',
      'fr': 'Pâtes',
    },
    'a2p37cxh': {
      'en': 'Fresh Handmade Pasta',
      'es': 'Pasta Fresca Artesanal',
      'fr': 'Pâtes Fraîches Artisanales',
    },
    '4qzgey7i': {
      'en': ' Ingredients:',
      'es': 'Ingredientes',
      'fr': 'Ingrédients',
    },
    'akeff4oi': {
      'en': 'Flour',
      'es': 'Harina de trigo',
      'fr': 'Farine',
    },
    '03fv0zz3': {
      'en': '300 grm',
      'es': '300  gr',
      'fr': '300 gramme',
    },
    'k9ldv5en': {
      'en': 'Salt',
      'es': 'Sal',
      'fr': 'Sel',
    },
    'jv08oelk': {
      'en': '1 Pinch',
      'es': '1 pizca',
      'fr': '1  pincée',
    },
    'fas1uqhn': {
      'en': 'Note',
      'es': 'Nota',
      'fr': 'Note',
    },
    'cchz1fp1': {
      'en': 'Write a recommendation for the chef',
      'es': 'Escribe una recomendación para el chef.',
      'fr': 'Rédiger une recommandation pour le chef',
    },
    '2afi00zd': {
      'en': 'Add to cart',
      'es': 'Añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
  },
  // AddToCartItem
  {
    'u3pgx5vv': {
      'en': 'Noodles',
      'es': 'Fideos',
      'fr': 'Nouilles',
    },
    'uxac6ovs': {
      'en': 'Fried grill noodles with egg special',
      'es': 'Fideos fritos a la parrilla con huevo especial',
      'fr': 'Nouilles grillées frites avec œuf spécial',
    },
    '6ov4bl4b': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'bw669zmp': {
      'en': '6,17',
      'es': '6,17',
      'fr': '6,17',
    },
  },
  // AddExtraItem
  {
    '4wms16ni': {
      'en': 'Eggs',
      'es': 'Huevos',
      'fr': 'œufs',
    },
    'ejo6z1g1': {
      'en': '3 Pieces',
      'es': '3 Piezas',
      'fr': '3 Parties',
    },
  },
  // MyCartItem
  {
    'acxq8c0g': {
      'en': ' Artisan Bread Workshop',
      'es': 'Taller de Panadería Artesanal',
      'fr': 'Atelier Boulangerie Artisanale',
    },
    'z0atyn19': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'bkk2t9yp': {
      'en': '12.99',
      'es': '6.17',
      'fr': '6.17',
    },
  },
  // SelectLocationItem
  {
    '3u9ubti5': {
      'en': 'Downtown - La Candelaria',
      'es': 'Zona Centro - La Candelaria',
      'fr': ' Centre-ville - La Candelaria',
    },
    'wu7s1swt': {
      'en': 'Bogotá, Colombia',
      'es': 'Bogotá, Colombia',
      'fr': 'Bogotá, Colombia',
    },
  },
  // changePaymentMethod_modal
  {
    'vdt5chjy': {
      'en': 'Payment Method',
      'es': 'Método de pago',
      'fr': 'Mode de paiement',
    },
    'zt4sy9vi': {
      'en': 'Paypall',
      'es': 'pago',
      'fr': 'Paypal',
    },
    'omu8rwmb': {
      'en': 'sask****@mail.com',
      'es': 'sask****@mail.com',
      'fr': 'sask****@mail.com',
    },
    '4ujur370': {
      'en': 'Add Payment Method',
      'es': 'Añadir método de pago',
      'fr': 'Ajouter un mode de paiement',
    },
    'yx6c24gu': {
      'en': 'Upply the payment method',
      'es': 'Subir el método de pago',
      'fr': 'Ajouter le mode de paiement',
    },
  },
  // PaymentMethodItem
  {
    'clpxilmk': {
      'en': 'Mastercard',
      'es': 'Tarjeta MasterCard',
      'fr': 'MasterCard',
    },
    '7547er0v': {
      'en': '4827 8472 7424 ****',
      'es': '4827 8472 7424 ****',
      'fr': '4827 8472 7424 ****',
    },
  },
  // orderSuccess_modal
  {
    'ai8qoftl': {
      'en': ' Order Successfully Placed',
      'es': 'Reserva Realizada con Éxito',
      'fr': 'Réservation Réussie',
    },
    '8w3ex41n': {
      'en':
          'Your class is confirmed!\nA local chef is getting ready to give you a unique culinary experience.\nYou’ll receive a notification with class details shortly.',
      'es':
          '¡Tu clase está confirmada!\nUn chef local se está preparando para ofrecerte una experiencia culinaria única.\nTe enviaremos una notificación con los detalles de la clase.',
      'fr':
          'Un chef local se prépare à vous offrir une expérience culinaire inoubliable.\nVous recevrez bientôt une notification avec les détails du cours.',
    },
    'znwujg1g': {
      'en': 'Order Tracking',
      'es': 'Ver seguimiento de reserva',
      'fr': 'Suivre ma Réservation',
    },
  },
  // MyOrderItem
  {
    '0kkxg04l': {
      'en': 'Japanese Sushi Masterclass',
      'es': 'Masterclass de Sushi Japonés',
      'fr': 'Masterclass de Sushi Japonais',
    },
    'ul6qwuuh': {
      'en': 'Date',
      'es': 'Fecha',
      'fr': 'Date',
    },
    '7sa1sgoe': {
      'en': '29 dec 2022',
      'es': '29 dic 2022',
      'fr': '29 décembre 2022',
    },
    'v2q7ytxk': {
      'en': 'Price',
      'es': 'Precio',
      'fr': 'Prix',
    },
    '7ps520k7': {
      'en': '\$35.05',
      'es': '\$35.05',
      'fr': '35,05 \$',
    },
    'p1ci0hje': {
      'en': 'Track Class',
      'es': 'Seguir Clase',
      'fr': 'Suivre le Cours',
    },
    'qj8muj7x': {
      'en': 'View Classes',
      'es': 'Ver Clases',
      'fr': 'Voir les Cours',
    },
  },
  // ButtonOrderStatus
  {
    'eh2zj9q4': {
      'en': 'On Progress',
      'es': 'En progreso',
      'fr': 'En progrès',
    },
  },
  // FavoriteItem
  {
    '10hcqqzp': {
      'en': 'Cata y Maridaje de Vinos ',
      'es': 'Ensalada de verduras premium',
      'fr': 'Cours de Dégustation et d’Accords Mets-Vins ',
    },
    '3ipz56iu': {
      'en': '4.6',
      'es': '4.6',
      'fr': '4.6',
    },
    'h937j6qa': {
      'en': '2h',
      'es': '2h',
      'fr': '2h',
    },
    't8839z31': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'vr8mv808': {
      'en': '6.17',
      'es': '6.17',
      'fr': '6.17',
    },
  },
  // VoucherItem
  {
    'swpl0p0m': {
      'en': 'FoodCort Discount',
      'es': 'Descuento en FoodCort',
      'fr': 'Remise FoodCort',
    },
    '3qc1a3vq': {
      'en': '40% discount for purchases over ',
      'es': '40% de descuento por compras superiores',
      'fr': '40 % de réduction pour les achats supérieurs à',
    },
    'x19lsosk': {
      'en': '\$30 ',
      'es': '\$30',
      'fr': '30 \$',
    },
    'ug615tq2': {
      'en': ', valid for today only',
      'es': ', válido solo por hoy',
      'fr': ', valable aujourd\'hui seulement',
    },
    'himear42': {
      'en': 'Get Discount',
      'es': 'Reclame el descuento',
      'fr': 'Réclamez la réduction',
    },
    'u1f04mcl': {
      'en': '3',
      'es': '3',
      'fr': '3',
    },
  },
  // logOut_modal
  {
    '38q11wq9': {
      'en': 'Are you sure you want to logout?',
      'es': '¿Está seguro de que desea cerrar sesión?',
      'fr': 'Êtes-vous sûr de vouloir vous déconnecter?',
    },
    'mpj8eknt': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'p19zdwc8': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
  },
  // navigator
  {
    'w4ui9cw8': {
      'en': 'Pages',
      'es': 'paginas',
      'fr': 'Pages',
    },
    'r9x56x9c': {
      'en': 'Add New payment method',
      'es': 'Agregar nuevo método de pago',
      'fr': 'Ajouter un nouveau mode de paiement',
    },
    '74gdmugu': {
      'en': 'Address',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
    },
    '3kzxsnf1': {
      'en': 'Shopping Cart',
      'es': 'Carro de la compra',
      'fr': 'Panier',
    },
    'i3gyatzv': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    'sjrrg2g9': {
      'en': 'Checkout',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    'rtio6ax8': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    '1imgxewf': {
      'en': 'Details',
      'es': 'Detalles',
      'fr': 'Détails',
    },
    's2m6hsyu': {
      'en': 'Detail Two',
      'es': 'Detalle dos',
      'fr': 'Détail deux',
    },
    '5df5wb6d': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'sfo0wzam': {
      'en': 'Favorite',
      'es': 'Favorito',
      'fr': 'Préféré',
    },
    'cau894re': {
      'en': 'Help and Support',
      'es': 'Ayuda y apoyo',
      'fr': 'Aide et soutien',
    },
    'hu2inqjs': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
    'z0q5il1b': {
      'en': 'Home Two',
      'es': 'Hogar dos',
      'fr': 'Maison Deux',
    },
    'cryv162n': {
      'en': 'Change Language',
      'es': 'Cambiar idioma',
      'fr': 'Changer de langue',
    },
    'ubk0apu5': {
      'en': 'Policies',
      'es': 'Políticas',
      'fr': 'Stratégies',
    },
    'we3ke45m': {
      'en': 'Location',
      'es': 'Ubicación',
      'fr': 'Emplacement',
    },
    'hhdryzkt': {
      'en': 'Login',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    'm70he3lc': {
      'en': 'My Order',
      'es': 'Mi pedido',
      'fr': 'Ma commande',
    },
    '2lq6kli6': {
      'en': 'Notifications',
      'es': 'Notificaciones',
      'fr': 'Notifications',
    },
    'gnn9z841': {
      'en': 'Notification Setting',
      'es': 'Notificación de configuración',
      'fr': 'Paramètre de notification',
    },
    'tl1qab9r': {
      'en': 'Onboarding',
      'es': 'Inducción',
      'fr': 'Intégration',
    },
    'w4d6l0xg': {
      'en': 'Security',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    '6vbi0byh': {
      'en': 'Setting',
      'es': 'Configuración',
      'fr': 'Paramètre',
    },
    '3wz6lqp1': {
      'en': 'Verification',
      'es': 'Verificación',
      'fr': 'Vérification',
    },
    'cu78oruw': {
      'en': 'Voucher',
      'es': 'Vale',
      'fr': 'Bon',
    },
    'oj3cf9cd': {
      'en': 'Modals',
      'es': 'modales',
      'fr': 'Modaux',
    },
    'uv5rjs14': {
      'en': 'Add to cart',
      'es': 'Añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
    '6vf2cznr': {
      'en': 'Change payment method',
      'es': 'Cambiar método de pago',
      'fr': 'Changer la méthode de paiement',
    },
    '5o9cd5e2': {
      'en': 'Confirm',
      'es': 'Confirmar',
      'fr': 'Confirmer',
    },
    'c2evnsw5': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    '8l5zbjdz': {
      'en': 'New Password',
      'es': 'Nueva contraseña',
      'fr': 'nouveau mot de passe',
    },
    'askd0uki': {
      'en': 'Order Success',
      'es': 'Orden exitosa',
      'fr': 'Succès de la commande',
    },
    'kwl7igml': {
      'en': 'Register Success',
      'es': 'Registro exitoso',
      'fr': 'Inscription réussie',
    },
    '1z4hfai6': {
      'en': 'About Template',
      'es': 'Acerca de la plantilla',
      'fr': 'À propos du modèle',
    },
    '86o94vt0': {
      'en': 'Builderking',
      'es': 'constructor',
      'fr': 'Construction',
    },
  },
  // Miscellaneous
  {
    'b3u7as3r': {
      'en': 'Create Account',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'ctqamqlc': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
      'fr': 'Créez votre nom d\'utilisateur',
    },
    'umpm3yh5': {
      'en': 'Sign Up with Google',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    'u17s3o3i': {
      'en': 'Let\'s find the food you like',
      'es': 'Busquemos la comida que te gusta.',
      'fr': 'Trouvons la nourriture que vous aimez',
    },
    'm470nw6c': {
      'en': 'San Diego, CA',
      'es': 'San Diego, California, EE.UU.',
      'fr': 'San Diego, Californie',
    },
    'tkq1nhez': {
      'en': 'Recommended',
      'es': 'Recomendado',
      'fr': 'Recommandé',
    },
    'amak33fx': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    '5hctr45y': {
      'en': 'Add to Cart',
      'es': 'añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
    'fazi37bo': {
      'en': 'Get Discount',
      'es': 'Reclame el descuento',
      'fr': 'Réclamez la réduction',
    },
    '6on3f8zv': {
      'en': 'Enter voucher code',
      'es': 'Ingrese código de descuento',
      'fr': 'Entrer le code du bon',
    },
    'vc3k7k6z': {
      'en': 'Hamburgers',
      'es': 'hamburguesas',
      'fr': 'Hamburgers',
    },
    'cvmlykt8': {
      'en': 'On Progress',
      'es': 'En progreso',
      'fr': 'En progrès',
    },
    'ogz0ss6o': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'cpbcsw9m': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'zi2yt9e7': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'vnau18bv': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'lktg3dy4': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'fjabeg9r': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '7yw004o2': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'xsjq375t': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'xiyzhulx': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'm3u1mw7e': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '0wos4zsl': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'f7eqomwt': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'dvzeat75': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '4bdekwbm': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'rvm9rdle': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '3uxb43tw': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'g8ay9flm': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '0raeaqd3': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'j3d762mc': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'jzepjy1z': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'dlctomaa': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'fdy7k4vs': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'o37sr5xj': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'v8s1znh7': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'jg3a7edz': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'pcwstkno': {
      'en': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
