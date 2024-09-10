import 'package:flutter/material.dart';
import 'package:list_view_proj/components/defult_text_button.dart';
import 'package:list_view_proj/components/defult_text_form_field.dart';
import 'package:list_view_proj/models/budgetCard_model.dart';
import 'package:intl/intl.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreen();
}

final List<BudgetcardModel> budgetCategories = [
  BudgetcardModel(icon: Icons.restaurant, title: "Restaurant", value: 0.0),
  BudgetcardModel(icon: Icons.directions_bus, title: "Transport", value: 0.0),
  BudgetcardModel(icon: Icons.local_grocery_store, title: "Grocery", value: 0.0),
  BudgetcardModel(icon: Icons.medical_services, title: "Medication", value: 0.0),
  BudgetcardModel(icon: Icons.checkroom_outlined, title: "Cloth", value: 0.0),
  BudgetcardModel(icon: Icons.videogame_asset, title: "Entertainment", value: 0.0),

  // Add more categories as needed
];

BudgetcardModel selectedCategory = budgetCategories.first;
TextEditingController amountController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();



class _AddNewScreen extends State<AddNewScreen> {
  DateTime now = DateTime.now();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          DateFormat('EEE, MMM d').format(now),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add New',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Budget name',
                    style: TextStyle(
                      color: Color(0xFF868686),
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButton<BudgetcardModel>(
                          value: selectedCategory,
                          onChanged: (newValue) {
                            setState(() {
                              selectedCategory = newValue!;
                            });
                          },
                          items: budgetCategories.map((category) {
                            return DropdownMenuItem<BudgetcardModel>(
                              value: category,
                              child: Row(
                                children: [
                                  Icon(category.icon),
                                  const SizedBox(width: 8),

                                  Text(category.title),
                                  const SizedBox(
                                    width: 150,
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      /*
                      Text('Selected Category: ${selectedCategory?.title ?? 'None'}'),
                       */
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Amount',
                    style: TextStyle(
                      color: Color(0xFF868686),
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextFormField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          labelText: '0.00 L.E',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter the amount";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32,),

                  Row(
                    children: [
                      Expanded(
                        child: buildTextButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                selectedCategory.value = double.parse(amountController.text);
                                Navigator.pop(context,selectedCategory);
                              }
                            },
                            textColor: Colors.white,
                            backgroundColor: const Color(0xFF125A93),
                            text: 'Add item'),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
