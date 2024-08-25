import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tax_xpert/Repo/UserCalculationRepo.dart';
import 'package:tax_xpert/Repo/userModelRepo.dart';
import 'package:tax_xpert/model/user_model.dart';

class CustomTabScreen extends ConsumerStatefulWidget {
  const CustomTabScreen({super.key});

  @override
  _CustomTabScreenState createState() => _CustomTabScreenState();
}

class _CustomTabScreenState extends ConsumerState<CustomTabScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _incomeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _80CFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _80DFormKey = GlobalKey<FormState>();
  final TextEditingController _salaryIncomeController = TextEditingController();
  final TextEditingController _incomeFromInterestController = TextEditingController();
  final TextEditingController _rentalIncomeController = TextEditingController();
  final TextEditingController _incomeFromOtherSourcesController = TextEditingController();
  // Deduction Controllers
  final TextEditingController _lifeInsuranceController = TextEditingController();
  final TextEditingController _providentFundController = TextEditingController();
  final TextEditingController _tuitionFeesController = TextEditingController();
  final TextEditingController _annuitiesController = TextEditingController();
  final TextEditingController _pensionSchemeController = TextEditingController();
  final TextEditingController _additionalPensionSchemeController = TextEditingController();
  final TextEditingController _employerPensionContributionController = TextEditingController();
  final TextEditingController _agnipathContributionController = TextEditingController();
  final TextEditingController _healthInsuranceController = TextEditingController();
  final TextEditingController _preventiveCheckupController = TextEditingController();
  final TextEditingController _medicalTreatmentController = TextEditingController();
  final TextEditingController _educationLoanInterestController = TextEditingController();
  final TextEditingController _homeLoanInterestController = TextEditingController();
  final TextEditingController _firstTimeHomeBuyerInterestController = TextEditingController();
  final TextEditingController _electricVehicleLoanInterestController = TextEditingController();
  final TextEditingController _donationsController = TextEditingController();
  final TextEditingController _rentPaidController = TextEditingController();
  final TextEditingController _scientificResearchDonationsController = TextEditingController();
  final TextEditingController _politicalPartyDonationsController = TextEditingController();
  final TextEditingController _savingsAccountInterestController = TextEditingController();
  final TextEditingController _depositsInterestController = TextEditingController();
  final TextEditingController _disabilityDeductionController = TextEditingController();

  String formatDoubleToCurrency(double number) {
    NumberFormat formatter = NumberFormat("#,##,##0", "en_IN");
    return formatter.format(number);
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // Changed to 4
    final val = ref.read(userProvider);

    _salaryIncomeController.text = formatDoubleToCurrency(val.salary ?? 0.0);
    _incomeFromInterestController.text = formatDoubleToCurrency(val.incomeFromInterest ?? 0.0);
    _rentalIncomeController.text = formatDoubleToCurrency(val.rentalIncome ?? 0.0);
    _incomeFromOtherSourcesController.text = formatDoubleToCurrency(val.incomeFromOtherSources ?? 0.0);

    _lifeInsuranceController.text = formatDoubleToCurrency(val.lifeInsurance ?? 0.0);
    _providentFundController.text = formatDoubleToCurrency(val.providentFund ?? 0.0);
    _tuitionFeesController.text = formatDoubleToCurrency(val.tuitionFees ?? 0.0);
    _annuitiesController.text = formatDoubleToCurrency(val.annuities ?? 0.0);
    _pensionSchemeController.text = formatDoubleToCurrency(val.pensionScheme ?? 0.0);
    _additionalPensionSchemeController.text = formatDoubleToCurrency(val.additionalPensionScheme ?? 0.0);
    _employerPensionContributionController.text = formatDoubleToCurrency(val.employerPensionContribution ?? 0.0);
    _agnipathContributionController.text = formatDoubleToCurrency(val.agnipathContribution ?? 0.0);
    _healthInsuranceController.text = formatDoubleToCurrency(val.healthInsurance ?? 0.0);
    _preventiveCheckupController.text = formatDoubleToCurrency(val.preventiveCheckup ?? 0.0);
    _medicalTreatmentController.text = formatDoubleToCurrency(val.medicalTreatment ?? 0.0);
    _educationLoanInterestController.text = formatDoubleToCurrency(val.educationLoanInterest ?? 0.0);
    _homeLoanInterestController.text = formatDoubleToCurrency(val.homeLoanInterest ?? 0.0);
    _firstTimeHomeBuyerInterestController.text = formatDoubleToCurrency(val.firstTimeHomeBuyerInterest ?? 0.0);
    _electricVehicleLoanInterestController.text = formatDoubleToCurrency(val.electricVehicleLoanInterest ?? 0.0);
    _donationsController.text = formatDoubleToCurrency(val.donations ?? 0.0);
    _rentPaidController.text = formatDoubleToCurrency(val.rentPaid ?? 0.0);
    _scientificResearchDonationsController.text = formatDoubleToCurrency(val.scientificResearchDonations ?? 0.0);
    _politicalPartyDonationsController.text = formatDoubleToCurrency(val.politicalPartyDonations ?? 0.0);
    _savingsAccountInterestController.text = formatDoubleToCurrency(val.savingsAccountInterest ?? 0.0);
    _depositsInterestController.text = formatDoubleToCurrency(val.depositsInterest ?? 0.0);
    _disabilityDeductionController.text = formatDoubleToCurrency(val.disabilityDeduction ?? 0.0);
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    _salaryIncomeController.dispose();
    _incomeFromInterestController.dispose();
    _rentalIncomeController.dispose();
    _incomeFromOtherSourcesController.dispose();
    _lifeInsuranceController.dispose();
    _providentFundController.dispose();
    _tuitionFeesController.dispose();
    _annuitiesController.dispose();
    _pensionSchemeController.dispose();
    _additionalPensionSchemeController.dispose();
    _employerPensionContributionController.dispose();
    _agnipathContributionController.dispose();
    _healthInsuranceController.dispose();
    _preventiveCheckupController.dispose();
    _medicalTreatmentController.dispose();
    _educationLoanInterestController.dispose();
    _homeLoanInterestController.dispose();
    _firstTimeHomeBuyerInterestController.dispose();
    _electricVehicleLoanInterestController.dispose();
    _donationsController.dispose();
    _rentPaidController.dispose();
    _scientificResearchDonationsController.dispose();
    _politicalPartyDonationsController.dispose();
    _savingsAccountInterestController.dispose();
    _depositsInterestController.dispose();
    _disabilityDeductionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(userProvider);
    ref.listen<UserModel>(userProvider, (previous, next) {
      ref.read(taxCalculationProvider.notifier).calculateTax(next);
    });
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Tab(text: 'Basic Salary'),
                Tab(text: '80C'),
                Tab(text: '80D'),
                Tab(text: "TDS"),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 400, // Fixed height for the tab content
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildIncomeSection(context),
              _build80CSection(context),
              _build80DSection(context),
              _buildSettingsSection(context),
            ],
          ),
        ),
      ],
    );

    // Tab Bar View
  }

  /*
------- saari details------------ 
   */

  Widget _buildIncomeSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      /*
          ------- Basic Salary------------ 
          */
      children: [
        Text('Basic Salary', style: Theme.of(context).textTheme.headlineSmall),
        Expanded(
          child: Form(
              key: _incomeFormKey,
              child: ListView(
                children: [
                  _buildTextField(_salaryIncomeController, "Gross Income From Salary",
                      (value) => ref.read(userProvider.notifier).updateUser(salary: double.tryParse(value))),
                  _buildTextField(
                    _incomeFromInterestController,
                    "Income From Interest",
                    (value) => ref.read(userProvider.notifier).updateUser(
                          incomeFromInterest: double.tryParse(value),
                        ),
                  ),
                  _buildTextField(_rentalIncomeController, "Rental Income Received",
                      (value) => ref.read(userProvider.notifier).updateUser(rentalIncome: double.tryParse(value))),
                  _buildTextField(_incomeFromOtherSourcesController, "Income From Other Sources",
                      (value) => ref.read(userProvider.notifier).updateUser(incomeFromOtherSources: double.tryParse(value))),
                ],
              )),
        )
      ],
    );
  }

  Widget _build80CSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('80-C', style: Theme.of(context).textTheme.headlineSmall),
        Expanded(
          child: Form(
              key: _80CFormKey,
              child: ListView(
                children: [
                  _buildSection(
                    context,
                    "Life Insurance Premium, Provident Fund, Tuition Fees - 80C",
                    "Deduction Limit: ₹ 1,50,000 under Section 80C",
                    ["Life Insurance Premium", "Provident Fund", "Tuition Fees"],
                    [_lifeInsuranceController, _providentFundController, _tuitionFeesController],
                    [
                      (value) => ref.read(userProvider.notifier).updateUser(lifeInsurance: double.tryParse(value)),
                      (value) => ref.read(userProvider.notifier).updateUser(providentFund: double.tryParse(value)),
                      (value) => ref.read(userProvider.notifier).updateUser(tuitionFees: double.tryParse(value))
                    ],
                  ),
                  _buildSection(
                    context,
                    "Annuity Plan of LIC or Other Insurer - Section 80CCC",
                    "Deduction for annuity plans.",
                    ["Contribution to Annuity Plan"],
                    [_annuitiesController],
                    [(value) => ref.read(userProvider.notifier).updateUser(annuities: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "Pension Scheme of Central Government - Section 80CCD(1)",
                    "Contribution to NPS. Deduction Limit: ₹1,50,000",
                    ["Contribution to Pension Scheme"],
                    [_pensionSchemeController],
                    [(value) => ref.read(userProvider.notifier).updateUser(pensionScheme: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "Section 80CCD(1B)",
                    "Additional Contribution to NPS. Deduction Limit: ₹ 50,000",
                    ["Additional Contribution to Pension Scheme"],
                    [_additionalPensionSchemeController],
                    [(value) => ref.read(userProvider.notifier).updateUser(additionalPensionScheme: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "Section 80CCD(2)",
                    "Employer Contribution to Pension Scheme. Deduction Limit: 10% or 14% of salary",
                    ["Employer Contribution to Pension Scheme"],
                    [_employerPensionContributionController],
                    [(value) => ref.read(userProvider.notifier).updateUser(employerPensionContribution: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "Section 80CCH",
                    "Contribution to Agnipath Scheme.",
                    ["Contribution to Agnipath Scheme"],
                    [_agnipathContributionController],
                    [(value) => ref.read(userProvider.notifier).updateUser(agnipathContribution: double.tryParse(value))],
                  ),
                ],
              )),
        )
      ],
    );
  }

  Widget _build80DSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('80-D', style: Theme.of(context).textTheme.headlineSmall),
        Expanded(
          child: Form(
              key: _80DFormKey,
              child: ListView(
                children: [
                  _buildSection(
                    context,
                    "Health Insurance Premium - Section 80D",
                    "Deduction for health insurance premiums paid for self, spouse, children, and parents.",
                    ["Health Insurance Premium", "Preventive Health Checkup"],
                    [_healthInsuranceController, _preventiveCheckupController],
                    [
                      (value) => ref.read(userProvider.notifier).updateUser(healthInsurance: double.tryParse(value)),
                      (value) => ref.read(userProvider.notifier).updateUser(preventiveCheckup: double.tryParse(value))
                    ],
                  ),
                  _buildSection(
                    context,
                    "Medical Treatment - Section 80DDB",
                    "Deduction for medical treatment of specified diseases. Deduction Limit: ₹ 40,000 or ₹ 1,00,000 for senior citizens",
                    ["Medical Treatment"],
                    [_medicalTreatmentController],
                    [(value) => ref.read(userProvider.notifier).updateUser(medicalTreatment: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "Education Loan Interest - Section 80E",
                    "Deduction for interest on education loan. No maximum limit on the amount.",
                    ["Education Loan Interest"],
                    [_educationLoanInterestController],
                    [(value) => ref.read(userProvider.notifier).updateUser(educationLoanInterest: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "Home Loan Interest - Section 24(b)",
                    "Deduction for interest on home loan. Deduction Limit: ₹ 2,00,000",
                    ["Interest on Home Loan"],
                    [_homeLoanInterestController],
                    [(value) => ref.read(userProvider.notifier).updateUser(homeLoanInterest: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "First-Time Home Buyer - Section 80EE",
                    "Additional deduction for interest on home loan for first-time home buyers. Deduction Limit: ₹ 50,000",
                    ["Interest on Home Loan (First-Time Buyer)"],
                    [_firstTimeHomeBuyerInterestController],
                    [(value) => ref.read(userProvider.notifier).updateUser(firstTimeHomeBuyerInterest: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "Electric Vehicle Loan Interest - Section 80EEB",
                    "Deduction for interest on loan for electric vehicle purchase. Deduction Limit: ₹ 1,50,000",
                    ["Interest on Electric Vehicle Loan"],
                    [_electricVehicleLoanInterestController],
                    [(value) => ref.read(userProvider.notifier).updateUser(electricVehicleLoanInterest: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "Donations - Section 80G",
                    "Deduction for donations to charitable institutions. Deduction limit varies based on the institution.",
                    ["Donations"],
                    [_donationsController],
                    [(value) => ref.read(userProvider.notifier).updateUser(donations: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "Rent Paid - Section 80GG",
                    "Deduction for rent paid by self-employed individuals. Deduction Limit: ₹ 5,000 per month",
                    ["Rent Paid"],
                    [_rentPaidController],
                    [(value) => ref.read(userProvider.notifier).updateUser(rentPaid: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "Scientific Research Donations - Section 35(1)(ii)",
                    "Deduction for donations to institutions engaged in scientific research.",
                    ["Scientific Research Donations"],
                    [_scientificResearchDonationsController],
                    [(value) => ref.read(userProvider.notifier).updateUser(scientificResearchDonations: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "Political Party Donations - Section 80GGC",
                    "Deduction for donations to political parties.",
                    ["Political Party Donations"],
                    [_politicalPartyDonationsController],
                    [(value) => ref.read(userProvider.notifier).updateUser(politicalPartyDonations: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "Savings Account Interest - Section 80TTA",
                    "Deduction for interest earned on savings accounts. Deduction Limit: ₹ 10,000",
                    ["Interest on Savings Account"],
                    [_savingsAccountInterestController],
                    [(value) => ref.read(userProvider.notifier).updateUser(savingsAccountInterest: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "Deposits Interest - Section 80TTB",
                    "Deduction for interest earned on deposits for senior citizens. Deduction Limit: ₹ 50,000",
                    ["Interest on Deposits"],
                    [_depositsInterestController],
                    [(value) => ref.read(userProvider.notifier).updateUser(depositsInterest: double.tryParse(value))],
                  ),
                  _buildSection(
                    context,
                    "Disability Deduction - Section 80U",
                    "Deduction for individuals with disabilities. Deduction Limit: ₹ 75,000 or ₹ 1,25,000 for severe disability.",
                    ["Disability Deduction"],
                    [_disabilityDeductionController],
                    [(value) => ref.read(userProvider.notifier).updateUser(disabilityDeduction: double.tryParse(value))],
                  ),
                ],
              )),
        )
      ],
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Settings', style: Theme.of(context).textTheme.headlineSmall),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("Coming soon")],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, Function(String) onChange) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          // Remove commas and convert empty string to '0'
          String parsedValue = value.replaceAll(',', '');
          parsedValue = parsedValue.isEmpty ? '0' : parsedValue;

          // Update the controller with formatted value
          double? numericValue = double.tryParse(parsedValue);
          if (numericValue != null) {
            String formattedValue = NumberFormat('#,##0').format(numericValue);
            controller.value = TextEditingValue(
              text: formattedValue,
              selection: TextSelection.collapsed(offset: formattedValue.length),
            );
          }

          onChange(parsedValue);

          // Recalculate tax
          ref.read(taxCalculationProvider.notifier).calculateTax(ref.read(userProvider));
        },
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a number';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    String description,
    List<String> labels,
    List<TextEditingController> controllers,
    List<void Function(String)> onChangeFunctions,
  ) {
    return ExpansionTile(
      title: Row(
        children: [
          Expanded(child: Text(title)),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: description,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(title),
                    content: Text(description),
                    actions: [
                      TextButton(
                        child: const Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      children: List.generate(
        labels.length,
        (index) => _buildTextField(
          controllers[index],
          labels[index],
          onChangeFunctions[index],
        ),
      ),
    );
  }
}