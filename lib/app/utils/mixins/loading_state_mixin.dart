import 'package:get/get.dart';
import 'package:swiss_army_component/swiss_army_component.dart';
import '../../data/api/exceptions/api_exceptions.dart';
import '../../widgets/snackbar.dart';

mixin LoadingStateMixin on GetxController {
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  Future<T> runWithLoading<T>(
    Future<T> Function() action, {
    bool isRefresh = false,
  }) async {
    try {
      if (!isRefresh) {
        isLoading = true;
      }
      return await action();
    } on RequestCancelledException {
      return Future.error('Cancelled');
    } catch (e) {
      appLog('LoadingStateMixin: Caught error', e);
      if (e is ApiException) {
        KoraSnackbar.showError(title: 'Error', message: e.message);
      } else {
        KoraSnackbar.showError(
          title: 'Error',
          message: 'An unexpected error occurred.',
        );
      }
      rethrow;
    } finally {
      if (!isRefresh) {
        isLoading = false;
      }
    }
  }
}
