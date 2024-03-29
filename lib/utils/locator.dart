import 'package:get_it/get_it.dart';
import 'package:workshop/navigation/router.dart';
import 'package:workshop/ui/flights/flights_vm.dart';
import 'package:workshop/ui/home/home_vm.dart';
import 'package:workshop/ui/tickets/tickets_vm.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
 locator.registerLazySingleton(() => Router());

 locator.registerFactory(() => HomeVM());
 locator.registerFactory(() => TicketsVM());
 locator.registerFactory(() => FlightsVM());
}