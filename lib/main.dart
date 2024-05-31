// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }




// import 'package:flutter/material.dart';

// void main() {
//   runApp(const SalesTrackerApp());
// }

// class SalesTrackerApp extends StatelessWidget {
//   const SalesTrackerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sales Tracker',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: const SalesTrackerHome(),
//     );
//   }
// }

// class SalesTrackerHome extends StatefulWidget {
//   const SalesTrackerHome({super.key});

//   @override
//   _SalesTrackerHomeState createState() => _SalesTrackerHomeState();
// }

// class _SalesTrackerHomeState extends State<SalesTrackerHome> {
//   String userName = '';
//   late String selectedCustomer;
//   late String selectedProduct;
//   double productPrice = 0.0;
//   int productQuantity = 0;
//   double totalSales = 0.0;
//   double cumulativeSales = 0.0;
//   final double monthlyTarget = 5000.0;

//   final List<String> customers = ['Customer A', 'Customer B', 'Customer C'];
//   final List<Map<String, dynamic>> products = [
//     {'name': 'Product 1', 'price': 10.00},
//     {'name': 'Product 2', 'price': 20.00},
//     {'name': 'Product 3', 'price': 30.00},
//   ];

//   void updateTotalSales() {
//     setState(() {
//       totalSales = productPrice * productQuantity;
//       cumulativeSales += totalSales;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sales Tracker'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Sales Tracker',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'Date & Time: ${DateTime.now().toString()}',
//               style: const TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               decoration: const InputDecoration(labelText: 'Your Name'),
//               onChanged: (value) {
//                 setState(() {
//                   userName = value;
//                 });
//               },
//             ),
//             DropdownButton<String>(
//               hint: const Text('Select Customer'),
//               value: selectedCustomer,
//               onChanged: (String newValue) {
//                 setState(() {
//                   selectedCustomer = newValue;
//                 });
//               },
//               items: customers.map((String customer) {
//                 return DropdownMenuItem<String>(
//                   value: customer,
//                   child: Text(customer),
//                 );
//               }).toList(),
//             ),
//             DropdownButton<String>(
//               hint: const Text('Select Product'),
//               value: selectedProduct,
//               onChanged: (String newValue) {
//                 setState(() {
//                   selectedProduct = newValue;
//                   productPrice = products
//                       .firstWhere((product) => product['name'] == newValue)['price'];
//                 });
//               },
//               items: products.map((product) {
//                 return DropdownMenuItem<String>(
//                   value: product['name'],
//                   child: Text(product['name']),
//                 );
//               }).toList(),
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Product Price',
//                 hintText: productPrice.toStringAsFixed(2),
//               ),
//               enabled: false,
//             ),
//             TextField(
//               decoration: const InputDecoration(labelText: 'Product Quantity'),
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 setState(() {
//                   productQuantity = int.tryParse(value) ?? 0;
//                 });
//               },
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: updateTotalSales,
//               child: const Text('Add Sale'),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView(
//                 children: [
//                   ListTile(
//                     title: const Text('Total Sales'),
//                     trailing: Text('\$${totalSales.toStringAsFixed(2)}'),
//                   ),
//                   ListTile(
//                     title: const Text('Monthly Target'),
//                     trailing: Text('\$${monthlyTarget.toStringAsFixed(2)}'),
//                   ),
//                   ListTile(
//                     title: const Text('Cumulative Sales'),
//                     trailing: Text('\$${cumulativeSales.toStringAsFixed(2)}'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }











// import 'package:flutter/material.dart';

// void main() {
//   runApp(const SalesTrackerApp());
// }

// class SalesTrackerApp extends StatelessWidget {
//   const SalesTrackerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sales Tracker',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: const SalesTrackerHome(),
//     );
//   }
// }

// class SalesTrackerHome extends StatefulWidget {
//   const SalesTrackerHome({super.key});

//   @override
//   _SalesTrackerHomeState createState() => _SalesTrackerHomeState();
// }

// class _SalesTrackerHomeState extends State<SalesTrackerHome> {
//   String userName = '';
//   String? selectedCustomer;
//   String? selectedProduct;
//   double productPrice = 0.0;
//   int productQuantity = 0;
//   double totalSales = 0.0;
//   double cumulativeSales = 0.0;
//   final double monthlyTarget = 5000.0;

//   final List<String> customers = ['Customer A', 'Customer B', 'Customer C'];
//   final List<Map<String, dynamic>> products = [
//     {'name': 'Product 1', 'price': 10.00},
//     {'name': 'Product 2', 'price': 20.00},
//     {'name': 'Product 3', 'price': 30.00},
//   ];

//   void updateTotalSales() {
//     setState(() {
//       totalSales = productPrice * productQuantity;
//       cumulativeSales += totalSales;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sales Tracker'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Sales Tracker',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'Date & Time: ${DateTime.now().toString()}',
//               style: const TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               decoration: const InputDecoration(labelText: 'Your Name'),
//               onChanged: (value) {
//                 setState(() {
//                   userName = value;
//                 });
//               },
//             ),
//             DropdownButton<String>(
//               hint: const Text('Select Customer'),
//               value: selectedCustomer,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedCustomer = newValue;
//                 });
//               },
//               items: customers.map((String customer) {
//                 return DropdownMenuItem<String>(
//                   value: customer,
//                   child: Text(customer),
//                 );
//               }).toList(),
//             ),
//             DropdownButton<String>(
//               hint: const Text('Select Product'),
//               value: selectedProduct,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedProduct = newValue;
//                   productPrice = products
//                       .firstWhere((product) => product['name'] == newValue)['price'];
//                 });
//               },
//               items: products.map((product) {
//                 return DropdownMenuItem<String>(
//                   value: product['name'],
//                   child: Text(product['name']),
//                 );
//               }).toList(),
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Product Price',
//                 hintText: productPrice.toStringAsFixed(2),
//               ),
//               enabled: false,
//             ),
//             TextField(
//               decoration: const InputDecoration(labelText: 'Product Quantity'),
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 setState(() {
//                   productQuantity = int.tryParse(value) ?? 0;
//                 });
//               },
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: updateTotalSales,
//               child: const Text('Add Sale'),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView(
//                 children: [
//                   ListTile(
//                     title: const Text('Total Sales'),
//                     trailing: Text('\$${totalSales.toStringAsFixed(2)}'),
//                   ),
//                   ListTile(
//                     title: const Text('Monthly Target'),
//                     trailing: Text('\$${monthlyTarget.toStringAsFixed(2)}'),
//                   ),
//                   ListTile(
//                     title: const Text('Cumulative Sales'),
//                     trailing: Text('\$${cumulativeSales.toStringAsFixed(2)}'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }











import 'package:flutter/material.dart';

void main() {
  runApp(const SalesTrackerApp());
}

class SalesTrackerApp extends StatelessWidget {
  const SalesTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Tracker',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SalesTrackerHome(),
    );
  }
}

class SalesTrackerHome extends StatefulWidget {
  const SalesTrackerHome({super.key});

  @override
  SalesTrackerHomeState createState() => SalesTrackerHomeState();
}

class SalesTrackerHomeState extends State<SalesTrackerHome> {
  String userName = '';
  String? selectedCustomer;
  String? selectedProduct;
  double productPrice = 0.0;
  int productQuantity = 0;
  double totalSales = 0.0;
  double cumulativeSales = 0.0;
  final double monthlyTarget = 5000.0;

  final List<String> customers = ['Customer A', 'Customer B', 'Customer C'];
  final List<Map<String, dynamic>> products = [
    {'name': 'Product 1', 'price': 10.00},
    {'name': 'Product 2', 'price': 20.00},
    {'name': 'Product 3', 'price': 30.00},
  ];

  void updateTotalSales() {
    setState(() {
      totalSales = productPrice * productQuantity;
      cumulativeSales += totalSales;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sales Tracker',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Date & Time: ${DateTime.now().toString()}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: 'Your Name'),
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
            ),
            DropdownButton<String>(
              hint: const Text('Select Customer'),
              value: selectedCustomer,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCustomer = newValue;
                });
              },
              items: customers.map((String customer) {
                return DropdownMenuItem<String>(
                  value: customer,
                  child: Text(customer),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              hint: const Text('Select Product'),
              value: selectedProduct,
              onChanged: (String? newValue) {
                setState(() {
                  selectedProduct = newValue;
                  productPrice = products
                      .firstWhere((product) => product['name'] == newValue)['price'];
                });
              },
              items: products.map((product) {
                return DropdownMenuItem<String>(
                  value: product['name'],
                  child: Text(product['name']),
                );
              }).toList(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Product Price',
                hintText: productPrice.toStringAsFixed(2),
              ),
              enabled: false,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Product Quantity'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  productQuantity = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateTotalSales,
              child: const Text('Add Sale'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Total Sales'),
                    trailing: Text('\$${totalSales.toStringAsFixed(2)}'),
                  ),
                  ListTile(
                    title: const Text('Monthly Target'),
                    trailing: Text('\$${monthlyTarget.toStringAsFixed(2)}'),
                  ),
                  ListTile(
                    title: const Text('Cumulative Sales'),
                    trailing: Text('\$${cumulativeSales.toStringAsFixed(2)}'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
