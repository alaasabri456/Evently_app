

import 'package:evently/core/extensions/date_time_ex.dart';
import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/resources/validators.dart';
import 'package:evently/core/ui_utils.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/core/widgets/custom_tab_bar.dart';
import 'package:evently/core/widgets/custom_text_button.dart';
import 'package:evently/firebase/firebase_service.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_text_form_field.dart';
import '../../l10n/app_localizations.dart';

class CreateEvent extends StatefulWidget {
  final EventModel? event;

  const CreateEvent({super.key,this.event});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late CategoryModel selectedCategory=CategoryModel.getCategory(context)[0];
late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  DateTime selectedDateTime = DateTime.now();
  TimeOfDay selectedTimeTemp = TimeOfDay.now();
  GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController(); _descriptionController = TextEditingController();
    if (widget.event != null) {
      selectedCategory = widget.event!.category;
      _titleController.text = widget.event!.title;
      _descriptionController.text = widget.event!.description;
      selectedDateTime = widget.event!.dateTime;
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations=AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title:Text(widget.event == null ? appLocalizations.create_event:appLocalizations.edit_event),

      ),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
            ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(selectedCategory.imgPath)),
                SizedBox(height:16.h),
                CustomTabBar(onCategotyItemClick: (category) {
                  selectedCategory=category;
                  setState(() {

                  });
                },categories: CategoryModel.getCategory(context), selectedBgColor: ColorsManager.blue, unselectedBgColor: Colors.transparent, selectedFgColor:ColorsManager.white , unselectedFgColor: ColorsManager.blue),
                SizedBox(height:16.h),
                Text(appLocalizations.title,style:Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 8.h),
                  CustomTextFormField(validator:Validator.validateEventTitle,controller: _titleController,
                    hintText:appLocalizations.event_title,keyboardType:TextInputType.text,
            prefixIcon:Icon(Icons.edit_note),),
                SizedBox(height: 16.h),
                Text(appLocalizations.description,style:Theme.of(context).textTheme.bodySmall),
                SizedBox(height: 8.h),
                CustomTextFormField(validator:Validator.validateEventDescription,controller: _descriptionController,
                  hintText:appLocalizations.event_description ,maxLiens: 4,keyboardType:TextInputType.text,),
                SizedBox(height: 16.h),
                Row(children: [Icon(Icons.calendar_month,),
                  SizedBox(width: 8.w,),
                  Text( selectedDateTime.toFormattedDate,style:Theme.of(context).textTheme.bodySmall),
                  Spacer(),
                  CustomTextButton(text: appLocalizations.choose_date,    onTap: _selectEventData,)
                ],),
                SizedBox(height: 16.h),
                Row(children: [Icon(Icons.timer_outlined),
                  SizedBox(width: 8.w,),
                  Text( selectedDateTime.toFormattedTime,style:Theme.of(context).textTheme.bodySmall),
                  Spacer(),
                  CustomTextButton(text:appLocalizations.choose_time, onTap: _selectEventTime ,
                  )
                ],),
                SizedBox(height: 16.h),
                Text(appLocalizations.location,style:Theme.of(context).textTheme.bodySmall),
                SizedBox(height: 30.h),
                SizedBox(height: 8.h),
                CustomElevatedButton(onPressed:  widget.event == null? _createEvent:_updateEvent,
                    text:  widget.event == null? appLocalizations.add_event:appLocalizations.update_event)

              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectEventData() async {
    selectedDateTime =
        await showDatePicker(
         // locale: Locale("ar"),
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        ) ??
            selectedDateTime;
    selectedDateTime = selectedDateTime.copyWith(
      hour: selectedTimeTemp.hour,
      minute: selectedTimeTemp.minute,
    );
    print(selectedDateTime.toString());
    setState(() {});
  }

  void _selectEventTime() async {
    selectedTimeTemp =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
            selectedTimeTemp;
    selectedDateTime = selectedDateTime.copyWith(
      hour: selectedTimeTemp.hour,
      minute: selectedTimeTemp.minute,
    );
    setState(() {});
  }

  void _createEvent()async{
    if(_formKey.currentState?.validate()==false)return;
    selectedDateTime;
    selectedCategory;
    _descriptionController;
    _titleController;
    EventModel event=EventModel(id:"",category: selectedCategory, title: _titleController.text, description: _descriptionController.text, dateTime: selectedDateTime);
    UiUtils.showLoading(context, false);
await FirebaseService.addEventToFireStore(event,context);
UiUtils.hideDialog(context);
    UiUtils.showToastMessage("Event created successfully", Colors.green);
    Navigator.pop(context);
  }

  void _updateEvent() async {
    if (_formKey.currentState?.validate() == false) return;
    UiUtils.showLoading(context,false);

    EventModel event = EventModel(
      id: widget.event!.id,
      category: selectedCategory,
      title: _titleController.text,
      description: _descriptionController.text,
      dateTime: selectedDateTime,
      uid: widget.event!.uid,
    );
    await FirebaseService.updateEvent(context,event);
    if (context.mounted) {
      Navigator.pop(context);
    }
    UiUtils.showToastMessage("Event Updated successfully",Colors.green);
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}


