import 'model_type.dart';


T parseModel<T>(dynamic json) => ModelType.getParseData<T>(json);
