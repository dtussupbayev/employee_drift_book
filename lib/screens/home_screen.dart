import 'package:employee_drift_book/data/local/db/app_db.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppDb _db;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<EmployeeData>>(
          future: _db.getEmployees(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            final List<EmployeeData>? employees = snapshot.data;
            if (snapshot.hasData && employees != null) {
              return ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final employee = employees[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/edit_employee',
                        arguments: employee.id,
                      ).then(
                        (value) => setState(() {}),
                      );
                    },
                    child: Card(
                      color: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey.shade400,
                          style: BorderStyle.solid,
                          width: 1.2,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              employee.id.toString(),
                            ),
                            Text(
                              employee.userName.toString(),
                            ),
                            Text(
                              employee.firstName.toString(),
                            ),
                            Text(
                              employee.lastName.toString(),
                            ),
                            Text(
                              employee.dateOfBirth.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add_employee').then(
            (value) => setState(() {}),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add employee'),
      ),
    );
  }
}
