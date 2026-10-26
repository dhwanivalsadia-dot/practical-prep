### PRACTICAL NO. 02 - Graphs using R ###

# Q.1. Line graph
cat('\014')
days<-c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
students<-c(40, 45, 50, 48, 60)
plot(students, type="o", xaxt="n", main="Students Attending Online Lecture", xlab="Day", ylab="Number of Students", pch=16)
axis(1,at=1:5, labels=days)

# Q.2. Bar graph
cat('\014')
specialization<-c("Data Science", "Cyber Security", "AI", "Cloud Computing")
students<-c(40, 35, 45, 30)
bar_pos<-barplot(students, names.arg=specialization, main="Students in IT Specializations", xlab="Specialization", ylab="Number of Students", ylim=c(0,50), col="cyan")
text(x=bar_pos, y=students, labels=students, pos=3)

# Q.3. Pie chart
cat('\014')
subjects<-c("Programming", "Database", "Networking", "Mathematics", "Other")
hours<-c(10,6,5,4,3)
lab<-paste(subjects, "\n", hours)
pie(hours, labels=lab, main="Weekly Study Time", col=rainbow(length(hours)))
pc<-round(hours/sum(hours)*100,2)
lab<-paste(subjects, "\n", paste0("(", pc, "%)"))
pie(hours, labels=lab, main="Weekly Study Time", col=rainbow(length(hours)))

# Q.4. Histogram
cat('\014')
marks<-c(45, 55, 60, 62, 65, 67, 70, 72, 74, 75, 76, 78, 80, 82, 84, 85, 88, 90, 92, 95)
h<-hist(marks, main="Distribution of Programming Marks", xlab="Marks", ylab="Frequency", ylim=c(0,7), breaks=5, col="lightgreen")
text(x=h$mids, y=h$counts, labels=h$counts, pos=3)

# Q.5. Scatter plot
cat('\014')
study_hours<-c(2,3,4,5,6,7,8,9)
marks<-c(45, 50, 55, 65, 70, 75,82,88)
plot(study_hours, marks, main="Study Hours vs Programming Marks", xlab="Study Hours", ylab="Marks", xlim=c(0,10), ylim=c(0,100), pch=19, col="blue")

# Q.6. Box plot
cat('\014')
programming<-c(55, 60, 65, 68, 70, 72, 75, 80, 85)
database<-c(50, 55, 60, 62, 65, 68, 70, 75, 78)
networking<-c(45, 50, 55, 58, 60, 63, 67, 70, 72)
marks<-data.frame(programming, database, networking)
boxplot(marks, main="Subject-wise Marks Distribution", xlab="Subjects", ylab="Marks", col=c("lightblue", "lightgreen", "lightyellow"))

# Q.7. Multiple line graph
cat('\014')
months <- c("January", "February", "March", "April")
teamA <- c(5, 7, 8, 10)
teamB <- c(4, 6, 9, 11)
plot(teamA, type="o", pch=16, col="red", xaxt="n", ylim=c(0,12), main="Projects Completed by Teams", xlab="Month", ylab="Number of Projects")
axis(1, at=1:4, labels=months)
lines(teamB, type="o", pch=8, col="blue")
legend("topleft", legend=c("Team A", "Team B"), col=c("red", "blue"), pch=c(16,8), lty=1)

# Q.8. Horizontal bar graph
cat('\014')
languages <- c("Python", "R", "Java", "C++", "JavaScript")
users <- c(45, 30, 35, 25, 40)
par(mar=c(5,7,5,2))
par(mgp=c(5,1,0))
bar_pos<-barplot(users, names.arg=languages, horiz=TRUE, main="Programming Languages Used by Students", xlab="Number of Students", ylab="Programming Language", col="orange", xlim=c(0,50), las=1)
text(x=users + 2, y=bar_pos, labels=users, pos=4)

# Q.9. Dot chart
cat('\014')
activity <- c("Coding", "Reading", "Project", "Testing", "Documentation")
hours <- c(12, 7, 10, 6, 5)
dotchart(hours, labels=activity, main="Time Spent on IT Activities", xlab="Hours")

# Q.10. Line graph with points and grid lines
cat('\014')
month <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun")
usage <- c(80, 95, 110, 105, 125, 140)
plot(usage, type="o", xaxt="n", main="Monthly Internet Data Usage", xlab="Month", ylab="Data Usage (GB)", pch=19)
axis(1, at=1:6, labels=month)
grid()


### PRACTICAL NO. 03 - Diagrams using R ###

# Q.1. Computer -> Hardware/Software tree
cat('\014')
library(DiagrammeR)
grViz("digraph { Computer->Hardware Computer->Software Hardware->CPU Hardware->Memory Software->OS Software->Application }")

# Q.2. Marks pass/fail flow
library(DiagrammeR)
grViz("digraph { Start->Marks Marks->Check Check->Pass [label='Marks >= 40'] Check->Fail [label='Marks < 40'] Pass->End Fail->End }")

# Q.3. Directed Graph with igraph
cat('\014')
library(igraph)
g<-graph_from_literal(A+-B, A-+C, B-+D, C+-D, D-+E)
set.seed(10)
plot(g, layout=layout_with_fr(g), vertex.color="cyan", vertex.frame.color="blue", vertex.frame.width=3, vertex.size=30, vertex.label.color="black", edge.color="black", edge.width=2, main="Directed Graph")

# Q.4. Login flowchart
library(DiagrammeR)
grViz("digraph { Start [label='START', shape=oval] Login [label='Enter Username\\nand Password', shape=box] Validate [label='Validate Login', shape=diamond] Dashboard [label='Dashboard', shape=box] End [label='END', shape=oval] Error [label='Invalid Login', shape=box] Start -> Login Login -> Validate Validate -> Dashboard [label='Valid'] Validate -> Error [label='Invalid'] Dashboard -> End Error -> End }")

# Q.5. Web architecture
cat('\014')
library(DiagrammeR)
grViz("digraph{ node[shape=rectangle, style=dashed] edge[style=dashed] 'Web Browser'->'Web Server' 'Web Server'->'Application\nServer' 'Application\nServer'->'Database\nServer' 'Application\nServer'->'Payment\nGateway' }")


### PRACTICAL NO. 04 - Simple Linear Regression ###

# Q.1. Study hours vs marks
cat('\014')
study_hrs<-c(2,3,4,5,6,7,8,9,10,11)
marks<-c(45,50,54,61,65,70,74,80,85,88)
df<-data.frame(study_hrs, marks)
model<-lm(marks ~ study_hrs)
print(summary(model))
eq<-coef(model)
b0<-eq[1]
b1<-eq[2]
cat("Regression Equation y=", b0, "+",b1, "x")
ans<-predict(model, data.frame(study_hrs=7.5))
cat("\nPredicted Marks of a student who studies for 7.5 hours = ",ans)
plot(study_hrs, marks, main="Marks vs Study Hours", xlab="Study Hours", ylab="Marks", xlim=c(0,12), ylim=c(0,100))
abline(model,col="red")

# Q.2. Women dataset
cat('\014')
data(women)
print(women)
model<-lm(weight ~ height, data=women)
print(summary(model))
eq<-coef(model)
b0<-eq[1]
b1<-eq[2]
cat("Regression Equation y=", b0, "+",b1, "x")
ans<-predict(model, data.frame(height=65))
cat("\nPredicted weight of a woman with a height of 65 inches = ",ans, "\n\n")
predicted<-fitted(model)
res<-residuals(model)
result<-data.frame(Actual_Height=women$height, Actual_Weight=women$weight, Predicted_Weight=predicted, Residuals=res)
print(result)

# Q.3. RAM vs performance score
cat('\014')
ram<-c(4,6,8,10,12,14,16,18)
pscore<-c(45,52,60,67,73,78,84,88)
df<-data.frame(ram, pscore)
model<-lm(pscore ~ ram)
print(coef(model))
ans<-predict(model, data.frame(ram=75))
cat("\nPredicted Website Loading Time when 75 users access the website simultaneously = ", ans)
fit<-fitted(model)
res<-residuals(model)
plot(fit,res, main="Residuals vs Fitted Values", xlab="Fitted Values", ylab="Residuals")
abline(h=0)
qqnorm(res)
qqline(res)

# Q.4. cars dataset
cat('\014')
data(cars)
model<-lm(dist ~ speed, data=cars)
Speed<-c(10,15,20,25)
Stopping_Distance<-predict(model, data.frame(speed=Speed))
df<-data.frame(Speed, Stopping_Distance)
print(df)
plot(cars$speed, cars$dist, main="Stopping Distance vs Speed", xlab="Speed (mph)", ylab="Stopping Distance (miles)")
abline(model)
plot(model)

# Q.5. airquality dataset
cat('\014')
data(airquality)
head(airquality)
df<-na.omit(airquality[, c("Ozone", "Temp")])
model<-lm(Ozone ~ Temp, data=df)
print(summary(model))
ans<-predict(model, data.frame(Temp=80))
cat("\nozone concentration when the temperature is 80°F = ", ans)
plot(df$Temp, df$Ozone, main="Ozone Concentration vs Temperature", xlab="Temperature (°F)", ylab="Ozone Concentration", pch=19)
abline(model)


### PRACTICAL NO. 05 - Weighted Least Square using R ###

# Q.1. Study hours vs marks (WLS)
cat('\014')
study_hours<-c(2, 3, 4, 5, 6)
marks<-c(45, 50, 58, 65, 72)
weight<-c(1, 2, 3, 4, 5)
df<-data.frame(study_hours, marks, weight)
print(df)
model<-lm(marks ~ study_hours, data=df, weights=weight)
print(summary(model))
eq<-coef(model)
b0<-eq[1]
b1<-eq[2]
cat("\nRegression Equation: \nMarks =", b0, "+",b1, "*Study Hours\n")
answer<-predict(model, data.frame(study_hours=7))
cat("\nPredicted Marks=", answer)
plot(study_hours, marks, main="WLS Regression: Marks vs Study Hours", xlab="Study Hours", ylab="Marks", pch=19)
abline(model)

# Q.2. Advertising expenditure vs sales (WLS)
cat('\014')
advertising<-c(10,20,30,40,50)
sales<-c(25,38,55,70,88)
weight<-c(1,2,3,4,5)
df<-data.frame(advertising, sales, weight)
print(df)
model<-lm(sales ~ advertising, data=df, weights=weight)
print(summary(model))
eq<-coef(model)
b0<-eq[1]
b1<-eq[2]
cat("\nRegression Equation: \nSales =",b0, "+",b1, "*Advertising\n")
answer<-predict(model, data.frame(advertising=35))
cat("\nPredicted Sales=", answer)
plot(advertising, sales, main="WLS Regression: Sales vs Advertising", xlab="Advertising", ylab="Sales", pch=19)
abline(model)

# Q.3. cars dataset (WLS)
cat('\014')
data(cars)
print(head(cars))
w<-1/cars$speed
wls_model<-lm(dist ~ speed, data=cars, weights=w)
print(summary(wls_model))
eq<-coef(wls_model)
b0<-eq[1]
b1<-eq[2]
cat("\nRegression Equation: dist =", b0, "+",b1, "*speed\n")
answer<-predict(wls_model, data.frame(speed=20))
cat("\nPredicted Speed = ", answer)
plot(cars$speed, cars$dist, main="WLS Regression: Stopping Distance Vs Speed", xlab="Speed", ylab="Stopping Distance", pch=19)
abline(wls_model)

# Q.4. trees dataset (WLS)
cat('\014')
data(trees)
print(head(trees))
w<-1/trees$Height
wls_model<-lm(Volume ~ Girth, data=trees, weights=w)
print(summary(wls_model))
eq<-coef(wls_model)
b0<-eq[1]
b1<-eq[2]
cat("\nRegression Equation: Volume =", b0, "+",b1, "*Girth\n")
answer<-predict(wls_model, data.frame(Girth=15))
cat("\nPredicted Volume = ", answer)
plot(trees$Girth, trees$Volume, main="WLS Regression: Volume Vs Girth", xlab="Girth", ylab="Volume", pch=19)
abline(wls_model)


### PRACTICAL NO. 06 - Multiple Linear Regression and Ridge Regression ###

# Q.1. Exam marks (Multiple Linear Regression)
cat('\014')
student_data<-data.frame(
StudyHours=c(2,3,4,5,6,7,8,9,10,11),
Attendance=c(65,70,72,75,78,82,85,88,92,95),
Assignment=c(55,60,65,70,72,78,80,85,88,92),
ExamMarks=c(52,58,64,69,74,81,85,89,94,97)
)
print(student_data)
model<-lm(ExamMarks ~ StudyHours + Attendance + Assignment, data=student_data)
print(summary(model))
new_student<-data.frame(StudyHours=8, Attendance=85, Assignment=82)
answer<-predict(model, newdata=new_student)
cat("\nPredicted Marks=", answer)

# Q.2. House price (Multiple Linear Regression)
cat('\014')
HousePrice<-data.frame(
Area=c(800, 1000, 1200, 1400, 1600, 1800, 2000, 2200, 2400, 2600),
Bedrooms=c(2,2,3,3,3,4,4,4,5,5),
Age=c(20,18,15,12,10,8,7,5,4,2),
Price=c(45,55,65,75,88, 100, 115, 125,140,155)
)
print(HousePrice)
model<-lm(Price ~ Area + Bedrooms + Age, data=HousePrice)
print(summary(model))
new_house<-data.frame(Area=1900, Bedrooms=4, Age=6)
answer<-predict(model, newdata=new_house)
cat("\nPredicted Price=", answer)

# Q.3. mtcars dataset (Multiple Linear Regression)
cat('\014')
data(mtcars)
print(head(mtcars))
model<-lm(mpg ~ hp + wt + disp, data=mtcars)
print(summary(model))
new_car<-data.frame(hp=120, wt=2.8, disp=200)
answer<-predict(model, newdata=new_car)
cat("\nPredicted MPG=", answer)

# Q.4. mtcars dataset (Ridge Regression)
cat('\014')
library(glmnet)
data(mtcars)
x<-as.matrix(mtcars[, c("hp", "wt", "disp", "qsec")])
y<-mtcars$mpg
ridge_model<-glmnet(x, y, alpha=0)
cv_ridge<-cv.glmnet(x, y, alpha=0)
cat("\n Optimum Lambda=", cv_ridge$lambda.min)
plot(cv_ridge)
cat("\nCoefficients\n")
print(coef(cv_ridge, s="lambda.min"))

# Q.5. airquality dataset (Ridge Regression)
cat('\014')
library(glmnet)
data(airquality)
air_data<-na.omit(airquality)
x<-as.matrix(air_data[, c("Solar.R", "Wind", "Temp")])
y<-air_data$Ozone
ridge_model<-glmnet(x, y, alpha=0)
cv_ridge<-cv.glmnet(x, y, alpha=0)
cat("\nOptimum Lambda = ", cv_ridge$lambda.min)
plot(cv_ridge)
cat("\nCoefficients\n")
print(coef(cv_ridge, s="lambda.min"))
new_data<-matrix(c(200, 10, 80), nrow=1)
colnames(new_data)<-c("Solar.R", "Wind", "Temp")
answer<-predict(cv_ridge, newx=new_data, s="lambda.min")
cat("\nPredicted Ozone Concentration = ", answer)