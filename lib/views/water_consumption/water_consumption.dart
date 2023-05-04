import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdemoproject/controllers/water_consumption_controller.dart';
import 'package:newdemoproject/models/bar_chart_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WaterConsumption extends StatefulWidget {
  const WaterConsumption({Key? key}) : super(key: key);

  @override
  _WaterConsumptionState createState() => _WaterConsumptionState();
}

class _WaterConsumptionState extends State<WaterConsumption> {
  final energyConsumptionController = Get.find<WaterConsumptionController>();
  final items = ['Last 6 months', 'Last 3 months', "Last 1 month"];
  String? value;
  bool isSelected = true;
  late List<BarChartModel> _data;
  List<BarChartModel> getChartData() {
    final List<BarChartModel> data = [
      BarChartModel(year: "JAN", energy_units: 10),
      BarChartModel(year: "FEB", energy_units: 5),
      BarChartModel(
        year: "MARCH",
        energy_units: 15,
      ),
      BarChartModel(
        year: "APRIL",
        energy_units: 25,
      ),
      BarChartModel(year: "MAY", energy_units: 10),
      BarChartModel(year: "JUNE", energy_units: 18),
    ];
    return data;
  }

  @override
  void initState() {
    _data = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Energy Consumption"),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: value,
                        icon: const Icon(Icons.arrow_drop_down),
                        isExpanded: true,
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) {
                          setState(() {
                            this.value = value;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
                child: Expanded(
                  child: AppBar(
                    backgroundColor: Colors.white,
                    bottom: const TabBar(
                      tabs: [
                        Text(
                          "By month",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "By cycle",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [buildCycleWidget(), buildMonthWidget()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMonthWidget() => Expanded(
        child: Container(
            margin: const EdgeInsets.fromLTRB(
              5,
              70,
              5,
              30,
            ),
            child: ListView.separated(
              itemCount: energyConsumptionController.stainImage.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.asset(
                      energyConsumptionController.stainImage[index]),
                  title: Text(energyConsumptionController.stains[index]),
                  trailing: Image.asset(
                      energyConsumptionController.energyLevel[index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            )),
      );

  Widget buildCycleWidget() => Expanded(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              SfCartesianChart(
                series: <ChartSeries>[
                  ColumnSeries<BarChartModel, String>(
                      dataSource: _data,
                      xValueMapper: (BarChartModel bcm, _) => bcm.year,
                      yValueMapper: (BarChartModel bcm, _) => bcm.energy_units,
                      color: Colors.indigo),
                ],
                primaryXAxis: CategoryAxis(),
                primaryYAxis:
                    NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(5)),
                          Image.asset(
                            "assets/images/energyconsumption.png",
                            width: 20.0,
                            height: 20.0,
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          const Text(
                            "Average Consumption",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("13 units per month")),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 0, 0)),
                          Image.asset(
                            "assets/images/energyconsumption.png",
                            width: 20.0,
                            height: 20.0,
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            "Average Usage",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("6 cycles per month")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
