// import 'dart:async';
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// class InternetState extends StatefulWidget {
//   const InternetState({ Key? key }) : super(key: key);
//   @override
//   _InternetStateState createState() => _InternetStateState();
// }
// class _InternetStateState extends State<InternetState> {
//   String _connectionStatus = 'Unknown';
//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
//   @override
//   void initState() {
//     super.initState();
//     initConnectivity();
//     _connectivitySubscription =
//         _connectivity.onConnectivityChanged.listen( (ConnectivityResult result) {
//           if(result == ConnectivityResult.wifi) {
//             print('Wifi');
//           } else if(result == ConnectivityResult.mobile) {
//             print('mobile');
//           } else if(result == ConnectivityResult.none) {
//             print('No internet!');   
//           } else {
//               print('Connection failed');
//           }
//           }
//         );
//   }
//   @override
//   void dispose() {   
//     super.dispose();
//     _connectivitySubscription.cancel();
//   }
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initConnectivity() async {
//     ConnectivityResult result = ConnectivityResult.none;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       result = await _connectivity.checkConnectivity();
//     } on PlatformException catch (e) {
//       print(e.toString());
//     }
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) {
//       return Future.value(null);
//     }
//     return _updateConnectionStatus(result);
//   } 
//   @override
//   Widget build(BuildContext context) {
//     return Text('Connection Status: $_connectionStatus');
//   }
//    Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     //  if(result == ConnectivityResult.wifi) {
//     //    print('Wifi');
//     //  } else if(result == ConnectivityResult.mobile) {
//     //    print('mobile');
//     //  } else if(result == ConnectivityResult.none) {
//     //    print('No internet!');   
//     //  } else {
//     //     print('Connection failed');
//     //  }
//     switch (result) {
//       case (ConnectivityResult.wifi):
//       case ConnectivityResult.mobile:
//       case ConnectivityResult.none:
//         setState(() => _connectionStatus = result.toString());
//         break;
//       default:
//         print('Connection failed');
//         setState(() => _connectionStatus = 'Failed to get connectivity.');
//         break;
//     }
//   }
// }