USE train;
SHOW TABLES;
SHOW COLUMNS FROM survival;
SELECT * FROM survival;


-- Q1. What is the total number of passengers who survived?
SELECT COUNT(*)
FROM survival
WHERE survived = 1;

-- After running the query above the answer is 342.

-- Q2. What is the total number of passengers who did not survive?
SELECT COUNT(*)
FROM survival
WHERE survived = 0;

-- After running the query above the answer is 549.

-- Q3. Get the name and sex of passengers under the age of 27 that embarked at Queenstown and Cherbourg?
SELECT passenger.name, passenger.sex 
FROM passenger
INNER JOIN traveldetail
ON passenger.PassengerId = traveldetail.PassengerId
WHERE age < 27 
AND Embarked = 'Q'
OR Embarked = 'C';

-- Q4.  How many of the passengers that embarked at Southampton survived?
SELECT COUNT(*)
FROM traveldetail
RIGHT JOIN survival
ON survival.PassengerId = traveldetail.PassengerId
WHERE Embarked = 'S'
OR survived = 1;
-- After running the query above the answer is 342.

-- Q5. Get the id, name and the total number of passengers who paid a fare greater 
-- than $100 and above the age of 35 had siblings or spouses on board?
SELECT passenger.PassengerId, passenger.Name
FROM passenger
INNER JOIN traveldetail
ON passenger.PassengerId = traveldetail.PassengerId
WHERE Fare > 100
AND age > 35
  OR SibSp = 0;
  