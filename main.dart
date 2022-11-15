import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quick Sort',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Quick Sort'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _listController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _listController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText:
                        'Masukkan inputan berbentuk integer (1,3,5. dst...)',
                  ),
                ),
                const SizedBox(height: 13.0),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    controller: _resultController,
                    enabled: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Hasil Binary Search',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      List<int> list = _listController.text
                          .split(',')
                          .map(int.parse)
                          .toList();
                      int n = list.length;
                      _resultController.text =
                          quickSort(list, 0, n - 1).join(', ');
                    },
                    child: const Text('Hasil Sorting'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<int> quickSort(List<int> arr, int low, int high) {
  if (low < high) {
    int? pi = partition(arr, low, high);

    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }

  return arr;
}

int partition(List<int> arr, int low, int high) {
  int pivot = arr[high];

  int i = (low - 1);

  for (int j = low; j <= high - 1; j++) {
    if (arr[j] < pivot) {
      i++;
      swap(arr, i, j);
    }
  }
  swap(arr, i + 1, high);
  return (i + 1);
}

void swap(List<int> arr, int i, int j) {
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}
