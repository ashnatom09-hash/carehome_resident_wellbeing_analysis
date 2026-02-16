select * from carehome limit 20
#Understand yourtable
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'carehome';

#What is the overall wellbeing level of residents?
SELECT
    COUNT(*) AS total_residents,
    MIN("Wellbeing_Score") AS lowest_wellbeing,
    ROUND(AVG("Wellbeing_Score"), 2) AS average_wellbeing,
    MAX("Wellbeing_Score") AS highest_wellbeing
FROM carehome;

#How does activity participation per week affect residents’ wellbeing score?
SELECT
    "Activity_Participation_Per_Week",
    ROUND(AVG("Wellbeing_Score"), 2) AS avg_wellbeing_score,
    COUNT(*) AS resident_count
FROM carehome
GROUP BY "Activity_Participation_Per_Week"
ORDER BY "Activity_Participation_Per_Week";

#Does staff consistency improve overall resident wellbeing
SELECT
    "Staff_Consistency_Score",
    ROUND(AVG("Wellbeing_Score"), 2) AS avg_wellbeing_score,
    COUNT(*) AS resident_count
FROM carehome
GROUP BY "Staff_Consistency_Score"
ORDER BY "Staff_Consistency_Score";

#Do residents with better nutrition intake or more frequent hydration monitoring have higher wellbeing scores?
SELECT
    "Nutrition_Intake_Score",
    ROUND(AVG("Wellbeing_Score"), 2) AS avg_wellbeing_score,
    COUNT(*) AS resident_count
FROM carehome
GROUP BY "Nutrition_Intake_Score"
ORDER BY "Nutrition_Intake_Score";

#hydration
SELECT
    "Hydration_Monitoring_Frequency",
    ROUND(AVG("Wellbeing_Score"), 2) AS avg_wellbeing_score,
    COUNT(*) AS resident_count
FROM carehome
GROUP BY "Hydration_Monitoring_Frequency"
ORDER BY "Hydration_Monitoring_Frequency";

#NUTRITION AND HYDRATION COMBINED 
SELECT
    "Nutrition_Intake_Score",
    "Hydration_Monitoring_Frequency",
    ROUND(AVG("Wellbeing_Score"), 2) AS avg_wellbeing_score,
    COUNT(*) AS resident_count
FROM carehome
GROUP BY "Nutrition_Intake_Score", "Hydration_Monitoring_Frequency"
ORDER BY "Nutrition_Intake_Score", "Hydration_Monitoring_Frequency";
#Does family contact frequency affect residents’ wellbeing scores?
SELECT
    "Family_Contact_Frequency",
    ROUND(AVG("Wellbeing_Score"), 2) AS avg_wellbeing_score,
    COUNT(*) AS resident_count
FROM carehome
GROUP BY "Family_Contact_Frequency"
ORDER BY avg_wellbeing_score DESC;
#Does Cognitive Status affect Wellbeing?
SELECT
    "Cognitive_Status",
    ROUND(AVG("Wellbeing_Score"), 2) AS avg_wellbeing_score,
    COUNT(*) AS resident_count
FROM carehome
GROUP BY "Cognitive_Status"
ORDER BY avg_wellbeing_score DESC;

