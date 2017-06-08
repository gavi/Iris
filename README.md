
# Iris Example Swift Project

This example shows how to use a `.mlmodel` file. This model was created from sklearn iris data set.

The source to create the `iris.mlmodel` is below

```python
from sklearn import datasets
#from sklearn.svm import SVC
from sklearn.ensemble import RandomForestClassifier
import coremltools

iris = datasets.load_iris()
clf = RandomForestClassifier()
clf.fit(iris.data, iris.target_names[iris.target])
#Test to see if it is working correctly
print(list(clf.predict(iris.data[:3])))
print(list(clf.predict([[ 5.1,3.5,1.4,0.2]])))


#Now lets export to .mlmodel format
import coremltools
coreml_model = coremltools.converters.sklearn.convert(clf,['Sepal.Length','Sepal.Width','Petal.Length','Petal.Width'],'Species')
coreml_model.author = 'Gavi Narra'
coreml_model.license = 'BSD'
coreml_model.short_description = 'Predicts the iris species provided the sepal length, sepal width, petal length and petal width.'
coreml_model.save('iris.mlmodel')
```

