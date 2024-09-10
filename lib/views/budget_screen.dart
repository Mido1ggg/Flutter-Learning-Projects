import 'package:flutter/material.dart';
import 'package:list_view_proj/models/budgetCard_model.dart';
import 'package:list_view_proj/views/add_new_screen.dart';
import 'package:pie_chart/pie_chart.dart';
import '../components/defult_text_button.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreen();
}

final List<BudgetcardModel> budgetCategories = [
  BudgetcardModel(icon: Icons.restaurant, title: "Restaurant", value: 10.0),

  // Add more categories as needed
];

class _BudgetScreen extends State<BudgetScreen> {
  
  Map<String, double> data = {
    for (var item in budgetCategories) item.title: item.value
  };

  void addItemToBudget(IconData icon, String title, double value) {
    setState(() {
      bool categoryExists = false;
      for (var item in budgetCategories) {
        if (item.title == title) {
          categoryExists = true;
          item.value = value;
          break;
        }
      }
      if(!categoryExists) {
        budgetCategories
            .add(BudgetcardModel(icon: icon, title: title, value: value));
        data[title] = value;
      }
      calculateTotalBudget();
    });
  }


  void removeItem(String category) {
    setState(() {
      budgetCategories.removeWhere((item) => item.title == category);
      calculateTotalBudget();
      data.remove(category);
    });
  }
/*
  void updateItem(String category, double value) {
    setState(() {
      data[category] = value;
    });
  }
*/
  double calculateTotalBudget() {
    double total = 0;
    for (var item in budgetCategories) {
      total += item.value;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    double totalBudget = calculateTotalBudget();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 28, right: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        
                const SizedBox(height: 10,),
        
                PieChart(
                  chartLegendSpacing: 20,
                  emptyColor: const Color(0xFFDEDDDD),
                  chartValuesOptions:
                      const ChartValuesOptions(showChartValuesInPercentage: true),
                  dataMap: data,
                  chartType: ChartType.ring,
                  centerText: "Budget\n${totalBudget.toStringAsFixed(2)} L.E",
                  legendOptions: const LegendOptions(
                    showLegends: true,
                    legendPosition: LegendPosition.right,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Budget',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    buildTextButton(
                      width: 100,
                      height: 40,
                      textColor: const Color(0xFF125A93),
                      text: '+ Add new',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddNewScreen())).then((onValue){
                          if(onValue != null){
                            addItemToBudget(onValue.icon, onValue.title, onValue.value);
                          }
                        });
                        },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onLongPress: () {
                            // Show a dialog or confirmation prompt to remove the item
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Confirm Removal'),
                                content: Text('Are you sure you want to remove "${budgetCategories[index].title}"?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); // Close the dialog without removing
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      removeItem(budgetCategories[index].title);
                                      Navigator.pop(context); // Close the dialog and remove the item
                                    },
                                    child: const Text('Remove'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            width: 100,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: const Color(0xFFC4C4C4), width: 1),
                              color: const Color(0xFFFBFCFB),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(budgetCategories[index].icon),
                                  Text(budgetCategories[index].title),
                                  Text((budgetCategories[index].value).toString()),
        
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 4,
                        );
                      },
                      itemCount: budgetCategories.length
        
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
