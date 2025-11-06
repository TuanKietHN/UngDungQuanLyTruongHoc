
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/giangvien_repository.dart';
import '../../data/models/lophocphan_model.dart';
import '../../data/models/sinhvien_model.dart';

/// Provide a repository so other providers can reuse the same instance.
final giangVienRepositoryProvider = Provider<GiangVienRepository>((ref) {
  return GiangVienRepository();
});

/// Provider for list of LopHocPhan
final lopHocPhanControllerProvider =
StateNotifierProvider<LopHocPhanController, AsyncValue<List<LopHocPhan>>>(
      (ref) {
    final repo = ref.watch(giangVienRepositoryProvider);
    return LopHocPhanController(repo);
  },
);

class LopHocPhanController
    extends StateNotifier<AsyncValue<List<LopHocPhan>>> {
  final GiangVienRepository repository;

  LopHocPhanController(this.repository) : super(const AsyncValue.loading()) {
    loadLopHocPhan();
  }

  Future<void> loadLopHocPhan() async {
    try {
      final list = await repository.fetchLopHocPhan();
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Force refresh
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    await loadLopHocPhan();
  }
}

/// Provider for students by LopHocPhan (autoDispose)
final sinhVienByLopHPControllerProvider =
StateNotifierProvider.autoDispose<SinhVienByLopHPController,
    AsyncValue<List<SinhVien>>>((ref) {
  final repo = ref.watch(giangVienRepositoryProvider);
  return SinhVienByLopHPController(repo);
});

class SinhVienByLopHPController
    extends StateNotifier<AsyncValue<List<SinhVien>>> {
  final GiangVienRepository repository;

  SinhVienByLopHPController(this.repository)
      : super(const AsyncValue.data(<SinhVien>[]));

  /// Fetch students for a given LopHocPhan id/code
  Future<void> fetch(String maLopHocPhan) async {
    state = const AsyncValue.loading();
    try {
      final list =
      await repository.fetchSinhVienByLopHocPhan(maLopHocPhan); // repo method
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
