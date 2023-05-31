// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:bip32/bip32.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:hex/hex.dart';
import 'package:pointycastle/digests/ripemd160.dart';
import 'package:pointycastle/digests/sha256.dart';
import 'package:qr_flutter/qr_flutter.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HD Wallet Address Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QRCodeGenerator(),
    );
  }
}

// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('HD Wallet Address Generator'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             ElevatedButton(
// //               onPressed: () async {
// //                 await generateAddresses();
// //               },
// //               child: Text('Generate Addresses'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// // Future<void> generateAddresses() async {
// //   final sha256Digest = SHA256Digest();
// //   final ripemd160Digest = RIPEMD160Digest();
// //   // Generate a new mnemonic
// //   final mnemonic = bip39.generateMnemonic();
// //   // Derive the master seed from the mnemonic
// //   final seed = bip39.mnemonicToSeed(mnemonic);
// //   // Derive the master node from the seed
// //   final node = BIP32.fromSeed(seed);
// //   // Generate 10 addresses from the HD wallet
// //   for (var i = 0; i < 10; i++) {
// //     final child = node.derivePath("m/44'/0'/0'/0/$i");
// //     final publicKey = child.publicKey;
// //     final addressBytes = sha256Digest.process(publicKey);
// //     final addressBytesHash = ripemd160Digest.process(addressBytes);
// //     final address = HEX.encode(addressBytesHash);
// //     print('Address $i: $address');
// //   }
// // }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<String> addresses = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HD Wallet Address Generator'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 await generateAddresses();
//               },
//               child: Text('Generate Addresses'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: addresses.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: ListTile(
//                       title: Text('Address ${index + 1}'),
//                       subtitle: QrImage(
//                         data: addresses[index],
//                         version: QrVersions.auto,
//                         size: 200.0,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> generateAddresses() async {
//     final sha256Digest = SHA256Digest();
//     final ripemd160Digest = RIPEMD160Digest();
//     // Generate a new mnemonic
//     final mnemonic = bip39.generateMnemonic();

//     // Derive the master seed from the mnemonic
//     final seed = bip39.mnemonicToSeed(mnemonic);

//     // Derive the master node from the seed
//     final node = BIP32.fromSeed(seed);

//     List<String> generatedAddresses = [];

//     // Generate 10 addresses from the HD wallet
//     for (var i = 0; i < 10; i++) {
//       final child = node.derivePath("m/44'/0'/0'/0/$i");
//       final publicKey = child.publicKey;
//       final addressBytes = sha256Digest.process(publicKey);
//       final addressBytesHash = ripemd160Digest.process(addressBytes);
//       final address = HEX.encode(addressBytesHash);
//       generatedAddresses.add(address);
//     }

//     setState(() {
//       addresses = generatedAddresses;
//     });
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: QRCodeGenerator(),
  ));
}

class QRCodeGenerator extends StatelessWidget {
  final List<String> addresses = [
    'TLbtRcm6FbPcXQWJPrd83xziruK8bkguXY',
    'TQyB4HqXzPiezM9vwWqvYurP4kTcR5Ass5',
    'TT3PCqiz6xMzdHb8JgDEoaH9CGrey2Gf6n',
    'TLgjE6DjHeK2kgWdYSp7cdEPwFV3NvVcrN',
    'TB6X9FfwzzuRTtXC1bbnTWLmxPJwxxKWGp',
    'TULeosiHEtjQbbioiRfREYxjzpEScu7zyE',
    'THf1geR5AR2Syqyuqv32VYdGmJkSeSVZFP',
    'TEKQuQDoHwPswk33GLKeKyMrUyEQwgCrwu',
    'TShiMWCKbknHwHGvm6MgPvGUTFb77MWjHA',
    'TEn9s1FZVtMb1Bw3vjmDEEhc8k76EqZoAH',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code Generator')),
      body: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(20.0),
          child: QrImage(
            data: addresses[index],
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
      ),
    );
  }
}
