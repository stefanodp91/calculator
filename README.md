# calculator

Customizable calculator for iPadOS and iOS

It uses the [DDMathParser](https://github.com/davedelong/DDMathParser.git) core library to evaluate the most common math operations.

## Screenshots

<img src="https://github.com/stefanodp91/calculator/blob/master/resources/iPhone13pro-screen1.png" width="250"> | <img src="https://github.com/stefanodp91/calculator/blob/master/resources/iPhone13pro-screen2.png" width="250"> 


<img src="https://github.com/stefanodp91/calculator/blob/master/resources/iPadPro11-screen2.png" width="250"> |
<img src="https://github.com/stefanodp91/calculator/blob/master/resources/iPadPro11-screen1.png" width="450"> 


---

## Usage

1. Create your own [UIConfiguration](https://github.com/stefanodp91/calculator/blob/master/calculator/presentation/UIConfiguration.swift)

2. Add [CalculatorUI](https://github.com/stefanodp91/calculator/blob/master/calculator/presentation/CalculatorUI.swift) to your controller or storyboard for the ui.

3. Instantiate the [EvaluatorController](https://github.com/stefanodp91/calculator/blob/master/calculator/business/EvaluatorController.swift) to perform the evaluation of the math string passed from the ui

4. Draw the CalculatorUI by calling `.drawUI(YOUR_CONFIGURATION_OBJECT)` method

You can see the [Sample controller](https://github.com/stefanodp91/calculator/blob/master/calculator/ViewController.swift)


--- 

## Configurations

[UIConfigurationBuilder](https://github.com/stefanodp91/calculator/blob/master/calculator/presentation/UIConfiguration.swift) allows you to configure which keys you want to be shown on each single row:


```
    private func createConfiguration() -> UIConfiguration {
        return UIConfigurationBuilder()
            .addRow([
                DataBean(id: Symbol.clear.id, label: Symbol.clear.label, type: DataType.symbol),
                DataBean(id: MathSymbol.leftParentheses.id, label: MathSymbol.leftParentheses.label, type: DataType.symbol),
                DataBean(id: MathSymbol.rightParentheses.id, label: MathSymbol.rightParentheses.label, type: DataType.symbol),
                DataBean(id: Operation.division.id, label: Operation.division.label, type: DataType.operation),
            ])
            .addRow([
                DataBean(id: Cipher.seven.id, label: Cipher.seven.label, type: DataType.number),
                DataBean(id: Cipher.eight.id, label: Cipher.eight.label, type: DataType.number),
                DataBean(id: Cipher.nine.id, label: Cipher.nine.label, type: DataType.number),
                DataBean(id: Operation.multiplication.id, label: Operation.multiplication.label, type: DataType.operation),
            ])
            .addRow([
                DataBean(id: Cipher.four.id, label: Cipher.four.label, type: DataType.number),
                DataBean(id: Cipher.five.id, label: Cipher.five.label, type: DataType.number),
                DataBean(id: Cipher.six.id, label: Cipher.six.label, type: DataType.number),
                DataBean(id: Operation.subtraction.id, label: Operation.subtraction.label, type: DataType.operation),
            ])
            .addRow([
                DataBean(id: Cipher.one.id, label: Cipher.one.label, type: DataType.number),
                DataBean(id: Cipher.two.id, label: Cipher.two.label, type: DataType.number),
                DataBean(id: Cipher.three.id, label: Cipher.three.label, type: DataType.number),
                DataBean(id: Operation.sum.id, label: Operation.sum.label, type: DataType.operation),
            ])
            .addRow([
                DataBean(id: Cipher.zero.id, label: Cipher.zero.label, type: DataType.number),
                DataBean(id: MathSymbol.comma.id, label: MathSymbol.comma.label, type: DataType.symbol),
                DataBean(id: Symbol.delete.id, label: Symbol.delete.label, type: DataType.symbol),
                DataBean(id: MathSymbol.result.id, label: MathSymbol.result.label, type: DataType.result),
            ])
            .build()
    }
```

it is also possible to customize some graphic aspects such as button size, spaces and aspect ratio between the display and the calculator keyboard:

```
  return UIConfigurationBuilder()
            .addRow([ .... ])
            .setLabelsContainerScreenRatio(0.5)
            .setButtonsContainerScreenRatio(0.5)
            .setLabelResultRationInContainer(0.2)
            .setLabelCurrentExpressionRatioInContainer(0.8)
            .setLabelTextScaleFactor(0.2)
            .setLabelRadius(16)
            .setLabelContainerPadding(8)
            .setLabelInternalPadding(25)
            .setButtonsContainerPadding(8)
            .setButtonsSpacing(12)
            .setResultFontSize(60)
            .setCurrentCalculationFontSize(100)
            .setButtonFontSize(40)
            .setButtonRadius(16)
            .build()
```

---

## Compatibility

<img src="https://github.com/stefanodp91/calculator/blob/master/resources/compatibility.png"> 

---

## Known issues

1. Light theme is not working correctly
2. It is not possible to customize the colors from the configurator, they must be changed directly in the class [CalculatorUI](https://github.com/stefanodp91/calculator/blob/master/calculator/presentation/CalculatorUI.swift)
3. Some mathematical operations supported by the [DDMathParser](https://github.com/davedelong/DDMathParser.git) are not managed by the ui (for example the pow calculation)

---

## Credits

### Author

[![LinkedIn](https://tks.com.au/Images/Home/LinkedIn.png)](https://it.linkedin.com/in/stefano-de-pascalis-1b51aa6a)
Stefano de Pascalis
[](https://it.linkedin.com/in/stefano-de-pascalis-1b51aa6a)

### Libraries 
[DDMathParser](https://github.com/davedelong/DDMathParser.git)

---

## License
    Copyright 2016 stefanodp91.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
