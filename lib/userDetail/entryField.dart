import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tax_xpert/Repo/userModelRepo.dart';
import 'package:tax_xpert/model/user_model.dart'; // Adjust import based on actual file location
import 'package:tax_xpert/homeMainTry.dart'; // Adjust import based on actual file location

class TaxDeductionForm extends ConsumerStatefulWidget {
  const TaxDeductionForm({super.key});

  @override
  _TaxDeductionFormState createState() => _TaxDeductionFormState();
}

class _TaxDeductionFormState extends ConsumerState<TaxDeductionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  @override
  void initState() {
    super.initState();
    final user = ref.read(userModelProvider); // Fetch user from Riverpod provider or other source
    initializeControllers(user);
  }

  void initializeControllers(UserModel user) {
    _salaryIncomeController.text = user.salary?.toString() ?? '';
    _incomeFromInterestController.text = user.incomeFromInterest?.toString() ?? '';
    _rentalIncomeController.text = user.rentalIncome?.toString() ?? '';
    _incomeFromOtherSourcesController.text = user.incomeFromOtherSources?.toString() ?? '';
    _lifeInsuranceController.text = user.lifeInsurance?.toString() ?? '';
    _providentFundController.text = user.providentFund?.toString() ?? '';
    _tuitionFeesController.text = user.tuitionFees?.toString() ?? '';
    _annuitiesController.text = user.annuities?.toString() ?? '';
    _pensionSchemeController.text = user.pensionScheme?.toString() ?? '';
    _additionalPensionSchemeController.text = user.additionalPensionScheme?.toString() ?? '';
    _employerPensionContributionController.text = user.employerPensionContribution?.toString() ?? '';
    _agnipathContributionController.text = user.agnipathContribution?.toString() ?? '';
    _healthInsuranceController.text = user.healthInsurance?.toString() ?? '';
    _preventiveCheckupController.text = user.preventiveCheckup?.toString() ?? '';
    _medicalTreatmentController.text = user.medicalTreatment?.toString() ?? '';
    _educationLoanInterestController.text = user.educationLoanInterest?.toString() ?? '';
    _homeLoanInterestController.text = user.homeLoanInterest?.toString() ?? '';
    _firstTimeHomeBuyerInterestController.text = user.firstTimeHomeBuyerInterest?.toString() ?? '';
    _electricVehicleLoanInterestController.text = user.electricVehicleLoanInterest?.toString() ?? '';
    _donationsController.text = user.donations?.toString() ?? '';
    _rentPaidController.text = user.rentPaid?.toString() ?? '';
    _scientificResearchDonationsController.text = user.scientificResearchDonations?.toString() ?? '';
    _politicalPartyDonationsController.text = user.politicalPartyDonations?.toString() ?? '';
    _savingsAccountInterestController.text = user.savingsAccountInterest?.toString() ?? '';
    _depositsInterestController.text = user.depositsInterest?.toString() ?? '';
    _disabilityDeductionController.text = user.disabilityDeduction?.toString() ?? '';
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
    return Scaffold(
      appBar: AppBar(title: const Text("Tax Deduction Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_salaryIncomeController, "Gross Income From Salary"),
              _buildTextField(_incomeFromInterestController, "Income From Interest"),
              _buildTextField(_rentalIncomeController, "Rental Income Received"),
              _buildTextField(_incomeFromOtherSourcesController, "Income From Other Sources"),
              const Text(
                "Under Section 80C Deduction",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              _buildSection(
                context,
                "Life Insurance Premium, Provident Fund, Tuition Fees - 80C",
                "Deduction Limit: ₹ 1,50,000 under Section 80C",
                ["Life Insurance Premium", "Provident Fund", "Tuition Fees"],
                [_lifeInsuranceController, _providentFundController, _tuitionFeesController],
              ),
              _buildSection(
                context,
                "Annuity Plan of LIC or Other Insurer - Section 80CCC",
                "Deduction for annuity plans. It's like trading your money for a guaranteed income stream.",
                ["Contribution to Annuity Plan"],
                [_annuitiesController],
              ),
              _buildSection(
                context,
                "Pension Scheme of Central Government - Section 80CCD(1)",
                "Contribution to NPS. Deduction Limit: ₹1,50,000",
                ["Contribution to Pension Scheme"],
                [_pensionSchemeController],
              ),
              _buildSection(
                context,
                "Section 80CCD(1B)",
                "Additional Contribution to NPS. Deduction Limit: ₹ 50,000",
                ["Additional Contribution to Pension Scheme"],
                [_additionalPensionSchemeController],
              ),
              _buildSection(
                context,
                "Section 80CCD(2)",
                "Employer Contribution to Pension Scheme. Deduction Limit: 10% or 14% of salary",
                ["Employer Contribution to Pension Scheme"],
                [_employerPensionContributionController],
              ),
              _buildSection(
                context,
                "Section 80CCH",
                "Contribution to Agnipath Scheme.",
                ["Contribution to Agnipath Scheme"],
                [_agnipathContributionController],
              ),
              const Text(
                "Under Section 80D Deduction",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              _buildSection(
                context,
                "Health Insurance Premium - Section 80D",
                "Deduction for health insurance premiums paid for self, spouse, children, and parents.",
                ["Health Insurance Premium", "Preventive Health Checkup"],
                [_healthInsuranceController, _preventiveCheckupController],
              ),
              _buildSection(
                context,
                "Medical Treatment - Section 80DDB",
                "Deduction for medical treatment of specified diseases. Deduction Limit: ₹ 40,000 or ₹ 1,00,000 for senior citizens",
                ["Medical Treatment"],
                [_medicalTreatmentController],
              ),
              _buildSection(
                context,
                "Education Loan Interest - Section 80E",
                "Deduction for interest on education loan. No maximum limit on the amount.",
                ["Education Loan Interest"],
                [_educationLoanInterestController],
              ),
              _buildSection(
                context,
                "Home Loan Interest - Section 24(b)",
                "Deduction for interest on home loan. Deduction Limit: ₹ 2,00,000",
                ["Interest on Home Loan"],
                [_homeLoanInterestController],
              ),
              _buildSection(
                context,
                "First-Time Home Buyer - Section 80EE",
                "Additional deduction for interest on home loan for first-time home buyers. Deduction Limit: ₹ 50,000",
                ["Interest on Home Loan (First-Time Buyer)"],
                [_firstTimeHomeBuyerInterestController],
              ),
              _buildSection(
                context,
                "Electric Vehicle Loan Interest - Section 80EEB",
                "Deduction for interest on loan for electric vehicle purchase. Deduction Limit: ₹ 1,50,000",
                ["Interest on Electric Vehicle Loan"],
                [_electricVehicleLoanInterestController],
              ),
              _buildSection(
                context,
                "Donations - Section 80G",
                "Deduction for donations to charitable institutions. Deduction limit varies based on the institution.",
                ["Donations"],
                [_donationsController],
              ),
              _buildSection(
                context,
                "Rent Paid - Section 80GG",
                "Deduction for rent paid by self-employed individuals. Deduction Limit: ₹ 5,000 per month",
                ["Rent Paid"],
                [_rentPaidController],
              ),
              _buildSection(
                context,
                "Scientific Research Donations - Section 35(1)(ii)",
                "Deduction for donations to institutions engaged in scientific research.",
                ["Scientific Research Donations"],
                [_scientificResearchDonationsController],
              ),
              _buildSection(
                context,
                "Political Party Donations - Section 80GGC",
                "Deduction for donations to political parties.",
                ["Political Party Donations"],
                [_politicalPartyDonationsController],
              ),
              _buildSection(
                context,
                "Savings Account Interest - Section 80TTA",
                "Deduction for interest earned on savings accounts. Deduction Limit: ₹ 10,000",
                ["Interest on Savings Account"],
                [_savingsAccountInterestController],
              ),
              _buildSection(
                context,
                "Deposits Interest - Section 80TTB",
                "Deduction for interest earned on deposits for senior citizens. Deduction Limit: ₹ 50,000",
                ["Interest on Deposits"],
                [_depositsInterestController],
              ),
              _buildSection(
                context,
                "Disability Deduction - Section 80U",
                "Deduction for individuals with disabilities. Deduction Limit: ₹ 75,000 or ₹ 1,25,000 for severe disability.",
                ["Disability Deduction"],
                [_disabilityDeductionController],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleSubmit,
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a value';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String description, List<String> labels, List<TextEditingController> controllers) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          ...List.generate(labels.length, (index) {
            return _buildTextField(controllers[index], labels[index]);
          }),
        ],
      ),
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      final user = ref.read(userModelProvider.notifier); // Access the user model's notifier

      // Update user model with form data using copyWith
      user.updateUser(
        salary: double.tryParse(_salaryIncomeController.text),
        incomeFromInterest: double.tryParse(_incomeFromInterestController.text),
        rentalIncome: double.tryParse(_rentalIncomeController.text),
        incomeFromOtherSources: double.tryParse(_incomeFromOtherSourcesController.text),
        lifeInsurance: double.tryParse(_lifeInsuranceController.text),
        providentFund: double.tryParse(_providentFundController.text),
        tuitionFees: double.tryParse(_tuitionFeesController.text),
        annuities: double.tryParse(_annuitiesController.text),
        pensionScheme: double.tryParse(_pensionSchemeController.text),
        additionalPensionScheme: double.tryParse(_additionalPensionSchemeController.text),
        employerPensionContribution: double.tryParse(_employerPensionContributionController.text),
        agnipathContribution: double.tryParse(_agnipathContributionController.text),
        healthInsurance: double.tryParse(_healthInsuranceController.text),
        preventiveCheckup: double.tryParse(_preventiveCheckupController.text),
        medicalTreatment: double.tryParse(_medicalTreatmentController.text),
        educationLoanInterest: double.tryParse(_educationLoanInterestController.text),
        homeLoanInterest: double.tryParse(_homeLoanInterestController.text),
        firstTimeHomeBuyerInterest: double.tryParse(_firstTimeHomeBuyerInterestController.text),
        electricVehicleLoanInterest: double.tryParse(_electricVehicleLoanInterestController.text),
        donations: double.tryParse(_donationsController.text),
        rentPaid: double.tryParse(_rentPaidController.text),
        scientificResearchDonations: double.tryParse(_scientificResearchDonationsController.text),
        politicalPartyDonations: double.tryParse(_politicalPartyDonationsController.text),
        savingsAccountInterest: double.tryParse(_savingsAccountInterestController.text),
        depositsInterest: double.tryParse(_depositsInterestController.text),
        disabilityDeduction: double.tryParse(_disabilityDeductionController.text),
      );

      // Navigate to the next screen or show a confirmation
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreenTry()), // Adjust based on actual target screen
      );
    }
  }
}
