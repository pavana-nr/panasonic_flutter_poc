import 'package:get/get.dart';
import 'package:newdemoproject/routes/router.dart';
import 'package:newdemoproject/views/stain_genius/machine_wash.dart';
import 'package:newdemoproject/views/stain_genius/main_stain_categories.dart';
import 'package:newdemoproject/views/stain_genius/stain_pre_treatment.dart';
import 'package:newdemoproject/views/stain_genius/sub_stain_categories.dart';
import 'package:newdemoproject/views/wash_cycle/wash_cycle.dart';

import '../main.dart';

class Routes {
  Routes._();
  static final routes = [
    GetPage(name: Screens.home, page: () => MyApp()),
    GetPage(name: Screens.mainCategories, page: () => MainStainCategories()),
    GetPage(name: Screens.machineWash, page: () => MachineWash()),
    GetPage(
      name: Screens.subCategories,
      page: () => SubStainCategories(),
    ),
    GetPage(
      name: Screens.preTreatment,
      page: () => StainPretreatment(),
    ),
    GetPage(
      name: Screens.washCycle,
      page: () => WashCycle(),
    ),
  ];
}
