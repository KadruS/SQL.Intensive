SELECT CONCAT(name, ' ', '(age:',age, ',gender:', '''',gender,'''', ',address:', '''',address,'''', ')') AS person_information
  FROM person
 ORDER BY 1 ASC;