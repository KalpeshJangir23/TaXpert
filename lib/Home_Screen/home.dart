import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tax_xpert/Home_Screen/utils/customSumary_tab.dart';
import 'package:tax_xpert/Repo/UserCalculationRepo.dart';
import 'package:tax_xpert/Repo/userModelRepo.dart';
import 'package:tax_xpert/Home_Screen/summary.dart';
import 'package:tax_xpert/model/user_model.dart';
import 'package:tax_xpert/Home_Screen/utils/tab_section.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.watch(userProvider);
    final taxCalculation = ref.watch(taxCalculationProvider);
    ref.listen<UserModel>(userProvider, (previous, next) {
      ref.read(taxCalculationProvider.notifier).calculateTax(next);
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Tax Deduction Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: const [
              // Displaying the gross income
              HomeSummary(),
              SizedBox(
                height: 30,
              ),
              // Custom tab section
              CustomTabScreen(),

              // Spacer
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}