import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/lophocphan_model.dart';
import '../controllers/giangvien_controller.dart';

class QuanLyLopScreen extends ConsumerWidget {
  const QuanLyLopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lopHocPhanState = ref.watch(lopHocPhanControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý lớp học phần'),
        centerTitle: true,
      ),
      body: lopHocPhanState.when(
        data: (list) {
          if (list.isEmpty) {
            return const Center(
              child: Text(
                'Hiện tại bạn chưa phụ trách lớp học phần nào.',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final lopHP = list[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: const Icon(Icons.class_, color: Colors.blueAccent),
                  title: Text(
                    lopHP.tenMonHoc ?? 'Không rõ môn học',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(
                    'Lớp: ${lopHP.tenLopHocPhan ?? '---'}\n'
                        'Sĩ số: ${lopHP.soLuongSV ?? 0} SV\n'
                        'Thời gian: ${lopHP.ngayBatDau ?? ''} - ${lopHP.ngayKetThuc ?? ''}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Chuyển sang màn hình chi tiết lớp học phần
                    Navigator.pushNamed(context, '/thongtinlop',
                        arguments: lopHP);
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Lỗi tải dữ liệu: $err')),
      ),
    );
  }
}
