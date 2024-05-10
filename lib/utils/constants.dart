abstract final class TelescopeUtils {
  static const String _equatorial = 'Equatorial';
  static const String _altazimuth = 'Altazimuth';
  static const String _refractor = 'Refractor';
  static const String _reflector = 'Reflactor';
  static const String _catadioptric = 'Catadioptric';
  static const String _autoFocus = 'Auto Focus';
  static const String _manualFocus = 'Manual Focus';
  static const String _autoAndManualFocus = 'Auto & Manual Focus';
  static const mountList = [_equatorial,_altazimuth];
  static const typeList = [_refractor, _reflector,_catadioptric,];
  static const focusList = [_autoFocus, _manualFocus,_autoAndManualFocus,];

}

const String telescopeImageDirectory = 'Telescopes/';