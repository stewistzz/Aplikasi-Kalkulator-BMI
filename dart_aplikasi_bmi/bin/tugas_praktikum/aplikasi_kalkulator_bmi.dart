// main.dart
import 'dart:io';

void main() {
  List<Map<String, dynamic>> riwayat = []; // Simulasi beberapa input
  hitungBMI(170, 65, riwayat);
  hitungBMI(165, 75, riwayat);
  hitungBMI(180, 85, riwayat); // Tampilkan riwayat menggunakan perulangan
  tampilkanRiwayat(riwayat);

  // melakukan input dari kalkulator BMI
  print("Masukkan Tinggi Badan Anda : ");
  // input user
  String? tinggiBadan = stdin.readLineSync();
  double? tinggiConvert = double.tryParse(tinggiBadan ?? '');

  print("Masukkan Tinggi Badan Anda : ");
  String? beratBadan = stdin.readLineSync();
  double? beratConvert = double.tryParse(beratBadan ?? '');

  // masukkan data ke parameter untuk hitungBMI
  if (tinggiConvert != null && beratConvert != null) {
    hitungBMI(tinggiConvert, beratConvert, riwayat);
  } else {
    print("Input tidak valid. Mohon masukkan angka yang benar untuk tinggi dan berat badan.");
  }
}

void hitungBMI(
  double tinggiCm,
  double beratKg,
  List<Map<String, dynamic>> riwayat) {
  // Konversi tinggi dari cm ke m
  double tinggiM = tinggiCm / 100; // Hitung BMI
  double bmi = beratKg / (tinggiM * tinggiM); // Tentukan kategori menggunakan percabangan
  String kategori;
  if (bmi < 18.5) {
    kategori = "Kurus";
  } else if (bmi < 25) {
    kategori = "Normal";
  } else if (bmi < 30) {
    kategori = "Gemuk";
  } else {
    kategori = "Obesitas";
  } // Simpan hasil ke riwayat
  riwayat.add({
    'tinggi': tinggiCm,
    'berat': beratKg,
    'bmi': bmi,
    'kategori': kategori,
  });
}