import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ข้อมูลส่วนตัว',
      debugShowCheckedModeBanner: false, // ซ่อนแถบ "DEBUG" ที่มุมขวาบน
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(), // หน้าหลัก
        '/second': (context) => const SecondPage(), // หน้าที่สอง (Social Profile Style)
      },
      theme: ThemeData(
        fontFamily: 'Roboto', // ใช้ฟอนต์มาตรฐานที่อ่านง่าย
        appBarTheme: const AppBarTheme(
          color: Color(0xFF1976D2), // สีฟ้าเข้มสำหรับหน้าหลัก
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
    );
  }
}

// ==========================================================
// 1. MyHomePage (หน้าหลัก - ข้อมูลส่วนตัว)
// ==========================================================

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // ข้อมูลที่ได้รับการอัปเดตตามคำขอ
  final String profileName = "Ratthaphum Khampha";
  final String profileEmail = "ratthaphum.khampha@e-tech.ac.th";
  final String phoneNumber = "085-806-3836";
  final String dateOfBirth = "20 กันยายน 2548";
  final String address = "สมุทรปราการ";
  final String education = "วิทยาลัยเทคโนโลยีภาคตะวันออก (อี.เทค)";

  // Placeholder URL สำหรับรูปโปรไฟล์ (ใช้ URL เดิม)
  final String profileImageUrl = "https://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721829171970.jpg";

  @override
  Widget build(BuildContext context) {
    // ขนาดของหน้าจอ
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                          profileImageUrl,
                          width: 110,
                          height: 110,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // แสดงไอคอนคนถ้าโหลดรูปไม่ได้
                            return const Icon(
                              Icons.person,
                              size: 110,
                              color: Colors.white70,
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

                  const SizedBox(height: 30),

                  // **********************************************
                  // ************ ปุ่มสำหรับไปหน้า 2 ***************
                  // **********************************************
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // นำทางไปยังหน้า '/second' ที่ถูกกำหนดไว้ใน MaterialApp
                        Navigator.pushNamed(context, '/second');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        "ไปยังหน้า 2",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // **********************************************

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

// ==========================================================
// 2. SecondPage (หน้าที่สอง - Social Profile Style)
// ==========================================================

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  // ข้อมูลจำลองสำหรับหน้าโปรไฟล์โซเชียล
  final String socialProfileName = "carf";
  final String socialUsername = "gengleedd";
  final String profilePicUrl = "https://placehold.co/110x110/CCCCCC/FFFFFF?text=W"; // รูปโปรไฟล์ placeholder
  final String followingCount = "29";
  final String followersCount = "45";
  final String likesCount = "1057";

  // URL รูปภาพสำหรับ Grid (ใช้ Placeholder แทนรูปแมว)
  final List<String> postImageUrls = const [
    "https://placehold.co/200x300/F4D03F/17202A?text=Video+1",
    "https://placehold.co/200x300/5DADE2/17202A?text=Video+2",
    "https://placehold.co/200x300/48C9B0/17202A?text=Video+3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // AppBar ว่างเปล่าเพื่อให้เนื้อหาเริ่มต้นจากขอบบนสุด
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0, // ซ่อน AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- ส่วนบน: รูปโปรไฟล์, ชื่อ, สถิติ ---
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10, left: 15, right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // วงกลมรูปโปรไฟล์
                      ClipOval(
                        child: Image.network(
                          profilePicUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // สถิติ (กำลังติดตาม, ผู้ติดตาม, ถูกใจ)
                      Row(
                        children: [
                          _buildStatColumn(followingCount, 'กำลังติดตาม'),
                          const SizedBox(width: 25),
                          _buildStatColumn(followersCount, 'ผู้ติดตาม'),
                          const SizedBox(width: 25),
                          _buildStatColumn(likesCount, 'ถูกใจและบันทึก'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // ชื่อและชื่อผู้ใช้
                  Row(
                    children: [
                      Text(
                        socialProfileName,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 5),
                      const Icon(Icons.verified, color: Colors.blue, size: 18), // Icon Verified
                    ],
                  ),
                  const SizedBox(height: 2),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      socialUsername,
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),

            // --- ปุ่ม (ติดตาม) และปุ่ม (แชร์) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow, // สีเหลืองคล้ายในภาพ
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        elevation: 0,
                      ),
                      child: const Text(
                        'ติดตาม',
                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        elevation: 0,
                      ),
                      child: const Icon(Icons.share, color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- ส่วน Tabs (Grid View) ---
            // สร้าง Tab Bar ชั่วคราว (เนื่องจากใช้ SingleChildScrollView จึงไม่สามารถใช้ SliverList แบบ NestedScrollView ได้)
            Container(
              height: 40,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.black12, width: 0.5)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.grid_on, color: Colors.black),
                  Icon(Icons.favorite_border, color: Colors.grey),
                ],
              ),
            ),

            // Grid View แสดงวิดีโอ/รูปภาพ
            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), // ป้องกันการ Scroll ซ้ำ
              itemCount: postImageUrls.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 คอลัมน์เหมือนในรูป
                childAspectRatio: 0.65, // อัตราส่วนที่เหมาะกับวิดีโอแนวตั้ง
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    image: DecorationImage(
                      image: NetworkImage(postImageUrls[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // แสดงจำนวนวิว (จำลอง)
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(5),
                  child: const Row(
                    children: [
                      Icon(Icons.play_arrow, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '1.2k', // จำนวนวิวจำลอง
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          shadows: [
                            Shadow(color: Colors.black, blurRadius: 2),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 40),

            // ปุ่มสำหรับกลับไปยังหน้าแรก
            ElevatedButton(
              onPressed: () {
                // ใช้ Navigator.pop(context) เพื่อย้อนกลับไปยังหน้าก่อนหน้า (MyHomePage)
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 5,
              ),
              child: const Text(
                "กลับหน้าหลัก",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Widget ย่อยสำหรับคอลัมน์สถิติ (ตัวเลข/ข้อความ)
  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}