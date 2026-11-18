// Student: Kayitanirwa Shalihah
// Reg no: 264552024
const String regNo = '264552024';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// Part B2: Count vowels
int countVowels(String text) {
  // by KS
  String lower = text.toLowerCase();
  String vowels = 'aeiou';
  int count = 0;
  for (int i = 0; i < lower.length; i++) {
    if (vowels.contains(lower[i])) {
      count++;
    }
  }
  return count;
}

// Part B3: Initials
String initials(String fullName) {
  // by KS
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) {
    return '';
  }
  List<String> parts = trimmed.split(RegExp(r'\s+'));
  String result = '';
  for (String part in parts) {
    if (part.isNotEmpty) {
      result += '${part[0].toUpperCase()}.';
    }
  }
  return result;
}

// Part C5: Right-aligned triangle
void drawTriangle(int height) {
  // by KS
  if (height <= 0) {
    return;
  }
  for (int row = 1; row <= height; row++) {
    String spaces = ' ' * (height - row);
    String symbol = (row % 2 == 1) ? '*' : '#';
    String symbols = symbol * row;
    print('$spaces$symbols');
  }
}

// Part D2: MoMo receipt printer (using while loops)
int momoFee(int amount) {
  // by KS
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String maskPhone(String phone) {
  // by KS
  if (phone.length != 10) {
    return 'INVALID';
  }
  String prefix = phone.substring(0, 3);
  String suffix = phone.substring(phone.length - 2);
  String maskedMiddle = '';
  int i = 0;
  while (i < 5) {
    maskedMiddle += '*';
    i++;
  }
  return '$prefix$maskedMiddle$suffix';
}

void main() {
  // by KS
  print('Reg no: $regNo | D = $d | T = $t');

  // B2 test
  String myName = 'Kayitanirwa Shalihah';
  int vowelCount = countVowels(myName);
  print('$myName has $vowelCount vowels');

  // B3 tests
  print(initials(myName));
  print(initials('  ana   uwase  '));
  print(initials('   '));

  // C5 tests
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2 receipt printer (while loop from 1 to D + 3)
  int i = 1;
  int totalFees = 0;
  String phone = '0788123456';
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i: $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}