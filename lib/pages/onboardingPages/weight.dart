import 'package:flutter/material.dart';

class Weight extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WeightState();
  }
}

class WeightState extends State<Weight> {
  int _pounds;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFeet() {
    return TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: 'Pounds'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Weight is Required';
        } else if (int.parse(value) < 30) {
          return 'Please Put in More Than 30 Pounds';
        } else if (int.parse(value) >= 1000) {
          return 'Please Put in Less Than 1000 Pounds';
        }
        return null;
      },
      onSaved: (value) {
        _pounds = int.parse(value);
      },
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent, //TODO: Pick a color
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'What is your weight?',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              //Row(children: <Widget>[],),
              _buildFeet(),
              SizedBox(height: 100),
              Container(
                margin: EdgeInsets.only(right: 16, bottom: 16),
                child: FloatingActionButton(
                  backgroundColor: Colors.lightBlueAccent,
                  heroTag: 'nextButton',
                  shape: CircleBorder(),
                  child: Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    print(_pounds);
                    Navigator.of(context).pushNamed(
                      '/seventh',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
