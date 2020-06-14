 # starreviews
 
A flutter package for displaying detailed star reviews

<img src=https://github.com/buraktabn/starreviews/raw/master/images/example.png width="200" />

## Install

```yaml
dependencies:  
  starreviews: ^1.0.1
```

```console
$  flutter pub get
```

```dart
import  'package:starreviews/starreviews.dart';
```

## Usage

```dart
List<String> _names = ['Star 5', 'Star 4', 'Star 3', 'Star 2', 'Star 1'];  
List<double> _values = [0.5, 0.2, 0.8, 0.5, 0.1];
```
```dart
StarReviews(  
  total: 20,  
  starNames: _names,  
  values: _values,  
  showPercentage: true,  
)
```

## Customization
Here is a list of properties available to customize the widget:

|        Name        	|       Type      	|                 Description                	|
|:------------------:	|:---------------:	|:------------------------------------------:	|
| total| int| total numbers of reviews           	|
| showHeader| bool| if false, hides header           	|
| showBottom| bool| if false, hides bottom reviews           	|
| showPercentage| bool| if false, hides rating number           	|
| starNames| List<String>| list of star names (max 5)           	|
| percentageStyle| TextStyle| style applied to percentage                                  	|
| showPercentage| bool| if false, hides percentage                                 	|
| valueColor| Color| color of the progressbar             	|
| progressBarBackgroundColor| Color| color of the progress bar background                      	|
| values| List<double>| list of review values as `double`                     	|
| starSize| double| the size of the stars                     	|
| starColor| Color| the color of the stars                     	|

  
## Contributions

Contributions of any kind are more than welcome! Feel free to fork and improve in any way you want, make a pull request, or open an issue.
