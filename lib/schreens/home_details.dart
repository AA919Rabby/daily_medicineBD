import 'package:daily_medicinebd/models/medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final MedicineModel data = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(data.medicineName, style: const TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.redAccent.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  Text(
                    data.diseaseName,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Category: ${data.category}",
                    style: TextStyle(color: Colors.grey[700], fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            buildSection("Overview", data.overview, Icons.info_outline),
            buildSection("Symptoms", data.symptoms, Icons.sick_outlined),
            buildSection("Diagnostic Tests", data.diagnosticTests, Icons.science_outlined),
            buildSection("Dosage (Adult/Women)", data.dosageAdult, Icons.person),
            buildSection("Dosage (Child)", data.dosageChild, Icons.child_care),
            buildSection("Side Effects", data.sideEffects, Icons.warning_amber_rounded, isWarning: true),
          ],
        ),
      ),
    );
  }
  //widget
   buildSection(String title, String content, IconData icon, {bool isWarning = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: isWarning ? Colors.red : Colors.blue),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isWarning ? Colors.red : Colors.blue[800],
                    ),
                  ),
                ],
              ),
              const Divider(),
              Text(
                content,
                style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}