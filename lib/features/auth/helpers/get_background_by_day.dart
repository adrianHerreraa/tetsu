import 'package:tetsugym/core/constants/rkb_assets.dart';
import 'package:tetsugym/utils/date_time/date_time_utils.dart';

class GetBackgroundByDay {
  String getBackgroundByDay() {
    final dayInt = DateTimeUtils().getDayOfWeekNumber();

    switch (dayInt) {
      case 1:
        return RkbAssets.backgroundLogginOne;
      case 2:
        return RkbAssets.backgroundLogginTwo;
      case 3:
        return RkbAssets.backgroundLogginThree;
      case 4:
        return RkbAssets.backgroundLogginFour;
      case 5:
        return RkbAssets.backgroundLogginFive;
      case 6:
        return RkbAssets.backgroundLogginSix;
      case 7:
        return RkbAssets.backgroundLogginSeven;
      default:
        return RkbAssets.backgroundLogginOne;
    }
  }
}
