import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/styles/colors.dart';

class CheckBoxItem extends StatefulWidget{
  final List<String> labels;
  final String label;
  final RxBool value;
  const CheckBoxItem({
    Key? key, 
    required this.labels,
    required this.label,
    required this.value
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _CheckBox();
}

class _CheckBox extends State<CheckBoxItem>{
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Column(
        children: [
          Text(widget.label),
          ListView.builder(
      itemCount: widget.labels.length,
      itemBuilder: (context, index){
      return ListTile(
        leading: Checkbox(
          value: widget.value.value, 
          onChanged: (val){
            setState(() {
              widget.value.value = val!;
            });
            },
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.all(getColor()),
          ),
          title: Text(widget.labels[index]),
        );
      },
    )
        ],
      );
    });
  }
}