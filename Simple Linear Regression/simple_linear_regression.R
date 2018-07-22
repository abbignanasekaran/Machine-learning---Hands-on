# Simple Linaer Regression

#Importing the dataset
dataset = read.csv('Salary_Data.csv')



#Splitting the dataset into the Training set and Split set
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# scale does not work on categorical data
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])

# Fitting Simple Linear to the Training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set
               )

# Predicting the test set results

y_pred = predict(regressor, newdata = 'test_set')

# Visualizing the training set results

install.packages('ggplot2')
library(ggplot2)

ggplot2() +
  geom_plot(aes(x = training_set$YearsExperience, y = training_set$Salary),
       color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = 'training_set')),
                color = 'blue') +
  ggtitle('Salary vs Work Experience(Training set') +
  xlab('Years of Experience') +
  ylab('Salary')
