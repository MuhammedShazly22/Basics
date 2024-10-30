
import 'package:flutter_projects/modules/shopApp/login/shopAppLoginScreen.dart';
import 'package:flutter_projects/shared/componants/componants.dart';

import '../network/local/cache_helper.dart';

void SignOut (context)
{

  CacheHelper.removeData(key: 'token').then((value)
  {
    if (value) {
      NavigateAndReplace(context, shopAppScreen());
    }
  });
}

String? token='';