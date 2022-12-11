class Check {
  final String id;
  final String additionalData;

  Check(this.id, this.additionalData);
}

class MasterCardApi {
  String getChecks() {
    return '[{"Id": "User1", "AddData": "Simple data"}]';
  }
}

class PayPalApi {
  String getChecks() {
    return '[{"userId": "User2", "Data": "Simple data2"}]';
  }
}