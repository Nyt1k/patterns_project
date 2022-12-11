import 'dart:convert';

import 'package:patterns_project/adapter_pattern/models/models.dart';

abstract class IChecksApi {
  List<Check> getChecks();
}

class MasterCardAdapter implements IChecksApi {
  final api = MasterCardApi();

  @override
  List<Check> getChecks() {
    final checkList = jsonDecode(api.getChecks()) as List;

    return checkList
        .map(
          (check) => Check(
            check['Id'],
            check['AddData'],
          ),
        )
        .toList();
  }
}

class PayPalAdapter implements IChecksApi {
  final api = PayPalApi();

  @override
  List<Check> getChecks() {
    final checkList = jsonDecode(api.getChecks()) as List;

    return checkList
        .map(
          (check) => Check(
            check['userId'],
            check['Data'],
          ),
        )
        .toList();
  }
}

class AdapterApp {
  static void getAllChecks() {
    final IChecksApi api1 = MasterCardAdapter();
    final IChecksApi api2 = PayPalAdapter();

    final allChecks = api1.getChecks() + api2.getChecks();

    for (var element in allChecks) {
      print('${element.id} ${element.additionalData}');
    }
  }
}
