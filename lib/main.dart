import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ข้อมูลส่วนตัว',
      debugShowCheckedModeBanner: false, // ซ่อนแถบ "DEBUG" ที่มุมขวาบน
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // ข้อมูลที่ได้รับการอัปเดตตามคำขอ
  final String profileName = "Ratthaphum Khampha";
  final String profileEmail = "ratthaphum.khampha@e-tech.ac.th";
  final String phoneNumber = "085-806-3836";
  final String dateOfBirth = "20 กันยายน 2548";
  final String address = "สมุทรปราการ";
  final String education = "วิทยาลัยเทคโนโลยีภาคตะวันออก (อี.เทค)";

  // Placeholder URL สำหรับรูปโปรไฟล์แมว (แทนรูปภาพเดิม)
  // เนื่องจากไม่สามารถใช้รูปจากเครื่องได้ จึงใช้ Placeholder แทน
  final String profileImageUrl = "https://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721829171970.jpg";

  @override
  Widget build(BuildContext context) {
    // ขนาดของหน้าจอ
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // ตัด Safe Area ออก เพื่อให้ส่วนหัวสีฟ้าทอดยาวไปถึงขอบด้านบนของหน้าจอ
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- ส่วนหัวสีน้ำเงินเข้ม ---
            Container(
              width: double.infinity,
              height: screenHeight * 0.35, // กำหนดความสูงประมาณ 35% ของหน้าจอ
              decoration: const BoxDecoration(
                color: Color(0xFF1976D2), // สีฟ้าเข้ม
              ),
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
                child: Column(
                  children: [
                    const Text(
                      "ข้อมูลส่วนตัว",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    // วงกลมรูปโปรไฟล์
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3), // ขอบสีขาวตามภาพต้นฉบับ
                      ),
                      child: ClipOval(
                        child: Image.network(
                          profileImageUrl, // ใช้ Placeholder
                          width: 110,
                          height: 110,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.person,
                              size: 110,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // ชื่อ
                    Text(
                      profileName,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    // อีเมล
                    Text(
                      profileEmail,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // --- ส่วนเนื้อหา (ข้อมูลส่วนตัว) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "ข้อมูลส่วนตัว",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // รายละเอียดข้อมูลแต่ละแถว
                  DataRowItem(
                    icon: Icons.phone_enabled,
                    iconColor: Colors.pink.shade300,
                    title: "เบอร์โทรศัพท์",
                    value: phoneNumber,
                  ),
                  DataRowItem(
                    icon: Icons.cake,
                    iconColor: Colors.purple.shade300,
                    title: "วันเกิด",
                    value: dateOfBirth,
                  ),
                  DataRowItem(
                    icon: Icons.location_on,
                    iconColor: Colors.orange.shade300,
                    title: "ที่อยู่",
                    value: address,
                  ),
                  DataRowItem(
                    icon: Icons.school,
                    iconColor: Colors.deepPurple.shade300,
                    title: "การศึกษา",
                    value: education,
                  ),

                  // ลบปุ่ม "ไปยังหน้า 2" ออกแล้ว
                  const SizedBox(height: 30),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget สำหรับข้อมูลแต่ละแถว (Icon, Title, Value)
class DataRowItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;

  const DataRowItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon ที่มีพื้นหลังวงกลมสีอ่อน
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 15),
          // ข้อมูล
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}