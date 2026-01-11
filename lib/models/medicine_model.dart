//store all medi info

class MedicineModel {
  final String category;
  final String medicineName;
  final String diseaseName;
  final String overview;
  final String symptoms;
  final String diagnosticTests;
  final String dosageAdult;
  final String dosageChild;
  final String sideEffects;

  MedicineModel({
    required this.category,
    required this.medicineName,
    required this.diseaseName,
    required this.overview,
    required this.symptoms,
    required this.diagnosticTests,
    required this.dosageAdult,
    required this.dosageChild,
    required this.sideEffects,
  });
}