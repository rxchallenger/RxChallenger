extends Control

var current_case :int = ScriptGlobal.current_case

func _enter_tree() -> void:
	hide()

var history_dic :Dictionary = {
	1:"Name: Mr. Ali Hassan

Age: 68 years

Sex: Male

Past Medical History:
Hypertension (diagnosed 15 years ago, controlled with medication).
Type 2 Diabetes Mellitus (diagnosed 10 years ago).
Hyperlipidemia (on treatment).
Mild cognitive impairment (noticed over the past two years, gradually worsening).
History of a minor ischemic stroke two years ago with no significant residual weakness.

Family History: Father passed away at age 75 from a stroke; mother had Alzheimer’s disease.

Social History:
Retired accountant.
Smokes 10 cigarettes/day for 40 years.
Rare alcohol use.

Medications at Home:
Metformin 500 mg BID.
Amlodipine 5 mg daily.
Bisoprolol 5 mg daily.",
	2:"Name: Mrs. Salma Ahmed

Age: 45 years

Sex: Female

Past Medical History:
Allergic rhinitis, managed with antihistamines.
No significant medical conditions.
Family History: Non-contributory.

Social History:
Non-smoker, occasional tea drinker.
Works as a teacher.

Dental History:
Occasional dental visits.
Last cleaning was over a year ago.",
	3:"Name: Mr. Hossam Farouk

Age: 55 years

Sex: Male

Past Medical History:
Type 2 Diabetes Mellitus (diagnosed 8 years ago, poorly controlled with HbA1c of 8.2%).
Chronic low back pain for 3 years, exacerbated by prolonged sitting or standing.
Vitamin D deficiency diagnosed a year ago, with incomplete adherence to supplementation.

Family History:
Father had osteoporosis and multiple fractures in his late 60s.
Mother had diabetes.

Social History:
Office worker, sedentary lifestyle.
Occasional smoker, no alcohol use.

Current Medications:
Metformin 850 mg BID.
Over-the-counter analgesics for pain relief.",
	4:"Name: Mr. Mahmoud El-Sayed

Age: 52 years

Sex: Male

Past Medical History:
Dyspepsia and chronic gastritis for 5 years, exacerbated by stress.
Hyperlipidemia, diagnosed 2 years ago, partially controlled with lifestyle changes.
Irritable Bowel Syndrome (IBS) with alternating constipation and diarrhea.

Family History:
Father: Hypertension and coronary artery disease.
Mother: Peptic ulcer disease.

Social History:
Works as a high-stress executive.
Smoker (1 pack/day for 20 years).
Occasional alcohol consumption.

Current Medications:
Over-the-counter antacids for heartburn relief.",
	5:"Name: Mrs. Leila Mostafa

Age: 64 years

Sex: Female

Past Medical History:
Type 2 Diabetes Mellitus for 12 years, controlled with oral hypoglycemics.
Hypertension for 10 years, managed with medication.
History of cataract surgery in the right eye 6 months ago.

Family History:
Mother: Glaucoma.
Father: Diabetes and macular degeneration.

Social History:
Retired teacher.
Non-smoker, no alcohol use.

Ophthalmic History:
Diagnosed with open-angle glaucoma 5 years ago.
Recent complaints of dry eye symptoms and discomfort following prolonged screen use.",
	6:"Name: Mr. Khaled Ibrahim

Age: 68 years

Sex: Male

Past Medical History:
Heart failure with reduced ejection fraction (HFrEF), diagnosed 3 years ago.
Hypertension for 15 years, controlled with medication.
Atrial fibrillation, diagnosed 6 months ago, with a history of embolic stroke 2 years ago.
Dyslipidemia, diagnosed 5 years ago.
Chronic kidney disease (CKD), Stage 3b.

Family History:
Father: Myocardial infarction at age 70.
Mother: Stroke at age 65.

Social History:
Retired accountant.
Non-smoker, occasional tea drinker.

Current Medications:
Beta-blockers discontinued due to bradycardia.",
	7:"Name: Ms. Salma Hussein

Age: 32 years

Sex: Female

Past Medical History:
Seasonal allergic rhinitis.
Recurrent sinus infections over the past 2 years, treated with antibiotics.
Mild asthma, controlled with as-needed inhalers.

Family History:
Mother: Chronic sinusitis.
Father: Allergies and eczema.

Social History:
Works as a florist, exposed to pollen and dust frequently.
Non-smoker, occasional tea drinker.",
	8:"Name: Mr. Ahmed Khalil

Age: 55 years

Sex: Male

Past Medical History:
Osteoarthritis in both knees, diagnosed 5 years ago.
History of mild lumbar disc prolapse 2 years ago.
Hypertension, well-controlled with medication.
No history of trauma or fractures.

Family History:
Father: Osteoarthritis.
Mother: Rheumatoid arthritis.

Social History:
Works as a taxi driver, involving prolonged sitting and limited physical activity.
Smokes 5-10 cigarettes per day.

Allergies:
None known.",
	9:"Name: Ms. Mariam Abdelrahman

Age: 38 years

Sex: Female

Past Medical History:
Recurrent episodes of abdominal discomfort and bloating, attributed to irritable bowel syndrome (IBS).
Helicobacter pylori infection, successfully treated 2 years ago.
History of recurrent urinary tract infections (UTIs).

Family History:
Mother: IBS.
Father: Type 2 diabetes mellitus.

Social History:
Works as a primary school teacher, often stressed.
Drinks 3–4 cups of coffee per day.
No smoking or alcohol consumption.",
	10:"Name: Mr. Hossam Youssef

Age: 58 years

Sex: Male

Past Medical History:
Ischemic stroke, 6 months ago, with residual mild left-sided weakness.
Type 2 diabetes mellitus for 12 years, controlled with oral hypoglycemics.
Hypertension for 15 years, controlled with medication.
Peripheral neuropathy, diagnosed 3 years ago.

Family History:
Father: Stroke at age 60.
Mother: Diabetes mellitus.

Social History:
Former construction worker, retired.
Smokes 1 pack/day for 30 years, recently reduced to 5 cigarettes/day.
Moderate alcohol use in the past, now abstinent.",
	11:"Name: Mr. Mahmoud Ezzat

Age: 45 years

Sex: Male

Past Medical History:
History of gallstones, diagnosed 6 months ago, with occasional episodes of biliary colic.
Chronic dyspepsia and bloating for the past year.
Mild hepatic steatosis noted on an abdominal ultrasound 2 years ago.
No known allergies.

Family History:
Father: Gallstones and diabetes mellitus.
Mother: Hyperlipidemia.

Social History:
Works as an office administrator with a sedentary lifestyle.
Consumes high-fat meals regularly.
No smoking or alcohol consumption.",
	12:"Name: Ms. Salma Ahmed

Age: 32 years

Sex: Female

Past Medical History:
Chronic gastritis diagnosed 2 years ago, managed with intermittent proton pump inhibitors.
Functional dyspepsia with episodes of bloating and nausea, especially after meals.
Peripheral neuropathy diagnosed 6 months ago, likely secondary to a vitamin B deficiency.

Family History:
Mother: History of peptic ulcer disease.
Father: Type 2 diabetes mellitus.

Social History:
Works as a sales assistant with irregular meal patterns.
Drinks 2–3 cups of coffee daily.
Non-smoker, no alcohol consumption.",
	13:"Name: Mr. Hossam Ali

Age: 55 years

Sex: Male

Past Medical History:
Gout diagnosed 3 years ago, with intermittent flare-ups.
Hypertension, well-controlled on medication.
History of kidney stones 5 years ago, resolved without complications.

Family History:
Father: Gout and chronic kidney disease.
Mother: Rheumatoid arthritis.

Social History:
Works as a construction foreman, with physically demanding tasks.
High intake of red meat and seafood.
Drinks alcohol occasionally and smokes 10 cigarettes/day.",
	14:"Name: Mrs. Amina Saleh

Age: 38 years

Sex: Female

Past Medical History:
Hypertension diagnosed 5 years ago, poorly controlled due to irregular follow-up.
Recurrent upper respiratory tract infections.
Allergy to penicillin.

Family History:
Father: Hypertension and chronic obstructive pulmonary disease (COPD).
Mother: Asthma.

Social History:
Works as a teacher with frequent exposure to children with respiratory illnesses.
Lives in a rural area with possible exposure to parasitic infections.
Non-smoker, no alcohol consumption.",
	15:"Name: Mr. Khaled Mahmoud

Age: 60 years

Sex: Male

Past Medical History:
Chronic obstructive pulmonary disease (COPD) diagnosed 10 years ago, with frequent exacerbations.
Gastroesophageal reflux disease (GERD) managed intermittently with proton pump inhibitors.
Atrial fibrillation (AF) diagnosed 1 year ago, treated with anticoagulants.

Family History:
Father: Hypertension and stroke.
Mother: Asthma.

Social History:
Retired office worker, spends most time indoors.
Smoked 1 pack/day for 35 years; quit 2 years ago.
Moderate coffee consumption, no alcohol use.",
	16:"Name: Mrs. Samar Ahmed

Age: 42 years

Sex: Female

Past Medical History:
Diagnosed with bronchial asthma 10 years ago, with moderate severity and seasonal exacerbations.
Allergic rhinitis triggered by dust and pollen.
No history of smoking.

Family History:
Father: Asthma and hypertension.
Mother: Seasonal allergies.

Social History:
Works as a librarian, often exposed to dust from old books.
Lives in an urban area with moderate air pollution.",
	17:"Name: Mr. Youssef Ali

Age: 55 years

Sex: Male

Past Medical History:
Chronic low back pain attributed to lumbar spondylosis diagnosed 5 years ago.
History of gastroesophageal reflux disease (GERD) managed with proton pump inhibitors intermittently.
Intermittent episodes of muscle spasms in the lower back.

Family History:
Father: Hypertension and osteoarthritis.
Mother: GERD.

Social History:
Works as a driver, spending long hours sitting.
Smokes 10 cigarettes/day for 20 years.
Occasional NSAID use for pain relief.",
	18:"Name: Mr. Ahmed Ibrahim

Age: 48 years

Sex: Male

Past Medical History:
Recurrent episodes of peptic ulcer disease managed with proton pump inhibitors.
Occasional joint pain in knees and wrists over the past year, likely due to osteoarthritis.
History of mild hypertension controlled with lifestyle modifications.

Family History:
Father: Osteoarthritis.
Mother: Hypertension and gastritis.

Social History:
Works as a construction worker with physically demanding tasks.
Smokes 15 cigarettes/day for 25 years.
Frequently consumes over-the-counter NSAIDs for joint pain.",
	19:"Name: Mr. Sameh Abdelrahman

Age: 67 years

Sex: Male

Past Medical History:
History of chronic cerebrovascular insufficiency, diagnosed 2 years ago.
Hypertension, managed with antihypertensive medications.
Type 2 diabetes mellitus for the past 10 years, controlled with oral hypoglycemic agents.

Family History:
Father: Stroke at age 70.
Mother: Type 2 diabetes and hypertension.

Social History:
Retired accountant.
Non-smoker, occasional tea drinker.
Sedentary lifestyle with minimal physical activity.",
	20:"Name: Ms. Salma Hassan

Age: 52 years

Sex: Female

Past Medical History:
Osteoarthritis of the knees, diagnosed 3 years ago.
Chronic low back pain attributed to lumbar spondylosis.
History of mild depression, managed intermittently with antidepressants.

Family History:
Mother: Osteoporosis and knee osteoarthritis.
Father: Hypertension.

Social History:
Office worker with sedentary lifestyle.
Non-smoker, occasional coffee drinker.
BMI: 32 kg/m² (classified as obese).",
	21:"Name: Ahmed Abdelrahman

Age: 42 years

Gender: Male

Medical History:
Mild hypertension (controlled with lifestyle changes)
Occasional acid reflux symptoms
No known allergies

Family History:
Father had a history of gastrointestinal issues and mild hypertension.
Mother has a history of type 2 diabetes and high cholesterol.

Social History:
Non-smoker
Drinks alcohol occasionally (social drinking)
Sedentary lifestyle but is trying to increase physical activity",
	22:"Name: Rania Abdelaziz

Age: 36 years

Gender: Female

Medical History:
No significant past medical history.
Occasionally experiences mild seasonal allergies.
No known chronic illnesses or regular medications.
Non-smoker, consumes alcohol socially.

Family History:
Mother has a history of asthma.
Father has a history of hypertension.

Social History:
Works as a teacher, sedentary lifestyle during weekdays, enjoys walking on weekends.
No recent travel history, no known exposure to contagious illnesses.",
	23:"Name: Ahmed Khaled

Age: 42 years

Gender: Male

Medical History:
Depression: Diagnosed 3 years ago, managed with intermittent psychotherapy and medications. Recently, symptoms of low mood, lack of interest in daily activities, and fatigue have worsened.
Gastroesophageal reflux disease (GERD): Diagnosed 5 years ago. Managed intermittently with antacids and H2 blockers, but recently experiencing more frequent episodes.
Irritable Bowel Syndrome (IBS): Diagnosed 2 years ago, characterized by bloating, abdominal discomfort, and irregular bowel movements.

Family History:
Father has a history of hypertension and type 2 diabetes.
Mother has a history of depression and osteoarthritis.

Social History:
Non-smoker, occasional alcohol use (1-2 drinks per week).
Works as an office manager and has a sedentary lifestyle, often under stress from work deadlines.
Reports poor sleep quality and high-stress levels recently.",
	24:"Name: Tamer El-Sayed

Age: 58 years

Gender: Male

Medical History:
Osteoarthritis: Diagnosed 5 years ago, with gradual worsening of knee pain, especially in the mornings and after physical activity.
Chronic Lower Back Pain: History of chronic lower back pain for the last 2 years, attributed to degenerative changes in the spine (disc degeneration).
Depression: Diagnosed 3 years ago and treated intermittently with selective serotonin reuptake inhibitors (SSRIs) but with poor adherence.
Hypertension: Diagnosed 2 years ago, managed with lifestyle changes and a low-dose antihypertensive.

Smoking: 20 cigarettes per day for the past 30 years.

Family History:
Father had osteoarthritis and hypertension.
Mother has a history of diabetes and heart disease.

Social History:
Works as an office manager, sitting for long hours at a desk. No regular exercise.
Reports poor sleep quality and increased stress at work.
Drinks alcohol occasionally (1-2 drinks per week).",
	25:"Name: Hana Ahmed

Age: 45 years

Gender: Female

Medical History:
Gastroesophageal Reflux Disease (GERD): Diagnosed 4 years ago. Patient has a history of heartburn, regurgitation, and acid reflux, especially after meals.
Irritable Bowel Syndrome (IBS): Diagnosed 2 years ago, with symptoms including bloating, abdominal discomfort, and irregular bowel movements (mostly diarrhea).
Hypertension: Diagnosed 3 years ago, well-controlled with medication.
Chronic Sinusitis: History of recurrent sinus infections with nasal congestion, especially in the winter months.

Smoking: Smokes 10 cigarettes per day for the past 20 years.

Allergies: No known drug allergies, but sensitive to dust and pollen.

Social History:
Occupation: Works as a bank manager, often stressed with long hours and sitting for extended periods.
Diet: High in processed foods, infrequent meals, often late at night.
Physical Activity: Sedentary lifestyle, does not exercise regularly.
Alcohol: Drinks socially on weekends (1-2 glasses of wine).",
	26:"Name: Sarah Mahmoud

Age: 52 years

Gender: Female

Medical History:
Chronic Venous Insufficiency (CVI): Diagnosed 2 years ago; experiencing leg discomfort and visible varicose veins.
Hyperprolactinemia: Diagnosed 1 year ago; associated with menstrual irregularities, fatigue, and occasional headaches.
Type 2 Diabetes Mellitus: Diagnosed 5 years ago; controlled with oral hypoglycemic agents.
Obesity: BMI of 32 kg/m².
Past Surgeries: Hysterectomy performed 4 years ago due to uterine fibroids.

Social History:
Occupation: Homemaker.
Diet: High-carbohydrate diet with limited physical activity.
Smoking/Alcohol: Non-smoker and no alcohol use.
Physical Activity: Minimal, avoids prolonged standing due to leg discomfort.",
	27:"Name: Eman Saeed

Age: 43 years

Gender: Female

Medical History:
History of recurrent urinary tract infections (UTIs).
Diagnosed with irritable bowel syndrome (IBS) 3 years ago, presenting with abdominal pain and bloating.
Allergies: No known drug or food allergies.
History of mild hypertension; controlled with lifestyle modifications.

Social History:
Diet: High in spicy foods and low in fiber.
Hydration: Poor water intake (~1 liter/day).
Physical Activity: Sedentary lifestyle.",
	28:"Patient History:
Name: Mostafa Youssef

Age: 57 years

Gender: Male

Medical History:
Hypertension, managed with ACE inhibitors.
Type 2 Diabetes Mellitus, controlled with oral hypoglycemics.
Previous episodes of vertigo and tinnitus, suspected to be related to Meniere’s disease.
Smoking History: Quit smoking 5 years ago after 20 years of smoking 1 pack/day.

Social History:
Diet: High in sodium and low in vegetables.
Physical Activity: Minimal, sedentary lifestyle.",
	29:"Name: Salma Hussein

Age: 23 years

Gender: Female

Medical History:
Diagnosed with mild acne vulgaris at age 17, previously managed with topical treatments.
History of mild skin sensitivity to strong cleansers and cosmetics.
No significant systemic conditions.

Family History:
Mother experienced adult-onset acne and oily skin.

Social History:
Diet: High consumption of dairy products and sugary snacks.
Skin Routine: Occasional use of non-comedogenic products but no consistent skincare routine.
Stress: High stress due to university exams, which exacerbates acne outbreaks.",
	30:"Name: Mohamed Salah

Age: 2 years

Gender: Male

Medical History:
Premature birth at 35 weeks; otherwise healthy development.
History of colic episodes and mild vitamin D deficiency diagnosed at 6 months.

Family History:
No significant medical conditions reported in parents or siblings.

Dietary History:
Transitioned from formula to regular diet at 12 months.
Fussy eater with limited vegetable and fruit intake.

Developmental History:
Normal growth and milestones within age range.",
	31:"Name: Karim Ahmed

Age: 4 years

Gender: Male

Medical History:
Recurrent upper respiratory tract infections (URTIs) in the past year.
Mild iron-deficiency anemia diagnosed at 3 years.
Known allergy to penicillin, causing rash and mild swelling.

Family History:
Father has a history of seasonal allergies.
Mother has asthma.

Dietary History:
Balanced diet, occasional fussy eating episodes.",
	32:"Name: Fatma Mahmoud

Age: 35 years

Gender: Female

Medical History:
Recurrent fungal infections, particularly in intertriginous areas.
Type 2 Diabetes Mellitus (T2DM), diagnosed 5 years ago, currently on oral hypoglycemic agents.
History of cellulitis 1 year ago, successfully treated with antibiotics.

Family History:
Mother has hypertension.
Father has a history of fungal nail infections.

Lifestyle:
Works as a cashier, prolonged sitting hours.
Reports occasional lapses in maintaining proper hygiene due to busy work schedule.",
	33:"Name: Ahmed Hassan

Age: 55 years

Gender: Male

Medical History:
Osteoarthritis diagnosed 3 years ago, primarily affecting the knees.
GERD (Gastroesophageal Reflux Disease), managed intermittently with proton pump inhibitors.
Hypertension controlled with amlodipine 10 mg daily.

Family History:
Father had severe osteoarthritis.
Mother had GERD and osteoporosis.

Lifestyle:
Sedentary office job, limited physical activity.
Reports poor adherence to physiotherapy exercises.",
	34:"Name: Salma Hussein

Age: 34 years

Gender: Female

Medical History:
Obesity (BMI: 32 kg/m²).
Vitamin D deficiency diagnosed 2 years ago.
History of occasional episodes of constipation.

Family History:
Mother: Type 2 Diabetes and hypertension.
Father: Obesity and dyslipidemia.

Lifestyle:
Sedentary office job, minimal physical activity.
Diet rich in processed foods and sugary beverages.

Current Medications:
None prior to this visit.",
	35:"Name: Ahmed Hassan

Age: 48 years

Gender: Male

Medical History:
Diagnosed with Irritable Bowel Syndrome (IBS) two years ago.
History of occasional heartburn.
No known allergies.

Family History:
Father: History of peptic ulcer disease.
Mother: Hypertension.

Lifestyle:
High-stress job as a sales manager.
Irregular meal patterns and frequent consumption of spicy foods.
Smokes 5 cigarettes/day.

Current Medications:
None prior to this visit.",
	36:"Name: Sarah Ahmed

Age: 32 years

Gender: Female

Medical History:
No significant past medical history.
Regular menstrual cycles until 6 months ago.
Previous miscarriage 2 years ago in the first trimester.
No chronic diseases or allergies.

Family History:
Mother: No significant health conditions.
Father: Hypertension, type 2 diabetes.
No family history of gynecological issues or hereditary disorders.

Lifestyle:
Non-smoker.
Rare alcohol consumption.
Works as a software developer (sedentary lifestyle).
Attempts to exercise 2-3 times a week.
Moderate stress levels related to work-life balance.

Obstetric History:
Gravida 2, Para 1 (one previous healthy full-term pregnancy).
No history of surgical procedures or complications in past pregnancies.",
	37:"Name: Ahmed Khaled

Age: 4 years

Gender: Male

Medical History:
No significant medical history.
Immunizations are up to date.
Mild asthma diagnosed at age 2, managed with inhalers.
No known allergies.
No history of chronic diseases (e.g., diabetes, hypertension).

Family History:
Father: No significant health issues.
Mother: History of seasonal allergic rhinitis.

Lifestyle:
Lives in a city with moderate air pollution.
Attends daycare, frequent exposure to other children with upper respiratory infections.
Regular physical activity (outdoor play).",
	38:"Name: Hassan Ahmed

Age: 67 years

Gender: Male

Medical History:
Hypertension (diagnosed 15 years ago, well-controlled with medication).
Type 2 Diabetes Mellitus (diagnosed 5 years ago, well-controlled with oral hypoglycemics).
Hyperlipidemia (on statins for 2 years).
No history of stroke or major neurological disorders.
No known drug allergies.
Mild cognitive decline, suspected early-stage dementia (evaluated 1 year ago).

Family History:
Father had a history of hypertension and stroke.
Mother had dementia (Alzheimer’s disease).

Lifestyle:
Retired, sedentary lifestyle.
Former smoker (quit 10 years ago).
Occasionally consumes alcohol (one or two drinks per week).
Diet includes high carbohydrate intake.",
	39:"Name: Mohamed Ali

Age: 58 years

Gender: Male

Medical History:
Type 2 Diabetes Mellitus (diagnosed 5 years ago, poorly controlled with occasional hypoglycemic episodes).
Hypertension (diagnosed 7 years ago, suboptimally controlled).
Hyperlipidemia (on statins for 3 years, LDL not well-controlled).
History of smoking (quit 15 years ago, 20 pack-years).
Family history of cardiovascular disease and diabetes.
No known drug allergies.

Family History:
Father had a history of diabetes and heart disease.
Mother had hypertension and hyperlipidemia.

Lifestyle:
Sedentary lifestyle, works at an office job.
Diet is high in carbohydrates and saturated fats.
Occasionally consumes alcohol (2-3 drinks on weekends).",
	40:"Name: Ahmed Hany

Age: 65 years

Gender: Male

Medical History:
Hypertension (diagnosed 10 years ago, poorly controlled at times).
Chronic Obstructive Pulmonary Disease (COPD) (diagnosed 5 years ago, moderate symptoms).
Chronic Kidney Disease (Stage 2) (diagnosed 3 years ago, stable).
Type 2 Diabetes Mellitus (diagnosed 6 years ago, poorly controlled with occasional fluctuations in blood sugar levels).
History of smoking (quit 7 years ago, 30 pack-years).
No known drug allergies.

Family History:
Father had a history of heart disease and hypertension.
Mother had type 2 diabetes and renal issues.

Lifestyle:
Sedentary lifestyle, works as a retired engineer.
Diet rich in processed foods and high in sodium.
Rare alcohol consumption, quit smoking 7 years ago.",
	41:"Name: Sara Mahmoud

Age: 58 years

Gender: Female

Medical History:
Osteoarthritis (diagnosed 6 years ago, affecting both knees).
Peripheral Artery Disease (PAD) (diagnosed 3 years ago, with intermittent claudication).
Hypertension (diagnosed 10 years ago, controlled with medication).
Hyperlipidemia (diagnosed 5 years ago, on statins).
History of gastrointestinal upset with NSAIDs.
No known drug allergies.

Family History:
Mother had a history of rheumatoid arthritis.
Father had cardiovascular disease.

Lifestyle:
Sedentary due to joint pain.
Non-smoker, moderate alcohol consumption.
Diet rich in carbohydrates but low in fiber.",
	42:"Name: Mahmoud Ali

Age: 32 years

Gender: Male

Medical History:
Seasonal allergic rhinitis.
History of mild asthma (occasional exacerbations).
No known drug allergies.

Family History:
Father has hypertension.
Mother has type 2 diabetes.

Lifestyle:
Works as a marketing manager with frequent late hours.
Smokes 10 cigarettes per day.
Drinks 3-4 cups of coffee daily.",
	43:"Name: Hany Salah

Age: 45 years

Gender: Male

Medical History:
Type 2 diabetes mellitus for 10 years, managed with oral hypoglycemics.
History of gastroesophageal reflux disease (GERD).
Occasional episodes of diarrhea after antibiotic use.

Family History:
Father with ischemic heart disease.
Mother with hypertension.

Lifestyle:
Works as a taxi driver with irregular meal timings.
Sedentary lifestyle and occasional alcohol consumption.",
	44:"Name: Salma Ahmed

Age: 32 years

Gender: Female

Medical History:
Irritable Bowel Syndrome (IBS) for 5 years
No known allergies
Intermittent tension headaches

Lifestyle:
Office worker with a sedentary lifestyle
Non-smoker
Regular caffeine intake (2–3 cups/day)",
	45:"Name: Omar Hassan

Age: 5 years

Gender: Male

Medical History:
Recurrent upper respiratory tract infections (URTI)
Mild allergy to dust
Normal growth and development milestones

Lifestyle:
Active preschooler
Diet predominantly includes homemade meals, with occasional fast food.",
	46:"Name: Ahmed Saleh

Age: 42 years

Gender: Male

Medical History:
Asthma (controlled with inhalers)
Seasonal allergies
History of mild GERD

Lifestyle:
Non-smoker
Works as a teacher
Moderate physical activity",
	47:"Name: Hossam Mahmoud

Age: 50 years

Gender: Male

Medical History:
Chronic low back pain due to lumbar spondylosis
History of hypertension (controlled with medication)
No known allergies

Lifestyle:
Works in construction (physically demanding job)
Smokes occasionally
Irregular physical activity",
	48:"Name: Mona Ali

Age: 37 years

Gender: Female

Medical History:
Recurrent episodes of tonsillitis in the past year.
Seasonal allergies managed with antihistamines.
No known drug allergies.

Lifestyle:
Works as a schoolteacher, frequently exposed to children with respiratory infections.
Non-smoker, moderate caffeine consumption.",
	49:"Name: Ahmed Saeed

Age: 29 years

Gender: Male

Medical History:
Recurrent ear infections in childhood.
No known allergies.
History of mild seasonal rhinitis managed with over-the-counter antihistamines.

Lifestyle:
Works in a construction company, frequently exposed to dust and noise.
Non-smoker.",
	50:"Name: Sara Ali

Age: 45 years

Gender: Female

Medical History:
No significant past medical history.
Mild hypertension, well-controlled with lifestyle modifications.
No known drug allergies.

Family History:
Mother had cataracts diagnosed at age 70.
Father has a history of age-related macular degeneration.

Lifestyle:
Works as an office manager, spends long hours in front of a computer.
Reports occasional eye strain and dry eyes, especially in the evenings.
Non-smoker.",
	51:"Name: Mohamed Said

Age: 50 years

Gender: Male

Medical History:
Diagnosed with peptic ulcer disease (PUD) two years ago, managed with proton pump inhibitors.
History of mild persistent asthma, controlled with inhaled corticosteroids.
No known drug allergies.

Social History:
Works as a taxi driver, reporting high stress levels and irregular meal patterns.
Smokes 1 pack of cigarettes daily for the past 20 years.
Drinks coffee frequently (4–5 cups daily).",
	52:"Patient History:
Name: Ahmed Khalil

Age: 45 years

Gender: Male

Medical History:
History of generalized anxiety disorder (GAD), treated intermittently with antidepressants.
Recurrent episodes of tension-type headaches over the past year.
No known drug allergies.

Social History:
Works as an accountant; reports high stress levels at work.
Regular caffeine consumption (3–4 cups daily).
Non-smoker and occasional alcohol use.",
	53:"Name: Fatma Saeed

Age: 52 years

Gender: Female

Medical History:
Hypertension (HTN): Diagnosed 10 years ago, currently on antihypertensive therapy.
Osteoarthritis: Complains of chronic joint pain, especially in the knees.
No known drug allergies.

Social History:
Sedentary lifestyle with minimal physical activity.
Non-smoker and non-drinker.",
	54:"Name: Ali Mansour

Age: 27 years

Gender: Male

Medical History:
Seasonal Allergic Conjunctivitis diagnosed three years ago.
No known chronic illnesses.
No history of prior eye surgeries or trauma.

Social History:
Works as a software developer with long hours in front of a screen.
No smoking or alcohol consumption.",
	55:"Name: Fatima Hassan

Age: 34 years

Gender: Female

Medical History:
History of functional dyspepsia diagnosed two years ago.
Occasional constipation and bloating episodes.
No known allergies.

Social History:
Sedentary lifestyle with irregular meal patterns.
Non-smoker and non-alcoholic.
Drinks 3-4 cups of coffee daily.",
	56:"Name: Ahmed Salim

Age: 28 years

Gender: Male

Medical History:
Diagnosed with iron-deficiency anemia 6 months ago.
No known allergies.

Social History:
Works as a delivery driver, irregular meal patterns.
Smoker (5-6 cigarettes/day).
Low dietary intake of iron-rich foods.",
	57:"Name: Fatima Hassan

Age: 32 years

Gender: Female

Medical History:
History of mild eczema during adolescence.
No known drug allergies.

Social History:
Works as a schoolteacher.
No history of smoking or alcohol consumption.
Recently returned from a trip to a humid tropical area.",
	58:"Name: Mariam Abdallah

Age: 27 years

Gender: Female

Medical History:
Occasional dry skin during winter months.
No history of allergies or chronic dermatological conditions.

Social History:
Works as an office assistant, frequently exposed to air-conditioned environments.
Moderate water intake.

Family History:
Mother has a history of eczema.",
	59:"Name: Ahmed Saleh

Age: 19 years

Gender: Male

Medical History:
Recurring acne flare-ups over the past 2 years.
No known allergies.
No chronic medical conditions.

Social History:
University student with stress-induced flare-ups during exams.
Diet includes occasional fast food and sugary snacks.

Family History:
Both parents had a history of acne during adolescence.",
	60:"Name: Mahmoud Hassan

Age: 55 years

Gender: Male

Medical History:
History of gout diagnosed 3 years ago.
Frequent episodes of abdominal discomfort and bloating.
No known drug allergies.

Social History:
Works as an accountant, leading a sedentary lifestyle.
Regular consumption of high-purine foods such as red meat and seafood.
Drinks alcohol occasionally.

Family History:
Father had a history of gout and hypertension.",
	61:"Name: Sara Ahmed

Age: 6 years

Gender: Female

Medical History:
Generally healthy with no significant medical history.
Up-to-date on vaccinations.
No known allergies.

Social History:
Attends kindergarten.
Eats a varied diet but tends to avoid vegetables.

Family History:
Parents are healthy, with no significant medical conditions.
Family history of vitamin deficiencies (mother had iron deficiency anemia as a child).",
	62:"Name: Ahmed El-Sayed

Age: 52 years

Gender: Male

Medical History:
Hypertension (controlled with medication).
Hyperlipidemia (managed with diet and lifestyle changes).
No known chronic illnesses or surgeries.
Non-smoker.

Social History:
Works as an accountant.
Sedentary lifestyle due to desk job.
Moderate alcohol consumption (occasionally drinks on weekends).

Family History:
Father had a myocardial infarction at age 60.
Mother had type 2 diabetes.",
	63:"Name: Sara Ahmed

Age: 24 years

Gender: Female

Medical History:
No significant medical history.
Previous episodes of acne during adolescence, treated with topical agents.
No known allergies.

Social History:
College student, lives in a dormitory.
Non-smoker, occasional alcohol use.
Diet consists of fast food and sugary snacks; limited vegetable intake.

Family History:
Mother has a history of adult acne.
Father has no significant health issues.",
	64:"Name: Ahmed Mohamed

Age: 35 years

Gender: Male

Medical History:
History of atopic dermatitis since childhood, with occasional flare-ups.
No other significant medical history.
No known allergies.

Social History:
Works as an IT consultant.
Lives in an urban area, experiences high-stress levels.
Non-smoker, drinks alcohol occasionally.
Maintains a diet high in processed foods, low in fruits and vegetables.

Family History:
Family history of eczema (mother) and asthma (sister).",
	65:"Name: Fatima Ahmed

Age: 28 years

Gender: Female

Medical History:
No significant past medical history.
Diagnosed with acne vulgaris in adolescence.
Recent concerns about skin pigmentation changes, particularly on the face.

Social History:
Works as a teacher.
Lives in a suburban area with moderate sun exposure.
Uses sunscreen sporadically and has not followed a consistent skincare regimen.

Family History:
No known family history of skin conditions or pigmentation disorders.",
	66:"Name: Ahmed Khaled

Age: 34 years

Gender: Male

Medical History:
No significant past medical history.
Has a history of atopic dermatitis diagnosed in childhood, currently well-managed.
No known allergies.

Social History:
Works as an accountant in an office environment.
Non-smoker, consumes alcohol occasionally.
No recent travel or changes in environment.

Family History:
No family history of skin disorders or autoimmune diseases.",
	67:"Name: Sarah Ahmed

Age: 29 years

Gender: Female

Medical History:
Diagnosed with asthma at age 15, well-managed with occasional use of bronchodilators.
No history of hospitalizations or exacerbations in the past year.
No known drug allergies.

Social History:
Works as a teacher and is exposed to dust and pollen.
Non-smoker and does not consume alcohol.
Engages in regular physical activity, such as jogging.

Family History:
Family history of asthma (mother) and allergic rhinitis (sister).",
	68:"Name: Fatma El-Sayed

Age: 52 years

Gender: Female

Medical History:
Diagnosed with primary biliary cholangitis (PBC) two years ago.
History of gastritis treated intermittently with proton pump inhibitors.
Occasional constipation managed with over-the-counter remedies.
Vitamin D deficiency diagnosed six months ago, currently supplemented.

Social History:
Non-smoker, does not consume alcohol.
Works as a schoolteacher, sedentary lifestyle.
Balanced diet, though low in fiber.

Family History:
Father had cirrhosis related to chronic hepatitis B.
Mother has type 2 diabetes.",
	69:"Name: Mohamed Hassan

Age: 35 years

Gender: Male

Medical History:
Previously healthy with no significant chronic conditions.
Mild seasonal allergies, managed with over-the-counter antihistamines.

Social History:
Works as a sales manager, frequently eats out due to travel.
Non-smoker, occasional alcohol consumption.

Family History:
Mother has a history of irritable bowel syndrome (IBS).",
	70:"Name: Youssef Abdelrahman

Age: 45 years

Gender: Male

Medical History:
History of allergic rhinitis.
Mild intermittent asthma, currently not on regular controller medication.

Social History:
Non-smoker, avoids pets due to allergy triggers.
Works in a construction environment, with frequent exposure to dust.

Family History:
Father has a history of asthma.",
	71:"Name: Ahmed Mostafa

Age: 54 years

Gender: Male

Medical History:
Chronic knee pain diagnosed as osteoarthritis (OA) for the past 5 years.
Mild hypertension managed with medication (losartan 50 mg daily).
No known drug allergies.

Social History:
Works a desk job with minimal physical activity.
Smokes one pack of cigarettes per week.

Family History:
Father had arthritis and required knee replacement surgery in his late 60s.",
	72:"Name: Mostafa Hassan

Age: 42 years

Gender: Male

Medical History:
Diagnosed with Type 2 Diabetes Mellitus for 8 years, controlled with metformin.
No known drug allergies.

Social History:
Works in construction, with frequent exposure to minor cuts and wounds.
Smoker (10 cigarettes/day).

Family History:
Father had diabetes and hypertension.",
	73:"Name: Fatma Ahmed

Age: 57 years

Gender: Female

Medical History:
Chronic Obstructive Pulmonary Disease (COPD) for 10 years.
Hypertension controlled with amlodipine.
Mild gastroesophageal reflux disease (GERD).

Social History:
Former smoker (quit 5 years ago, 25 pack-year history).
Lives in a heavily polluted urban area.

Family History:
No significant family history of respiratory or cardiovascular conditions.",
	74:"Name: Mahmoud Tarek

Age: 45 years

Gender: Male

Medical History:
Type 2 diabetes mellitus for 10 years, managed with metformin.
Hypertension, controlled with lisinopril.
History of recurrent dermatitis on the face and upper chest.

Social History:
Works as a construction manager, exposed to dust and irritants.
Non-smoker.

Family History:
Father: Psoriasis and hypertension.
Mother: Type 2 diabetes mellitus.",
	75:"Name: Salma Ahmed

Age: 30 years

Gender: Female

Medical History:
History of mild seasonal allergies.
No chronic illnesses.

Social History:
Office worker with a sedentary lifestyle.
Occasional overuse of over-the-counter pain relievers for headaches.

Family History:
Father: Hypertension.
Mother: Rheumatoid arthritis.",
	76:"Name: Mostafa Ali

Age: 42 years

Gender: Male

Medical History:
History of chronic obstructive pulmonary disease (COPD).
Seasonal allergic rhinitis.
No known drug allergies.

Social History:
Works as a construction supervisor, frequently exposed to dust and pollutants.
Smoker (10 cigarettes/day for 20 years).

Family History:
Father: Hypertension and diabetes.
Mother: Asthma.",
	77:"Name: Hala Mostafa

Age: 6 years

Gender: Female

Medical History:
History of frequent upper respiratory tract infections.
No known drug allergies.

Social History:
Lives in a crowded urban area with poor ventilation.
Attends school and often exposed to classmates with similar symptoms.

Family History:
Mother: Allergic rhinitis.
Father: Seasonal bronchitis.",
	78:"Name: Mahmoud Ali

Age: 52 years

Gender: Male

Medical History:
Chronic hemorrhoids.
Intermittent episodes of urinary tract infections (UTIs).
No known drug allergies.

Social History:
Sedentary lifestyle with prolonged sitting at work.
Occasional smoker and moderate coffee consumption.

Family History:
Father: Benign prostatic hyperplasia (BPH).
Mother: History of varicose veins.",
	79:"Name: Fatma Elsayed

Age: 42 years

Gender: Female

Medical History:
Recurrent abdominal pain episodes in the last 3 months.
History of chronic back pain.
No known allergies.

Social History:
Works as a bank teller, involving long hours of sitting.
Rarely exercises and has irregular meals.
Occasional smoker.

Family History:
Father: Peptic ulcer disease.
Mother: Type 2 diabetes and hypertension.",
	80:"Name: Ahmed Hassan

Age: 35 years

Gender: Male

Medical History:
Previous diagnosis of low testosterone levels (hypogonadism).
Chronic fatigue and muscle weakness for the last 6 months.
History of mild acne treated sporadically with topical medications.

Social History:
Works in construction with high physical activity.
No known allergies.
Smoker, 10 cigarettes/day.

Family History:
Father: Hypertension.
Mother: Osteoporosis.",
	81:"Name: Mohamed Saleh

Age: 42 years

Gender: Male

Medical History:
Chronic gastritis for 5 years.
Known history of irritable bowel syndrome (IBS).
Seasonal allergic rhinitis.
No known drug allergies.

Social History:
Office worker with a sedentary lifestyle.
Non-smoker.
Drinks coffee 2–3 times daily.

Family History:
Father: Type 2 diabetes.
Mother: Hypertension.",
	82:"Name: Salma Ahmed

Age: 8 years

Gender: Female

Medical History:
Recurrent upper respiratory tract infections.
Mild allergic rhinitis.
No known drug allergies.

Social History:
Attends school regularly.
Exposed to secondhand smoke at home (father smokes).

Family History:
Mother: Asthma.
Father: Seasonal allergies.",
	83:"Name: Mariam Youssef

Age: 28 years

Gender: Female

Medical History:
Hirsutism (excessive facial hair growth) for 5 years.
Polycystic Ovary Syndrome (PCOS), diagnosed 3 years ago.
No known drug allergies.

Social History:
Works as a customer service representative.
No smoking or alcohol use.

Family History:
Mother: Type 2 Diabetes.
Father: Hypertension.",
	84:"Name: Hossam Ahmed

Age: 57 years

Gender: Male

Medical History:
Chronic fatigue and weakness for the past six months.
History of gastroesophageal reflux disease (GERD).
Diagnosed with mild orthostatic hypotension two years ago.
No known drug allergies.

Social History:
Retired accountant.
Non-smoker, occasional tea drinker.

Family History:
Father: Hypertension and ischemic heart disease.
Mother: Osteoarthritis.",
	85:"Name: Samar Hassan

Age: 42 years

Gender: Female

Medical History:
Recurrent episodes of abdominal discomfort and bloating.
Diagnosed with irritable bowel syndrome (IBS) two years ago.
History of occasional urinary tract infections (UTIs).
No known drug allergies.

Social History:
Office worker, sedentary lifestyle.
Occasional fast food consumption.

Family History:
Mother: History of gallstones.
Father: Type 2 diabetes.",
	86:"Name: Ahmed Khaled

Age: 7 years

Gender: Male

Medical History:
No significant medical history.
Up-to-date with vaccinations.
Allergic rhinitis (seasonal allergies).
No known drug allergies.

Social History:
Lives with parents and an older sister.
Attends school and participates in sports activities.

Family History:
Mother: Allergies (hay fever).
Father: No significant health issues.",
	87:"Name: Mohamed Hassan

Age: 55 years

Gender: Male

Medical History:
Hyperlipidemia (on atorvastatin).
History of recurrent urinary tract infections (UTIs).
Hypertension (controlled with medication).
No previous surgeries.

Social History:
Works as a bank manager.
Sedentary lifestyle with minimal physical activity.
Non-smoker and occasional alcohol consumption.

Family History:
Father: Deceased from myocardial infarction at age 65.
Mother: Hypertensive with diabetes.",
	88:"Name: Fatima Ali

Age: 62 years

Gender: Female

Medical History:
Osteoarthritis diagnosed 5 years ago.
Hypertension (controlled with medication).
No history of significant surgical interventions.

Social History:
Retired school teacher.
Moderate physical activity, including walking and gardening.
Non-smoker and consumes alcohol occasionally.

Family History:
Mother had osteoarthritis.
Father was hypertensive with a history of heart disease.",
	89:"Name: Ahmed Farouk

Age: 68 years

Gender: Male

Medical History:
Osteoporosis diagnosed 3 years ago.
Hypertension, well-controlled with medication.
No history of fractures but experiences joint pain.

Social History:
Retired civil servant.
Regularly engages in light exercises like walking.
Non-smoker and drinks alcohol occasionally.

Family History:
Family history of osteoporosis (mother) and cardiovascular diseases (father).",
	90:"Name: Fatima Hassan

Age: 54 years

Gender: Female

Medical History:
Type 2 diabetes mellitus diagnosed 5 years ago, controlled with oral hypoglycemics.
Hypertension diagnosed 3 years ago, controlled with medication.
Hyperlipidemia, managed with dietary changes.
No known allergies.

Social History:
Works as a school teacher.
Non-smoker.
Occasional alcohol consumption (1-2 drinks per week).
Follows a mostly healthy diet but struggles with portion control.

Family History:
Father had hypertension and heart disease; mother had diabetes.",
	91:"Name: Ahmed El-Sayed

Age: 42 years

Gender: Male

Medical History:
History of recurrent sinus infections for the past year, treated with various antibiotics.
Allergic rhinitis, managed with antihistamines.
No history of significant chronic diseases.
No known allergies to medications.

Social History:
Works as a computer programmer.
Non-smoker.
Consumes alcohol occasionally (1-2 drinks per week).
No recent travel history.

Family History:
Family history of allergies (mother) and hypertension (father).",
	92:"Name: Fatima Mahmoud

Age: 29 years

Gender: Female

Medical History:
No significant chronic diseases.
History of recurrent gastrointestinal issues (dyspepsia and occasional diarrhea) for the past six months.
Previous treatment with proton pump inhibitors with temporary relief.
No known drug allergies.

Social History:
Works as a teacher.
Non-smoker.
Occasional alcohol consumption (1-2 drinks per month).
Not currently pregnant but planning to conceive in the next year.

Family History:
No significant family history of gastrointestinal diseases or hereditary conditions.",
	93:"Name: Ahmed Khaled

Age: 54 years

Gender: Male

Medical History:
History of benign prostatic hyperplasia (BPH) diagnosed 2 years ago.
Hypertension, controlled with medication.
No history of kidney stones or urinary tract infections.
No known drug allergies.

Social History:
Works as an accountant.
Non-smoker.
Consumes alcohol occasionally (social drinking).
Engages in regular moderate exercise.

Family History:
Family history of prostate issues (father had BPH).
No significant family history of cancers or chronic diseases.",
	94:"Name: Sara Mohamed

Age: 42 years

Gender: Female

Medical History:
Diagnosed with hormone receptor-positive breast cancer 2 years ago, treated with surgery and chemotherapy.
Currently in remission and undergoing adjuvant hormonal therapy.
No significant past medical history of other conditions.

Social History:
Works as a teacher.
Non-smoker.
Consumes alcohol occasionally (social drinking).
Active lifestyle; participates in regular exercise.

Family History:
Family history of breast cancer (mother diagnosed at age 50).
No significant family history of other cancers or chronic diseases.",
	95:"Name: Ahmed Saad

Age: 35 years

Gender: Male

Medical History:
History of allergic conjunctivitis.
Previous episodes of dry eyes, especially in winter.
No history of systemic diseases (e.g., diabetes, hypertension).
No prior eye surgeries.

Social History:
Works in an office environment, frequently uses a computer.
Non-smoker.
Occasional alcohol consumption.
Engages in regular exercise.

Family History:
No significant family history of eye diseases.
Family history of allergies.",
	96:"Name: Fatma Abdel Rahman

Age: 42 years

Gender: Female

Medical History:
History of bipolar disorder and recent manic episodes.
Seizure disorder, well-controlled with previous medications.
Past episodes of anxiety and depression.
No known drug allergies.

Social History:
Works as a teacher.
Lives with her husband and two children.
Non-smoker.
Drinks alcohol occasionally during social gatherings.

Family History:
Family history of mood disorders (mother with bipolar disorder).
No significant history of neurological disorders.",
	97:"Name: Ahmed Soliman

Age: 55 years

Gender: Male

Medical History:
History of osteoarthritis in both knees, managed with analgesics and occasional corticosteroid injections.
Recent history of deep vein thrombosis (DVT) following knee surgery three months ago, treated with anticoagulants.
No known allergies to medications.

Social History:
Retired civil engineer.
Lives alone; active lifestyle with regular walking and light gardening.
Non-smoker and consumes alcohol socially.

Family History:
Family history of cardiovascular disease and osteoarthritis.",
	98:"Name: Fatima Ahmed

Age: 32 years

Gender: Female

Medical History:
History of atopic dermatitis, managed with topical corticosteroids.
No known drug allergies.
No chronic illnesses or surgeries.

Social History:
Works as a graphic designer.
Lives with her husband and two children.
Non-smoker, moderate alcohol use.

Family History:
Family history of allergies and eczema.",
	99:"Name: Ahmed Salim

Age: 45 years

Gender: Male

Medical History:
History of osteoarthritis diagnosed 5 years ago, managed with NSAIDs as needed.
No previous surgeries related to the musculoskeletal system.
No known drug allergies.

Social History:
Works as an office manager.
Sedentary lifestyle, occasional walking for exercise.
Non-smoker, drinks alcohol socially.

Family History:
Family history of osteoarthritis in mother and father.",
	100:"Name: Fatima Ahmed

Age: 50 years

Gender: Female

Medical History:
Diagnosed with gastroesophageal reflux disease (GERD) 2 years ago, treated intermittently with proton pump inhibitors and H2 blockers.
History of osteoarthritis affecting the knees and lower back, managed with nonsteroidal anti-inflammatory drugs (NSAIDs) as needed.
No previous surgeries related to the musculoskeletal system.
No known drug allergies.

Social History:
Works as a school teacher.
Engages in low-impact aerobic exercise 2-3 times per week.
Non-smoker, consumes alcohol occasionally.

Family History:
Family history of osteoarthritis in both parents, hypertension in father.",
	101:"Name: Omar Khaled

Age: 6 years

Gender: Male

Medical History:
History of recurrent upper respiratory tract infections (URTIs), approximately 3 episodes in the past year.
Mild seasonal allergies, treated with antihistamines as needed.
No history of chronic illness or hospitalization.
No known drug allergies.

Social History:
Attends kindergarten.
Lives in a household with two siblings, one of whom recently had a cold.
Up-to-date with vaccinations.

Family History:
Family history of allergic rhinitis in the mother.
No family history of asthma or significant respiratory diseases.",
	102:"Name: Dina Hafez

Age: 29 years

Gender: Female

Medical History:
History of androgenetic alopecia (diagnosed 2 years ago).
Occasional eczema flare-ups on the scalp.
No known drug allergies.

Social History:
Works in a high-stress office environment.
Poor dietary habits with limited protein intake.
Recently delivered a baby 8 months ago (postpartum phase).

Family History:
Positive family history of hair thinning in her mother.",
	103:"Name: Mohamed Ali

Age: 55 years

Gender: Male

Medical History:
History of hypertension (diagnosed 5 years ago, currently on medication).
History of gastroesophageal reflux disease (GERD).
No known allergies to medications.

Social History:
Works as a taxi driver, often experiences irregular meal timings.
Smokes approximately 15 cigarettes/day for 25 years.
Reports frequent consumption of caffeinated beverages to stay alert.

Family History:
Positive history of cardiovascular disease in first-degree relatives (father had a myocardial infarction at 60).",
	104:"Name: Salma Hassan

Age: 27 years

Gender: Female

Medical History:
Diagnosed with mild atopic dermatitis during adolescence.
Seasonal allergies (allergic rhinitis).
No history of systemic illnesses or chronic conditions.

Social History:
Works as a teacher, often exposed to dust in the classroom.
Occasionally uses over-the-counter creams for skin irritation.
No smoking or alcohol use.

Family History:
Mother has a history of eczema.",
	105:"Name: Mahmoud Ebrahim

Age: 45 years

Gender: Male

Medical History:
Diagnosed with lower back pain (lumbar spondylosis) 2 years ago.
No known allergies.
Intermittent episodes of muscle spasms in the lower back.
History of mild gastritis.

Social History:
Works as a construction supervisor, with prolonged standing and heavy lifting.
Smoker (15 cigarettes/day).
No alcohol consumption.

Family History:
Father had osteoarthritis.",
	106:"Name: Huda Mahmoud

Age: 33 years

Gender: Female

Medical History:
History of recurrent urinary tract infections (UTIs).
Diagnosed with bacterial vaginosis 6 months ago, treated successfully.
No known drug allergies.

Social History:
Married, no children yet.
Works as a teacher, no exposure to occupational hazards.
Good personal hygiene practices.

Family History:
Mother has type 2 diabetes.",
	107:"Name: Kareem Saleh

Age: 25 years

Gender: Male

Medical History:
Recurrent episodes of seasonal allergies.
History of sinusitis two years ago, treated successfully.
No known drug allergies.

Social History:
Works as a mechanic, often exposed to dust and fumes.
Smokes 5-6 cigarettes daily.

Family History:
Father has asthma.",
	108:"Name: Ali Mohamed

Age: 7 years

Gender: Male

Medical History:
Diagnosed with recurrent fungal infections in the past year.
History of mild seasonal allergies, treated with antihistamines.
No history of significant illnesses or hospitalizations.

Social History:
Attends school regularly, participates in sports activities.
Lives in a rural area with exposure to farm animals and outdoor activities.

Family History:
Mother has a history of atopic dermatitis.",
	109:"Name: Amr Saeed

Age: 52 years

Gender: Male

Medical History:
Hypertension for the past 5 years, controlled with medication.
Recently diagnosed with mild osteopenia following a routine check-up.
Occasional fatigue and muscle weakness reported over the last few months.

Social History:
Works a sedentary office job, limited physical activity.
Smokes 5 cigarettes/day for the past 20 years.
Consumes a diet low in calcium and vitamin D-rich foods.

Family History:
Mother had osteoporosis and a history of fractures in her 60s.",
	110:"Name: Salma Ahmed

Age: 32 years

Gender: Female

Marital Status: Married

Medical History:
Recurrent vaginal yeast infections over the past 2 years.
No history of sexually transmitted infections (STIs).
Diagnosed with type 2 diabetes mellitus 5 years ago; blood sugar levels sub-optimally controlled (HbA1c: 8.2%).
No known drug allergies.

Social History:
Sedentary lifestyle, works as an office assistant.
Moderate intake of sugary foods despite dietary counseling.
Non-smoker, occasional alcohol consumption.

Obstetric and Gynecologic History:
Gravida 2, Para 1 (1 live birth, 1 miscarriage at 8 weeks).
Regular menstrual cycles, no contraceptive use.",
	111:"Name: Sara Mahmoud

Age: 28 years

Gender: Female

Marital Status: Married (actively trying to conceive for the past year)

Medical History:
Diagnosed with polycystic ovary syndrome (PCOS) 5 years ago.
History of irregular menstrual cycles (cycles range from 35–60 days).
Slightly elevated prolactin levels diagnosed 6 months ago (treated intermittently).
No history of hypertension or diabetes but reports a family history of type 2 diabetes (mother and grandmother).
No known drug allergies.

Lifestyle:
Sedentary lifestyle with occasional physical activity.
BMI: 29.5 (overweight).
Diet includes high carbohydrate intake with limited protein and fiber.",
	112:"Name: Khaled Ahmed

Age: 35 years

Gender: Male

Occupation: Office worker

Medical History:
Diagnosed with atopic dermatitis (chronic eczema) 10 years ago.
Seasonal allergies with intermittent flares of urticaria.
No known drug allergies.
Family history of eczema and asthma.
Previously treated with topical corticosteroids and emollients during flare-ups.

Lifestyle:
High stress due to work commitments.
Limited physical activity.
Frequently exposed to air-conditioned environments.",
	113:"Name: Hany Mahmoud

Age: 42 years

Gender: Male

Occupation: Accountant

Medical History:
Chronic obstructive pulmonary disease (COPD) diagnosed 5 years ago.
History of seasonal allergies.
Recurrent upper respiratory tract infections.
Previous episodes of acute bronchitis requiring corticosteroid treatment.

Lifestyle:
Smokes one pack of cigarettes daily for 20 years.
Sedentary lifestyle with occasional outdoor walks.
Reports a low intake of fruits and vegetables.",
	114:"Name: Malak Ahmed

Age: 7 years

Gender: Female

Medical History:
Low weight since birth (BMI in the 5th percentile for age).
Mild iron-deficiency anemia diagnosed 1 year ago.
History of frequent upper respiratory infections (4–5 times per year).

Family History:
Father: History of migraine.
Mother: Underweight during childhood with similar feeding challenges.

Dietary Habits:
Picky eater with a preference for snacks over balanced meals.
Limited intake of protein-rich foods and vegetables.",
	115:"Name: Khaled Hassan

Age: 38 years

Gender: Male

Medical History:
Complaints of abdominal discomfort and bloating for several months.
History of occasional fatigue and low energy levels.
No known chronic illnesses.

Lifestyle Factors:
Works as a construction worker with limited access to clean water during work hours.
Often eats undercooked or street-prepared food.

Family History:
No significant history of gastrointestinal diseases.",
	116:"Name: Fatma Ahmed

Age: 43 years

Gender: Female

Medical History:
Diagnosed with hyperthyroidism 6 months ago but reported inconsistent adherence to treatment.
Complaints of generalized anxiety and mild depressive symptoms for the past 3 months.
History of frequent episodes of acid reflux and epigastric discomfort.

Family History:
Sister has a history of hyperthyroidism.
No significant history of mental health disorders.

Lifestyle Factors:
Works a sedentary office job.
Consumes coffee multiple times a day.
Reports irregular meals and stress-eating patterns.",
	117:"Name: Ahmed Mahmoud

Age: 57 years

Gender: Male

Medical History:
Type 2 Diabetes Mellitus diagnosed 10 years ago.
Dyslipidemia with elevated LDL cholesterol.
History of hypertension, well-controlled with medication.
Iron-deficiency anemia identified during a routine check-up 2 months ago.

Family History:
Father had diabetes and coronary artery disease.
Mother had iron-deficiency anemia.

Lifestyle Factors:
Sedentary lifestyle with minimal physical activity.
Diet high in processed foods and low in fresh vegetables.
Former smoker; quit 3 years ago.",
	118:"Name: Fatma Hassan

Age: 45 years

Gender: Female

Medical History:
Type 2 Diabetes Mellitus diagnosed 5 years ago.
Recurrent urinary tract infections (UTIs).
No known drug allergies.

Family History:
Father had diabetes and hypertension.
Mother had recurrent kidney infections.

Lifestyle Factors:
Drinks minimal water daily (~1 liter).
Sedentary lifestyle due to desk job.",
	119:"Name: Amr Youssef

Age: 52 years

Gender: Male

Medical History:
Chronic gastritis diagnosed 3 years ago.
Osteoarthritis affecting the knees for 5 years.
Recent flare-up of lumbar disc herniation.
No known drug allergies.

Lifestyle Factors:
Sedentary lifestyle due to desk job.
Frequent use of over-the-counter pain medications.
Smoker (10 cigarettes/day for 20 years).",
	120:"Name: Fatma Mahmoud

Age: 36 years

Gender: Female

Medical History:
History of iron-deficiency anemia diagnosed 2 years ago.
Recurrent dyspepsia, likely related to NSAID use.
Occasional episodes of vertigo, especially during stress.

Lifestyle Factors:
Works long hours as a teacher.
Inconsistent dietary habits with low iron and vitamin intake.
No smoking or alcohol consumption.",
	121:"Name: Ahmed Saleh

Age: 42 years

Gender: Male

Medical History:
Type 2 Diabetes Mellitus for 5 years, managed with oral hypoglycemics.
History of recurrent skin infections, particularly around the lower extremities.
Occasional complaints of nerve pain, possibly linked to diabetic neuropathy.
Allergies: No known drug allergies.

Lifestyle Factors:
Works as a construction supervisor, exposed to physical strain and environmental factors.
Smokes 5-10 cigarettes daily.",
	122:"Name: Youssef Mahmoud

Age: 9 years

Gender: Male

Medical History:
History of seasonal allergies (allergic rhinitis).
Previous episode of acute otitis media 2 years ago, resolved with antibiotics.
No significant chronic illnesses.

Family History:
Mother has asthma.
No family history of autoimmune or metabolic diseases.
Allergies: Penicillin allergy (documented rash and swelling after use).",
	123:"Name: Fatma Ahmed

Age: 54 years

Gender: Female

Medical History:
Chronic hepatitis C diagnosed 5 years ago, currently on antiviral therapy.
History of mild fatty liver disease.
Hypertension managed with lifestyle changes and dietary modifications.
No previous surgeries.

Family History:
Father had liver cirrhosis due to alcohol use.
Mother has type 2 diabetes.
Allergies: No known drug allergies.",
	124:"Name: Ahmed El-Sayed

Age: 48 years

Gender: Male

Medical History:
Chronic lower back pain due to osteoarthritis diagnosed 3 years ago.
Epilepsy managed with Carbamazepine (Tegretol) for the past 10 years.
No history of major surgeries.
No known allergies.

Family History:
Family history of osteoarthritis and hypertension.
Father had a history of epilepsy.",
	125:"Name: Fatma Ahmed

Age: 34 years

Gender: Female

Medical History:
Diagnosed with migraine headaches for the past 5 years, with episodes occurring approximately 2-3 times per month.
No previous surgeries or major illnesses.
No known allergies.
Currently not taking any regular medications other than occasional over-the-counter pain relievers.

Family History:
Family history of migraines (mother) and hypertension (father).",
	126:"Name: Mohamed Ahmed

Age: 52 years

Gender: Male

Medical History:
History of osteoarthritis diagnosed 5 years ago, currently affecting the knees and lower back.
Hypertension, controlled with medication (Amlodipine).
No history of gastrointestinal diseases, such as peptic ulcer disease or gastroesophageal reflux disease (GERD).
No known drug allergies.

Family History:
Family history of osteoarthritis (mother) and cardiovascular disease (father).",
	127:"Name: Fatma El-Masry

Age: 34 years

Gender: Female

Medical History:
No significant past medical history.
No known allergies.
No history of chronic skin conditions.

Family History:
No family history of skin disorders or chronic diseases.",
	128:"Name: Ahmed Soliman

Age: 28 years

Gender: Male

Medical History:
History of chronic migraines for the past 5 years, with episodes occurring 2-3 times per month.
Diagnosed with epilepsy at age 18, currently well-controlled on carbamazepine.
No known drug allergies.

Family History:
Family history of migraines in the mother.
No significant family history of neurological disorders.",
	129:"Name: Fatma El-Sayed

Age: 52 years

Gender: Female

Medical History:
Diagnosed with estrogen receptor-positive breast cancer 6 months ago.
Underwent lumpectomy followed by radiation therapy.
No significant medical history of hypertension or diabetes.
Menopause at age 50, no hormone replacement therapy.
No known drug allergies.

Family History:
Family history of breast cancer in mother (diagnosed at age 60) and aunt.
No significant family history of other cancers or hereditary syndromes.",
	130:"Name: Ahmed El-Husseini

Age: 65 years

Gender: Male

Medical History:
History of osteoarthritis diagnosed 5 years ago, currently managed with non-steroidal anti-inflammatory drugs (NSAIDs).
Previous hip fracture at age 60, treated conservatively with rehabilitation.
No history of osteoporosis but has a family history of osteoporosis in mother.
No significant medical history of hypertension or diabetes.
No known drug allergies.

Family History:
Mother diagnosed with osteoporosis and hip fracture at age 70.
No other significant family history of musculoskeletal disorders.",
	131:"Name: Sara Mahmoud

Age: 32 years

Gender: Female

Medical History:
Recurrent episodes of cold sores (herpes labialis) over the past five years, usually triggered by stress or sun exposure.
History of mild atopic dermatitis during childhood, resolved without sequelae.
No known chronic illnesses or allergies.

Family History:
Mother with a history of cold sores.
No significant history of other dermatological or systemic conditions.

Social History:
Works as a schoolteacher with frequent outdoor exposure.
Non-smoker, moderate caffeine intake.
Uses over-the-counter sunscreens sporadically.",
	132:"Name: Khaled Hassan

Age: 45 years

Gender: Male

Medical History:
Chronic dyspepsia and acid reflux for the past three years, managed intermittently with over-the-counter antacids.
Occasional nausea and bloating, often associated with meals.
Mild anxiety and stress, especially during work deadlines.
No history of peptic ulcers, gastrointestinal bleeding, or surgeries.

Family History:
Father diagnosed with GERD and H. pylori infection.
No significant family history of other gastrointestinal or psychiatric conditions.

Social History:
Works as an accountant with a sedentary lifestyle.
Smokes approximately five cigarettes daily.
Regular coffee intake of 2–3 cups per day.
Consumes spicy and fatty foods frequently.",
	133:"Name: Mariam Saad

Age: 57 years

Gender: Female

Medical History:
Chronic obstructive pulmonary disease (COPD) for 8 years, managed with inhaled bronchodilators.
History of gastroesophageal reflux disease (GERD).
Seasonal allergic rhinitis.
Recent upper respiratory tract infection.

Family History:
Hypertension and diabetes in both parents.
No family history of malignancies or autoimmune diseases.

Social History:
Non-smoker but previously exposed to secondhand smoke for 15 years.
No alcohol use.",
	134:"Name: Nour Hassan

Age: 19 years

Gender: Female

Medical History:
Mild seasonal allergies.
History of acne since adolescence.
No known chronic illnesses.

Family History:
No significant dermatological conditions.
No family history of autoimmune diseases or hormonal disorders.

Social History:
University student under moderate stress due to exams.
Diet includes high intake of dairy and processed foods.
Does not smoke or consume alcohol.",
	135:"Name: Ibrahim Mostafa

Age: 42 years

Gender: Male

Medical History:
Chronic low back pain due to herniated lumbar discs (diagnosed 3 years ago).
Occasional episodes of muscle spasms.
History of gastritis.
No known allergies.

Family History:
Father with osteoarthritis.
No significant family history of autoimmune diseases.

Social History:
Office worker with prolonged sitting hours.
Occasionally smokes (3–5 cigarettes/day).
Limited physical activity.",
	136:"Name: Fatma Ahmed

Age: 56 years

Gender: Female

Medical History:
Type 2 Diabetes Mellitus diagnosed 12 years ago, poorly controlled on oral hypoglycemics.
Hypertension, well-controlled on antihypertensives.
Obesity (BMI: 32 kg/m²).
No known drug allergies.

Family History:
Father had type 2 diabetes and cardiovascular disease.
Mother had hypertension.

Social History:
Sedentary lifestyle with minimal physical activity.
High intake of refined carbohydrates.
Non-smoker and does not consume alcohol.",
	137:"Name: Mona Hassan

Age: 32 years

Gender: Female

Marital Status: Married for 4 years

Medical History:
Diagnosed with primary infertility for the past 2 years.
Regular menstrual cycles, with no significant gynecological issues reported.
No history of sexually transmitted infections.
No history of chronic illnesses or surgeries.

Family History:
No known genetic disorders or fertility issues.

Social History:
Non-smoker and does not consume alcohol.
Works as a teacher with moderate physical activity.",
	138:"Name: Adam Khaled

Age: 6 years

Gender: Male

Weight: 22 kg

Medical History:
Recurrent upper respiratory tract infections (URTIs).
No known drug allergies.
Up-to-date vaccination history.

Family History:
Older sibling with a history of allergic rhinitis.

Social History:
Lives in a crowded home environment with potential exposure to secondhand smoke.",
	139:"Name: Fatma Nabil

Age: 35 years

Gender: Female

Medical History:
History of seasonal allergic conjunctivitis.
No known drug allergies.
No systemic conditions like diabetes or hypertension.

Family History:
Mother with dry eye syndrome.

Social History:
Works as a data analyst, spends prolonged hours in front of a screen.
Occasional contact lens user, primarily for social events.",
	140:"Name: Mahmoud Ali

Age: 68 years

Gender: Male

Medical History:
Atrial fibrillation (diagnosed 5 years ago).
Heart failure with reduced ejection fraction (HFrEF, diagnosed 3 years ago).
Hypertension (diagnosed 10 years ago).
History of ischemic stroke (1 year ago).

Medications (prior to visit):
Beta-blockers (Metoprolol).
Aspirin (discontinued post-Warfarin initiation).
Statins (Atorvastatin).

Family History:
Father passed away from heart disease at 70.
Mother with a history of hypertension.

Social History:
Retired accountant.
Non-smoker, occasional alcohol use (discontinued after stroke).",
	141:"Name: Fatima Ahmed

Age: 34 years

Gender: Female

Medical History:

History of irritable bowel syndrome (IBS) diagnosed 5 years ago.
Occasional episodes of constipation and bloating.
No known drug allergies.
No significant past medical history beyond IBS.
Family History:

Mother has a history of IBS.
No family history of colorectal cancer or inflammatory bowel disease.
Social History:

Works as a teacher, sedentary lifestyle.
Non-smoker, moderate alcohol consumption (1-2 drinks per week).
Diet primarily consists of processed foods with low fiber intake.",
	142:"Name: Ahmed El-Sayed

Age: 52 years

Gender: Male

Medical History:
History of hypertension controlled with medication.
Mild chronic obstructive pulmonary disease (COPD).
No known drug allergies.
Previous hospitalizations for respiratory infections but otherwise in good health.

Family History:
Father had a history of cardiovascular disease.
No family history of bleeding disorders or significant respiratory diseases.

Social History:
Works as a construction manager, exposed to dust and allergens.
Non-smoker, does not consume alcohol.
Exercises occasionally but has a sedentary lifestyle due to work demands.",
	143:"Name: Fatima Hassan

Age: 45 years

Gender: Female

Medical History:
History of mild osteoarthritis in both knees.
Previous episodes of lower back pain, treated with physical therapy.
No known drug allergies.
No significant past surgical history.

Family History:
Mother had osteoarthritis; father had a history of hypertension.

Social History:
Works as an office administrator.
Sedentary lifestyle; exercises infrequently.
Non-smoker and consumes alcohol occasionally (1-2 glasses of wine per week).",
	144:"Name: Ahmed El-Sayed

Age: 34 years

Gender: Male

Medical History:
No significant past medical history.
No known drug allergies.
Vaccination status up to date.
Mild asthma, well-controlled with albuterol as needed.

Family History:
Father has a history of hypertension.
Mother has type 2 diabetes.

Social History:
Works as a teacher.
Engages in moderate physical activity (walking).
Non-smoker, drinks alcohol occasionally (1-2 drinks per week).",
	145:"",
	146:"",
	147:"",
	148:"",
	149:"",
	150:"",
	151:"",
	152:"",
	153:"",
	154:"",
	155:"",
	156:"",
	157:"",
	158:"",
	159:"",
	160:"",
	161:"",
	162:"",
	163:"",
	164:"",
	165:"",
	166:"",
	167:"",
	168:"",
	169:"",
	170:"",
	171:"",
	172:"",
	173:"",
	174:"",
	175:"",
	176:"",
	177:"",
	178:"",
	179:"",
	180:"",
	181:"",
	182:"",
	183:"",
	184:"",
	185:"",
	186:"",
	187:"",
	188:"",
	189:"",
	190:"",
	191:"",
	192:"",
	193:"",
	194:"",
	195:"",
	196:"",
	197:"",
	198:"",
	199:"",
	200:"",
	201:"",
	202:"",
	203:"",
	204:"",
	205:"",
	206:"",
	207:"",
	208:"",
	209:"",
	210:"",
	211:"",
	212:"",
	213:"",
	214:"",
	215:"",
	216:"",
	217:"",
	218:"",
	219:"",
	220:"",
	221:"",
	222:"",
	223:"",
	224:"",
	225:"",
	226:"",
	227:"",
	228:"",
	229:"",
	230:"",
	231:"",
	232:"",
	233:"",
	234:"",
	235:"",
	236:"",
	237:"",
	238:"",
	239:"",
	240:"",
	241:"",
	242:"",
	243:"",
	244:"",
	245:"",
	246:"",
	247:"",
	248:"",
	249:"",
	250:"",}



var complaint_dic :Dictionary = {
	1: "The patient’s daughter reports that he has been increasingly forgetful, repeating stories, and misplacing items. Recently, he has had trouble remembering appointments and experienced difficulty concentrating during conversations.",
	2: "Mrs. Salma presented to the dentist with severe pain and swelling in her lower right jaw for the past three days. She reports difficulty chewing and mild fever.",
	3:"The patient presents with worsening low back pain radiating to both legs over the past month, accompanied by numbness and tingling in the feet. He reports increased fatigue, difficulty climbing stairs, and muscle cramps, particularly at night.",
	4:"The patient complains of persistent upper abdominal discomfort and bloating after meals, accompanied by intermittent diarrhea and fatigue. He also mentions a bitter taste in his mouth, frequent belching, and occasional chest discomfort, especially after heavy meals.",
	5:"The patient reports persistent dryness, irritation, and a gritty sensation in both eyes, particularly during the evening. She also describes mild ocular pain and blurry vision in her right eye, which has worsened over the past week.",
	6:"The patient presents with worsening shortness of breath over the past week, particularly on exertion and while lying flat. He also reports swelling in both legs and occasional palpitations.",
	7:"Ms. Salma complains of persistent nasal congestion, facial pain around the cheeks and forehead, and thick yellowish nasal discharge for the past 10 days. She also reports mild eye redness and itching, accompanied by intermittent sneezing and a sore throat.",
	8:"Mr. Ahmed presents with worsening knee pain, stiffness, and swelling in both knees over the past 3 months, particularly after prolonged driving or walking. He also reports occasional low back pain radiating to his right leg, worsened with activity.",
	9:"Ms. Mariam reports persistent abdominal pain in the lower quadrants, accompanied by bloating, diarrhea alternating with constipation, and a feeling of incomplete evacuation. She also complains of nausea and a bitter taste in her mouth for the past week.",
	10:"The patient reports persistent burning and tingling pain in his feet and hands, worsening at night. He also complains of occasional dizziness and headaches.",
	11:"Mr. Mahmoud presents with intermittent upper abdominal pain, particularly after eating fatty meals, accompanied by bloating, mild nausea, and occasional episodes of burping. He also reports fatigue and a general sense of malaise over the past month.",
	12:"Ms. Salma reports persistent upper abdominal discomfort, bloating, and early satiety. She also complains of intermittent nausea, occasional tingling in her hands and feet, and fatigue.",
	13:"Mr. Hossam presents with sudden onset of intense pain, redness, and swelling in his right big toe, which began the previous night. He also complains of mild fever and difficulty walking.",
	14:"Mrs. Amina reports persistent cough, fatigue, mild fever, and generalized body aches for the past week. She also mentions itching and a mild skin rash that appeared two days ago.",
	15:"Mr. Khaled presents with worsening shortness of breath, productive cough with thick mucus, mild chest tightness, and fatigue over the past week. He also reports experiencing mild epigastric discomfort and occasional heartburn.",
	16:"Mrs. Samar presents with complaints of shortness of breath, wheezing, and persistent cough for the past 5 days. Symptoms worsen at night and with exposure to dust. She also reports difficulty clearing mucus and a feeling of tightness in her chest.",
	17:"Mr. Youssef presents with complaints of worsening low back pain that radiates to his left leg, accompanied by occasional tingling sensations. He also reports mild epigastric discomfort and bloating over the past week.",
	18:"Mr. Ahmed complains of severe knee and wrist pain, particularly during work, and mild swelling in both joints. He also reports stomach discomfort and nausea after taking pain relievers.",
	19:"Mr. Sameh presents with persistent dizziness, difficulty concentrating, and a recent increase in forgetfulness. He also reports intermittent tingling sensations in his hands and feet.",
	20:"Ms. Salma reports worsening knee pain, stiffness, and difficulty climbing stairs. She also complains of persistent lower back pain, which radiates intermittently to her thighs.",
	21:"Primary Complaint: Abdominal discomfort, bloating, and occasional indigestion for the past 2 months. Symptoms have been worsening over the past week, especially after meals, accompanied by mild heartburn. Associated Symptoms: Mild nausea after meals, belching, and a sensation of fullness. Duration of Complaint: 2 months, worsening over the past week. Previous Treatments: Over-the-counter antacids and dietary changes have provided minimal relief.",
	22:"Primary Complaint: Persistent cough, runny nose, and mild sore throat for the past 1 week. Associated Symptoms: Mild fever (37.5°C), headache, and fatigue. Duration of Complaint: Symptoms began 1 week ago and have not improved with over-the-counter medications. Previous Treatments: Self-medication with over-the-counter antihistamines and pain relievers without significant improvement.",
	23:"Primary Complaint: Persistent stomach discomfort, bloating, and acid reflux, along with worsening mood (feeling down and fatigued). Associated Symptoms: Difficulty concentrating, lack of interest in work and personal activities, occasional heartburn, and irregular bowel movements (alternating diarrhea and constipation). Duration of Complaint: Symptoms have gradually worsened over the past 2 months, especially the emotional and gastrointestinal symptoms. Previous Treatments: Has been using omeprazole occasionally for heartburn but hasn't found relief. Recently started experiencing more frequent episodes of acid reflux and abdominal discomfort. On-and-off use of antidepressants but never consistently, especially when feeling better.",
	24:"Primary Complaint: Severe lower back pain and knee pain that has progressively worsened over the past 6 months, with difficulty performing daily activities like walking, sitting, or climbing stairs. Associated Symptoms: Stiffness in the knees and lower back, especially after prolonged sitting or upon waking in the morning. Occasional numbness in the legs and tingling sensation around the knees. Duration of Complaint: Symptoms have been present for about 6 months, worsening gradually over time. Previous Treatments: Has tried over-the-counter analgesics (ibuprofen, paracetamol), but reports insufficient relief. Occasionally uses hot/cold therapy, which helps temporarily.",
	25:"Primary Complaint: The patient reports experiencing persistent bloating, upper abdominal discomfort, and a sensation of fullness. Additionally, she has been experiencing increased heartburn and regurgitation, especially after meals. Associated Symptoms: Nasal congestion, occasional headache, and a mild sore throat. Also reports frequent burping and mild nausea after eating. Duration of Complaint: Symptoms have been gradually worsening over the past 3 months. Previous Treatments: Previously treated with over-the-counter antacids and proton pump inhibitors (PPIs), but found that the symptoms are not fully alleviated. She has also used nasal decongestants for sinus issues intermittently, with temporary relief.",
	26:"Primary Complaint: Swelling and pain in both legs, particularly around the ankles, worsening with prolonged standing. Associated Symptoms: Persistent headache, occasional dizziness, and fatigue. Duration of Complaint: Symptoms have been worsening over the past 6 months.",
	27:"Primary Complaint: Lower abdominal pain, bloating, and burning sensation during urination. Associated Symptoms: Increased urgency and frequency of urination. Foul-smelling urine. Mild nausea and occasional diarrhea. Duration of Symptoms: 1 week.",
	28:"Primary Complaint: Persistent dizziness, especially when standing or moving quickly. Associated Symptoms: Ringing in the ears (tinnitus). Mild headache and occasional nausea. Difficulty concentrating and a feeling of mental fog. Duration of Symptoms: 2 weeks.",
	29:"Primary Complaint: Persistent acne lesions on the face, particularly on the cheeks and jawline. Associated Symptoms: Inflammation and redness around lesions. Occasional pustules and mild pain when touching the affected areas. Duration of Symptoms: Acne has worsened over the past 3 months.",
	30:"Primary Complaint: Persistent abdominal bloating and gas discomfort, particularly after meals. Skin irritation and mild redness on cheeks. Associated Symptoms: Restlessness, poor appetite, and occasional crying during bloating episodes. Red spots with minor pustules on the cheeks, worsening over the past two weeks. Duration of Symptoms: 3 weeks.",
	31:"Primary Complaint: Persistent productive cough with yellowish sputum. Fever (up to 38.5°C) for the past two days. Associated Symptoms: Mild wheezing and shortness of breath during physical activity. Fatigue and reduced appetite. Duration of Symptoms: 5 days.",
	32:"Primary Complaint: Painful erythematous rash with scaling and mild oozing in the groin and axillary areas. Associated Symptoms: Itching and burning sensation in the affected areas. Low-grade fever (37.8°C). Duration of Symptoms: 10 days.",
	33:"Primary Complaint: Worsening knee pain, stiffness, and swelling, especially in the mornings. Associated Symptoms: Difficulty walking long distances or climbing stairs. Occasional heartburn. Duration of Symptoms: 3 weeks.",
	34:"Primary Complaint: Difficulty losing weight despite attempting diets. Associated Symptoms: Fatigue and lack of energy. Occasional bloating and digestive discomfort. Duration of Symptoms: 6 months.",
	35:"Primary Complaint: Recurrent abdominal discomfort and bloating. Associated Symptoms: Intermittent diarrhea alternating with constipation. Occasional cramping, especially after meals. Duration of Symptoms: 3 months.",
	36:"Primary Complaint: Irregular menstrual cycles and difficulty conceiving. Associated Symptoms: Occasional lower abdominal pain associated with menstruation. Periods occur every 40-45 days, with light flow. Duration of Symptoms: Irregular cycles have been present for about 2 years, worsening in the last 6 months.",
	37:"Primary Complaint: Fever and cough for 3 days, associated with nasal congestion and difficulty breathing. Associated Symptoms: Watery eyes, sore throat, and mild chest tightness. No vomiting or diarrhea. No significant abdominal pain. Duration of Symptoms: Symptoms have been progressively worsening over the last 3 days.",
	38:"Primary Complaint: Persistent memory loss and difficulty concentrating for the past 6 months. Patient reports feeling forgetful, often misplacing items, and struggling to recall recent events. Associated Symptoms: Mild headache (occasionally). No visual or auditory disturbances. No significant motor weakness or sensory loss. Duration of Symptoms: Symptoms have progressively worsened over the past 6 months.",
	39:"Primary Complaint: Frequent episodes of fatigue, increased thirst, and frequent urination. The patient reports that his blood sugar is often fluctuating and occasionally spikes despite taking his prescribed diabetes medications. Associated Symptoms: Mild headaches, dizziness occasionally, and blurred vision during periods of high blood sugar. No chest pain, shortness of breath, or swelling in the legs. No recent weight loss or change in appetite. Duration of Symptoms: Symptoms have been present for the past few months, but they have worsened in the last 2 weeks.",
	40:"Primary Complaint: The patient complains of progressive shortness of breath, especially with exertion and while walking up stairs. He also reports increased leg swelling over the past few weeks. Associated Symptoms: Fatigue and occasional dizziness. Frequent urination, especially at night (nocturia). Reports some palpitations and feeling light-headed when standing up too quickly. No chest pain, no recent weight gain, no fever. Duration of Symptoms: Shortness of breath has been worsening over the past 2 months. Swelling has progressively increased over the last month.",
	41:"Primary Complaint: Severe knee pain and stiffness, worsening over the past month. Difficulty walking and climbing stairs due to pain and intermittent leg cramps. Associated Symptoms: Swelling in both knees, especially after prolonged activity. Cold sensation in feet and mild numbness during rest. Duration of Symptoms: Chronic knee pain present for several years, but acute worsening in the last month. Leg cramps and cold sensation noted for the past 2 weeks.",
	42:"Primary Complaint: Persistent dry cough and mild fever for 5 days. Headache and fatigue worsening over the past week. Associated Symptoms: Congested nose and sore throat. Occasional wheezing during nighttime. Duration of Symptoms: Onset 7 days ago, progressively worsening.",
	43:"Primary Complaint: Persistent nausea, vomiting, and abdominal pain for 2 days. Associated Symptoms: Mild fever (37.8°C), generalized weakness, and inability to tolerate oral intake. Loose stools with no blood or mucus. Duration of Symptoms: Started suddenly 2 days ago after eating food from a street vendor.",
	44:"Primary Complaint: Recurrent abdominal cramping, bloating, and excessive gas for the past 3 days. Associated Symptoms: Mild headache, Loss of appetite",
	45:"Primary Complaint: High fever (39.5°C) and sore throat for the past 2 days. Associated Symptoms: Vomiting (2 episodes in 24 hours), Loss of appetite, Mild abdominal discomfort",
	46:"Primary Complaint: Persistent dry cough for 1 week. Associated Symptoms: Low-grade fever (38°C), Mild chest tightness, Fatigue, Loss of appetite",
	47:"Primary Complaint: Acute onset of severe back pain radiating to the left leg (sciatica-like symptoms). Associated Symptoms: Stiffness in the lower back, Difficulty standing or walking for extended periods, Mild swelling in the lower back region",
	48:"Primary Complaint: Sore throat with difficulty swallowing for the past 3 days. Associated Symptoms: Fever (38.5°C/101.3°F). Swollen lymph nodes in the neck. Mild fatigue and body aches.",
	49:"Primary Complaint: Persistent ear discomfort and itching for 5 days. Associated Symptoms: Feeling of fullness in the ear. Occasional mild pain, especially when lying on the affected side. No fever or discharge.",
	50:"Primary Complaint: My eyes feel dry and tired, especially after a long day at work. Associated Symptoms: Occasional blurred vision after prolonged screen use. No redness, discharge, or visual field changes reported. Not experiencing any flashes of light or floaters.",
	51:"Primary Complaint: I’ve been having stomach pain and trouble breathing lately. Associated Symptoms: Epigastric burning pain, worse after meals and at night. Intermittent wheezing and shortness of breath, especially in the morning and during physical activity.",
	52:"Primary Complaint: I’ve been feeling very anxious, and my headaches are getting worse. Associated Symptoms: Persistent worry, restlessness, and irritability for the past month. Daily headaches, described as a dull, squeezing sensation, often triggered by work stress. Poor sleep quality, with difficulty falling and staying asleep.",
	53:"Primary Complaint: I’ve been having chest discomfort and muscle spasms in my upper back. Associated Symptoms: Localized muscle stiffness and pain in the back, radiating to the chest. Intermittent, non-radiating joint pain (knees and hips).",
	54:"Primary Complaint: My left eye has been red, watery, and painful for the past two days. Associated Symptoms: Eye discharge (yellowish). Mild swelling of the eyelids. Blurred vision in the affected eye.",
	55:"Primary Complaint: I’ve been feeling bloated and uncomfortable in my stomach after eating, with frequent belching. Associated Symptoms: Early satiety during meals. Intermittent abdominal pain (mild, non-radiating). Nausea without vomiting.",
	56:"Primary Complaint: I’ve been feeling tired and dizzy for the past two weeks, and I noticed a change in my bowel habits. Associated Symptoms: Fatigue, pallor, and shortness of breath on exertion. Mild abdominal discomfort and occasional diarrhea.",
	57:"Primary Complaint: I have itchy, red patches between my toes and on the soles of my feet that won’t go away. Associated Symptoms: Peeling skin, slight burning sensation, and occasional cracking in affected areas.",
	58:"Primary Complaint: My skin feels excessively dry and flaky, especially on my arms and legs. Associated Symptoms: Tightness and mild itching of the skin. Visible scaling and dull appearance in affected areas.",
	59:"Primary Complaint: My acne is getting worse, with redness and occasional pus-filled bumps. Associated Symptoms: Painful cystic lesions on the face and upper back. Persistent redness and post-inflammatory hyperpigmentation in affected areas.",
	60:"Primary Complaint: I've been experiencing bloating, stomach discomfort, and joint pain in my big toe. Associated Symptoms: Recurrent abdominal cramps, especially after meals. Pain and swelling in the right big toe joint.",
	61:"Primary Complaint: Sara seems tired all the time and is not eating well. Associated Symptoms: Occasional irritability. Complaints of headaches and mild abdominal discomfort. Recent increase in frequency of colds and infections.",
	62:"Primary Complaint: I've been feeling unusually fatigued and have noticed my skin is very dry. Associated Symptoms: Occasional muscle cramps. Mild joint pain. History of dry skin and brittle nails.",
	63:"Primary Complaint: I've been breaking out a lot on my face and back, and it's not responding to my usual treatments. Associated Symptoms: Red, inflamed lesions primarily on the face, chest, and back. Occasional pain associated with the lesions. Mild itching and discomfort.",
	64:"Primary Complaint: I have persistent itching and red patches on my arms and neck that won't go away. Associated Symptoms: Severe itching, particularly at night. Dry, flaky skin. Occasional weeping lesions during flare-ups.",
	65:"Primary Complaint: I have dark spots on my face that I want to get rid of. Associated Symptoms: Occasional mild acne flare-ups. No pain or itching associated with the dark spots. Noticeable changes in skin tone over the last 6 months.",
	66:"Primary Complaint: I have a persistent rash on my arms and legs that won’t go away. Associated Symptoms: Itching and discomfort, particularly in the evenings. Rash has been present for about 2 months and has not improved with over-the-counter creams. No fever or systemic symptoms reported.",
	67:"Primary Complaint: I have been experiencing increased shortness of breath and wheezing, especially at night. Associated Symptoms: Persistent cough, particularly in the early morning and at night. Reports a recent upper respiratory infection that resolved a week ago. Denies chest pain, fever, or swelling.",
	68:"Primary Complaint: I’ve been feeling fatigued and bloated for weeks, and my stools have become pale. Associated Symptoms: Persistent itchiness, especially at night. Mild abdominal discomfort on the right side. Reduced appetite and occasional nausea.",
	69:"Primary Complaint: I’ve had diarrhea for three days, and it’s not getting better. Associated Symptoms: Abdominal cramping and bloating. Mild nausea without vomiting. No fever or blood in stool.",
	70:"Primary Complaint: I’ve been having difficulty breathing and coughing for the past week, especially at night. Associated Symptoms: Wheezing and chest tightness. Mucus production, yellowish in color. Symptoms are worse at night and early morning.",
	71:"Primary Complaint: My knees hurt even more lately, and I struggle to go up and down stairs. Associated Symptoms: Stiffness in the morning lasting about 30 minutes. Occasional swelling and a cracking sound in the knees during movement.",
	72:"Primary Complaint: I have a painful and swollen abscess on my right arm that hasn't improved for a few days. Associated Symptoms: Redness and warmth around the area. Mild fever (37.8°C). Limited movement of the arm due to pain.",
	73:"Primary Complaint: I have been experiencing shortness of breath, productive cough with thick yellow sputum, and wheezing for the past 5 days. Associated Symptoms: Mild fever (37.9°C). Increased fatigue.",
	74:"Primary Complaint: I have red, itchy patches on my face and chest that are getting worse. Associated Symptoms: Scaling and mild burning sensation. Intermittent oozing from the affected areas.",
	75:"I have a fever, sore throat, and pain in my jaw.",
	76:"I've had a persistent cough, shortness of breath, and mild fever for three days",
	77:"She has had diarrhea, fever, and a productive cough for three days.",
	78:"I have pain and difficulty urinating, along with swelling and discomfort in the anal area.",
	79:"Severe abdominal pain radiating to my back, accompanied by nausea and loss of appetite.",
	80:"I feel constantly tired and weak, and my gym performance has decreased drastically. I’ve also noticed some weight gain.",
	81:"I have been experiencing stomach pain, bloating, and difficulty digesting meals for the past two weeks. Additionally, my seasonal allergies have flared up recently.",
	82:"Salma has been having a high fever, sore throat, and difficulty swallowing for the past 3 days. She also developed a dry cough and general body aches.",
	83:"I have excessive hair growth on my face, especially on my upper lip and chin, which is very embarrassing and difficult to manage.",
	84:"I feel extremely weak and lightheaded when I stand up, and I’ve been experiencing heartburn almost daily.",
	85:"I have been having severe abdominal pain and diarrhea for the past two days, along with nausea and fatigue.",
	86:"My son has had a fever, runny nose, and cough for the past three days, and he is feeling very tired.",
	87:"I have been experiencing persistent abdominal pain and increased urinary frequency over the past week.",
	88:"I have been experiencing worsening pain and stiffness in my knees and lower back, especially in the morning.",
	89:"I've been experiencing increasing joint pain and stiffness, particularly in my knees and lower back, and I'm worried about my bone health.",
	90:"I've been feeling more fatigued lately, and my blood pressure has been a bit high despite my medications.",
	91:"I have been experiencing persistent nasal congestion and ear pain that doesn’t go away, along with some fatigue.",
	92:"I have been experiencing severe abdominal pain, especially after eating, along with nausea and diarrhea.",
	93:"I have been experiencing difficulty urinating, with a weak stream and increased frequency, especially at night.",
	94:"I am here for a follow-up regarding my breast cancer treatment and to discuss the side effects I’ve been experiencing.",
	95:"I've been experiencing redness and discomfort in my right eye, along with excessive tearing and sensitivity to light.",
	96:"I've been feeling extremely anxious and restless lately, and I’ve had more frequent headaches.",
	97:"I have been experiencing significant swelling and pain in my right knee, and my leg feels heavy after walking.",
	98:"I have developed a red, itchy rash on my left forearm that has been worsening over the past week.",
	99:"I've been experiencing persistent pain and swelling in my right knee for the past month, especially after sitting for long periods.",
	100:"I have been experiencing persistent heartburn and stomach discomfort that is worsening, especially after taking pain medication for my knee pain.",
	101:"My son has had a runny nose, mild fever, and sore throat for the past three days.",
	102:"I’ve been experiencing severe hair loss and an itchy, flaky scalp for the past few months.",
	103:"I’ve been having frequent headaches and joint pain for the past two weeks.",
	104:"I have red, itchy patches on my hands and face that don’t seem to heal despite using moisturizing creams.",
	105:"I have been experiencing severe lower back pain that radiates down my right leg, along with muscle spasms, for the past two weeks.",
	106:"I’ve been experiencing abnormal vaginal discharge with a bad odor and mild lower abdominal discomfort for the past week.",
	107:"I’ve been experiencing a persistent cough, nasal congestion, and a mild fever for the past three days.",
	108:"My son has an itchy rash on his scalp and body for the past week, and he started developing a fever two days ago.",
	109:"I feel tired all the time, and I’ve been experiencing muscle cramps more frequently.",
	110:"I have intense vaginal itching, discharge, and discomfort that has worsened over the past week.",
	111:"I’ve been struggling with irregular periods, and I’m finding it hard to conceive.",
	112:"I have severe itching and red, scaly patches on my arms and legs that haven’t improved with over-the-counter creams.",
	113:"I’ve had a fever, persistent cough, and difficulty breathing for the past three days.",
	114:"She hasn’t been eating well for months, is very thin, and often seems tired.",
	115:"Persistent abdominal bloating and irregular bowel movements, with complaints of occasional itching around the anal area, especially at night.",
	116:"Palpitations, irritability, occasional hand tremors, and worsening of acid reflux symptoms over the past month.",
	117:"Fatigue, shortness of breath during light activity, and difficulty maintaining glycemic control.",
	118:"Symptoms: Frequent, painful urination for 3 days. Foul-smelling, cloudy urine. Fever of 38.5°C and general fatigue.",
	119:"Severe lower back pain radiating to the left leg for 4 days. Swelling and pain in both knees, worsened by activity. Occasional heartburn and upper abdominal discomfort.",
	120:"Persistent fatigue and dizziness for the past 3 weeks. Epigastric discomfort after meals and occasional nausea. Swelling and pain in the knees after prolonged standing.",
	121:"Swelling, redness, and pain around the left lower leg, with a pustular rash noted 4 days ago. Intermittent burning and tingling sensations in the feet over the last 2 weeks.",
	122:"Fever (38.5°C), sore throat, difficulty swallowing, and fatigue for the past 3 days.",
	123:"Fatigue and discomfort in the right upper quadrant of the abdomen for the past 2 months, with occasional episodes of nausea.",
	124:"The patient presents with worsening lower back pain radiating to the right hip, which has become more intense over the last month. He reports difficulty in performing daily activities and has experienced episodes of numbness in his right leg.",
	125:"The patient presents with a severe migraine attack, characterized by throbbing pain primarily on the right side of the head, accompanied by nausea, sensitivity to light, and occasional vomiting. The current episode has persisted for 24 hours despite the use of over-the-counter analgesics.",
	126:"The patient presents with worsening knee pain, rated 8/10 on the pain scale, which has increased in intensity over the last two weeks. The pain is exacerbated by activity and improves with rest. He also reports occasional heartburn but has not sought treatment for it.",
	127:"The patient presents with a 2-week history of itchy, red, and inflamed skin on her left arm. The rash is scaly, and she reports occasional oozing and crusting. She has been using over-the-counter hydrocortisone cream without improvement.",
	128:"The patient presents with a severe migraine headache that started 24 hours ago. He describes the headache as throbbing and located on the right side of his head. He reports associated symptoms of nausea, vomiting, and light sensitivity. He has attempted over-the-counter medications without relief.",
	129:"The patient presents for a follow-up visit, reporting mild hot flashes and occasional joint pain since starting tamoxifen therapy. She expresses concerns about the long-term effects of the medication and whether these symptoms are normal.",
	130:"The patient presents with complaints of persistent knee pain, particularly on weight-bearing activities, and occasional swelling. He is concerned about his bone health, especially after learning about his mother's condition.",
	131:"Primary Complaint: Painful, blistering lesions on her upper lip and around the mouth, present for two days. Secondary Complaint: Increased skin sensitivity and redness on her face due to recent sun exposure.",
	132:"Persistent upper abdominal discomfort and burning sensation, particularly after meals. Associated symptoms: Nausea, occasional vomiting, and a sensation of fullness.",
	133:"Persistent productive cough for two weeks accompanied by fever, wheezing, and chest tightness. Associated symptoms: Nasal congestion and postnasal drip.",
	134:"Persistent acne on the face and occasional dryness and flaking of the skin despite frequent use of over-the-counter products.",
	135:"Increased severity of lower back pain over the past two weeks, radiating to the left leg. Associated with stiffness and muscle spasms, particularly in the mornings and after prolonged sitting.",
	136:"Persistent fatigue, excessive thirst, and frequent urination over the past month. Unintentional weight loss of 3 kg over the last two months.",
	137:"Difficulty conceiving despite regular, unprotected intercourse for over two years. Anxiety and emotional distress related to infertility.",
	138:"High fever (39.5°C), persistent sore throat, nasal congestion, and fatigue for three days.",
	139:"Persistent eye redness, dryness, and a gritty sensation in both eyes for two weeks.",
	140:"Persistent fatigue, shortness of breath on mild exertion, and occasional episodes of dizziness.",
	141:"The patient presents with complaints of abdominal discomfort, bloating, and constipation for the past week.",
	142:"The patient presents with complaints of a persistent cough, nasal congestion, and occasional shortness of breath for the past week.",
	143:"The patient presents with complaints of persistent lower back pain that has worsened over the past two weeks. She describes the pain as dull and aching, with occasional sharp pain radiating down her left leg.",
	144:"The patient presents with a 5-day history of persistent cough, sore throat, and low-grade fever (up to 100.4°F). He also reports muscle aches and general fatigue.",
	145:"",
	146:"",
	147:"",
	148:"",
	149:"",
	150:"",
	151:"",
	152:"",
	153:"",
	154:"",
	155:"",
	156:"",
	157:"",
	158:"",
	159:"",
	160:"",
	161:"",
	162:"",
	163:"",
	164:"",
	165:"",
	166:"",
	167:"",
	168:"",
	169:"",
	170:"",
	171:"",
	172:"",
	173:"",
	174:"",
	175:"",
	176:"",
	177:"",
	178:"",
	179:"",
	180:"",
	181:"",
	182:"",
	183:"",
	184:"",
	185:"",
	186:"",
	187:"",
	188:"",
	189:"",
	190:"",
	191:"",
	192:"",
	193:"",
	194:"",
	195:"",
	196:"",
	197:"",
	198:"",
	199:"",
	200:"",
	201:"",
	202:"",
	203:"",
	204:"",
	205:"",
	206:"",
	207:"",
	208:"",
	209:"",
	210:"",
	211:"",
	212:"",
	213:"",
	214:"",
	215:"",
	216:"",
	217:"",
	218:"",
	219:"",
	220:"",
	221:"",
	222:"",
	223:"",
	224:"",
	225:"",
	226:"",
	227:"",
	228:"",
	229:"",
	230:"",
	231:"",
	232:"",
	233:"",
	234:"",
	235:"",
	236:"",
	237:"",
	238:"",
	239:"",
	240:"",
	241:"",
	242:"",
	243:"",
	244:"",
	245:"",
	246:"",
	247:"",
	248:"",
	249:"",
	250:"",}

var diagnosis_dic :Dictionary = {
	1: "Based on the clinical presentation, medication prescribed, and medical history, the patient likely has vascular dementia compounded by early Alzheimer’s disease or mixed dementia.",
	2: "Based on clinical examination and imaging, the patient was diagnosed with periapical abscess resulting from an untreated dental caries in the lower right molar.",
	3:"Primary Diagnosis: Diabetic neuropathy with lumbar spondylosis. Secondary Diagnosis: Osteomalacia secondary to vitamin D deficiency.",
	4:"Primary Diagnosis: Gastroesophageal Reflux Disease (GERD) with dyspepsia.Secondary Diagnosis: Functional dyspepsia and IBS, with hyperlipidemia.",
	5:"Primary Diagnosis: Dry Eye Disease (DED). Secondary Diagnosis: Post-cataract surgery inflammation and open-angle glaucoma.",
	6:"Primary Diagnosis: Exacerbation of heart failure with reduced ejection fraction (HFrEF). Secondary Diagnoses: Atrial fibrillation with anticoagulation therapy. Dyslipidemia with risk of atherosclerosis progression.",
	7:"Primary Diagnosis: Acute bacterial sinusitis, likely secondary to an unresolved upper respiratory tract infection. Secondary Diagnosis: Allergic conjunctivitis exacerbated by environmental allergens.",
	8:"Primary Diagnosis: Osteoarthritis of the knees with moderate functional impairment. Secondary Diagnosis: Lumbar discogenic pain with mild radiculopathy.",
	9:"Primary Diagnosis: Irritable bowel syndrome (IBS), exacerbated by possible bacterial gastroenteritis. Secondary Diagnosis: Gastroesophageal reflux disease (GERD), likely triggered by stress and dietary habits.",
	10:"Primary Diagnosis:Diabetic peripheral neuropathy. Post-stroke syndrome with secondary prevention needs. Secondary Diagnosis: Hypertension and hyperlipidemia contributing to vascular disease.",
	11:"Primary Diagnosis: Gallbladder dysfunction with gallstones leading to biliary colic. Dyspepsia likely related to biliary issues and dietary habits. Secondary Diagnosis: Early signs of hepatic dysfunction, possibly related to fatty liver disease.",
	12:"Primary Diagnosis: Functional dyspepsia with delayed gastric emptying (gastroparesis features). Chronic gastritis likely exacerbated by dietary and lifestyle factors. Secondary Diagnosis: Peripheral neuropathy due to a possible deficiency in vitamin B complex or other nutritional factors.",
	13:"Primary Diagnosis: Acute gouty arthritis flare in the right big toe (podagra). Secondary Diagnosis: Hyperuricemia as an underlying cause of recurrent gout flares.",
	14:"Primary Diagnosis: Suspected parasitic infection (e.g., helminthic infection) with respiratory and systemic manifestations.Secondary Diagnosis: Hypertension requiring better management. Secondary bacterial infection exacerbating symptoms.",
	15:"Primary Diagnosis: Acute exacerbation of COPD, likely triggered by an upper respiratory tract infection or environmental factors. Secondary Diagnosis: GERD contributing to epigastric discomfort. Risk of thromboembolic complications due to atrial fibrillation.",
	16:"Primary Diagnosis: Acute exacerbation of bronchial asthma. Secondary Diagnosis: Mucus hypersecretion contributing to airway obstruction.",
	17:"Primary Diagnosis: Lumbar radiculopathy secondary to lumbar spondylosis. Secondary Diagnosis: Exacerbation of GERD symptoms due to NSAID use and stress.",
	18:"Primary Diagnosis: Acute exacerbation of osteoarthritis with joint inflammation and pain. Secondary Diagnosis: NSAID-induced gastritis.",
	19:"Primary Diagnosis: Chronic cerebrovascular insufficiency causing cognitive impairment and dizziness. Secondary Diagnosis: Peripheral neuropathy, likely due to long-standing diabetes.",
	20:"Primary Diagnosis: Exacerbation of osteoarthritis of the knees with associated pain and reduced mobility. Secondary Diagnosis: Lumbar spondylosis with radiculopathy.",
	21:"Primary Diagnosis: Functional Dyspepsia Functional dyspepsia is a common disorder of the upper digestive tract characterized by symptoms of discomfort, bloating, and nausea without any identifiable underlying cause (e.g., ulcers, cancer). Secondary Diagnosis: Gastroesophageal Reflux Disease (GERD) Symptoms of heartburn, acid reflux, and regurgitation indicate mild GERD, which can coexist with functional dyspepsia.",
	22:"Primary Diagnosis: Upper Respiratory Tract Infection (URTI) – likely viral in origin, as the patient’s symptoms align with typical viral infections such as the common cold. Secondary Diagnosis: Acute viral pharyngitis with mild congestion and cough.",
	23:"Primary Diagnosis: Depression with Gastroesophageal Reflux Disease (GERD) and Irritable Bowel Syndrome (IBS) Symptoms of persistent low mood, fatigue, and lack of interest suggest depression. Increased frequency of acid reflux and discomfort point to a worsening of GERD. Bloating and alternating bowel habits are consistent with IBS. Secondary Diagnosis: GERD exacerbated by stress and poor lifestyle habits.",
	24:"Primary Diagnosis: Osteoarthritis of the knees and Chronic Low Back Pain (CLBP), both with associated inflammation and degenerative changes. Osteoarthritis: Progressive knee pain with morning stiffness and decreased range of motion. Imaging may show joint space narrowing and osteophytes. Chronic Low Back Pain: Degenerative disc disease with pain, stiffness, and intermittent tingling/numbness in the legs. Secondary Diagnosis: Depression secondary to chronic pain and reduced quality of life. Other Considerations: Hypertension: Well-controlled with medications but may be exacerbated by pain and stress.",
	25:"Primary Diagnosis: Gastroesophageal Reflux Disease (GERD) with associated Functional Dyspepsia. Symptoms: Heartburn, acid regurgitation, and bloating suggest GERD, while the bloating and discomfort after meals point to functional dyspepsia. Imaging/Endoscopy: Esophageal pH monitoring or an upper endoscopy may reveal signs of reflux esophagitis and potential inflammation or erosions in the esophagus. Secondary Diagnosis: Irritable Bowel Syndrome (IBS) with a predominant bloating and discomfort component. Other Considerations: Chronic Sinusitis: Likely contributing to her nasal congestion and sore throat, especially in the winter months. Hypertension: Well-controlled but requires monitoring due to potential interactions with medications.",
	26:"Primary Diagnosis: Chronic Venous Insufficiency (CVI): Symptoms of leg swelling, heaviness, and varicose veins align with CVI. History of poor venous return and visible varicosities. Secondary Diagnosis: Hyperprolactinemia: Persistent elevated prolactin levels leading to symptoms like fatigue and headaches. Differential Considerations: Evaluate for diabetic complications such as peripheral neuropathy contributing to leg symptoms.",
	27:"Primary Diagnosis: Urinary Tract Infection (UTI): Supported by symptoms of dysuria, frequency, and foul-smelling urine. Secondary Diagnosis: Irritable Bowel Syndrome (IBS) with diarrhea-predominant symptoms (IBS-D): History of bloating and abdominal discomfort aggravated by dietary patterns.",
	28:"Primary Diagnosis: Vestibular Dysfunction (likely Meniere’s disease): Symptoms such as vertigo, tinnitus, and balance disturbances suggest an inner ear disorder. Secondary Consideration: Cerebral Hypoperfusion: Likely secondary to poor circulation or aging-related cerebrovascular changes.",
	29:"Primary Diagnosis: Moderate Acne Vulgaris: Characterized by inflamed papules, pustules, and localized redness.",
	30:"Primary Diagnosis: Functional Gastrointestinal Disorder (Infantile Colic): Characterized by bloating, gas, and abdominal discomfort. Mild Dermatitis: Likely caused by external irritants or mild infection. Differential Diagnosis: Food intolerance (e.g., lactose intolerance). Allergic reaction to environmental or dietary triggers.",
	31:"Primary Diagnosis: Acute Lower Respiratory Tract Infection (LRTI): Likely bacterial in origin, given fever and productive cough. Differential Diagnosis: Viral bronchitis (less likely due to the nature of sputum and fever). Early-stage pneumonia (ruled out based on auscultation and mild symptoms).",
	32:"Primary Diagnosis: Intertrigo Complicated by Fungal and Bacterial Infection: Likely caused by Candida species and secondary bacterial infection due to scratching and poor hygiene. Differential Diagnosis: Psoriasis (ruled out due to infection markers). Erythrasma (less likely due to clear fungal involvement).",
	33:"Primary Diagnosis: Exacerbation of Osteoarthritis: Chronic degenerative joint disease, aggravated by lack of physical activity and increased joint stress. Differential Diagnosis: Rheumatoid arthritis (ruled out due to lack of systemic symptoms and rheumatoid factor). Gout (unlikely due to absence of acute, severe monoarticular flare).",
	34:"Primary Diagnosis: Obesity (Class I): BMI >30, linked to sedentary lifestyle and poor dietary habits. Differential Diagnosis: Hypothyroidism (ruled out by normal thyroid function tests). Polycystic Ovary Syndrome (PCOS) (no other clinical signs or history).",
	35:"Primary Diagnosis: Irritable Bowel Syndrome - Mixed Type (IBS-M). Differential Diagnosis: Small Intestinal Bacterial Overgrowth (SIBO). Gastroenteritis (ruled out based on chronic nature and absence of fever).",
	36:"Primary Diagnosis: Irregular Menstrual Cycles, likely related to anovulation (absence of ovulation). Differential Diagnosis: Polycystic Ovary Syndrome (PCOS) (to be considered given her irregular cycles). Endometriosis (family history suggests potential for this condition).",
	37:"Primary Diagnosis: Upper Respiratory Tract Infection (URTI) with possible viral etiology, complicated by secondary bacterial infection (likely bacterial pneumonia or sinusitis). Differential Diagnosis: Asthma exacerbation due to viral infection or allergic rhinitis. Acute bacterial rhinosinusitis or bacterial pneumonia as secondary infections.",
	38:"Primary Diagnosis: Mild Cognitive Impairment (MCI) likely due to early-stage Alzheimer's disease or vascular cognitive impairment. Differential Diagnosis: Vascular Dementia (due to hypertension and diabetes history). Alzheimer's Disease (early stages). Depression (which can sometimes present with cognitive symptoms). Vitamin B12 deficiency or Hypothyroidism (both can contribute to cognitive impairment).",
	39:"Primary Diagnosis: Uncontrolled Type 2 Diabetes Mellitus (likely due to inadequate blood sugar control and potential medication regimen issues). Differential Diagnosis: Hypertension (poorly controlled), possibly contributing to fatigue and dizziness. Diabetic Complications: Early signs of retinopathy or nephropathy (due to uncontrolled diabetes). Hyperlipidemia: Risk factor for cardiovascular disease, which may worsen overall prognosis if not managed properly.",
	40:"Primary Diagnosis: Chronic Obstructive Pulmonary Disease (COPD), exacerbated (worsening symptoms likely due to environmental factors or medication non-compliance). Hypertension, poorly controlled (likely contributing to fluid retention and worsening COPD symptoms). Chronic Kidney Disease, Stage 2 (risk of renal impairment with current medication regimen). Secondary Diagnosis: Peripheral Edema (likely due to the combination of poorly controlled hypertension and possible fluid retention from medications). Type 2 Diabetes Mellitus (risk of nephropathy, though kidney function is stable at present).",
	41:"Primary Diagnosis: Exacerbation of Osteoarthritis with possible inflammation in the knee joints. Peripheral Artery Disease (PAD) with worsening symptoms of intermittent claudication. Secondary Diagnosis: Mild Peripheral Neuropathy due to chronic PAD and vascular insufficiency.",
	42:"Primary Diagnosis: Upper Respiratory Tract Infection (URTI) with post-viral bronchial irritation. Secondary Diagnosis: Possible acute bronchitis contributing to the cough and mild wheezing.",
	43:"Primary Diagnosis: Acute Gastroenteritis (likely bacterial or protozoal origin). Secondary Concerns: Dehydration due to persistent vomiting and diarrhea. Potential exacerbation of GERD.",
	44:"Primary Diagnosis: Exacerbation of Irritable Bowel Syndrome (IBS) triggered by stress or dietary changes. Secondary Diagnosis: Tension-Type Headache due to stress or prolonged sedentary posture.",
	45:"Primary Diagnosis: Acute Tonsillitis likely bacterial in origin. Secondary Diagnosis: Mild Gastrointestinal Upset likely due to infection or fever.",
	46:"Primary Diagnosis: Acute Bronchitis likely triggered by a bacterial infection. Secondary Diagnosis: Asthmatic exacerbation due to respiratory infection.",
	47:"Primary Diagnosis: Acute exacerbation of lumbar spondylosis with radiculopathy (sciatica). Secondary Diagnosis: Localized inflammation and muscle spasm in the lumbar region",
	48:"Primary Diagnosis: Acute bacterial pharyngitis, likely streptococcal. Secondary Diagnosis: Localized throat inflammation with tissue edema.",
	49:"Primary Diagnosis: Otitis externa (mild, non-infectious) possibly due to earwax buildup and irritation. Differential Diagnosis: Allergic reaction or early-stage infection secondary to ear canal irritation.",
	50:"Primary Diagnosis: Computer Vision Syndrome (Digital Eye Strain) due to prolonged screen exposure. Secondary Diagnosis: Dry Eye Syndrome likely exacerbated by environmental factors and screen time.",
	51:"Primary Diagnosis: Peptic Ulcer Disease (H. pylori-associated) based on symptoms and medical history. Secondary Diagnosis: Exacerbation of Asthma possibly triggered by smoking and seasonal changes.",
	52:"Primary Diagnosis: Generalized Anxiety Disorder (GAD) with worsening symptoms. Secondary Diagnosis: Chronic Tension-Type Headaches (CTTH) exacerbated by anxiety and stress.",
	53:"Primary Diagnosis: Muscle Spasm-Induced Chest Pain (non-cardiac origin) due to poor posture and sedentary lifestyle. Secondary Diagnosis: Hypertension Management Challenge: Possible medication-induced blood pressure instability.",
	54:"Primary Diagnosis: Bacterial Conjunctivitis in the left eye, likely caused by improper hygiene or environmental exposure. Differential Diagnosis: Viral conjunctivitis or an allergic reaction ruled out based on symptoms and discharge characteristics.",
	55:"Primary Diagnosis: Functional Dyspepsia (Postprandial Distress Syndrome subtype). Differential Diagnosis: Gastroesophageal Reflux Disease (GERD) ruled out due to absence of significant heartburn. Gastritis excluded by absence of acute inflammation markers.",
	56:"Primary Diagnosis: Iron Deficiency Anemia complicated by suspected Amebic Colitis. Differential Diagnosis: Rule out gastrointestinal blood loss or malabsorption syndromes.",
	57:"Primary Diagnosis: Tinea Pedis (Athlete's Foot) caused by a dermatophyte fungal infection. Differential Diagnosis: Contact dermatitis or eczema.",
	58:"Primary Diagnosis: Xerosis (Dry Skin) likely exacerbated by environmental factors such as cold weather and low humidity. Differential Diagnosis: Mild eczema or early-stage psoriasis (less likely due to absence of inflammation and lesions).",
	59:"Primary Diagnosis: Moderate to Severe Acne Vulgaris with inflammation and secondary bacterial infection. Differential Diagnosis: Folliculitis or hormonal imbalance (less likely based on history and clinical findings).",
	60:"Primary Diagnosis: Gouty Arthritis with Irritable Bowel Syndrome (IBS). Differential Diagnosis: Dyspepsia due to medications or diet. Other forms of arthritis (less likely given history and symptoms).",
	61:"Primary Diagnosis: Nutritional Deficiency (possible iron, vitamin D, and overall vitamin deficiencies). Differential Diagnosis: Anemia (iron deficiency). Viral infections leading to fatigue. Attention-deficit/hyperactivity disorder (ADHD) (less likely).",
	62:"Primary Diagnosis: Nutritional deficiency (likely vitamin E deficiency due to inadequate dietary intake of essential fatty acids). Differential Diagnosis: Chronic dehydration. Possible hypothyroidism (less likely, but needs to be ruled out). Osteoarthritis (considering joint pain).",
	63:"Primary Diagnosis: Moderate inflammatory acne vulgaris. Differential Diagnosis: Hormonal acne (considering age and symptoms). Folliculitis. Allergic contact dermatitis (less likely, but possible given the product usage).",
	64:"Primary Diagnosis: Atopic dermatitis (eczema) flare-up. Differential Diagnosis: Contact dermatitis (considering the patient's occupation and lifestyle). Psoriasis (less likely due to clinical presentation). Fungal infection (consider if lesions appear weepy or crusty).",
	65:"Primary Diagnosis: Post-inflammatory hyperpigmentation secondary to acne. Differential Diagnosis: Melasma (less likely due to lack of hormonal changes). Solar lentigines (considering sun exposure). Other forms of dermatitis (less likely given presentation).",
	66:"Primary Diagnosis: Contact dermatitis, likely due to irritants or allergens from environmental exposure. Differential Diagnosis: Atopic dermatitis flare-up. Psoriasis. Fungal infections (less likely due to clinical presentation).",
	67:"Primary Diagnosis: Asthma exacerbation, likely triggered by a recent respiratory infection and environmental allergens. Differential Diagnosis: Allergic rhinitis. Chronic obstructive pulmonary disease (COPD) (less likely given age and history). Anxiety or panic attacks (as they can mimic asthma symptoms).",
	68:"Primary Diagnosis: Primary biliary cholangitis (PBC) with signs of worsening cholestasis and early liver dysfunction. Differential Diagnosis: Autoimmune hepatitis. Gallstone-related biliary obstruction.",
	69:"Primary Diagnosis: Acute infectious diarrhea, likely due to bacterial gastroenteritis. Differential Diagnosis: Viral gastroenteritis. Food poisoning (e.g., staphylococcal toxin). Parasitic infection (less likely due to lack of systemic symptoms).",
	70:"Primary Diagnosis: Acute exacerbation of asthma with associated mucus hypersecretion. Differential Diagnosis: Allergic bronchitis. Early signs of chronic obstructive pulmonary disease (COPD) (less likely given patient history and age). Respiratory infection contributing to mucus production.",
	71:"Primary Diagnosis: Osteoarthritis (knee) – moderate stage. Differential Diagnosis: Rheumatoid arthritis (unlikely as no systemic or symmetrical joint involvement). Gout (ruled out due to absence of sudden, severe pain and lab confirmation).",
	72:"Primary Diagnosis: Localized bacterial skin infection (suspected cellulitis with an abscess). Differential Diagnosis: Deep vein thrombosis (unlikely due to location and lack of systemic symptoms). Septic arthritis (ruled out as the joint is not directly involved).",
	73:"Primary Diagnosis: Acute exacerbation of COPD (AECOPD), likely due to bacterial infection. Differential Diagnosis: Community-acquired pneumonia (considered due to sputum changes and fever). Heart failure exacerbation (ruled out based on history and physical exam).",
	74:"Primary Diagnosis: Seborrheic dermatitis exacerbation. Differential Diagnosis: Contact dermatitis (ruled out due to lack of exposure to new allergens). Fungal infection (ruled out based on clinical presentation and negative fungal culture).",
	75:"Primary Diagnosis: Acute bacterial tonsillitis. Differential Diagnosis: Viral pharyngitis (ruled out by presence of pus and bacterial culture results). Dental abscess (ruled out by absence of localized tooth pain or visible dental issues).",
	76:"Primary Diagnosis: Acute exacerbation of COPD due to bacterial respiratory tract infection. Differential Diagnosis: Asthma exacerbation (less likely due to smoking history and absence of wheezing). Viral upper respiratory infection (less likely due to elevated WBC count).",
	77:"Primary Diagnosis: Acute gastroenteritis with a secondary bacterial respiratory tract infection. Differential Diagnosis: Viral gastroenteritis (less likely due to elevated neutrophils and persistent symptoms). Acute bacterial bronchitis.",
	78:"Primary Diagnosis: Acute urinary tract infection (UTI) and exacerbated hemorrhoids. Differential Diagnosis: Prostatitis (less likely given no fever or perineal pain). Anal fissure.",
	79:"Primary Diagnosis: Acute cholecystitis. Differential Diagnoses: Acute pancreatitis (considered based on radiating pain but ruled out due to no significant elevation of pancreatic enzymes). Peptic ulcer disease.",
	80:"Primary Diagnosis: Hypogonadism with secondary fatigue and muscle weakness. Differential Diagnoses: Nutritional deficiency (e.g., zinc or vitamin B6 deficiency). Anemia. Chronic fatigue syndrome.",
	81:"Primary Diagnosis: Functional dyspepsia with IBS. Differential Diagnoses: Gastroesophageal reflux disease (GERD). Food intolerance (e.g., lactose intolerance). Peptic ulcer disease (ruled out by no history of bleeding or black stools).",
	82:"Primary Diagnosis: Acute pharyngitis with secondary bacterial infection. Differential Diagnoses: Acute tonsillitis. Viral upper respiratory tract infection (less likely due to prolonged fever and symptoms).",
	83:"Primary Diagnosis: Facial hirsutism secondary to PCOS. Differential Diagnoses: Idiopathic hirsutism. Adrenal or thyroid disorders (less likely, given the history of PCOS).",
	84:"Primary Diagnosis: Orthostatic hypotension exacerbated by nutritional deficiencies. GERD causing chronic discomfort and contributing to fatigue. Differential Diagnoses: Anemia (secondary to poor nutritional intake or chronic GERD). Early signs of adrenal insufficiency.",
	85:"Primary Diagnosis: Acute gastrointestinal infection, likely due to bacterial or protozoal pathogens. Differential Diagnoses: Exacerbation of IBS triggered by an infection. Possible mild dehydration secondary to diarrhea.",
	86:"Primary Diagnosis: Upper respiratory tract infection (URI), likely viral in origin. Differential Diagnoses: Bacterial sinusitis. Allergic rhinitis exacerbation.",
	87:"Primary Diagnosis: Urinary tract infection (UTI) with potential renal involvement. Differential Diagnoses: Pyelonephritis. Ureterolithiasis. Irritable bowel syndrome (IBS).",
	88:"Primary Diagnosis: Osteoarthritis exacerbation in the knees and lower back. Differential Diagnoses: Rheumatoid arthritis (less likely due to lack of systemic symptoms). Sciatica or lumbar radiculopathy. Bursitis or tendonitis in the knee.",
	89:"Primary Diagnosis: Osteoporosis with associated joint pain. Differential Diagnoses: Osteoarthritis. Rheumatoid arthritis (less likely due to lack of systemic symptoms). Degenerative joint disease.",
	90:"Primary Diagnosis: Uncontrolled hypertension. Secondary Diagnosis: Type 2 diabetes mellitus, well-controlled. Mild fatigue, possibly related to diabetes management or medication side effects.",
	91:"Primary Diagnosis: Acute bacterial sinusitis with secondary ear involvement. Secondary Diagnosis: Allergic rhinitis contributing to nasal congestion. Possible medication-related fatigue.",
	92:"Primary Diagnosis: Peptic ulcer disease with possible H. pylori infection. Secondary Diagnosis: Iron deficiency anemia due to chronic gastrointestinal bleeding or inadequate dietary intake.",
	93:"Primary Diagnosis: Benign prostatic hyperplasia (BPH) with urinary obstruction. Secondary Diagnosis: Acute exacerbation of chronic pain due to osteoarthritis, managed with NSAIDs.",
	94:"Primary Diagnosis: Hormone receptor-positive breast cancer, in remission, currently on adjuvant therapy.",
	95:"Primary Diagnosis: Allergic conjunctivitis with exacerbation of dry eye symptoms. Secondary Diagnosis: Possible corneal abrasion due to rubbing of the eye.",
	96:"Primary Diagnosis: Bipolar disorder, currently in a manic phase with anxiety symptoms. Secondary Diagnosis: History of seizures (under control). Tension-type headaches, likely exacerbated by anxiety and medication side effects.",
	97:"Primary Diagnosis: Right knee osteoarthritis exacerbation with associated swelling and pain. Secondary Diagnosis: Post-thrombotic syndrome due to previous DVT, contributing to leg heaviness and swelling.",
	98:"Primary Diagnosis: Contact dermatitis, likely due to an irritant or allergen exposure. Secondary Diagnosis: Superinfection of the dermatitis with bacterial infection, indicated by the presence of crusting and discharge.",
	99:"Primary Diagnosis: Osteoarthritis of the right knee, with associated pain and swelling.",
	100:"Primary Diagnosis: Exacerbation of gastroesophageal reflux disease (GERD) possibly due to NSAID use.",
	101:"Primary Diagnosis: Acute bacterial pharyngitis with symptoms of fever, throat discomfort, and nasal congestion. Differential Diagnosis: Viral upper respiratory tract infection (URI).",
	102:"Primary Diagnosis: Androgenetic alopecia with secondary seborrheic dermatitis. Differential Diagnosis: Telogen effluvium (postpartum hair loss). Nutritional deficiencies (iron, zinc, and vitamins).",
	103:"Primary Diagnosis: Tension-type headache associated with lifestyle stress. Osteoarthritis in the knees and lower back (chronic joint pain). Differential Diagnosis: Migraine (unlikely, no aura or photophobia reported). Gastritis or peptic ulcer disease due to overuse of NSAIDs.",
	104:"Primary Diagnosis: Impetiginized eczema (secondary bacterial infection of atopic dermatitis). Differential Diagnosis: Contact dermatitis (less likely as no specific irritant identified). Psoriasis (ruled out due to lack of scaling or thickened plaques).",
	105:"Primary Diagnosis: Lumbar Radiculopathy secondary to lumbar spondylosis. Differential Diagnosis: Sciatica (consistent with nerve involvement but related to lumbar disc issues). Myofascial pain syndrome (less likely as pain is not localized).",
	106:"Primary Diagnosis: Mixed bacterial infection (suspected bacterial vaginosis with potential pelvic inflammatory disease). Differential Diagnosis: Fungal infection (ruled out due to lack of itching or white cottage cheese-like discharge). Trichomoniasis (requires confirmation through laboratory tests).",
	107:"Primary Diagnosis: Acute sinusitis with postnasal drip causing cough. Differential Diagnosis: Allergic rhinitis (symptoms overlap but fever points towards infection). Bronchitis (less likely as symptoms are mild and localized to the upper respiratory tract).",
	108:"Primary Diagnosis: Tinea corporis and tinea capitis with secondary bacterial infection. Fungal infections on the scalp and body with possible secondary bacterial involvement. Differential Diagnosis: Eczema with superimposed infection (less likely due to classic annular lesions typical of tinea). Psoriasis (unlikely due to lack of silvery scales and chronic course).",
	109:"Primary Diagnosis: Osteopenia due to inadequate nutritional intake and possible vitamin D deficiency. Differential Diagnosis: Early stages of osteoporosis. Vitamin B12 deficiency (less likely as neurological symptoms are absent). Electrolyte imbalance (possible contributing factor).",
	110:"Primary Diagnosis: Recurrent Vulvovaginal Candidiasis (VVC). Differential Diagnosis: Bacterial vaginosis. Trichomoniasis. Mixed vaginal infections.",
	111:"Primary Diagnosis: Polycystic Ovary Syndrome (PCOS) with hyperprolactinemia. Differential Diagnosis: Subclinical hypothyroidism (requires exclusion). Luteal phase defect.",
	112:"Primary Diagnosis: Chronic Atopic Dermatitis with Acute Exacerbation. Differential Diagnosis: Allergic contact dermatitis (ruled out by no recent exposure to new products). Psoriasis (less likely due to the patient’s history of eczema and the absence of silvery plaques).",
	113:"Primary Diagnosis: Acute Exacerbation of Chronic Obstructive Pulmonary Disease (AECOPD). Differential Diagnosis: Acute bronchitis (less likely due to existing COPD). Pneumonia (ruled out with chest X-ray findings showing no infiltrates).",
	114:"Primary Diagnosis: Pediatric undernutrition with poor appetite. Differential Diagnosis: Iron-deficiency anemia (likely contributing to fatigue). Subclinical vitamin and mineral deficiencies due to inadequate dietary intake.",
	115:"Primary Diagnosis: Intestinal helminthiasis (parasitic worm infection). Differential Diagnosis: Vitamin and mineral deficiencies secondary to malabsorption caused by parasitic infection. Functional gastrointestinal disorder (ruled out by lab tests and clinical symptoms).",
	116:"Primary Diagnosis: Hyperthyroidism. Secondary Conditions: Generalized Anxiety Disorder with mild depression (psychological effects of hyperthyroidism). Gastroesophageal Reflux Disease (GERD).",
	117:"Primary Diagnoses: Poorly controlled Type 2 Diabetes Mellitus. Dyslipidemia. Iron-deficiency anemia. Secondary Concerns: Risk of cardiovascular complications due to comorbid conditions.",
	118:"Primary Diagnosis: Acute bacterial urinary tract infection (UTI). Differential Diagnosis: Pyelonephritis (due to fever and systemic symptoms).",
	119:"Primary Diagnosis: Lumbar disc herniation with radiculopathy. Exacerbation of knee osteoarthritis. Secondary Diagnosis: Acute gastritis (secondary to NSAID use).",
	120:"Primary Diagnosis: Iron-deficiency anemia with associated fatigue and dizziness. Secondary Diagnosis: Dyspepsia due to a combination of iron supplementation and NSAID use. Mild vertigo, likely linked to stress and anemia.",
	121:"Primary Diagnosis: Bacterial skin infection (likely cellulitis), caused by a susceptible organism such as Staphylococcus aureus or Streptococcus pyogenes. Secondary Diagnosis: Diabetic peripheral neuropathy contributing to sensory symptoms. Possible history of herpes simplex reactivation (treated with valacyclovir).",
	122:"Primary Diagnosis: Acute pharyngitis caused by bacterial infection (likely Streptococcus pyogenes). Differential Diagnoses: Viral pharyngitis. Allergic rhinitis exacerbation.",
	123:"Primary Diagnosis: Non-alcoholic fatty liver disease (NAFLD) exacerbated by chronic hepatitis C. Secondary Diagnosis: Mild hepatomegaly based on physical examination findings.",
	124:"Primary Diagnosis: Exacerbation of osteoarthritis in the lumbar spine. Secondary Diagnosis: Neuropathic pain due to nerve irritation from osteophyte formation.",
	125:"Primary Diagnosis: Migraine headache, moderate to severe, acute attack. Secondary Diagnosis: Tension-type headache as a contributing factor.",
	126:"Primary Diagnosis: Osteoarthritis of the knee (bilateral). Secondary Diagnosis: Gastroesophageal reflux symptoms (mild).",
	127:"Primary Diagnosis: Contact dermatitis, suspected to be caused by exposure to an irritant or allergen (e.g., a new detergent or soap). Secondary Diagnosis: Secondary bacterial infection due to scratching and oozing lesions.",
	128:"Primary Diagnosis: Migraine headache, likely exacerbated due to stress and lack of sleep. Secondary Diagnosis: History of epilepsy, requiring monitoring due to potential medication interactions.",
	129:"Primary Diagnosis: Estrogen receptor-positive breast cancer, currently managed with tamoxifen therapy. Secondary Diagnosis: Tamoxifen-related side effects, including hot flashes and arthralgia.",
	130:"Primary Diagnosis: Osteoarthritis of the knees exacerbated by aging and previous hip fracture. Secondary Diagnosis: Risk of osteoporosis due to age and family history.",
	131:"Primary Diagnosis: Recurrent herpes labialis (caused by Herpes Simplex Virus-1). Secondary Diagnosis: Mild irritant contact dermatitis secondary to inadequate sun protection.",
	132:"Primary Diagnosis: Gastroesophageal reflux disease (GERD). Secondary Diagnosis: Functional dyspepsia with associated nausea and mild anxiety exacerbating symptoms.",
	133:"Primary Diagnosis: Acute bacterial bronchitis with exacerbation of COPD. Secondary Diagnosis: Allergic rhinitis with worsening GERD symptoms.",
	134:"Primary Diagnosis: Mild to moderate acne vulgaris with associated dry skin due to over-cleansing or environmental factors. Differential Diagnosis: Irritant or contact dermatitis from using harsh skincare products. Seborrheic dermatitis.",
	135:"Primary Diagnosis: Exacerbation of chronic low back pain due to lumbar disc herniation with associated muscle spasms. Differential Diagnosis: Lumbar radiculopathy. Myofascial pain syndrome.",
	136:"Primary Diagnosis: Uncontrolled Type 2 Diabetes Mellitus. Differential Diagnosis: Diabetic ketoacidosis (ruled out due to absence of severe symptoms like nausea or vomiting). Latent autoimmune diabetes in adults (LADA) as a remote possibility.",
	137:"Primary Diagnosis: Ovulatory dysfunction secondary to hypothalamic or idiopathic causes of infertility. Supporting Diagnostic Features: History of infertility with no apparent abnormalities in menstrual cycle length or pelvic health. Ultrasound showed normal ovarian and uterine morphology.",
	138:"Primary Diagnosis: Acute bacterial pharyngitis with associated fever and nasal congestion. Differential Diagnoses: Viral upper respiratory tract infection. Early-stage sinusitis.",
	139:"Primary Diagnosis: Moderate dry eye syndrome with mild corneal irritation. Differential Diagnoses: Meibomian gland dysfunction (MGD). Ocular surface inflammation secondary to environmental factors.",
	140:"Primary Diagnosis: Chronic atrial fibrillation with decompensated heart failure (NYHA Class III). Secondary Diagnosis: Secondary prevention of thromboembolic events post-stroke.",
	141:"Primary Diagnosis: Exacerbation of irritable bowel syndrome (IBS) with constipation (IBS-C).",
	142:"Primary Diagnosis: Acute bronchitis with underlying COPD exacerbation. Secondary Diagnosis: Allergic rhinitis.",
	143:"Primary Diagnosis: Acute exacerbation of chronic lower back pain (likely mechanical). Secondary Diagnosis: Mild muscle strain.",
	144:"Primary Diagnosis: Acute bacterial pharyngitis (suspected streptococcal infection). Secondary Diagnosis: Viral upper respiratory infection (possible).",
	145:"",
	146:"",
	147:"",
	148:"",
	149:"",
	150:"",
	151:"",
	152:"",
	153:"",
	154:"",
	155:"",
	156:"",
	157:"",
	158:"",
	159:"",
	160:"",
	161:"",
	162:"",
	163:"",
	164:"",
	165:"",
	166:"",
	167:"",
	168:"",
	169:"",
	170:"",
	171:"",
	172:"",
	173:"",
	174:"",
	175:"",
	176:"",
	177:"",
	178:"",
	179:"",
	180:"",
	181:"",
	182:"",
	183:"",
	184:"",
	185:"",
	186:"",
	187:"",
	188:"",
	189:"",
	190:"",
	191:"",
	192:"",
	193:"",
	194:"",
	195:"",
	196:"",
	197:"",
	198:"",
	199:"",
	200:"",
	201:"",
	202:"",
	203:"",
	204:"",
	205:"",
	206:"",
	207:"",
	208:"",
	209:"",
	210:"",
	211:"",
	212:"",
	213:"",
	214:"",
	215:"",
	216:"",
	217:"",
	218:"",
	219:"",
	220:"",
	221:"",
	222:"",
	223:"",
	224:"",
	225:"",
	226:"",
	227:"",
	228:"",
	229:"",
	230:"",
	231:"",
	232:"",
	233:"",
	234:"",
	235:"",
	236:"",
	237:"",
	238:"",
	239:"",
	240:"",
	241:"",
	242:"",
	243:"",
	244:"",
	245:"",
	246:"",
	247:"",
	248:"",
	249:"",
	250:"",}

var lab_dic :Dictionary = {
	1: "Basic Metabolic Panel:
Fasting Blood Glucose: 135 mg/dL (high).
Creatinine: 1.1 mg/dL (normal).
Electrolytes: Within normal limits.

Lipid Profile:
LDL: 145 mg/dL (high).
HDL: 40 mg/dL (low).
Triglycerides: 180 mg/dL (high).

CBC:
Hemoglobin: 13.8 g/dL (normal).
WBC: 7,200/mm³ (normal).
Platelets: 250,000/mm³ (normal).

Neuroimaging (MRI):
Multiple small infarcts in subcortical white matter consistent with vascular dementia.
Hippocampal atrophy consistent with Alzheimer’s disease.

Other Tests:
HbA1c: 7.5% (above target).
Homocysteine: Elevated.",

	2: "Vital Signs:
Temperature: 38°C (mild fever).
Heart Rate: 84 bpm.
Blood Pressure: 125/80 mmHg.

Blood Tests:
WBC: 12,000/mm³ (elevated, indicating infection).
CRP: 25 mg/L (elevated, indicative of inflammation).
ESR: 20 mm/hr (mildly elevated).

Imaging (X-ray of jaw):
Radiolucent area around the apex of the affected molar, consistent with an abscess.",
	3:"Blood Tests:
HbA1c: 8.2% (high, poorly controlled diabetes).
Fasting Blood Glucose: 160 mg/dL (high).
Vitamin D: 10 ng/mL (severely deficient).
Calcium: 7.8 mg/dL (low).
Parathyroid Hormone (PTH): Elevated, consistent with secondary hyperparathyroidism due to vitamin D deficiency.

Electrolytes:
Magnesium: Normal.
Phosphorus: Normal.

Imaging:
X-ray of lumbar spine: Evidence of mild degenerative changes and reduced bone density.

Nerve Conduction Study:
Reduced conduction velocity in the lower limbs, consistent with diabetic neuropathy.",
	4:"Blood Tests:
Complete Blood Count (CBC):
Hemoglobin: 13.5 g/dL (normal).
WBC: 7,500/mm³ (normal).
Platelets: 280,000/mm³ (normal).

Lipid Profile:
Total Cholesterol: 240 mg/dL (high).
LDL: 165 mg/dL (high).
HDL: 38 mg/dL (low).
Triglycerides: 190 mg/dL (high).

Liver Function Tests:
ALT/AST: Within normal limits.
Alkaline Phosphatase: Normal.
H. pylori Test (Urea Breath Test): Negative.

Upper Endoscopy:
No ulcers or masses.
Mild esophagitis and evidence of gastritis.

Abdominal Ultrasound:
Normal liver, gallbladder, and pancreas.",
	5:"Ophthalmologic Examination:
Visual Acuity:
Right Eye (OD): 20/30.
Left Eye (OS): 20/40.

Intraocular Pressure (IOP):
Right Eye (OD): 18 mmHg.
Left Eye (OS): 21 mmHg (mildly elevated).

Slit-Lamp Examination:
Mild conjunctival hyperemia in both eyes.
Clear cornea; mild dryness on fluorescein staining.

Fundus Examination:
Optic disc cupping (0.6 in both eyes), consistent with glaucoma progression.

Schirmer Test:
OD: 6 mm in 5 minutes (reduced).
OS: 5 mm in 5 minutes (reduced).

OCT (Optical Coherence Tomography):
Thinning of retinal nerve fiber layer (RNFL), more pronounced in the left eye.",
	6:"Complete Blood Count (CBC):
Hemoglobin: 12.2 g/dL (borderline anemia).
WBC: 7,800/mm³ (normal).
Platelets: 200,000/mm³ (normal).

Renal Function Tests:
Serum Creatinine: 1.8 mg/dL (elevated, CKD Stage 3b).
eGFR: 35 mL/min/1.73 m² (reduced).
Potassium: 4.8 mEq/L (normal).

Lipid Profile:
Total Cholesterol: 220 mg/dL (high).
LDL: 140 mg/dL (high).
HDL: 38 mg/dL (low).
Triglycerides: 180 mg/dL (high).
INR: 2.5 (therapeutic range for warfarin).

Echocardiogram:
Ejection Fraction (EF): 35% (severely reduced).
Left ventricular dilation.
Mild mitral regurgitation.

Electrocardiogram (ECG):
Atrial fibrillation with a ventricular rate of 85 bpm.

Chest X-ray:
Pulmonary congestion and mild cardiomegaly.",
	7:"Blood Tests:
Complete Blood Count (CBC):
WBC: 12,000/mm³ (elevated, consistent with infection).
Neutrophils: 75% (elevated).
Eosinophils: 6% (mildly elevated, indicative of allergies).
C-reactive Protein (CRP): 20 mg/L (elevated, indicating inflammation).
IgE Levels: Elevated, consistent with allergic predisposition.

Nasal Swab Culture:
Growth of Streptococcus pneumoniae, sensitive to amoxicillin.

Ophthalmologic Examination:
Mild conjunctival hyperemia and watery discharge.
No corneal involvement.",
	8:"Blood Tests:
Complete Blood Count (CBC):
WBC: 7,500/mm³ (normal).
Hemoglobin: 13.5 g/dL (normal).
C-reactive Protein (CRP): 5 mg/L (mildly elevated, indicating inflammation).
Erythrocyte Sedimentation Rate (ESR): 18 mm/hr (mildly elevated).
Uric Acid: 4.8 mg/dL (normal).

Imaging:
X-ray of the Knees:
Joint space narrowing in both knees, more pronounced on the medial side.
Osteophyte formation and mild subchondral sclerosis.
MRI of the Lumbar Spine:
L4-L5 disc bulge with mild compression of the right nerve root.",
	9:"Blood Tests:
Complete Blood Count (CBC):
WBC: 8,700/mm³ (normal).
Hemoglobin: 12.8 g/dL (normal).
Eosinophils: 4% (mildly elevated, suggestive of hypersensitivity).
C-reactive Protein (CRP): 8 mg/L (mildly elevated, indicating inflammation).

Stool Analysis:
Positive for bacterial pathogens (suspected bacterial gastroenteritis).
No occult blood.

Abdominal Ultrasound:
No significant findings.

Upper GI Endoscopy (performed previously):
Mild esophagitis and gastritis, consistent with GERD.",
	10:"Blood Tests:
Fasting Blood Glucose (FBG): 180 mg/dL (elevated).
HbA1c: 8.2% (poor glycemic control).

Lipid Profile:
LDL: 145 mg/dL (high).
HDL: 35 mg/dL (low).
Triglycerides: 220 mg/dL (high).
Renal Function Tests:
Serum Creatinine: 1.3 mg/dL (normal).
eGFR: 65 mL/min/1.73 m² (normal).
Complete Blood Count (CBC): Normal.

Electrodiagnostic Studies:
Reduced nerve conduction velocity in the lower extremities, consistent with diabetic neuropathy.

Imaging:
Brain MRI:
Evidence of prior ischemic stroke in the right MCA territory.
No acute findings.",
	11:"Blood Tests:
Liver Function Tests (LFT):
ALT: 42 U/L (mildly elevated).
AST: 38 U/L (mildly elevated).
Bilirubin (total): 1.2 mg/dL (normal).
Alkaline Phosphatase (ALP): 98 U/L (normal).
Lipid Profile:
Total Cholesterol: 230 mg/dL (elevated).
LDL: 150 mg/dL (high).
HDL: 35 mg/dL (low).
Triglycerides: 180 mg/dL (elevated).

Abdominal Ultrasound:
Gallbladder contains multiple small stones without signs of acute inflammation.
Mildly enlarged liver with increased echogenicity, consistent with fatty liver.

Complete Blood Count (CBC):
WBC: 6,800/mm³ (normal).
Hemoglobin: 14.2 g/dL (normal).",
	12:"Blood Tests:
Complete Blood Count (CBC):
Hemoglobin: 11.8 g/dL (borderline low).
Mean Corpuscular Volume (MCV): 78 fL (microcytic anemia).
Vitamin B12 Levels: 180 pg/mL (low).
Liver Function Tests (LFT): Normal.

Stool Analysis:
Negative for H. pylori or parasitic infections.

Abdominal Ultrasound:
No significant findings.

Upper GI Endoscopy (performed previously):
Mild antral gastritis, no active ulceration.",
	13:"Blood Tests:
Serum Uric Acid: 8.5 mg/dL (elevated).
Complete Blood Count (CBC):
WBC: 12,000/mm³ (elevated, indicating inflammation).
Neutrophils: 80% (elevated).
Hemoglobin: 13.5 g/dL (normal).
Renal Function Tests (RFT):
Serum Creatinine: 1.3 mg/dL (upper normal limit).
Blood Urea Nitrogen (BUN): 24 mg/dL (normal).

Joint Aspiration:
Synovial fluid analysis: Presence of monosodium urate crystals, confirming gout.

Imaging:
X-ray of the right foot: No bony erosions but soft tissue swelling noted.",
	14:"Blood Tests:
Complete Blood Count (CBC):
WBC: 15,000/mm³ (elevated).
Eosinophils: 15% (elevated, indicating parasitic infection).
Hemoglobin: 12.0 g/dL (normal).
Renal Function Tests (RFT):
Serum Creatinine: 1.1 mg/dL (normal).
Blood Urea Nitrogen (BUN): 22 mg/dL (normal).
Liver Function Tests (LFT):
Normal.

Stool Examination:
Presence of ova or larvae confirming parasitic infection.

Chest X-ray:
Normal, no signs of pneumonia.

Skin Examination:
Linear streaks and mild erythema, possibly from cutaneous larva migrans.",
	15:"Blood Tests:
Complete Blood Count (CBC):
WBC: 12,500/mm³ (elevated, suggesting inflammation or infection).
Hemoglobin: 14.0 g/dL (normal).
Arterial Blood Gases (ABG):
pH: 7.34 (mild acidosis).
pCO₂: 52 mmHg (elevated).
pO₂: 65 mmHg (reduced).

Sputum Analysis:
Presence of inflammatory cells, negative for bacterial growth (indicative of viral or environmental cause).

Chest X-ray:
Hyperinflated lungs consistent with COPD, no consolidation or acute findings.

ECG:
Irregularly irregular rhythm consistent with atrial fibrillation.",
	16:"Pulmonary Function Tests (PFT):
Forced Expiratory Volume in 1 second (FEV₁): 65% of predicted (reduced).
FEV₁/FVC ratio: 65% (indicative of airway obstruction).

Blood Tests:
Complete Blood Count (CBC):
WBC: 9,500/mm³ (normal).
Eosinophils: 8% (elevated, indicative of allergic inflammation).

Allergy Testing:
Positive for dust mites and pollen.

Chest X-ray:
Normal, no signs of pneumonia or other acute findings.",
	17:"Imaging Studies:
MRI of Lumbar Spine:
Disc bulge at L4-L5 compressing the left nerve root.
Degenerative changes in the lumbar spine.

Blood Tests:
Complete Blood Count (CBC):
Normal.
Liver and Renal Function Tests:
Normal.

Electrodiagnostic Studies:
Findings consistent with mild nerve root irritation in the lumbar region.",
	18:"Blood Tests:
Complete Blood Count (CBC):
WBC: Normal.
Hemoglobin: 12.0 g/dL (borderline low, likely due to chronic NSAID use).
C-Reactive Protein (CRP): Elevated, indicating inflammation.
Renal Function Tests: Normal.

Joint Imaging:
X-ray of Knees and Wrists:
Evidence of joint space narrowing and osteophytes suggestive of osteoarthritis.

Endoscopy:
Erosive gastritis without active bleeding.",
	19:"Blood Tests:
HbA1c: 7.8% (indicating suboptimal glucose control).
Fasting Blood Glucose: 160 mg/dL (elevated).
Lipid Profile:
LDL: 120 mg/dL (slightly elevated).
HDL: 42 mg/dL (low).
Complete Blood Count (CBC): Normal.
Renal Function Tests: Normal.

Imaging Studies:
Brain MRI:
Chronic ischemic changes in the periventricular white matter.
No evidence of acute infarction.

Electrodiagnostic Studies:
Evidence of peripheral neuropathy in the hands and feet.",
	20:"Blood Tests:
Vitamin D Level: 18 ng/mL (deficient).
Calcium: 8.6 mg/dL (borderline low).
Inflammatory Markers:
C-Reactive Protein (CRP): Mildly elevated, indicating inflammation.

Imaging Studies:
X-ray of Knees:
Joint space narrowing and osteophyte formation, consistent with osteoarthritis.
MRI of Lumbar Spine:
Disc degeneration at L4-L5 and L5-S1 levels with mild nerve root compression.",
	21:"Blood Pressure: 128/85 mmHg (controlled, no change from previous visits)

Blood Tests:
Complete Blood Count (CBC): Normal
Liver Function Tests: Normal
Renal Function Tests: Normal
Helicobacter pylori Test: Negative
Stool Analysis: No signs of infection or blood

Other Tests:
Abdominal Ultrasound: No signs of gallstones or liver abnormalities
Endoscopy (optional but recommended if symptoms persist or worsen): No significant findings, mild esophagitis indicative of GERD.",
	22:"Lab Values:

Blood Pressure: 118/76 mmHg (normal).

Temperature: 37.5°C (mild fever).

Blood Tests:
Complete Blood Count (CBC): Normal, with slight lymphocytosis, which can indicate a viral infection.
C-Reactive Protein (CRP): Mildly elevated (suggesting mild inflammation, typical of viral infection).
Rapid Antigen Test for Influenza: Negative.
Strep Test: Negative (ruled out streptococcal infection).

Other Tests:
Chest X-ray: No signs of pneumonia or any lower respiratory tract involvement.
Nasopharyngeal Swab: Negative for COVID-19 and other common respiratory viruses.",
	23:"Blood Pressure: 130/85 mmHg (slightly elevated, consistent with stress).

Heart Rate: 88 bpm (normal).

Temperature: 36.8°C (normal).

Blood Tests:
Complete Blood Count (CBC): Normal.
Liver Function Tests (LFTs): Normal.
Renal Function Tests (RFTs): Normal.
Thyroid Function Tests: Normal, ruling out thyroid disorders.
C-Reactive Protein (CRP): Normal (no evidence of systemic inflammation).
Fasting Blood Glucose: 98 mg/dL (normal).

Gastroscopy: Mild esophagitis consistent with GERD. No peptic ulcers or other serious pathology.

Colonoscopy: Normal findings; mild signs of IBS (no structural abnormalities).",
	24:"Blood Pressure: 140/90 mmHg (slightly elevated).

Heart Rate: 80 bpm (normal).

Temperature: 36.7°C (normal).

Blood Tests:
Complete Blood Count (CBC): Normal.
Renal Function Tests (RFTs): Normal.
Liver Function Tests (LFTs): Normal.
C-Reactive Protein (CRP): Elevated (suggesting inflammation).
Erythrocyte Sedimentation Rate (ESR): Elevated (consistent with inflammation or degenerative disease).
Fasting Blood Glucose: 102 mg/dL (slightly elevated, monitor for prediabetes).

X-rays of the Knees and Spine:
Knee X-rays: Evidence of osteoarthritis with joint space narrowing, osteophytes, and subchondral sclerosis.
Spine X-rays: Degenerative changes in the lumbar spine (disc degeneration and mild scoliosis).",
	25:"Blood Pressure: 130/85 mmHg (well-controlled).

Heart Rate: 78 bpm (normal).

Temperature: 36.8°C (normal).

Blood Tests:
Complete Blood Count (CBC): Normal.
Renal Function Tests (RFTs): Normal.
Liver Function Tests (LFTs): Normal.
C-Reactive Protein (CRP): Slightly elevated (indicating mild inflammation).
Fasting Blood Glucose: 98 mg/dL (normal).
Helicobacter pylori Antibody Test: Negative.

Imaging:
Abdominal Ultrasound: No significant findings except for mild gastric distension, consistent with functional dyspepsia.
Nasal Endoscopy: Mild signs of chronic rhinosinusitis.",
	26:"Complete Blood Count (CBC): Normal.

Blood Glucose Levels:
Fasting: 110 mg/dL (elevated).
HbA1c: 7.2% (indicating suboptimal diabetes control).

Liver Function Tests (LFTs): Normal.

Kidney Function Tests: Creatinine: 0.9 mg/dL (normal).

Prolactin Levels: 45 ng/mL (elevated; normal range: <20 ng/mL).

Doppler Ultrasound: Evidence of venous reflux and valve incompetence in the lower extremities.",
	27:"Urinalysis:
Leukocytes: ++
Nitrites: Positive
Protein: Trace
RBCs: 2-4/hpf
pH: 6.0

Complete Blood Count (CBC):
WBC: 12,000/μL (mild leukocytosis, indicating infection).
Hemoglobin: 12.5 g/dL (normal).
Stool Analysis: No parasites or blood detected.


Kidney Function Tests:
Serum Creatinine: 0.9 mg/dL (normal).",
	28:"Complete Blood Count (CBC):
WBC: 8,000/μL (normal).
Hemoglobin: 13.5 g/dL (normal).
Fasting Blood Sugar (FBS): 120 mg/dL (slightly elevated, diabetes-related).

Lipid Profile:
LDL: 150 mg/dL (elevated).
HDL: 40 mg/dL (low).

Liver and Kidney Function:
ALT: 22 IU/L (normal).
Creatinine: 1.1 mg/dL (normal).

Audiometry and Vestibular Testing:
Mild sensorineural hearing loss in the left ear.
Positive Dix-Hallpike test indicating vertigo.",
	29:"No specific labs were ordered as the clinical presentation is sufficient for diagnosis. However, the following were recommended for baseline and systemic evaluations if systemic therapy is considered:

Complete Blood Count (CBC): Normal.

Hormonal Profile: Normal, ruling out PCOS or hormonal imbalance.",
	30:"Basic labs for assessment:
Vitamin D levels: 25 ng/mL (mild insufficiency).
Complete Blood Count (CBC): Within normal limits.
C-reactive Protein (CRP): Normal, ruling out significant infection.",
	31:"White Blood Cell (WBC) Count: 14,000/µL (elevated, suggestive of infection).
C-reactive Protein (CRP): 18 mg/L (elevated, indicates inflammation).
Chest X-ray: No significant infiltrates or consolidation.
Oxygen Saturation (SpO2): 96% at rest.",
	32:"Blood Glucose (Random): 220 mg/dL (uncontrolled diabetes).

HbA1c: 8.5% (elevated, poor long-term glycemic control).

Complete Blood Count (CBC):
WBC: 13,000/µL (elevated, indicative of infection).
Neutrophils: 80% (elevated, bacterial involvement).

Skin Swab Culture Results:
Candida albicans: Fluconazole-sensitive.
Staphylococcus aureus: Tedizolid-sensitive.",
	33:"Erythrocyte Sedimentation Rate (ESR): 28 mm/hr (mildly elevated, consistent with osteoarthritis).
C-Reactive Protein (CRP): 4.2 mg/L (slightly elevated, indicative of inflammation).
Uric Acid: 4.8 mg/dL (normal).
Liver Function Tests: Normal (important for Celecoxib use).
Kidney Function Tests: Normal (important for NSAID safety).",
	34:"Lipid Profile:
Total Cholesterol: 230 mg/dL (elevated).
LDL: 160 mg/dL (elevated).
HDL: 40 mg/dL (low).
Triglycerides: 180 mg/dL (elevated).

Fasting Blood Glucose: 95 mg/dL (normal).

HbA1c: 5.6% (normal).

Vitamin D: 18 ng/mL (deficient).",
	35:"Complete Blood Count (CBC):
Hemoglobin: 13.5 g/dL (normal).
WBC: 6,800/µL (normal).

Liver Function Tests (LFTs):
ALT: 32 U/L (normal).
AST: 28 U/L (normal).

Stool Analysis:
No blood, mucus, or parasites.
Negative for H. pylori antigen.",
	36:"Complete Blood Count (CBC):
Hemoglobin: 13.2 g/dL (normal).
WBC: 6,100/µL (normal).

Hormonal Profile:
FSH: 9 IU/L (slightly elevated, suggesting anovulation).
LH: 8 IU/L (normal).
Progesterone: 2 ng/mL (low, indicating lack of ovulation).
Estradiol: 42 pg/mL (normal range for follicular phase).

Pelvic Ultrasound:
Ovaries show multiple small cysts, consistent with PCOS.",
	37:"Complete Blood Count (CBC):
WBC: 15,000/µL (elevated, suggesting bacterial infection).
Neutrophils: 85% (shift to the left, indicative of bacterial infection).
Hemoglobin: 11.5 g/dL (normal).

C-Reactive Protein (CRP):
30 mg/L (elevated, consistent with acute infection).

Blood Gas (if applicable for respiratory distress):
pH: 7.36 (mild acidosis).
PaCO2: 45 mmHg (mild respiratory acidosis, indicating possible respiratory compromise).

Chest X-ray (if applicable):
Mild bilateral infiltrates, suggesting possible pneumonia or viral infection.",
	38:"Complete Blood Count (CBC):
WBC: 6,000/µL (normal).
Hemoglobin: 13.5 g/dL (normal).
Platelets: 250,000/µL (normal).

Thyroid Function Tests:
TSH: 2.2 µIU/mL (normal).
Free T4: 1.2 ng/dL (normal).

Vitamin B12 Level:
250 pg/mL (low-normal, may contribute to cognitive decline).

Glucose and HbA1c:
Fasting Glucose: 110 mg/dL (impaired fasting glucose).
HbA1c: 6.8% (consistent with well-controlled diabetes).

Lipid Profile:
Total Cholesterol: 180 mg/dL (within normal range).
LDL: 95 mg/dL (within normal range).
HDL: 45 mg/dL (normal).
Triglycerides: 120 mg/dL (normal).

MRI Brain Scan:
Mild global atrophy, particularly in the hippocampus, without evidence of large vascular infarcts or major structural abnormalities.",
	39:"Complete Blood Count (CBC):
WBC: 6,300/µL (normal).
Hemoglobin: 13.8 g/dL (normal).
Platelets: 250,000/µL (normal).

Thyroid Function Tests:
TSH: 2.3 µIU/mL (normal).
Free T4: 1.1 ng/dL (normal).

Glucose and HbA1c:
Fasting Glucose: 165 mg/dL (elevated, suggesting poor glucose control).
HbA1c: 9.4% (high, indicating poor long-term control of blood glucose).

Lipid Profile:
Total Cholesterol: 200 mg/dL (normal).
LDL: 145 mg/dL (elevated, suboptimal control).
HDL: 40 mg/dL (low).
Triglycerides: 190 mg/dL (elevated).

Kidney Function Tests:
Serum Creatinine: 1.2 mg/dL (normal).
eGFR: 80 mL/min (normal).

Urinalysis:
Protein: Trace (early sign of nephropathy, requires monitoring).
Glucose: Positive (indicating poor blood sugar control).",
	40:"Complete Blood Count (CBC):
WBC: 6,500/µL (normal).
Hemoglobin: 14.2 g/dL (normal).
Platelets: 235,000/µL (normal).

Kidney Function Tests:
Serum Creatinine: 1.3 mg/dL (slightly elevated from baseline, but within acceptable range for CKD stage 2).
eGFR: 55 mL/min (reduced from baseline but still within stage 2 CKD).
BUN: 18 mg/dL (normal).

Electrolytes:
Sodium: 139 mmol/L (normal).
Potassium: 5.1 mmol/L (slightly elevated, needs monitoring with triamterene).
Calcium: 9.2 mg/dL (normal).

Liver Function Tests (LFTs):
AST: 28 U/L (normal).
ALT: 30 U/L (normal).
Bilirubin: 1.0 mg/dL (normal).

Glucose and HbA1c:
Fasting Glucose: 155 mg/dL (elevated, indicating poor glucose control).
HbA1c: 8.2% (high, indicating poor long-term glucose control).

Arterial Blood Gases (ABGs):
pH: 7.40 (normal).
pCO2: 39 mmHg (normal).
pO2: 75 mmHg (slightly low, consistent with COPD).",
	41:"Complete Blood Count (CBC):
WBC: 7,200/µL (normal).
Hemoglobin: 13.0 g/dL (normal).
Platelets: 260,000/µL (normal).

Inflammatory Markers:
ESR: 40 mm/hr (elevated, indicative of inflammation).
CRP: 12 mg/L (elevated, suggests acute inflammation).

Kidney Function Tests:
Serum Creatinine: 1.0 mg/dL (normal).
eGFR: 90 mL/min (normal).

Liver Function Tests (LFTs):
AST: 25 U/L (normal).
ALT: 30 U/L (normal).

Lipid Panel:
Total Cholesterol: 230 mg/dL (elevated).
LDL: 150 mg/dL (elevated).
HDL: 40 mg/dL (low).
Triglycerides: 190 mg/dL (elevated).

Coagulation Profile:
PT: 12 seconds (normal).
INR: 1.0 (normal).",
	42:"Complete Blood Count (CBC):
WBC: 8,500/µL (within normal range, mild reactive change).
Neutrophils: 65% (slightly elevated).
Lymphocytes: 30% (normal).

C-Reactive Protein (CRP):
8 mg/L (mildly elevated, suggests mild inflammation).

Liver Function Tests (LFTs):
AST: 22 U/L (normal).
ALT: 18 U/L (normal).

Renal Function Tests:
Creatinine: 0.9 mg/dL (normal).",
	43:"Complete Blood Count (CBC):
WBC: 14,000/µL (elevated, suggests infection).
Neutrophils: 78% (elevated).
Hemoglobin: 13.5 g/dL (normal).

Electrolytes:
Sodium: 132 mEq/L (mildly low).
Potassium: 3.4 mEq/L (borderline low).

Blood Glucose:
Random: 250 mg/dL (elevated, likely stress-induced hyperglycemia).

Renal Function Tests:
Urea: 38 mg/dL (normal).
Creatinine: 1.1 mg/dL (normal).

Stool Analysis:
Microscopic: Presence of cysts and leukocytes, consistent with protozoal infection.",
	44:"Complete Blood Count (CBC):
WBC: 6,500/µL (normal)
Hemoglobin: 13.1 g/dL (normal)
Platelets: 280,000/µL (normal)

Renal Function Tests:
Urea: 28 mg/dL (normal)
Creatinine: 0.9 mg/dL (normal)

Liver Function Tests:
AST/ALT: Within normal limits

Stool Analysis:
No ova, parasites, or blood detected
Positive for undigested food particles (suggestive of IBS)",
	45:"Complete Blood Count (CBC):
WBC: 14,500/µL (elevated, suggestive of bacterial infection)
Neutrophils: 75%
Hemoglobin: 11.5 g/dL (normal)
Platelets: 310,000/µL (normal)

Throat Swab Culture:
Positive for Streptococcus pyogenes

C-Reactive Protein (CRP):
20 mg/L (elevated, indicative of inflammation)",
	46:"Complete Blood Count (CBC):
WBC: 13,200/µL (elevated, suggestive of infection)
Neutrophils: 72%
Hemoglobin: 13.8 g/dL (normal)
Platelets: 280,000/µL (normal)

C-Reactive Protein (CRP):
18 mg/L (elevated, indicative of inflammation)

Chest X-ray:
No signs of pneumonia; mild bronchial thickening observed.",
	47:"Routine Labs:
WBC: 7,500/µL (normal)
ESR: 28 mm/hr (mildly elevated, indicative of inflammation)
CRP: 10 mg/L (mildly elevated)

Imaging:
Lumbar spine X-ray: Degenerative changes noted at L4-L5 with mild disc space narrowing.
MRI: Evidence of a mild disc herniation at L4-L5 with nerve root impingement.",
	48:"Routine Labs:
WBC: 12,000/µL (elevated, indicative of bacterial infection).
CRP: 15 mg/L (elevated).
Throat swab culture: Positive for Streptococcus pyogenes.",
	49:"(Labs typically not required for mild otitis externa; provided for thoroughness.)

WBC: Normal (no signs of systemic infection).
ESR/CRP: Normal.
Ear canal examination: Presence of cerumen with mild erythema of the external ear canal, no perforation of the eardrum.",
	50:"Ocular Surface Disease Index (OSDI): Mildly elevated score indicating dry eye symptoms.
Schirmer's Test: 10 mm in 5 minutes (indicating mild dry eye).
Tear Breakup Time: 5 seconds (indicating instability in tear film).",
	51:"H. pylori Antigen Test: Positive.
Complete Blood Count (CBC):
Hemoglobin: 12.5 g/dL (slightly low, indicating mild anemia).
White Blood Cell Count: 7.8 x 10^9/L (normal).
Liver Function Tests: Normal.
Arterial Blood Gas (ABG): Mild respiratory alkalosis.
Spirometry: FEV1/FVC ratio: 65% (consistent with asthma).",
	52:"Complete Blood Count (CBC): Normal.
Liver Function Tests (LFTs): Normal.
Electrolytes: Normal.
Thyroid-Stimulating Hormone (TSH): Normal.
Brain Imaging (if performed): Unremarkable, ruling out structural causes for headaches.",
	53:"Complete Blood Count (CBC): Normal.
Electrolytes: Mild hypokalemia (K+ = 3.2 mEq/L).
Renal Function Tests: Normal.
ECG: No ischemic changes, confirming non-cardiac chest pain.
C-Reactive Protein (CRP): Slightly elevated, indicating mild inflammation.",
	54:"Tear Sample Culture: Growth of Staphylococcus aureus confirming bacterial etiology.
Complete Blood Count (CBC):
Mild leukocytosis (WBC = 12,000/mm³) indicative of an infection.",
	55:"Complete Blood Count (CBC):
Normal hemoglobin and white blood cell count.

Stool Analysis:
Negative for occult blood, no parasitic infection.

Abdominal Ultrasound:
Normal findings, ruling out structural abnormalities.",
	56:"Complete Blood Count (CBC):
Hemoglobin: 9.5 g/dL (Low)
Mean Corpuscular Volume (MCV): 72 fL (Microcytic anemia)
Ferritin: 10 ng/mL (Low)

Stool Examination:
Positive for Entamoeba histolytica cysts.

Liver Function Tests:
Within normal limits.",
	57:"Skin Scrapings Analysis:
Positive for fungal hyphae under KOH (potassium hydroxide) preparation.

Complete Blood Count (CBC):
Within normal limits, no signs of systemic infection.",
	58:"No laboratory investigations were required for this case.
Diagnosis made based on clinical presentation and history.",
	59:"Routine lab tests were not required for this case. Diagnosis made clinically.",
	60:"Complete Blood Count (CBC): Normal
Uric Acid Level: Elevated at 8.5 mg/dL (normal range: 3.5–7.2 mg/dL).
Liver and Kidney Function Tests: Normal
CRP (C-Reactive Protein): Elevated, suggesting inflammation.",
	61:"Complete Blood Count (CBC):
Hemoglobin: 10.5 g/dL (normal range: 11.5–15.5 g/dL) - indicating possible anemia.
Hematocrit: Low.

Serum Ferritin:
Low at 10 ng/mL (normal range: 12–150 ng/mL) - indicating iron deficiency.

Vitamin D Level:
Low at 15 ng/mL (normal range: 20–50 ng/mL).

General Nutritional Assessment:
Signs of overall malnutrition due to poor dietary intake.",
	62:"Complete Blood Count (CBC):
Normal.

Lipid Profile:
Total Cholesterol: 200 mg/dL (borderline high).
LDL: 130 mg/dL (elevated).
HDL: 45 mg/dL (low).
Triglycerides: 150 mg/dL (normal).

Vitamin Levels:
Vitamin E: Low at 5 µg/mL (normal range: 10–40 µg/mL).
Other vitamins (A, D, K) and minerals within normal limits.",
	63:"Complete Blood Count (CBC):
Normal, no signs of infection.

Hormonal Panel:
Testosterone: Slightly elevated.
Dihydrotestosterone (DHT): Normal.

Skin Culture (if indicated):
No growth, indicating no secondary bacterial infection.",
	64:"Complete Blood Count (CBC):
Normal, no signs of infection.

Allergy Testing:
Patch testing reveals sensitivity to certain environmental allergens (e.g., pollen, dust mites).

Skin Scraping (if indicated):
No fungal elements present, ruling out tinea.",
	65:"Complete Blood Count (CBC):
Within normal limits.

Liver Function Tests:
Normal.

Skin Scraping (if indicated):
No fungal elements present, ruling out tinea or other infections.",
	66:"Complete Blood Count (CBC):
Normal with no signs of infection or anemia.

Skin Scraping (if indicated):
Negative for fungal elements.

Allergy Testing:
Patch testing could be considered if contact dermatitis is suspected; however, not performed during this visit.",
	67:"Peak Expiratory Flow Rate (PEFR):
Recorded at 65% of predicted value, indicating moderate obstruction.

Arterial Blood Gas (ABG) (if indicated):
Mild respiratory alkalosis with normal oxygen saturation (above 90%).

Spirometry:
FEV1/FVC ratio < 70% indicates obstruction, but improvement noted with bronchodilator use.",
	68:"Complete Blood Count (CBC):
Hemoglobin: 11.0 g/dL (mild anemia).
WBC: 6,200/mm³ (normal).
Platelets: 170,000/mm³ (normal).

Liver Function Tests (LFTs):
ALT: 85 U/L (elevated).
AST: 75 U/L (elevated).
Alkaline phosphatase (ALP): 320 U/L (elevated).
Bilirubin (Total): 2.1 mg/dL (elevated).

Coagulation Profile:
INR: 1.3 (prolonged).
Vitamin K levels: Low.

Other Tests:
Serum bile acids: Elevated.
Antimitochondrial antibodies (AMA): Positive.

Imaging:
Abdominal ultrasound: No gallstones; mild liver enlargement with increased echogenicity.",
	69:"Stool Analysis:
Positive for leukocytes.
Negative for ova, parasites, or significant blood.

Complete Blood Count (CBC):
Hemoglobin: 14.5 g/dL (normal).
WBC: 9,800/mm³ (normal, slight elevation in neutrophils).
Platelets: 210,000/mm³ (normal).

Electrolytes:
Sodium: 136 mEq/L (normal).
Potassium: 3.4 mEq/L (mildly low).",
	70:"Complete Blood Count (CBC):
Hemoglobin: 14.2 g/dL (normal).
WBC: 11,000/mm³ (mild elevation, suggestive of inflammation or infection).
Neutrophils: 68% (normal, slightly elevated).
Eosinophils: 5% (borderline high, indicating allergic component).

Spirometry:
FEV1: 75% of predicted (mild obstruction).
Improvement of FEV1 > 12% after bronchodilator administration.

Chest X-ray:
Normal, no evidence of pneumonia.",
	71:"Complete Blood Count (CBC): Normal.
Erythrocyte Sedimentation Rate (ESR): Slightly elevated, consistent with mild inflammation.
C-Reactive Protein (CRP): Within normal range.

Joint X-Ray:
Reduced joint space in both knees, osteophyte formation.",
	72:"Complete Blood Count (CBC):

WBC: 13,000/μL (elevated, indicating infection).
Neutrophils: 80% (consistent with bacterial infection).
C-Reactive Protein (CRP): Elevated.

Blood Glucose: 190 mg/dL (fasting, slightly elevated due to infection).

Culture and Sensitivity of Wound Exudate: Pending.",
	73:"Complete Blood Count (CBC):
WBC: 12,500/μL (elevated, indicating infection).
Neutrophils: 85%.

Arterial Blood Gas (ABG):
pH: 7.36 (compensated respiratory acidosis).
PaO2: 65 mmHg (mild hypoxemia).
PaCO2: 52 mmHg (hypercapnia).
Sputum Culture and Sensitivity: Positive for Haemophilus influenzae.

Liver Function Tests: Mild elevation in ALT and AST due to chronic theophylline use.",
	74:"Complete Blood Count (CBC):
WBC: 8,000/μL (normal).
Neutrophils: 60%.
Eosinophils: 4% (slightly elevated, consistent with dermatitis).
Blood Glucose (Fasting): 160 mg/dL (poor control of diabetes).

HbA1c: 8.2% (indicates suboptimal long-term glucose control).

Liver Function Tests: Normal.

Skin Swab Culture: No bacterial or fungal growth.",
	75:"Complete Blood Count (CBC):

WBC: 14,000/μL (elevated, indicating infection).
Neutrophils: 80% (elevated).
Lymphocytes: 15%.
C-Reactive Protein (CRP): 25 mg/L (elevated, supporting bacterial infection).

Throat Swab Culture: Positive for Streptococcus pyogenes.

Liver and Kidney Function Tests: Normal.",
	76:"Complete Blood Count (CBC):
WBC: 12,500/μL (elevated, indicating infection).
Neutrophils: 78% (elevated).
Lymphocytes: 18%.
C-Reactive Protein (CRP): 35 mg/L (elevated, supporting bacterial infection).

Chest X-Ray:
No signs of pneumonia. Mild hyperinflation noted, consistent with COPD.
Liver and Kidney Function Tests: Normal.",
	77:"Complete Blood Count (CBC):
WBC: 14,000/μL (elevated, suggesting bacterial infection).
Neutrophils: 80%.
Lymphocytes: 15%.
C-Reactive Protein (CRP): 50 mg/L (elevated, supporting bacterial infection).

Stool Analysis:
Presence of pus cells and undigested food particles.
No parasites detected.

Chest X-Ray:
Mild bronchial thickening consistent with lower respiratory tract infection.

Electrolytes:
Slightly decreased potassium levels (3.3 mEq/L) due to diarrhea.",
	78:"Urinalysis:
Appearance: Cloudy.
pH: 5.5.
WBCs: 20-25/high-power field (HPF) (elevated).
RBCs: 2-4/HPF.
Bacteria: Positive.

CBC:
WBC: 11,000/μL (mild leukocytosis).
Hemoglobin: 14.2 g/dL.
CRP: 20 mg/L (elevated, indicating inflammation).

Digital Rectal Examination (DRE):
External hemorrhoids noted, no thrombosis.
No prostate enlargement or tenderness.",
	79:"Complete Blood Count (CBC):
WBC: 13,000/μL (elevated, indicating infection).
Hemoglobin: 12.4 g/dL (normal).

Liver Function Tests (LFTs):
ALT: 52 U/L (slightly elevated).
AST: 48 U/L (slightly elevated).
Alkaline phosphatase (ALP): 210 U/L (elevated).
Bilirubin (Total): 1.6 mg/dL (elevated).

C-Reactive Protein (CRP):
45 mg/L (elevated, indicating inflammation).

Abdominal Ultrasound:
Gallbladder wall thickening and presence of gallstones.",
	80:"Complete Blood Count (CBC):
WBC: 8,000/μL (normal).
Hemoglobin: 12.0 g/dL (slightly low).

Hormonal Profile:
Total Testosterone: 220 ng/dL (low, normal range 300–1000 ng/dL).
LH: 4 mIU/mL (normal).
FSH: 3.5 mIU/mL (normal).

Biochemistry:
Zinc: 65 µg/dL (low, normal range 70–120 µg/dL).
Serum Vitamin B6: 8 ng/mL (low, normal range 5–30 ng/mL).

Liver Function Tests (LFTs):
ALT: 40 U/L (normal).
AST: 38 U/L (normal).",
	81:"Complete Blood Count (CBC):
WBC: 6,800/μL (normal).
Hemoglobin: 14.2 g/dL (normal).
Platelets: 250,000/μL (normal).

Liver Function Tests (LFTs):
ALT: 30 U/L (normal).
AST: 28 U/L (normal).

Stool Test:
Negative for H. pylori antigen.

Allergy Test:
Positive for pollen and dust mites.",
	82:"Complete Blood Count (CBC):
WBC: 13,000/μL (elevated, indicating infection).
Neutrophils: 80% (elevated, suggesting bacterial infection).
Lymphocytes: 15%.

C-Reactive Protein (CRP):
25 mg/L (elevated, indicates inflammation).

Throat Swab Culture:
Positive for Streptococcus pyogenes.",
	83:"Hormonal Panel:
Total Testosterone: 85 ng/dL (high; normal: 15–70 ng/dL for females).
LH/FSH Ratio: 2.8:1 (indicative of PCOS).
DHEAS: Normal.

Other Tests:
Fasting Glucose: 95 mg/dL (normal).
Lipid Profile: Within normal limits.",
	84:"Complete Blood Count (CBC):
Hemoglobin: 11.0 g/dL (low; normal: 13.5–17.5 g/dL for males).
Hematocrit: 35% (low).
Mean Corpuscular Volume (MCV): 78 fL (microcytic anemia).

Basic Metabolic Panel:
Sodium: 136 mmol/L (normal).
Potassium: 4.0 mmol/L (normal).
Glucose: 95 mg/dL (normal).

Other Tests:
Ferritin: 12 ng/mL (low; normal: 24–336 ng/mL).
Serum Iron: 45 µg/dL (low).",
	85:"Complete Blood Count (CBC):
White Blood Cell Count (WBC): 12,000/µL (elevated; normal: 4,000–11,000/µL).
Hemoglobin: 12.5 g/dL (normal).
Platelets: 280,000/µL (normal).

Basic Metabolic Panel:
Sodium: 134 mmol/L (slightly low; normal: 135–145 mmol/L).
Potassium: 3.5 mmol/L (normal).
Creatinine: 0.9 mg/dL (normal).

Stool Analysis:
Presence of leukocytes and red blood cells, no ova or parasites detected.",
	86:"Complete Blood Count (CBC):
White Blood Cell Count (WBC): 9,500/µL (normal; normal range: 4,000–11,000/µL).
Hemoglobin: 13.5 g/dL (normal).
Platelets: 250,000/µL (normal).

Rapid Antigen Test for Influenza:
Negative.

Streptococcal Test:
Negative.",
	87:"Complete Blood Count (CBC):
White Blood Cell Count (WBC): 12,000/µL (elevated, indicating possible infection).
Hemoglobin: 14.0 g/dL (normal).
Platelets: 300,000/µL (normal).

Urinalysis:
Color: Cloudy.
pH: 6.0.
Specific gravity: 1.015.
Protein: Negative.
Glucose: Negative.
Nitrite: Positive (indicating bacterial infection).
Leukocyte esterase: Positive (indicating inflammation/infection).

Culture and Sensitivity:
Pending results",
	88:"Complete Blood Count (CBC):
White Blood Cell Count (WBC): 7,000/µL (normal).
Hemoglobin: 13.5 g/dL (normal).
Platelets: 250,000/µL (normal).

Erythrocyte Sedimentation Rate (ESR):
15 mm/h (slightly elevated, indicating inflammation).

X-rays of the knees and lumbar spine:
Show moderate osteoarthritis changes (joint space narrowing, osteophytes, and subchondral sclerosis).",
	89:"Complete Blood Count (CBC):
White Blood Cell Count (WBC): 6,500/µL (normal).
Hemoglobin: 13.2 g/dL (normal).
Platelets: 300,000/µL (normal).

Calcium and Phosphorus Levels:
Serum Calcium: 9.0 mg/dL (normal).
Serum Phosphorus: 3.5 mg/dL (normal).

Vitamin D Levels:
25-Hydroxyvitamin D: 18 ng/mL (deficient).

Bone Density Scan:
DEXA scan shows a T-score of -2.5 in the lumbar spine and hip, confirming osteoporosis.",
	90:"Complete Blood Count (CBC):
WBC: 6,800/µL (normal).
Hemoglobin: 13.5 g/dL (normal).
Platelets: 250,000/µL (normal).

Lipid Profile:
Total Cholesterol: 190 mg/dL (borderline high).
LDL: 110 mg/dL (optimal).
HDL: 50 mg/dL (acceptable).
Triglycerides: 150 mg/dL (normal).

Fasting Blood Glucose:
120 mg/dL (slightly elevated, indicating suboptimal glycemic control).

HbA1c:
7.5% (indicates poor long-term glycemic control).

Renal Function:
Serum Creatinine: 0.9 mg/dL (normal).
eGFR: >60 mL/min (normal).

Liver Function Tests:
Normal.",
	91:"Complete Blood Count (CBC):
WBC: 12,000/µL (elevated, suggesting infection).
Hemoglobin: 14.0 g/dL (normal).
Platelets: 300,000/µL (normal).

Nasal Swab Culture:
Positive for Streptococcus pneumoniae, sensitive to Rifampicin.

Erythrocyte Sedimentation Rate (ESR):
Elevated at 25 mm/hr (indicative of inflammation).

Allergy Testing:
Positive for dust mites and pollen.",
	92:"Complete Blood Count (CBC):
WBC: 6,500/µL (normal).
Hemoglobin: 10.5 g/dL (low, indicative of anemia).
Hematocrit: 32% (low).
Platelets: 250,000/µL (normal).

Iron Studies:
Serum Ferritin: 15 ng/mL (low, indicative of iron deficiency).
Serum Iron: 40 µg/dL (low).
Total Iron Binding Capacity (TIBC): 450 µg/dL (elevated).

Stool Test:
Positive for occult blood, suggesting gastrointestinal bleeding.",
	93:"Urinalysis:
No signs of infection (negative for nitrites and leukocyte esterase).
Specific gravity: 1.020.
No hematuria.

PSA (Prostate-Specific Antigen):
4.5 ng/mL (slightly elevated; monitoring required for potential prostate issues).

Kidney Function Tests:
Serum creatinine: 0.9 mg/dL (normal).
BUN: 15 mg/dL (normal).

Blood Pressure:
130/80 mmHg (well-controlled).",
	94:"Hormone Levels:
Estradiol: 30 pg/mL (within normal range for a postmenopausal woman).

CBC (Complete Blood Count):
WBC: 6,000 cells/mm³ (normal).
Hemoglobin: 13.5 g/dL (normal).
Platelets: 250,000 cells/mm³ (normal).

Liver Function Tests:
AST: 20 U/L (normal).
ALT: 22 U/L (normal).
Alkaline Phosphatase: 85 U/L (normal).

Kidney Function Tests:
Serum creatinine: 0.8 mg/dL (normal).
BUN: 12 mg/dL (normal).",
	95:"Visual Acuity Test:
Right eye: 20/30 (with slight discomfort).
Left eye: 20/25 (normal).

Intraocular Pressure (IOP):
Right eye: 16 mmHg (normal).
Left eye: 15 mmHg (normal).

Slit Lamp Examination:
Mild conjunctival injection and edema in the right eye.
No foreign bodies noted.
Minor corneal abrasion observed in the right eye.

Tear Break-Up Time (TBUT):
Right eye: 4 seconds (reduced).
Left eye: 7 seconds (normal).",
	96:"Neurological Examination:
Alert and oriented, with no focal neurological deficits.
Mood swings noted, with periods of elevated mood and irritability.

Blood Tests:
Complete blood count (CBC): Normal.
Electrolytes: Normal.
Liver and renal function tests: Normal.

EEG (Electroencephalogram):
No significant abnormalities; normal waveforms.",
	97:"Physical Examination:
Right knee swollen and tender to palpation, with reduced range of motion.
No signs of infection (no fever, erythema, or warmth).

Blood Tests:
Complete blood count (CBC): Normal.
D-dimer: Elevated, indicating possible clotting issues.
Coagulation profile: INR within therapeutic range (on anticoagulants).

Imaging:
X-ray of the right knee: Moderate osteoarthritis changes with joint space narrowing.",
	98:"Physical Examination:
Erythematous, raised, and itchy rash on the left forearm, with some areas exhibiting crusting and oozing.
No signs of systemic infection (no fever, lymphadenopathy).

Skin Swab:
Bacterial culture: Positive for Staphylococcus aureus.",
	99:"Physical Examination:
Swelling and tenderness noted on the medial aspect of the right knee.
Range of motion is limited due to pain.
No signs of redness or warmth suggestive of infection.

Imaging Studies:
X-ray of the right knee: Mild joint space narrowing and osteophyte formation consistent with osteoarthritis.",
	100:"Physical Examination:
Vital signs: Stable, blood pressure 130/80 mmHg, heart rate 72 bpm.
Abdomen soft, non-tender, with no palpable masses.
Tenderness in bilateral knees with limited range of motion.

Imaging Studies:
No imaging studies performed at this visit; previous X-ray findings indicated mild osteoarthritis changes in knees.",
	101:"Physical Examination:
Temperature: 38.2°C (100.8°F).
Throat examination reveals erythema and swollen tonsils with no visible exudates.
Mildly enlarged anterior cervical lymph nodes.
Nasal passages inflamed with clear discharge.
Lungs: Clear on auscultation, no wheezing or rales.

Laboratory Results:
Complete Blood Count (CBC):
WBC: 12,500/μL (elevated, indicating possible bacterial infection).
Neutrophils: 72% (elevated).
Lymphocytes: 22% (reduced).
Rapid strep test: Negative.",
	102:"Physical Examination:
Diffuse thinning on the crown and frontal scalp, with noticeable widening of the hair parting.
Dry, flaky patches with mild redness on the scalp.
No visible signs of scarring.

Laboratory Results:
Complete Blood Count (CBC): Normal.
Ferritin: 20 µg/L (low-normal, suggesting suboptimal iron stores).
Vitamin D: 18 ng/mL (deficiency).
TSH (Thyroid-Stimulating Hormone): Normal.",
	103:"Physical Examination:
Blood pressure: 150/95 mmHg (elevated).
Weight: 85 kg; Height: 170 cm; BMI: 29.4 (overweight).
Knee joint tenderness and crepitus on movement.

Laboratory Results:
Complete Blood Count (CBC): Normal.
Lipid Profile:
LDL: 145 mg/dL (elevated).
HDL: 38 mg/dL (low).
Total cholesterol: 210 mg/dL (borderline high).
Liver Function Tests (LFT): Normal.
Renal Function Tests (RFT): Normal.",
	104:"Physical Examination:
Red, inflamed, and crusted patches noted on the hands and perioral area.
Mild excoriations from scratching.
No systemic signs of infection (e.g., fever).

Laboratory Tests:
Skin Swab Culture: Positive for Staphylococcus aureus.
Complete Blood Count (CBC):
White Blood Cell Count: 10,000/μL (upper limit of normal).
Eosinophils: Elevated at 6% (indicative of atopy).",
	105:"Physical Examination:
Positive straight leg raise test at 30° on the right side (suggesting nerve root irritation).
Muscle spasm palpable in the paraspinal region.
Decreased range of motion in lumbar spine flexion and extension.

Laboratory Tests:
Complete Blood Count (CBC):
WBC: 8,500/μL (normal).
No inflammatory markers indicating systemic infection.

Imaging:
Lumbar X-ray shows reduced intervertebral disc space at L4-L5.",
	106:"Physical Examination:
Observed thin, greyish vaginal discharge with a fishy odor.
Mild tenderness in the lower abdominal region.

Laboratory Tests:
Vaginal pH: Elevated at 5.5 (normal: <4.5).
Whiff Test: Positive (ammonia-like odor after adding potassium hydroxide).
Microscopy: Presence of clue cells, indicating bacterial vaginosis.
Culture Test: Confirms mixed bacterial flora, sensitive to ciprofloxacin and metronidazole.",
	107:"Physical Examination:
Mild tenderness over the maxillary sinuses.
Postnasal drip observed.
Normal lung auscultation.

Vital Signs:
Temperature: 37.8°C (low-grade fever).
Blood pressure: 120/80 mmHg.

Laboratory Tests:
CBC: Elevated WBC count at 12,000/µL, indicating bacterial infection.
CRP: Mildly elevated at 8 mg/L (normal <5 mg/L), consistent with bacterial sinusitis.",
	108:"Physical Examination:
Annular, scaly, erythematous lesions on the scalp and torso.
Some lesions show pustular drainage, indicating secondary infection.
Generalized pruritus with excoriations.

Vital Signs:
Temperature: 38.2°C (mild fever).
Heart rate: 96 bpm (within normal range).

Laboratory Tests:
KOH Preparation: Positive for fungal hyphae, confirming dermatophytosis.
CBC: Elevated WBC count of 14,500/µL, indicating infection.
CRP: 15 mg/L (elevated, indicating inflammation).",
	109:"Physical Examination:
Generalized muscle weakness.
Height loss of 2 cm compared to previous records.
Normal neurological exam.

Laboratory Results:
Serum Calcium: 8.4 mg/dL (low-normal).
Serum Vitamin D: 18 ng/mL (insufficient).
Parathyroid Hormone (PTH): Slightly elevated (consistent with vitamin D deficiency).
Serum Magnesium: 1.6 mg/dL (low).
Complete Blood Count (CBC): Normal.

Bone Mineral Density (BMD):
T-score: -1.8 (consistent with osteopenia).",
	110:"Physical Examination:
Vulvar erythema and swelling.
Thick, white, curd-like vaginal discharge noted.
No significant odor.

Laboratory Results:
Wet Mount Microscopy: Presence of budding yeast and pseudohyphae.
Vaginal pH: 4.2 (within normal acidic range for candidiasis).
Blood Sugar (Fasting): 180 mg/dL (elevated).
HbA1c: 8.2% (poor glycemic control).

Culture and Sensitivity:
Positive for Candida albicans, sensitive to both fluconazole and butoconazole.",
	111:"Physical Examination:
Mild hirsutism on the face and chest (Ferriman-Gallwey score: 8).
Acne on the face and upper back.
Laboratory Results:

Hormonal Profile:
LH/FSH ratio: 3:1 (elevated, consistent with PCOS).
Prolactin: 35 ng/mL (elevated; normal range: 4.8–23.3 ng/mL).
Free Testosterone: Slightly elevated at 1.5 ng/mL (normal range: 0.1–1.2 ng/mL).
TSH: 2.2 μIU/mL (normal range).

Metabolic Panel:
Fasting Blood Glucose: 115 mg/dL (impaired fasting glucose).
HbA1c: 5.8% (prediabetic range).

Pelvic Ultrasound:
Ovaries with multiple small follicles (10+ per ovary, size: 2–9 mm).
Increased ovarian volume (>10 cm³).
Endometrial thickness normal for the luteal phase.",
	112:"Physical Examination Findings:
Erythematous, scaly plaques on arms, legs, and lower back.
Lichenification (thickened skin) due to chronic scratching.
Fissures and minor excoriations noted on affected areas.

Blood Work:
Eosinophils: 6.5% (mildly elevated; normal range: 0–5%).
IgE Levels: 340 IU/mL (elevated; normal range: 0–100 IU/mL).

Allergy Testing:
Positive for dust mites and pollen allergens.",
	113:"Complete Blood Count (CBC):
WBC: 12,500/μL (elevated; normal range: 4,500–11,000/μL).
Neutrophils: 72% (elevated; normal range: 40–60%).
Hemoglobin: 13.5 g/dL (normal range: 13.0–17.0 g/dL).
C-Reactive Protein (CRP): 35 mg/L (elevated; normal <5 mg/L).

Arterial Blood Gas (ABG):
pH: 7.33 (acidotic; normal range: 7.35–7.45).
PaO2: 62 mmHg (low; normal range: 75–100 mmHg).
PaCO2: 50 mmHg (high; normal range: 35–45 mmHg).",
	114:"Complete Blood Count (CBC):

Hemoglobin: 10.5 g/dL (low; normal range for age: 11.5–15.5 g/dL).
Mean Corpuscular Volume (MCV): 75 fL (low; normal: 78–95 fL).
Red Blood Cell Count (RBC): 5.2 million/μL (normal range).
Serum Ferritin: 8 ng/mL (low; normal range: 12–150 ng/mL).

Vitamin D Level: 18 ng/mL (insufficient; normal: ≥20 ng/mL).",
	115:"Complete Blood Count (CBC):
Hemoglobin: 12.0 g/dL (low-normal range).
Eosinophils: 10% (elevated; normal: <5%).

Stool Examination:
Presence of helminth ova (Ascaris lumbricoides detected).
Serum Vitamin D: 18 ng/mL (insufficient; normal: ≥20 ng/mL).",
	116:"Thyroid Function Tests:
TSH: <0.01 mIU/L (low; normal: 0.4–4.0 mIU/L).
Free T3: 6.5 pmol/L (elevated; normal: 3.1–6.8 pmol/L).
Free T4: 26 pmol/L (elevated; normal: 10–22 pmol/L).

Complete Blood Count (CBC):
Hemoglobin: 13.5 g/dL (normal).
WBC: 8.2 x 10⁹/L (normal).

Endoscopy Results:
Mild inflammation of the esophageal mucosa consistent with GERD.",
	117:"Lab Values
HbA1c: 8.4% (elevated; target <7.0%).
Fasting Blood Glucose: 160 mg/dL (elevated; target 80–130 mg/dL).
LDL-C: 165 mg/dL (elevated; target <70 mg/dL).
Hemoglobin: 10.2 g/dL (low; normal: 13.8–17.2 g/dL for males).
Serum Ferritin: 8 ng/mL (low; normal: 30–300 ng/mL).
Creatinine: 1.1 mg/dL (normal).",
	118:"Urinalysis:
Nitrites: Positive.
Leukocytes: 3+.
RBCs: 10-15/HPF (hematuria).
Bacteria: Present.

Urine Culture:
Growth of Escherichia coli (>100,000 CFU/mL).
Sensitive to Cefixime.

Blood Tests:
WBC count: 14,000/μL (elevated).
CRP: 25 mg/L (elevated).
Renal Function Tests:
Creatinine: 0.9 mg/dL (normal).
Urea: 20 mg/dL (normal).",
	119:"Blood Tests:
ESR: 45 mm/hr (elevated).
CRP: 30 mg/L (elevated).
CBC:
WBC: 8,000/μL (normal).
Hemoglobin: 12.5 g/dL (mild anemia).

Liver Function Tests:
ALT: 25 U/L (normal).
AST: 30 U/L (normal).

Renal Function Tests:
Creatinine: 0.85 mg/dL (normal).
Urea: 18 mg/dL (normal).

X-Ray/MRI Findings:
Knee X-Ray: Osteoarthritis with joint space narrowing and osteophyte formation.
Lumbar MRI: L4-L5 disc herniation with nerve root compression on the left side.",
	120:"CBC (Complete Blood Count):
Hemoglobin: 9.5 g/dL (low).
MCV: 70 fL (microcytic).
MCH: 22 pg (low).
WBC: 6,500/μL (normal).
Platelets: 350,000/μL (normal).

Iron Studies:
Serum Ferritin: 10 ng/mL (low).
Serum Iron: 30 μg/dL (low).
Total Iron-Binding Capacity (TIBC): 450 μg/dL (elevated).

Liver and Renal Function Tests:
ALT: 20 U/L (normal).
AST: 18 U/L (normal).
Creatinine: 0.9 mg/dL (normal).
Stool Occult Blood Test: Negative.",
	121:"Complete Blood Count (CBC):
WBC: 13,500/μL (elevated, indicating infection).
Hemoglobin: 13.0 g/dL (normal).
Platelets: 250,000/μL (normal).

Inflammatory Markers:
CRP: 48 mg/L (elevated, indicating inflammation).
ESR: 40 mm/hr (elevated).

Blood Glucose Levels:
Fasting Blood Glucose: 170 mg/dL (high).
HbA1c: 7.8% (elevated).

Renal Function Tests:
Serum Creatinine: 1.0 mg/dL (normal).
BUN: 15 mg/dL (normal).

Culture and Sensitivity:
Pending results from skin swab.",
	122:"Complete Blood Count (CBC):
WBC: 14,000/μL (elevated, indicative of infection).
Neutrophils: 75% (elevated, bacterial infection suggested).
Lymphocytes: 20%.
Platelets: 220,000/μL (normal).

C-Reactive Protein (CRP):
30 mg/L (elevated, indicative of inflammation).

Rapid Antigen Detection Test (RADT):
Positive for Streptococcus pyogenes.

Throat Swab Culture:
Awaiting results (pending).",
	123:"Liver Function Tests (LFTs):
AST: 45 U/L (elevated)
ALT: 52 U/L (elevated)
ALP: 120 U/L (normal)
Bilirubin: Total 0.8 mg/dL (normal)
Albumin: 4.0 g/dL (normal)

Hepatitis C Viral Load:
Detected (not quantified).

Complete Blood Count (CBC):
WBC: 7,200/μL (normal)
Hemoglobin: 13.5 g/dL (normal)
Platelets: 180,000/μL (normal)

Metabolic Panel:
Glucose: 95 mg/dL (normal)
Cholesterol: Total 210 mg/dL (elevated)
Triglycerides: 180 mg/dL (elevated)

Ultrasound of the Abdomen:
Mild hepatomegaly, fatty infiltrate in the liver noted.",
	124:"Complete Blood Count (CBC):
WBC: 7,500/μL (normal)
Hemoglobin: 14.2 g/dL (normal)
Platelets: 250,000/μL (normal)

Comprehensive Metabolic Panel:
Sodium: 140 mEq/L (normal)
Potassium: 4.2 mEq/L (normal)
Creatinine: 0.9 mg/dL (normal)
AST: 22 U/L (normal)
ALT: 20 U/L (normal)

Liver Function Tests (LFTs):
Normal, indicating no hepatic dysfunction.

Vitamin B12 Level:
350 pg/mL (within normal range)

X-ray of the Lumbar Spine:
Mild degenerative changes with osteophyte formation at L3-L4 and L4-L5 levels.",
	125:"Complete Blood Count (CBC):
WBC: 6,800/μL (normal)
Hemoglobin: 13.5 g/dL (normal)
Platelets: 230,000/μL (normal)

Comprehensive Metabolic Panel:
Sodium: 138 mEq/L (normal)
Potassium: 4.1 mEq/L (normal)
Creatinine: 0.8 mg/dL (normal)
Glucose: 90 mg/dL (normal)
Liver function tests: Normal.

Head CT Scan (if indicated):
Normal, ruling out any structural causes for the headache (e.g., hemorrhage, tumor).",
	126:"Complete Blood Count (CBC):
WBC: 7,200/μL (normal)
Hemoglobin: 14.0 g/dL (normal)
Platelets: 250,000/μL (normal)

Comprehensive Metabolic Panel:
Sodium: 140 mEq/L (normal)
Potassium: 4.2 mEq/L (normal)
Creatinine: 0.9 mg/dL (normal)
Liver function tests: Normal.

X-ray of the Knee:
Evidence of osteoarthritis with joint space narrowing and osteophyte formation.",
	127:"Physical Examination Findings:
Erythematous patches with scaling on the left forearm.
Mild excoriation noted.
No systemic signs of infection (e.g., fever).

Skin Swab for Culture (if indicated):
No growth after 48 hours, suggesting that the primary issue is dermatitis rather than a severe bacterial infection.",
	128:"Neurological Examination:
Alert and oriented, but appears uncomfortable due to pain.
No focal neurological deficits noted.

Other Laboratory Tests (if indicated):
CBC and metabolic panel: within normal limits, ruling out systemic causes for headache.
CT scan of the head: no acute intracranial abnormalities noted.",
	129:"Blood Tests:
CBC: Within normal limits (WBC 6.2 x 10^3/uL, Hemoglobin 13.5 g/dL, Platelets 250 x 10^3/uL)
Liver function tests: AST 22 U/L, ALT 20 U/L, ALP 100 U/L, Bilirubin total 0.8 mg/dL (all within normal limits)
Renal function tests: Creatinine 0.8 mg/dL, BUN 12 mg/dL (normal)
Hormonal panel: Estradiol <20 pg/mL (consistent with menopause)

Imaging:
Recent mammogram: No signs of recurrence or new masses.
Bone density scan: Mild osteopenia (T-score -1.5), not requiring treatment at this time.",
	130:"Blood Tests:
CBC: Within normal limits (WBC 6.5 x 10^3/uL, Hemoglobin 14.0 g/dL, Platelets 230 x 10^3/uL)
Serum calcium: 9.2 mg/dL (normal)
Vitamin D: 25-hydroxyvitamin D level: 28 ng/mL (insufficient)
Phosphorus: 3.5 mg/dL (normal)
Alkaline phosphatase: 90 U/L (normal)

Imaging:
X-ray of knees: Mild joint space narrowing and osteophyte formation consistent with osteoarthritis.
Bone density scan (DEXA): T-score -1.8 (indicating osteopenia).",
	131:"Complete Blood Count (CBC):
WBC: 7.2 x 10^3/uL (normal)
Hemoglobin: 13.5 g/dL (normal)
Platelets: 250 x 10^3/uL (normal)

Serologic Tests:
HSV-1 IgM: Negative
HSV-1 IgG: Positive (consistent with prior exposure).",
	132:"Complete Blood Count (CBC):
WBC: 6.5 x 10^3/uL (normal)
Hemoglobin: 14.2 g/dL (normal)
Platelets: 240 x 10^3/uL (normal)

Liver Function Tests (LFTs):
ALT: 32 U/L (normal)
AST: 29 U/L (normal)

H. pylori Test:
Urea breath test: Negative

Renal Function Tests:
Creatinine: 1.0 mg/dL (normal)
BUN: 15 mg/dL (normal)",
	133:"Complete Blood Count (CBC):
WBC: 14.0 x 10^3/uL (elevated, indicating infection)
Hemoglobin: 12.5 g/dL (normal)
Platelets: 280 x 10^3/uL (normal)

C-Reactive Protein (CRP):
Elevated at 15 mg/L (normal <10 mg/L)

Arterial Blood Gas (ABG):
Mild hypoxemia with a PaO2 of 70 mmHg

Liver Function Tests (LFTs):
ALT: 30 U/L (normal)
AST: 28 U/L (normal)

Renal Function Tests:
Creatinine: 0.9 mg/dL (normal)",
	134:"No lab tests ordered for this case, as the diagnosis is clinical and based on visual examination and patient history.",
	135:"No recent lab tests ordered for this visit, but the patient has a history of mild anemia (Hb: 11.8 g/dL) and normal renal and liver function tests from prior investigations.",
	136:"Fasting Blood Glucose: 220 mg/dL (normal: <100 mg/dL).
Postprandial Blood Glucose: 320 mg/dL (normal: <140 mg/dL).
HbA1c: 9.4% (target: <7%).
Serum Creatinine: 0.8 mg/dL (normal: 0.7–1.3 mg/dL).
Lipid Profile:
Total Cholesterol: 210 mg/dL (normal: <200 mg/dL).
LDL: 140 mg/dL (normal: <100 mg/dL).
HDL: 40 mg/dL (normal: >50 mg/dL).
Triglycerides: 180 mg/dL (normal: <150 mg/dL).",
	137:"Day 3 Hormonal Profile:
Follicle Stimulating Hormone (FSH): 9.5 mIU/mL (normal: <10 mIU/mL).
Luteinizing Hormone (LH): 7.2 mIU/mL (normal: <12 mIU/mL).
Estradiol (E2): 45 pg/mL (normal: 20–80 pg/mL).
Anti-Müllerian Hormone (AMH): 2.1 ng/mL (normal: 1.5–4 ng/mL).
Prolactin: 18 ng/mL (normal: <25 ng/mL).
Thyroid-Stimulating Hormone (TSH): 2.8 µIU/mL (normal: 0.5–4.5 µIU/mL).

Semen Analysis (Partner): Normal count, motility, and morphology.",
	138:"Complete Blood Count (CBC):
White Blood Cell (WBC): 14,000/µL (elevated, indicating infection).
Neutrophils: 72% (elevated, suggestive of bacterial infection).
Lymphocytes: 22%.
Hemoglobin: 12 g/dL.
Platelets: 250,000/µL.
C-Reactive Protein (CRP): 45 mg/L (elevated, consistent with bacterial infection).

Throat Culture: Positive for Group A Streptococcus.",
	139:"Schirmer Test:
Left Eye: 5 mm (reduced tear production).
Right Eye: 6 mm (reduced tear production).
Tear Break-Up Time (TBUT): 6 seconds (shortened, indicating tear film instability).

Ocular Surface Staining: Positive with fluorescein dye, showing punctate epithelial erosions.",
	140:"Complete Blood Count (CBC):
Hemoglobin: 13.1 g/dL
WBC: 6,500/μL
Platelets: 220,000/μL

Renal Function:
Serum Creatinine: 1.3 mg/dL
eGFR: 50 mL/min/1.73m² (mild renal impairment).

Liver Function:
ALT: 25 U/L
AST: 23 U/L
INR (on Warfarin): 2.5 (therapeutic range).

Electrolytes:
Sodium: 135 mEq/L (low normal).
Potassium: 3.9 mEq/L (normal).

Echocardiogram:
Left ventricular ejection fraction (LVEF): 35%.
Moderate mitral regurgitation.

ECG:
Irregularly irregular rhythm, no ST-T changes suggestive of ischemia.",
	141:"Complete Blood Count (CBC):
Hemoglobin: 13.5 g/dL
WBC: 7,000/μL
Platelets: 250,000/μL

Electrolytes:
Sodium: 138 mEq/L
Potassium: 4.2 mEq/L
Chloride: 102 mEq/L
Bicarbonate: 25 mEq/L

Liver Function Tests:
ALT: 22 U/L
AST: 20 U/L

Thyroid Function Tests:
TSH: 1.5 μIU/mL (normal).

Stool Test:
No occult blood.
Stool consistency: hard.",
	142:"Complete Blood Count (CBC):
Hemoglobin: 14 g/dL
WBC: 9,500/μL (slightly elevated)
Platelets: 230,000/μL

Electrolytes:
Sodium: 140 mEq/L
Potassium: 4.0 mEq/L
Chloride: 100 mEq/L
Bicarbonate: 24 mEq/L

Arterial Blood Gas (ABG):
pH: 7.38
pCO2: 45 mmHg
pO2: 60 mmHg (indicating mild hypoxemia)

Chest X-ray:
Mild bronchial wall thickening, no infiltrates.",
	143:"Complete Blood Count (CBC):
Hemoglobin: 13.5 g/dL
WBC: 7,200/μL
Platelets: 250,000/μL

Electrolytes:
Sodium: 138 mEq/L
Potassium: 4.2 mEq/L
Chloride: 100 mEq/L
Bicarbonate: 24 mEq/L

Liver Function Tests:
AST: 22 U/L
ALT: 20 U/L
ALP: 70 U/L

X-ray of the lumbar spine:
No significant bony abnormalities. Mild degenerative changes observed.",
	144:"Complete Blood Count (CBC):
Hemoglobin: 14.5 g/dL
WBC: 11,000/μL (slightly elevated)
Platelets: 220,000/μL

Rapid Antigen Test for Group A Streptococcus:
Positive

Electrolytes:
Sodium: 139 mEq/L
Potassium: 4.0 mEq/L
Chloride: 101 mEq/L
Bicarbonate: 24 mEq/L",
	145:"",
	146:"",
	147:"",
	148:"",
	149:"",
	150:"",
	151:"",
	152:"",
	153:"",
	154:"",
	155:"",
	156:"",
	157:"",
	158:"",
	159:"",
	160:"",
	161:"",
	162:"",
	163:"",
	164:"",
	165:"",
	166:"",
	167:"",
	168:"",
	169:"",
	170:"",
	171:"",
	172:"",
	173:"",
	174:"",
	175:"",
	176:"",
	177:"",
	178:"",
	179:"",
	180:"",
	181:"",
	182:"",
	183:"",
	184:"",
	185:"",
	186:"",
	187:"",
	188:"",
	189:"",
	190:"",
	191:"",
	192:"",
	193:"",
	194:"",
	195:"",
	196:"",
	197:"",
	198:"",
	199:"",
	200:"",
	201:"",
	202:"",
	203:"",
	204:"",
	205:"",
	206:"",
	207:"",
	208:"",
	209:"",
	210:"",
	211:"",
	212:"",
	213:"",
	214:"",
	215:"",
	216:"",
	217:"",
	218:"",
	219:"",
	220:"",
	221:"",
	222:"",
	223:"",
	224:"",
	225:"",
	226:"",
	227:"",
	228:"",
	229:"",
	230:"",
	231:"",
	232:"",
	233:"",
	234:"",
	235:"",
	236:"",
	237:"",
	238:"",
	239:"",
	240:"",
	241:"",
	242:"",
	243:"",
	244:"",
	245:"",
	246:"",
	247:"",
	248:"",
	249:"",
	250:"",
}

var interaction_dic :Dictionary = {
	1:"Aspirin (Aspocid) + Atorvastatin (Ator):
Risk: Increased risk of gastrointestinal bleeding.
Recommendation: Consider adding a proton pump inhibitor (PPI) for gastric protection, particularly in patients with a history of GI disorders.

Aspirin (Aspocid) + Cerebrolysin:
Risk: Minimal; no clinically significant interaction reported.
Recommendation: Monitor for bleeding in high doses or prolonged use.

Aspirin (Aspocid) + Neuroton (B Complex Vitamins):
Risk: Aspirin can reduce folic acid absorption, which might slightly affect vitamin B levels.
Recommendation: Ensure adequate vitamin supplementation if aspirin is used long-term.

Atorvastatin (Ator) + Memantine (Memexa):
Risk: No significant interaction reported.

Atorvastatin (Ator) + Neuroton (B Complex Vitamins):
Risk: No significant interaction.

Cerebrolysin + Citicoline (Fortamind):
Risk: Potential additive neuroprotective effects, but no known adverse interaction.
Recommendation: Safe for combined use in neurological conditions.

Memantine (Memexa) + Citicoline (Fortamind):
Risk: Minimal; no known interaction.

Memantine (Memexa) + Neuroton (B Complex Vitamins):
Risk: No clinically significant interaction.
Cerebrolysin + Neuroton:

Risk: No significant interaction.",
	2:"Alphintern (Chymotrypsin + Trypsin) + Hibiotic (Amoxicillin + Clavulanic Acid):
Risk: No significant interaction reported.

Alphintern (Chymotrypsin + Trypsin) + Flagyl (Metronidazole):
Risk: No significant interaction reported.

Hibiotic (Amoxicillin + Clavulanic Acid) + Flagyl (Metronidazole):
Risk: Increased risk of gastrointestinal upset (nausea, diarrhea).
Recommendation: Administer with food to minimize GI discomfort.",
	3:"Thioctic Acid (Thiotacid) + Duloxetine (Karbalta):
Risk: No significant interaction reported.

Duloxetine (Karbalta) + Neurobion (B Complex Vitamins):
Risk: No significant interaction reported.

Duloxetine (Karbalta) + Alfacalcidol (Calcidol) or Cholecalciferol (Devarol):
Risk: No significant interaction reported.

Omeprazole (Omez) + Duloxetine (Karbalta):
Risk: Omeprazole may slightly reduce the absorption of duloxetine, potentially lowering its efficacy.
Recommendation: Monitor the patient's response to duloxetine and adjust the dose if necessary.

Alfacalcidol (Calcidol) + Cholecalciferol (Devarol):
Risk: Increased risk of hypercalcemia if used together in high doses.
Recommendation: Monitor serum calcium levels to prevent hypercalcemia.

Thioctic Acid (Thiotacid) + Omeprazole (Omez):
Risk: No significant interaction reported.

Omeprazole (Omez) + Neurobion (B Complex Vitamins):
Risk: Long-term use of Omeprazole may reduce vitamin B12 absorption.
Recommendation: Monitor vitamin B12 levels during prolonged therapy.
",
	4:"Nexium (Esomeprazole) + Rabeprazole:
Risk: Both are proton pump inhibitors (PPIs), and concurrent use is redundant. This combination increases the risk of side effects such as hypomagnesemia, bone fractures, and gastrointestinal infections.
Recommendation: Use only one PPI to avoid unnecessary duplication of therapy.

Nexium (Esomeprazole) or Rabeprazole + Mucosta (Rebamipide):
Risk: No significant interaction reported. Both can provide complementary gastric protection.

Nexium (Esomeprazole) or Rabeprazole + Ganaton (Itopride):
Risk: No significant interaction reported. PPIs and prokinetic agents like Itopride can work synergistically to manage GERD and functional dyspepsia.

Nexium (Esomeprazole) or Rabeprazole + Colovatil (Mebeverine + Sulpiride):
Risk: PPIs may alter gastric pH, potentially affecting sulpiride absorption. This could result in reduced efficacy of Colovatil.
Recommendation: Monitor for clinical response and adjust therapy if needed.

Nexium (Esomeprazole) or Rabeprazole + Cholorose (Rosuvastatin):
Risk: PPIs may increase the serum concentration of rosuvastatin, raising the risk of side effects like myopathy or rhabdomyolysis.
Recommendation: Monitor for muscle-related side effects and consider dose adjustments if necessary.

Mucosta (Rebamipide) + Ganaton (Itopride):
Risk: No significant interaction reported. These drugs can be co-administered safely for upper GI symptom relief.

Mucosta (Rebamipide) + Colovatil (Mebeverine + Sulpiride):
Risk: No significant interaction reported.

Ganaton (Itopride) + Colovatil (Mebeverine + Sulpiride):
Risk: Potential additive central nervous system (CNS) effects such as drowsiness or dizziness due to sulpiride.
Recommendation: Monitor for CNS side effects, especially in elderly patients or those with a history of CNS disorders.

Ganaton (Itopride) + Cholorose (Rosuvastatin):
Risk: No significant interaction reported.

Colovatil (Mebeverine + Sulpiride) + Cholorose (Rosuvastatin):
Risk: No significant interaction reported.",
	5:"Systane (Polyethylene + Propylene Glycol) + Bromoflam (Bromfenac):
Risk: No significant interaction reported. Systane is a lubricant eye drop and is compatible with Bromfenac, which is a nonsteroidal anti-inflammatory drug (NSAID) used in ophthalmic applications.

Systane (Polyethylene + Propylene Glycol) + Cosopt (Dorzolamide + Timolol):
Risk: No significant interaction reported. Both can be used together, with Systane providing moisture and Cosopt managing intraocular pressure.

Bromoflam (Bromfenac) + Cosopt (Dorzolamide + Timolol):
Risk: Caution is advised when combining NSAIDs with beta-blockers like Timolol, as NSAIDs may theoretically reduce the antihypertensive effect of beta-blockers, although this is less likely with topical use.
Recommendation: Monitor intraocular pressure to ensure the effectiveness of Cosopt is maintained.

Systane (Polyethylene + Propylene Glycol) + Other Unknown Drugs:
Risk: Generally minimal interaction with lubricant drops unless other eye drops are being used simultaneously, which might require spacing between administrations to prevent dilution.

Bromoflam (Bromfenac) + Other Unknown Drugs:
Risk: Bromfenac may increase the risk of bleeding if combined with systemic anticoagulants or antiplatelet medications. Care is required if the patient is using such drugs systemically.

Cosopt (Dorzolamide + Timolol) + Other Unknown Drugs:
Risk: Caution with systemic beta-blockers or drugs affecting electrolyte balance, as Dorzolamide may alter systemic electrolytes, leading to potential additive effects.
Recommendation: Regularly monitor electrolyte levels if systemic drugs with similar effects are prescribed.",
	6:"Examide (Torasemide) + Marevan (Warfarin):
Risk: Increased risk of bleeding due to enhanced anticoagulant effect via diuretic-induced hypokalemia.
Recommendation: Monitor INR and potassium levels.

Plavix (Clopidogrel) + Marevan:
Risk: High bleeding risk.
Recommendation: Avoid concurrent use unless absolutely necessary, and monitor closely for bleeding.

Entresto (Sacubitril + Valsartan) + Procoralan (Ivabradine):
Risk: Additive bradycardia.
Recommendation: Monitor heart rate closely.

Atoreza (Ezetimibe + Rosuvastatin) + Marevan:
Risk: Minimal; monitor for liver function and bleeding risk due to statin usage.",
	7:"Emoxclav (Amoxicillin + Clavulanic Acid) + Fenistil (Dimethindene):
Risk: No significant interaction.

Emoxclav + Dexatobrin (Dexamethasone + Tobramycin):
Risk: Increased risk of fungal infections due to combined antibiotic and steroid use.
Recommendation: Monitor for signs of secondary infections.",
	8:"Methoquick (Methocarbamol + Diclofenac) + Divido (Diclofenac Sodium):
Risk: Both drugs contain Diclofenac, leading to a risk of NSAID overdose. This increases the likelihood of gastrointestinal (GI) bleeding, kidney damage, and cardiovascular events.
Recommendation: Avoid duplication; use only one Diclofenac-containing product.

Methoquick (Methocarbamol + Diclofenac) + Genuphil (Glucosamine + Chondroitin):
Risk: No significant interaction reported. Methocarbamol provides muscle relaxation, while Genuphil supports joint health.

Divido (Diclofenac Sodium) + Genuphil (Glucosamine + Chondroitin):
Risk: No significant interaction reported. The combination may be beneficial in reducing joint inflammation and supporting cartilage repair.

General Considerations:
Combining multiple NSAIDs (like Methoquick and Divido) increases the risk of serious side effects, especially GI and renal issues.
Glucosamine and chondroitin in Genuphil are generally well-tolerated and do not interact significantly with NSAIDs or muscle relaxants.",
	9:"Bepra (Esomeprazole) + Coloverin (Mebeverine + Sulpiride):
Risk: No significant direct interactions reported. However, Esomeprazole (a proton pump inhibitor) may increase the gastric pH, which can affect the absorption of some drugs. Mebeverine and Sulpiride do not have significant interactions with Esomeprazole.
Recommendation: No special precautions are needed, but monitor for any changes in drug absorption, especially if other medications are involved.

Bepra (Esomeprazole) + Tinifloxacin (Tindamycine):
Risk: Esomeprazole may decrease the absorption of certain antibiotics, especially fluoroquinolones, but Tinifloxacin (a type of fluoroquinolone) doesn't have a significant interaction with Esomeprazole.
Recommendation: No major interactions; however, separate the dosing of Esomeprazole and Tinifloxacin by at least 2 hours to avoid potential interference with antibiotic absorption.

Coloverin (Mebeverine + Sulpiride) + Tinifloxacin (Tindamycine):
Risk: No major interaction between Mebeverine + Sulpiride and Tinifloxacin. Sulpiride (an antipsychotic) and Tinifloxacin (an antibiotic) are not known to interact, but caution is always advised when combining medications.
Recommendation: Monitor the patient for any central nervous system (CNS) side effects due to Sulpiride, especially if Tinifloxacin leads to side effects like dizziness or confusion.

Bepra (Esomeprazole) + Coloverin (Mebeverine + Sulpiride) + Tinifloxacin (Tindamycine):
Risk: As discussed, no significant interactions between these three drugs. The combination is generally considered safe.
Recommendation: Regular monitoring of patient symptoms to ensure the effectiveness of the drugs without adverse effects.",
	10:"Thiotic Acid (Thioctic Acid) + Gaptin (Gabapentin):
Risk: No significant direct interaction is reported between Thioctic Acid and Gabapentin. Both are used for nerve-related conditions, with Thioctic Acid acting as an antioxidant and Gabapentin as an anticonvulsant and neuropathic pain treatment.
Recommendation: No major concerns; however, Gabapentin can cause dizziness and drowsiness, so caution is advised when starting both together, especially in older patients.

Thiotic Acid (Thioctic Acid) + Neurovit (B Complex Vitamins):
Risk: No significant interactions. Thioctic Acid and B Complex Vitamins are commonly used together for the treatment of neuropathy and overall nerve health.
Recommendation: Generally safe to combine. Ensure the B vitamins are taken as directed for optimal nerve function and health.

Thiotic Acid (Thioctic Acid) + Plavix (Clopidogrel):
Risk: Thioctic Acid has some mild anticoagulant properties, though this is not usually a major concern. Clopidogrel is a strong antiplatelet, and while there's no major interaction, caution is recommended to avoid potential bleeding risks.
Recommendation: Monitor for signs of bleeding (e.g., bruising, unusual bleeding, or prolonged bleeding time), especially if the patient is at high risk.

Thiotic Acid (Thioctic Acid) + Tegretol (Carbamazepine):
Risk: Thioctic Acid may interfere with the metabolism of Carbamazepine, as both drugs can affect liver enzymes. This could potentially lower the effectiveness of Carbamazepine.
Recommendation: If both drugs are prescribed together, monitor the patient's symptoms carefully and consider dose adjustments for Carbamazepine if needed.

Gaptin (Gabapentin) + Neurovit (B Complex Vitamins):
Risk: No significant interaction. Gabapentin and B Complex Vitamins are often prescribed together for neuropathic pain and nerve health, and there are no major contraindications or interactions.
Recommendation: Safe to use together; just monitor for any unusual side effects such as dizziness or gastrointestinal upset.

Gaptin (Gabapentin) + Plavix (Clopidogrel):
Risk: No significant interaction. Gabapentin and Clopidogrel are used for different purposes (neuropathic pain vs. cardiovascular protection), and there are no direct interactions.
Recommendation: No adjustments needed, but always monitor the patient for general well-being.

Gaptin (Gabapentin) + Tegretol (Carbamazepine):
Risk: Carbamazepine can lower the blood levels of Gabapentin, reducing its efficacy. Additionally, Gabapentin may increase the risk of central nervous system (CNS) depression when combined with Carbamazepine.
Recommendation: If both drugs are needed, consider adjusting the dosage of Gabapentin and monitor the patient for signs of CNS depression (drowsiness, dizziness, confusion).

Neurovit (B Complex Vitamins) + Plavix (Clopidogrel):
Risk: No significant interaction. B Complex Vitamins are used for nerve health and do not interfere with the effects of Clopidogrel.
Recommendation: Safe to use together with no concerns.

Neurovit (B Complex Vitamins) + Tegretol (Carbamazepine):
Risk: Carbamazepine can reduce the absorption of B Vitamins, potentially leading to deficiencies if used long-term.
Recommendation: Supplementation with B Complex Vitamins is advised during Carbamazepine therapy, particularly for long-term use.

Plavix (Clopidogrel) + Tegretol (Carbamazepine):
Risk: Carbamazepine may reduce the effectiveness of Clopidogrel by inducing the cytochrome P450 enzymes, which can accelerate the metabolism of Clopidogrel. This may reduce the antiplatelet effect of Clopidogrel.
Recommendation: Monitor for signs of inadequate antiplatelet effects (e.g., signs of clot formation) if both drugs are used together. Adjust treatment or consider alternative therapies if necessary.",
	11:"Rowachol (Essential Oils) + Gasmovac (Simethicone):
Risk: No significant interaction; both address gastrointestinal discomfort.

Newtone (Multivitamin + Minerals) + Livabion (Vitamin B Complex):
Risk: Redundant vitamin supplementation.
Recommendation: Avoid excessive dosing to prevent hypervitaminosis.

Rowachol + Livabion:
Risk: No significant interaction.",
	12:"Motilium (Domperidone) + Zurcal (Pantoprazole):
Risk: No significant interaction; commonly prescribed together for gastrointestinal disorders.

Zurcal + Neuroton (B Complex Vitamins):
Risk: No significant interaction.

Motilium + Neuroton:
Risk: No significant interaction.",
	13:"Ketolgin (Ketoprofen) + Colchicine:
Risk: Increased risk of gastrointestinal irritation and bleeding.
Recommendation: Use PPI for protection and monitor for GI symptoms.

Ketolgin + Immunomash (Immune Boosters):
Risk: Minimal; no significant interaction.

Colchicine + Immunomash:
Risk: Potential pharmacodynamic interaction; monitor for unusual immune responses.",
	14:"Triamerican (Ceftriaxone) + Iverzine (Ivermectin):
Risk: Additive hypotension.
Recommendation: Monitor blood pressure, especially when initiating therapy.

Triamerican + Prontoplus (Paracetamol + Caffeine):
Risk: Minimal; both are safe when used within recommended doses.

Prontoplus + Infectomycin (Azithromycin):
Risk: Potential increased risk of hepatotoxicity.
Recommendation: Monitor liver function during prolonged use.

Infectomycin + Iverzine:
Risk: No significant interaction.",
	15:"Acetylcysteine + Disprelone (Prednisolone):
Risk: Increased risk of gastrointestinal irritation.
Recommendation: Use with PPI like Pepzol for protection.

Disprelone + Andorivaban (Rivaroxaban):
Risk: Increased risk of bleeding.
Recommendation: Monitor for signs of bleeding; adjust steroid dose if needed.

Pepzol (Omeprazole) + Andorivaban:
Risk: May slightly reduce Andorivaban efficacy due to altered absorption.
Recommendation: Monitor INR or coagulation parameters as needed.

Acetylcysteine + Pepzol:
Risk: No significant interaction.",
	16:"Foradil (Formoterol) + Mucophylline (Acefylline piperazine + Bromhexine):
Risk: Additive stimulant effects on the cardiovascular system (tachycardia, palpitations).
Recommendation: Monitor for signs of overstimulation or arrhythmias.

Miflonide (Budesonide) + Formoterol:
Risk: Combination is common in asthma/COPD but may increase the risk of oral thrush.
Recommendation: Ensure proper inhaler technique and consider using a spacer.

Asmakast (Montelukast) + Formoterol:
Risk: Minimal; both are used for asthma management.

Inhalex (Acetylcysteine) + Formoterol:
Risk: No significant interaction; both drugs complement each other by addressing mucus clearance and bronchial relaxation.",
	17:"Gralipentin (Gabapentin) + Caredalud (Tizanidine):
Risk: Additive central nervous system (CNS) depression (drowsiness, dizziness).
Recommendation: Avoid activities requiring alertness; monitor closely.

Gralipentin + Roxogesic (Loxoprofen):
Risk: Increased risk of gastrointestinal side effects due to NSAID and gabapentin-induced dyspepsia.
Recommendation: Use gastroprotective agents like proton pump inhibitors (PPI).

Zurcal (Pantoprazole) + Roxogesic:
Risk: Reduces NSAID-related gastric irritation; beneficial interaction.

Caredalud + Zurcal:
Risk: No significant interaction.",
	18:"Ketolac (Ketorolac) + Celeborg (Celecoxib):
Risk: Additive risk of gastrointestinal bleeding and renal impairment.
Recommendation: Avoid concurrent use or use with PPI protection.

Tavoniflox (Levofloxacin) + Ketolac:
Risk: Increased risk of CNS side effects, including seizures, especially in susceptible patients.
Recommendation: Use with caution in patients with seizure disorders.

Adol (Paracetamol) + Celeborg:
Risk: Safe combination; reduces inflammation and provides pain relief.

Tavoniflox + Adol:
Risk: No significant interaction.",
	19:"Lucidril (Meclofenoxate) + Trental (Pentoxifylline):
Risk: Minimal interaction; both improve cerebrovascular circulation.

Trental + Moxen (Moxonidine):
Risk: Possible additive hypotensive effects.
Recommendation: Monitor blood pressure to avoid excessive lowering.

Moxen + Lucidril:
Risk: No significant interaction.",
	20:"Cymbalta (Duloxetine) + Recoxibright (Etoricoxib):
Risk: Increased risk of gastrointestinal bleeding, especially in older patients.
Recommendation: Consider adding a PPI and monitor for bleeding symptoms.

Cymbalta + Deltavit (Vitamin D3):
Risk: No significant interaction.

Recoxibright + Deltavit:
Risk: No significant interaction.",
	21:"SpasmoFEN (Hyoscine + Ketoprofen) + Antodine (Ranitidine):
Risk: No significant direct interactions. Both drugs work through different mechanisms to alleviate gastrointestinal discomfort. Dicyclomine works as an antispasmodic, while Ranitidine blocks acid production.
Recommendation: Safe to use together. However, dicyclomine can cause dryness of the mouth and constipation, and ranitidine can reduce stomach acid. Monitor for any gastrointestinal changes.

SpasmoFEN (Hyoscine + Ketoprofen) + Gastrazole (Omeprazole):
Risk: No significant interaction. Omeprazole reduces acid production in the stomach, while Dicyclomine reduces gut spasms.
Recommendation: Safe to use together. Monitor for any excess dryness in the mouth or constipation due to dicyclomine. There is also a theoretical risk that Omeprazole may slightly decrease the absorption of some nutrients, such as vitamin B12.

SpasmoFEN (Hyoscine + Ketoprofen) + Duspatalin (Mebeverine):
Risk: Both drugs are antispasmodic agents, and while no significant interaction is reported, using them together may increase the risk of excessive relaxation of the gastrointestinal tract.
Recommendation: Caution is advised when combining two antispasmodics. Start with the lowest effective dose and monitor for symptoms of excessive bowel relaxation or constipation.

Antodine (Ranitidine) + Gastrazole (Omeprazole):
Risk: Ranitidine and Omeprazole both lower stomach acid but work through different mechanisms. Omeprazole is a stronger acid-suppressant, and combining the two may lead to unnecessary acid suppression, increasing the risk of nutrient deficiencies (e.g., vitamin B12, calcium) or gastrointestinal infections.
Recommendation: Combining Ranitidine and Omeprazole should be avoided if not necessary. Consider using only one acid-suppressing agent to minimize risks of over-suppression of stomach acid.

Antodine (Ranitidine) + Duspatalin (Mebeverine):
Risk: No significant interaction. Ranitidine and Mebeverine can be used together to address different aspects of gastrointestinal discomfort (acid suppression and spasm relief).
Recommendation: Safe to use together. However, monitor for possible constipation, as Ranitidine can cause mild constipation in some patients, and Mebeverine can also contribute to this effect.

Gastrazole (Omeprazole) + Duspatalin (Mebeverine):
Risk: No significant interaction. Both drugs have complementary roles in managing gastrointestinal symptoms—Omeprazole reduces acid reflux and Mebeverine alleviates spasms.
Recommendation: Safe to use together. Regular monitoring for gastrointestinal side effects (e.g., diarrhea or constipation) is recommended.",
	22:"LELIPEL (Montelukast) + FERNILAR (Desloratadine):
Risk: Both Montelukast and Desloratadine have minimal sedative effects, and there are no significant pharmacodynamic interactions between these two drugs.
Recommendation: Safe to use together for managing asthma and allergic rhinitis symptoms. Both drugs work via different mechanisms (Montelukast for leukotrienes, Desloratadine for histamine), offering complementary effects.

LELIPEL (Montelukast) + NOTUSSIL (Cloperastine):
Risk: Cloperastine, an antitussive, works by suppressing the cough reflex, while Montelukast works on inflammatory pathways. There is no significant interaction between these drugs, and they are often prescribed together in the management of asthma-related cough.
Recommendation: Safe to use together. Both drugs can help manage asthma symptoms, but Cloperastine should be used cautiously if the patient experiences excessive coughing, as it could obscure the assessment of worsening asthma symptoms.

FERNILAR (Desloratadine) + NOTUSSIL (Cloperastine):
Risk: Desloratadine is a non-sedating antihistamine, while Cloperastine can cause mild sedation due to its antihistamine properties. Combining both medications may cause drowsiness or sedation in some patients.
Recommendation: Use with caution, especially if the patient needs to be alert or if other sedating medications are involved. Advise the patient to avoid activities requiring full concentration (e.g., driving) until they are aware of how these medications affect them.

LELIPEL (Montelukast) + FERNILAR (Desloratadine) + NOTUSSIL (Cloperastine):
Risk: When used together, these three medications may cause mild sedation due to Cloperastine. Additionally, combining Montelukast and Desloratadine may lead to a more effective treatment of asthma and allergic rhinitis, but it may be unnecessary to use Cloperastine unless the cough is severe.
Recommendation: Generally safe to use together. However, the risk of drowsiness or sedation from Cloperastine should be considered, and the patient should be monitored for side effects.",
	23:"STABLON (Tianeptine) + NEXICURE (Esomeprazole):
Risk: Tianeptine is a serotonin reuptake enhancer, and Esomeprazole is a proton pump inhibitor (PPI). There are no significant drug-drug interactions between these two drugs.
Recommendation: Safe to use together. Both medications act on different pathways (central nervous system for Tianeptine and gastric acid secretion for Esomeprazole), so no direct interaction is expected.

STABLON (Tianeptine) + DICETEL (Pinaverium):
Risk: Tianeptine has a mild sedative effect, and Pinaverium is an antispasmodic which may also have mild sedative properties. There is no significant pharmacodynamic interaction between these two drugs.
Recommendation: Use with caution if the patient experiences excessive sedation or dizziness, especially when starting therapy. Monitor for any signs of sedation or dizziness and adjust the dosage accordingly if needed.

NEXICURE (Esomeprazole) + DICETEL (Pinaverium):
Risk: Esomeprazole reduces stomach acid, which can affect the absorption of certain medications, although Pinaverium is not known to be significantly affected by acid suppression.
Recommendation: These drugs can be taken together safely. No significant interaction is expected.

STABLON (Tianeptine) + NEXICURE (Esomeprazole) + DICETEL (Pinaverium):
Risk: The combination of all three drugs is generally safe. However, Tianeptine and Pinaverium can both contribute to a sedative effect, so the patient should be monitored for any signs of dizziness or excessive sedation.
Recommendation: This combination can be used safely, but the patient should be informed of the potential sedative effects, especially in the initial phase of treatment. It is advisable to monitor the patient for side effects like drowsiness or dizziness.",
	24:"METHOQUICK (Methocarbamol) + DULOXEPRIN (Duloxetine):
Risk: Methocarbamol may cause drowsiness and dizziness, which could be intensified by Duloxetine as it can also cause drowsiness or dizziness as side effects.
Recommendation: Monitor the patient for excessive sedation, dizziness, or confusion, especially when starting or adjusting doses of these medications. Caution is advised when performing tasks that require full alertness.

METHOQUICK (Methocarbamol) + DISPERCAM (Piroxicam):
Risk: Piroxicam (NSAID) increases the risk of gastrointestinal (GI) side effects such as ulcers and bleeding. Combining it with Methocarbamol, which has mild sedative effects, could increase the risk of sedation.
Recommendation: Use caution with the combination of these two drugs, particularly in elderly patients or those with a history of GI bleeding or ulcers. Monitor for any signs of excessive sedation or GI discomfort.

NEURORUBINE (B Complex Vitamins) + DULOXEPRIN (Duloxetine):
Risk: No significant interaction between B Complex Vitamins and Duloxetine. However, Duloxetine can sometimes cause dizziness, and patients may be concerned about taking multiple medications together.
Recommendation: The combination is generally safe, but ensure the patient is aware of any potential side effects, including dizziness, and advise on maintaining hydration and regular follow-up.

NEURORUBINE (B Complex Vitamins) + DISPERCAM (Piroxicam):
Risk: No major interactions between B Complex Vitamins and Piroxicam. Piroxicam may cause gastrointestinal side effects, but B Vitamins are not known to exacerbate these effects.
Recommendation: The combination is safe. However, regular monitoring for signs of GI discomfort or bleeding is recommended when using Piroxicam.

METHOQUICK (Methocarbamol) + DULOXEPRIN (Duloxetine) + DISPERCAM (Piroxicam):
Risk: Combining Methocarbamol with Duloxetine and Piroxicam could increase the risk of sedation, dizziness, and gastrointestinal issues like ulcers or bleeding. Piroxicam adds to the GI risk, while Duloxetine may contribute to drowsiness or dizziness.
Recommendation: Monitor for any signs of sedation, dizziness, or GI discomfort, and educate the patient about potential side effects. Use the lowest effective doses and consider alternative therapies if side effects are significant.",
	25:"EZOGAST (Esomeprazole) + FLUXOPRIDE (Mosapride):
Risk: Esomeprazole may decrease gastric acidity, which could interfere with the absorption of Mosapride (a prokinetic agent).
Recommendation: These medications can be used together with monitoring, but timing the doses (taking Esomeprazole at least 30 minutes before Mosapride) may help optimize efficacy.

EZOGAST (Esomeprazole) + CLARIKAN (Clarithromycin):
Risk: Clarithromycin may inhibit the metabolism of Esomeprazole in the liver, potentially leading to increased levels of the proton pump inhibitor, thereby increasing the risk of side effects such as headaches, dizziness, or GI issues.
Recommendation: Use with caution, especially if renal or hepatic impairment is present. Monitoring for adverse effects is advised, and dose adjustments might be necessary.

EZOGAST (Esomeprazole) + COLOVERIND (Dimethicone + Mebeverine):
Risk: There are no significant interactions between Esomeprazole and COLOVERIND.
Recommendation: Safe combination, but patient should continue to monitor for any abdominal discomfort or bloating that might still persist.

FLUXOPRIDE (Mosapride) + CLARIKAN (Clarithromycin):
Risk: Clarithromycin is an inhibitor of CYP3A4, which can lead to increased plasma levels of Mosapride, increasing the risk of side effects such as dizziness, abdominal discomfort, and diarrhea.
Recommendation: Use with caution, especially in patients with renal or hepatic dysfunction. Close monitoring is required.

TRIMEDFLU (Paracetamol + Pseudoephedrine) + COLOVERIND (Dimethicone + Mebeverine):
Risk: There are no major interactions between Paracetamol + Pseudoephedrine and Dimethicone + Mebeverine.
Recommendation: Safe combination. However, patients should be advised to monitor for signs of excessive sedation from the pseudoephedrine component, particularly in those with hypertension.

TRIMEDFLU (Paracetamol + Pseudoephedrine) + CLARIKAN (Clarithromycin):
Risk: Clarithromycin may interact with Pseudoephedrine by increasing its concentration, leading to potential side effects like increased heart rate, hypertension, and dizziness.
Recommendation: Monitor for symptoms of excessive stimulation, such as elevated blood pressure, palpitations, and restlessness. Adjust dose if necessary.",
	26:"LACTODEL (Bromocriptine) + DOXIUM (Calcium Dobesilate):
Risk: No direct interaction is reported. However, both medications can cause dizziness, which may be additive.
Recommendation: Monitor for signs of excessive dizziness or fatigue, particularly in patients with diabetes or vascular conditions.

LACTODEL (Bromocriptine):
Can cause nausea, dizziness, and hypotension, especially at the start of treatment. These side effects may complicate diabetic management.

DOXIUM (Calcium Dobesilate):
Potential for mild gastrointestinal upset, which might exacerbate any existing nausea caused by Bromocriptine.",
	27:"SPASMODIGESTIN (Dicyclomine + Simethicone) + SECNIDAZOLE:
Risk: No significant interactions, but Dicyclomine may exacerbate nausea caused by Secnidazole.
Recommendation: Administer with food to minimize nausea.

SPASMODIGESTIN + COLIURINAL (Hexamine + Khellin + Piperazine):
Risk: Both drugs may cause gastrointestinal disturbances like bloating and nausea.
Recommendation: Monitor for worsening abdominal discomfort.

SECNIDAZOLE + COLIURINAL:
Risk: No direct interaction reported, but both can cause gastrointestinal upset.
Recommendation: Maintain adequate hydration to mitigate side effects.",
	28:"CERVITAM (Piracetam + Vincamine) + VERSERC (Betahistine):
Risk: No significant pharmacological interaction. However, both drugs target cerebral blood flow and neurotransmission, which may increase the risk of headache or nausea in some patients.
Recommendation: Monitor for adverse effects like headaches or GI discomfort.

CERVITAM + NEUROVIT (B Complex Vitamins):
Risk: No clinically significant interaction.
Recommendation: Safe combination, supportive for neurological function.

VERSERC + NEUROVIT:
Risk: No known interaction.
Recommendation: Safe to co-administer.",
	29:"CLINDAM (Clindamycin) + ACNETROX (Nadifloxacin):
Risk: Both are topical antibiotics with no significant systemic absorption. However, overuse may lead to antibiotic resistance.
Recommendation: Rotate or combine treatments judiciously to avoid resistance.",
	30:"VIDROP (Cholecalciferol) + LCARNITINE (Levocarnitine):
Risk: No significant interaction. Both are supplements addressing different deficiencies.

LCARNITINE + SIMETHICONE:
Risk: No significant interaction. Both work independently, with one addressing metabolism and the other relieving gas.

ACNETROX (Nadifloxacin) + Other Medications:
Risk: Minimal systemic absorption from topical use, unlikely to interact with supplements or simethicone.",
	31:"TORBENER (Cefdinir) + XORAXON (Ceftriaxone):
Risk: Both are cephalosporins. Combining them may increase the risk of overlapping side effects (e.g., diarrhea, hypersensitivity). Co-administration is generally avoided unless a specific need is identified.

TORBENER + CSP (Paracetamol):
Risk: Minimal interaction. Safe when used for fever and infection-related symptoms.

MONOHEXAL (Ivy Leaves) + CSP:
Risk: No significant interaction. Ivy extract acts as an expectorant, while CSP targets fever and mild pain.

TORBENER + MONOHEXAL:
Risk: No direct interaction, though monitoring for gastrointestinal side effects like nausea or diarrhea is advised.",
	32:"NAVILUCA (Fluconazole) + TEDIMERP (Tedizolid):
Risk: Minimal interaction, generally safe.
Note: Fluconazole inhibits CYP3A4, potentially increasing Tedizolid levels, but this effect is clinically insignificant at recommended doses.",
	33:"CELEBORG (Celecoxib) + ZURCAL (Pantoprazole):
Risk: No significant interaction; Pantoprazole protects against Celecoxib-induced gastric irritation.
Note: Ensure long-term NSAID use is monitored for cardiovascular risks.

CELEBORG (Celecoxib) + DOROFEN (Glucosamine + Ginkgo Biloba):
Risk: Ginkgo Biloba may slightly increase bleeding risk due to antiplatelet effects, but this interaction is minimal with Celecoxib.
Note: Monitor for bruising or bleeding, particularly in older patients.

DOROFEN (Glucosamine + Ginkgo Biloba) + ZURCAL (Pantoprazole):
Risk: No significant interaction.",
	34:"LIMITLESS (Multivitamins) + QUICKSLIM (Orlistat):
Risk: Orlistat may reduce the absorption of fat-soluble vitamins (A, D, E, K).
Management: Take multivitamins at least 2 hours before or after Orlistat.

QUICKSLIM (Orlistat):
Risk: Increased risk of gastrointestinal discomfort, including oily stools and diarrhea, especially with high-fat meals.
Management: Educate on dietary adjustments to reduce fat intake.

LIMITLESS (Multivitamins):
Risk: None significant when taken appropriately.",
	35:"BIOREFAMIN (Rifaximin) + DUSPATALIN (Mebeverine):
Risk: None significant.
Management: Safe combination for treating IBS and its associated symptoms.

BIOREFAMIN (Rifaximin) + SPASMOAMRASE (Dicyclomine + Simethicone):
Risk: None significant.
Management: Effective for reducing bloating and spasms.

DUSPATALIN (Mebeverine) + SPASMOAMRASE (Dicyclomine + Simethicone):
Risk: Potential for excessive antispasmodic effect leading to constipation.
Management: Monitor bowel movements; adjust doses if constipation worsens.",
	36:"FOLICAP (Folic Acid) + PROGEST (Progesterone):
Risk: None significant.
Management: Safe combination. Folic acid is important for early pregnancy, while progesterone can support the luteal phase of the cycle.

PROGEST (Progesterone) + PETRO (Drotaverine + Paracetamol):
Risk: None significant.
Management: The combination of drotaverine (antispasmodic) and paracetamol (analgesic) is effective for controlling pain and discomfort, with no significant interactions with progesterone.

FOLICAP (Folic Acid) + PETRO (Drotaverine + Paracetamol):
Risk: None significant.
Management: These medications can be used together without concern. Folic acid supplementation is critical for conception and early pregnancy, while the pain relief combination is effective for managing dysmenorrhea.",
	37:"HEBITAXIME (Cefotaxime) + DEXA (Dexamethasone):
Risk: Moderate risk for increased risk of side effects such as gastrointestinal irritation or superinfections.
Management: Monitor for potential signs of infection, like fungal overgrowth or GI upset. No direct pharmacokinetic interaction, but consider using dexamethasone cautiously if patient is on long-term antibiotic therapy.

HEBITAXIME (Cefotaxime) + RHINOPRO (Carbinoxamine + Phenylephrine):
Risk: Carbinoxamine (an antihistamine) and phenylephrine (a decongestant) may have mild central nervous system effects such as drowsiness or hyperactivity. These could be exacerbated by the sedative properties of cefotaxime or dexamethasone.
Management: Advise parents to monitor the child for excessive drowsiness, agitation, or hyperactivity.

DEXA (Dexamethasone) + RHINOPRO (Carbinoxamine + Phenylephrine):
Risk: Minimal interaction, but steroids like dexamethasone may increase the risk of fluid retention or hypertension, especially with decongestants like phenylephrine.
Management: Monitor blood pressure, particularly if the child has a history of hypertension or is on prolonged dexamethasone therapy.

ROTAHELEX (Ivy Leaves) + RHINOPRO (Carbinoxamine + Phenylephrine):
Risk: Minor risk for additive sedative effects when combined with carbinoxamine (an antihistamine).
Management: Monitor for signs of sedation, such as excessive drowsiness. Avoid using multiple sedative agents simultaneously if possible.",
	38:"CEREBROLYSIN (Cerebrolysin) + SOMAZINA (Citicoline):
Risk: Both drugs are neuroprotective and may have additive benefits in improving cognitive function, with no significant direct drug-drug interaction.
Management: Ensure proper dosing and monitor for any adverse effects related to the central nervous system (e.g., dizziness, headache).

CEREBROLYSIN (Cerebrolysin) + TRENTAL (Pentoxifylline):
Risk: Pentoxifylline may have mild anticoagulant effects, and Cerebrolysin may also have slight effects on platelet aggregation. While no direct interactions are expected, combining these could theoretically increase the risk of bleeding.
Management: Monitor for signs of bleeding, especially if the patient has a history of anticoagulant use. Adjust dosages if needed.

CEREBROLYSIN (Cerebrolysin) + TEBONINA (Ginkgo Biloba):
Risk: Ginkgo Biloba is often used for cognitive enhancement and has mild blood-thinning properties. There is a potential additive effect on platelet aggregation inhibition when combined with Cerebrolysin.
Management: Monitor closely for any signs of bleeding, bruising, or gastrointestinal discomfort. Consider regular monitoring of coagulation parameters if the patient is on other medications that affect bleeding.

SOMAZINA (Citicoline) + TRENTAL (Pentoxifylline):
Risk: No significant direct interaction. However, both drugs are used to improve cerebral circulation, and combining them may have an additive effect.
Management: Monitor for improvement in cognitive function and watch for signs of dizziness or hypotension.

SOMAZINA (Citicoline) + TEBONINA (Ginkgo Biloba):
Risk: Ginkgo Biloba may increase the bioavailability of Citicoline and enhance its cognitive benefits. While no severe interactions are expected, the combination may enhance cognitive effects.
Management: Monitor the patient for any signs of overstimulation, such as headache or increased restlessness.",
	39:"GLUCOVANCE (Glibenclamide + Metformin) + ALKAPRESS (Amlodipine):
Risk: Metformin, when combined with amlodipine, may have an additive hypotensive effect. Metformin generally has a neutral effect on blood pressure, but with amlodipine, the patient may experience dizziness or lightheadedness due to lowered blood pressure, especially when standing.
Management: Monitor the patient's blood pressure regularly and adjust amlodipine dosage if necessary to avoid hypotension. Ensure the patient is aware of the potential risk of dizziness upon standing.

GLUCOVANCE (Glibenclamide + Metformin) + NEXICURE (Esomeprazole):
Risk: Esomeprazole may reduce the absorption of certain medications, but this effect is typically minor with metformin and Glibenclamide. There is no significant interaction between esomeprazole and the components of Glucovance.
Management: Regular monitoring of blood glucose is essential, as esomeprazole can sometimes impact gastric pH and slightly alter the absorption profile of drugs, although not significantly for these medications.

ALKAPRESS (Amlodipine) + NEXICURE (Esomeprazole):
Risk: No direct interactions between these two drugs. Amlodipine is a calcium channel blocker used for hypertension, and esomeprazole is a proton pump inhibitor used for acid reflux. However, both medications can lead to mild gastrointestinal side effects like constipation or abdominal discomfort.
Management: Monitor for gastrointestinal side effects, such as bloating or abdominal pain. Ensure the patient adheres to a proper diet and lifestyle modification to alleviate any GI discomfort.",
	40:"EPITENS (Triamterene + Xipamide) + QUIBRON (Theophylline):
Risk: Triamterene is a potassium-sparing diuretic, which can lead to hyperkalemia, especially when combined with theophylline. Theophylline, a bronchodilator, has a narrow therapeutic range and may require dose adjustments. Additionally, theophylline can interact with diuretics by increasing renal clearance and affecting potassium balance.
Management:
Monitor potassium levels regularly.
Theophylline levels should be monitored closely, as the combination of diuretics may alter the drug's metabolism.
Consider reducing the dose of theophylline if hyperkalemia is noted.
If signs of toxicity occur (e.g., nausea, palpitations), adjust or discontinue theophylline as needed.

EPITENS (Triamterene + Xipamide) + Dexamethasone (if prescribed in the future):
Risk: Corticosteroids like dexamethasone can increase the risk of hypokalemia, especially when used in combination with diuretics.
Management: Monitor serum potassium levels regularly if corticosteroids are added to the treatment regimen. Consider adding potassium supplements if necessary.",
	41:"DIVIDO (Diclofenac Sodium) + TRENTAL (Pentoxifylline):
Risk:
Diclofenac, an NSAID, increases the risk of gastrointestinal (GI) irritation and bleeding. Pentoxifylline can further enhance this risk by inhibiting platelet aggregation.
The combination may elevate the risk of GI ulcers or bleeding, especially in a patient with a history of GI upset.
Management:
Co-prescribe a proton pump inhibitor (PPI) like omeprazole to protect the stomach lining.
Monitor for signs of GI bleeding (e.g., black stools, abdominal pain).

TRENTAL + Antihypertensives (if prescribed):
Risk: Pentoxifylline may enhance the effect of antihypertensives, leading to hypotension.
Management: Monitor blood pressure closely, especially after initiating pentoxifylline. Adjust antihypertensive medications if necessary.",
	42:"PANADOLEXTRA (Caffeine + Paracetamol) + CEVAMOL (Vitamin C + Paracetamol):
Risk:
Overlapping paracetamol content increases the risk of hepatotoxicity, especially if taken frequently.
Management:
Avoid concurrent use; ensure the total daily dose of paracetamol does not exceed 4 grams.
Counsel the patient on proper dosing intervals and alternatives for symptom relief.

ZISROCIN (Azithromycin) + PANADOLEXTRA (Caffeine):
Risk: Azithromycin may slow caffeine metabolism, leading to caffeine-related side effects (e.g., restlessness, insomnia, tachycardia).
Management: Reduce caffeine intake while on azithromycin.

ZISROCIN + IVYBRONCH (Ivy Leaves):
Risk: Both may cause GI upset (nausea, diarrhea) in sensitive individuals.
Management: Advise taking with food to reduce gastrointestinal side effects.",
	43:"DEXTROSE + PANTAZOL (Pantoprazole):
Risk: None significant; commonly co-administered in emergency settings.
Management: Monitor glucose levels in diabetic patients to prevent hyperglycemia exacerbation due to dextrose infusion.

EMEREST (Ondansetron) + VISCERALGINE (Tiemonium):
Risk: Both can cause mild anticholinergic side effects (e.g., dry mouth, dizziness).
Management: Monitor for additive effects, especially in older patients.

ORNIDAZOLE + CORTIPLEX (CorticoAdrenal Extract + Vitamin B6):
Risk:
Corticoids can mask symptoms of infection.
Ornidazole may enhance the risk of peripheral neuropathy, especially with B6 deficiency.
Management: Monitor for neuropathy symptoms and adjust therapy if needed.",
	44:"SPASMODIGESTIN (Dicyclomine + Simethicone) + ADOL (Paracetamol):
Risk: Minimal interaction; safe combination for symptomatic relief of abdominal discomfort and headache.
Management: Monitor for rare side effects like drowsiness from dicyclomine.",
	45:"CURAM (Amoxicillin + Clavulanic Acid) + CETAL (Paracetamol):
Risk: No significant interaction; both are commonly prescribed together.
Management: Ensure dosing intervals are adhered to avoid liver strain from paracetamol.

CURAM + MOTINORM (Domperidone):
Risk: Potential increase in gastrointestinal motility may alter antibiotic absorption.
Management: Monitor for reduced efficacy of CURAM; administer CURAM 1 hour before MOTINORM if feasible.

CETAL + MOTINORM:
Risk: Minimal interaction. Safe for concurrent use.",
	46:"CLARIKAN (Clarithromycin) + PREDSOLFORTE (Prednisolone):
Risk: Clarithromycin may increase systemic levels of prednisolone by inhibiting CYP3A4 metabolism.
Management: Monitor for signs of corticosteroid side effects (e.g., hyperglycemia, weight gain, or mood changes).

CLARIKAN + DOLIPRANE (Paracetamol):
Risk: No significant interaction. Safe for concurrent use.

CLARIKAN + TUSSISTOP (Levodropropizine):
Risk: No significant interaction, both can be used together safely.

PREDSOLFORTE + DOLIPRANE:
Risk: No direct interaction. Ensure paracetamol dosage does not exceed the daily maximum (4 g/day).

TUSSISTOP + DOLIPRANE:
Risk: No interaction. Safe for combined use to manage symptoms.",
	47:"BETAFOS (Betamethasone) + DICLAC (Diclofenac Sodium):
Risk: Increased risk of gastrointestinal (GI) side effects such as ulcers or bleeding due to combined steroid and NSAID use.
Management: Prescribe a proton pump inhibitor (PPI) like omeprazole to reduce GI risk.

BETAFOS + ALPHINTERN (Chymotrypsin + Trypsin):
Risk: Minimal interaction; safe to use together.

DICLAC + ALPHINTERN:
Risk: No significant interaction. ALPHINTERN can enhance anti-inflammatory effects.",
	48:"ALPHINTERN (Chymotrypsin + Trypsin) + CLASYNMO (Amoxicillin + Clavulanic Acid):

Risk: No significant interaction.
Management: Safe to use concurrently. ALPHINTERN may enhance tissue recovery by reducing inflammation and edema.
Potential Gastrointestinal Upset:

CLASYNMO may cause mild GI upset (diarrhea or nausea).
Management: Recommend taking the antibiotic with food to minimize side effects.",
	49:"POLYFAST (Olive + Parafin + Garlic + Tea Tree Oils):
No significant systemic absorption, thus minimal to no risk of drug interactions.
Acts as a lubricant and antimicrobial to relieve discomfort and remove earwax.",
	50:"OCUGUARD (Ophthalmic Multivitamins):
No significant drug-drug interactions expected.
Contains vitamins (A, C, E, and B-complex) and minerals (zinc, selenium) to support overall eye health.",
	51:"HELICURE (Clarithromycin + Omeprazole + Tinidazole):
Clarithromycin may increase the plasma concentration of formoterol, heightening the risk of cardiovascular side effects (e.g., tachycardia).
Omeprazole may alter the absorption of budesonide, though clinically significant effects are uncommon.

MIFLONIDE (Budesonide):
Minimal systemic effects due to low bioavailability.
May interact with clarithromycin, increasing corticosteroid exposure.

FORADIL (Formoterol):
Increased risk of beta-agonist side effects when combined with clarithromycin. Monitor for palpitations or jitteriness.",
	52:"NEURAZINE (Chlorpromazine):
Potential interaction with RAMDEEP (Citalopram) increasing the risk of QT prolongation and serotonin syndrome.
Central nervous system (CNS) depressant effects may be potentiated by STOPAIN (contains caffeine and paracetamol, which can affect sedation levels).

RAMDEEP (Citalopram):
Interaction with STOPAIN: Caffeine may reduce sedative effects of citalopram, increasing anxiety.
Risk of serotonin syndrome when combined with other serotonergic or CNS-affecting medications.

STOPAIN (Caffeine + Paracetamol + Propyphenazone):
Caffeine may antagonize the sedative effects of NEURAZINE, worsening anxiety or insomnia.",
	53:"SIRDALUD (Tizanidine):
Can cause hypotension, which may interact with antihypertensives, increasing the risk of excessive blood pressure reduction.

KETOLAC (Ketorolac):
Concurrent use with SIRDALUD may enhance sedative effects.
Increased risk of gastrointestinal irritation and kidney function compromise.

MASSAGIL (Camphor + Menthol + Methyl Salicylate):
Minimal systemic absorption but potential skin irritation at the application site if overused.",
	54:"No significant interactions as CIPROCIN is applied topically with minimal systemic absorption.",
	55:"GASTORELIVE (Itopride):
A prokinetic agent to improve gastric motility and alleviate symptoms like bloating and early satiety.

VERDO (Peppermint Oil + Anise Oil + Ginger Oil):
A natural formulation to relieve bloating and improve digestion through its antispasmodic and carminative properties.",
	56:"FLAGYL + FEROSE:
No significant direct interactions, but gastrointestinal irritation may occur when taken together.
Stagger administration (iron supplement after meals and metronidazole before meals) to minimize discomfort.",
	57:"BUTAXIMARK:
Minimal systemic absorption; no significant drug interactions expected.",
	58:"LUMIERE:
Minimal systemic absorption; no significant drug interactions expected.
Safe for use in individuals with no history of topical allergies.",
	59:"ACNESTOP + DALACIN:
No significant interactions; both act synergistically to reduce acne severity.

FUSIZON + ACNESTOP/DALACIN:
Hydrocortisone may reduce inflammation but should be used sparingly to avoid skin thinning or rebound effects.

General Notes:
Monitor for signs of antibiotic resistance or skin irritation.",
	60:"COLOVATIL + ITOMASH:
No significant interactions; both target gastrointestinal symptoms synergistically.

COLOVATIL + ANDOURISTAT:
Monitor for CNS effects such as drowsiness due to sulpiride.

ITOMASH + ANDOURISTAT:
No direct interactions.",
	61:"Multivitamins and Minerals:
Generally safe, but caution with other medications that may affect absorption (e.g., certain antibiotics and antacids should not be taken simultaneously).
No significant interactions expected with vitamins and minerals when taken as prescribed.",
	62:"Generally safe with minimal interactions.
Caution with anticoagulants (e.g., warfarin) due to potential effects on bleeding time.
Monitor for any gastrointestinal side effects if taken alongside other medications.",
	63:"Doxycycline:
Avoid taking with antacids, calcium supplements, or iron supplements, as these can reduce absorption.
Monitor for potential photosensitivity; advise the patient to use sunscreen.

Erythromycin + Zinc Acetate:
Generally safe but may enhance photosensitivity when combined with doxycycline.

Adapalene:
May cause skin irritation when used with other topical products; advise on gradual introduction and monitoring for irritation.",
	64:"Tacrolimus:
Generally safe with few interactions; advise against using with other immunosuppressants or topical agents without guidance.

Prednicarbate:
Use with caution if combined with other topical corticosteroids; may increase the risk of local side effects.

Multivitamins + Minerals:
Generally safe; however, ensure no excessive intake of specific vitamins or minerals that could lead to toxicity (e.g., vitamin A).",
	65:"Low Risk:

Doxycycline should not be taken with calcium, magnesium, or iron supplements within 2 hours to avoid reduced absorption.
Minimal interaction expected with topical therapies.",
	66:"Minimal risk of interaction between these supplements/topical agents.
Both are complementary in addressing skin hydration and mild irritation.",
	67:"VENTOLIN and QUIBRON:
Both may cause additive effects, such as tachycardia, nervousness, or tremors. Monitor heart rate and serum potassium levels.

QUIBRON and VENTALCOMP:
Theophylline levels may be influenced by corticosteroids, requiring periodic monitoring of serum theophylline to avoid toxicity (e.g., nausea, arrhythmias).

Overall Management:
Caution with potential additive cardiovascular effects due to overlapping beta-agonist activity.",
	68:"URSOFALK and DUPHALAC:
Lactulose may reduce bile acid reabsorption, slightly altering the efficacy of ursodeoxycholic acid.

CONAADIONE and GASTRAZOLE:
Omeprazole may delay absorption of oral vitamin K1; consider administering at different times.

NEUROTON and LIVERIN:
Overlapping B-complex vitamins; monitor for signs of hypervitaminosis B (rare).",
	69:"ANTINAL (Nifuroxazide):
An intestinal antiseptic to address suspected bacterial pathogens.",
	70:"Minimal risk of interactions between Montelukast and Acetylcysteine.
Both drugs have complementary roles in managing respiratory symptoms.",
	71:"Low Risk:
Glucosamine and chondroitin are generally safe and do not interact with common antihypertensive medications.",
	72:"Low Risk:
Amoxicillin and flucloxacillin may interact minimally with metformin but generally safe.
Monitor for gastrointestinal discomfort when combined with enzyme therapy.",
	73:"Theophylline and Clarithromycin:
Risk of increased theophylline levels due to reduced clearance, potentially leading to toxicity (monitor for nausea, vomiting, or arrhythmias).

Ambroxol with Theophylline:
Generally safe but monitor for enhanced gastrointestinal side effects.",
	74:"Betamethasone (DIPROFOS) and Diabetes:
Betamethasone can increase blood glucose levels, necessitating close monitoring and adjustment of diabetes medications.
No significant interactions with TOPZAD.",
	75:"Amoxicillin + Ibuprofen:
No major interactions, but both can cause gastrointestinal irritation, so the patient should take them with food to minimize this risk.",
	76:"Ephedrine + Ciprofloxacin:
Ciprofloxacin can increase the plasma concentration of theophylline, potentially leading to toxicity (e.g., nausea, tremors, palpitations). Monitor theophylline levels and symptoms.

Ibuprofen + Hydroxyzine:
Minimal interaction; use ibuprofen cautiously to avoid gastrointestinal irritation.",
	77:"Nifuroxazide + Ampicillin/Dicloxacillin:
No significant interaction; both can be used together safely.

Carbocysteine + Antibiotics:
No significant interaction; carbocysteine may enhance mucus clearance, supporting antibiotic efficacy.",
	78:"Diosmin + Ketorolac:
No significant interaction; both drugs can be used concurrently.

Ketorolac + Povidone Iodine:
No interaction; topical antiseptic use does not affect systemic NSAIDs.",
	79:"Ceftriaxone + Dexamethasone:
No significant interaction; both drugs are safe for concurrent use.

Tenoxicam + Dexamethasone:
Increased risk of gastrointestinal (GI) irritation and ulcers; consider adding a proton pump inhibitor (PPI).

Ceftriaxone + Hyoscine:
No significant interaction.",
	80:"Doxycycline + Testosterone:
Increased risk of photosensitivity; patients should avoid prolonged sun exposure.

L-Carnitine + ATP:
No significant interaction; synergistic effect in improving energy levels.

Zinc + Vitamin B6:
No significant interaction; both help support enzyme function and cellular repair.",
	81:"AZGOVANC + Domperidone:
Potential increase in domperidone absorption due to altered gastric pH.
Monitor for side effects like dry mouth or dizziness.

Domperidone + Dicyclomine:
Additive anticholinergic effects, leading to possible dry mouth or blurred vision.

AZGOVANC + Ebastine:
No significant interaction.

Domperidone + Ebastine:
Low risk of QT prolongation; avoid combining with other QT-prolonging drugs.",
	82:"TOPLEXIL + TEMPRA:
Both contain paracetamol; avoid duplication to prevent overdose.

DOLPHIN + TEMPRA:
Additive analgesic effects; monitor for gastrointestinal irritation.

SEPTRIN + DOLPHIN:
Increased risk of gastrointestinal side effects such as nausea or stomach upset.",
	83:"No significant systemic drug interactions since Eflornithine is a topical medication with minimal systemic absorption.",
	84:"Omeprazole + Multivitamins:
Omeprazole may impair the absorption of certain minerals (e.g., calcium, magnesium, iron).
Patient may require alternate forms of iron supplementation or increased dietary intake.

Midodrine + Omeprazole:
No significant interaction.",
	85:"Ciprofloxacin + Tinidazole:
Ciprofloxacin may cause QT prolongation, particularly in patients with electrolyte imbalances (e.g., low potassium or magnesium).
Tinidazole may enhance the adverse effects of alcohol (e.g., disulfiram-like reaction).

Hyoscine + Ciprofloxacin:
Hyoscine may cause mild dry mouth and dizziness, which could be exacerbated by Ciprofloxacin's potential CNS effects.",
	86:"Cefadroxil:
Generally safe but may enhance effects of anticoagulants (e.g., warfarin). Monitor for increased bleeding.

Chlorpheniramine:
Sedative effects may be increased when used with other CNS depressants (e.g., alcohol, benzodiazepines).

Pseudoephedrine:
May interact with MAO inhibitors and increase blood pressure. Use with caution in children with hypertension.",
	87:"Atorvastatin:
May increase risk of myopathy when used with certain antibiotics, including sparfloxacin. Monitor for muscle pain or weakness.

Sparfloxacin:
Potentially increases QT interval; caution if the patient is on other medications that prolong the QT interval.

URIVIN:
Caution in patients with renal impairment; atropine may cause increased heart rate and urinary retention.",
	88:"Piroxicam and Diclofenac:
Both are nonsteroidal anti-inflammatory drugs (NSAIDs) and may increase the risk of gastrointestinal bleeding and renal impairment, particularly in elderly patients. Use the lowest effective doses for the shortest duration necessary.

Piroxicam:
May enhance the effects of anticoagulants (e.g., warfarin). Monitor for signs of bleeding.

Diclofenac:
Caution with concurrent use of other medications affecting the renal system (e.g., ACE inhibitors) due to the risk of kidney damage.

EUCAL Herbal Cream:
Generally safe but ensure no allergic reaction occurs; monitor for skin irritation at the application site.",
	89:"Tenoxicam:
Risk of gastrointestinal bleeding if taken with other NSAIDs or anticoagulants (e.g., warfarin).

Alfacalcidol:
Monitor calcium levels; concurrent use with high-dose calcium supplements may increase the risk of hypercalcemia.

Glucosamine + Chondroitin:
Generally well-tolerated, but use caution in patients with shellfish allergies (glucosamine is derived from shellfish).
May enhance the effects of anticoagulants; monitor for signs of bleeding.

Multivitamins + Minerals:
Ensure not to exceed recommended daily allowances for vitamins and minerals, especially Vitamin D and Calcium, to avoid toxicity.",
	90:"Bisoprolol:
Monitor for bradycardia or hypotension, especially if used with other antihypertensives.

Glimepiride and Metformin:
Risk of hypoglycemia when used together; ensure proper blood sugar monitoring.
Metformin may increase the risk of lactic acidosis in patients with renal impairment, but renal function is normal in this patient.

Multivitamins + Minerals and B Complex:
Generally well tolerated; no significant interactions expected but monitor for excessive vitamin intake.

Overall Considerations:
Assess for signs of dehydration, as medications may affect renal function and blood pressure management.",
	91:"Rifampicin:
rifampin will decrease the level or effect of gentamicin by P-glycoprotein (MDR1) efflux transporter. Use Caution/Monitor.
Can reduce the effectiveness of oral contraceptives and other medications metabolized by the liver. Monitor for any changes in contraceptive efficacy.

Gentamicin:
Minimal systemic absorption when used topically in the ear; monitor for signs of local irritation.


Cyproheptadine:
Can cause sedation; caution advised when driving or operating machinery. May also enhance the sedative effects of other CNS depressants.

Overall Considerations:
Ensure proper hydration, especially when using antibiotics and antihistamines, to avoid dehydration.",
	92:"Metronidazole:
Can interact with alcohol (causing disulfiram-like reaction). Advise avoiding alcohol during treatment and for at least 48 hours after the last dose.
May enhance the anticoagulant effect of warfarin; monitor INR if patient is on anticoagulants.

Misoprostol:
No major interactions, but caution with patients who may be pregnant as it can induce uterine contractions.

Folic Acid + Iron (Haemacaps):
Generally safe, but high doses of iron may decrease the absorption of certain antibiotics. Space out the timing of taking antibiotics and iron supplements by at least two hours.

Overall Considerations:
Monitor for gastrointestinal side effects from metronidazole (nausea, vomiting) and misoprostol (diarrhea, abdominal cramps).",
	93:"Tamsulosin:
May interact with other antihypertensives, leading to increased risk of hypotension. Monitor blood pressure regularly.
Use with caution in patients taking PDE-5 inhibitors (e.g., sildenafil) due to potential additive hypotensive effects.

Diclofenac Sodium:
Risk of gastrointestinal bleeding, especially if used concurrently with other NSAIDs or anticoagulants. Monitor for signs of GI bleeding.
May increase the effects of antihypertensives, leading to potential blood pressure control issues.

Rowatinex:
Generally safe but may cause drowsiness. Caution is advised if operating machinery or driving.
No significant interactions with other prescribed medications noted.

Halphabarol:
Use caution with other CNS depressants as it may enhance sedative effects.",
	94:"Letrozole:
May interact with estrogen-containing medications, which can reduce the effectiveness of letrozole.
Caution is advised when used with strong CYP2A6 inhibitors, as they may increase letrozole levels.
No significant interactions with common medications such as NSAIDs, antihypertensives, or other cancer therapies noted.",
	95:"DEXAFLOX:
Caution advised if used with other topical eye medications.
Notable drug interactions with systemic corticosteroids (may increase risk of side effects).

TEARSGUARD:
Generally safe; minimal interactions noted.
Can be used concurrently with other eye medications.

RAPIFLAM:
Caution with anticoagulants (e.g., warfarin) due to increased bleeding risk.
Potential interactions with other NSAIDs or corticosteroids can increase the risk of gastrointestinal side effects.",
	96:"OLAPEX:
May increase sedation when combined with other CNS depressants, including chlorpromazine.

TRILEPTAL:
Potential interaction with oral contraceptives; effectiveness may be reduced.

NEURAZINE:
Increased risk of side effects (e.g., sedation, dizziness) when combined with olanzapine or other CNS depressants.

EXTRAGESIC:
Caution advised with concurrent use of anticoagulants (e.g., warfarin) due to increased bleeding risk.",
	97:"EXTRAUMA (Recombinant Hirudin):
Risk of bleeding when combined with other anticoagulants or antiplatelet agents (e.g., aspirin, clopidogrel).

AMBEZIM (Chymotrypsin + Trypsin):
Generally safe; however, caution is advised if used in patients with bleeding disorders due to potential effects on blood clotting mechanisms.",
	98:"FUSIDERM (Fusidic acid):
Generally safe to use with most medications; however, caution is advised if the patient is using other topical agents, as they can potentially affect the absorption of fusidic acid.
Monitor for any signs of local irritation or allergic reaction.",
	99:"ALPHINTERN (Chymotrypsin + Trypsin):
Generally well-tolerated with a low risk of significant drug interactions.
Caution is advised if the patient is taking anticoagulants (e.g., warfarin) due to the potential for increased bleeding risk, although this is minimal.",
	100:"ESOMELODAN (Esomeprazole):
May increase the absorption of drugs that require an acidic environment for adequate absorption (e.g., certain antifungals, iron supplements).
Caution advised when combined with clopidogrel, as esomeprazole may reduce its effectiveness.

NIZATECT (Nizatidine):
Can interact with drugs that are affected by changes in gastric pH. Monitor for potential changes in efficacy.",
	101:"CEPOREX (Cefalexin):
Generally safe, but may interact with oral anticoagulants (not relevant in this case).
Potential for gastrointestinal upset if not taken with food.

CETAL (Paracetamol):
Avoid overlapping with other medications containing acetaminophen to prevent overdose.

PHYSIOMER (Isotonic Seawater):
No significant drug interactions; safe for pediatric use.",
	102:"PANTOGAR (Multivitamins + Minerals):
No significant interactions. However, absorption of iron may be affected if taken with calcium-rich foods or antacids.

HAIRPLUSBACK (Minoxidil):
Rare risk of systemic absorption causing hypotension; avoid use near bedtime to prevent absorption into bedding and other areas.

BETNOVATE (Betamethasone + Clioquinol):
Avoid prolonged use to minimize the risk of skin thinning or rebound dermatitis.
Interaction with other topical products can lead to irritation.",
	103:"CATAFLAM + ASPIRIN:
Increased risk of gastrointestinal (GI) irritation and ulceration when combined.
Use with caution in patients with GERD.

ASPIRIN + STOPAIN:
Both contain analgesic components (Paracetamol and Aspirin), increasing the risk of overdose if not monitored.

CATAFLAM + STOPAIN (Caffeine):
Caffeine can exacerbate GERD symptoms and increase the potential for gastric discomfort caused by Diclofenac.",
	104:"No significant interactions between Nigella Sativa Oil and Fusidic Acid.

Caution advised to avoid concurrent use of other topical agents that may irritate the skin.",
	105:"Tizanidine + NSAIDs (Tenoxicam, Ketoprofen):
Increased risk of gastrointestinal irritation or bleeding due to NSAIDs.
Recommendation: Co-prescribe a proton pump inhibitor (e.g., omeprazole) to prevent gastritis.

Tizanidine + Alcohol/Smoking:
Smoking may reduce the efficacy of tizanidine; patient advised to reduce smoking.",
	106:"Ciprofloxacin + Metronidazole:
Both metabolized by the liver; mild potential for increased hepatic load but generally safe in combination.

Ciprofloxacin + Calcium (dietary or supplements):
Calcium can reduce ciprofloxacin absorption. Advise the patient to avoid dairy products or calcium supplements within 2 hours of medication.",
	107:"Ceftriaxone + Desloratadine:
No significant interaction. Safe to use concurrently.

Ceftriaxone + Herbal Cough Syrup (BABETONE):
Herbal components may interfere slightly with the absorption of certain medications; administer the herbal syrup at least 1 hour after the antibiotic.",
	108:"Clemastine + Griseofulvin:
No significant interaction; monitor for sedation as both may have mild CNS effects.

Griseofulvin + Cefaclor:
Safe to use together. No known interactions.

Griseofulvin + Clotrimazole (topical):
Both target fungal infections; ensure oral and topical therapies are used as directed for optimal efficacy.

Topical Combination (QUADRIDERM):
No interaction concerns but avoid prolonged use of betamethasone to prevent skin atrophy.",
	109:"Multivitamins + Hypertension Medication:
Calcium interaction with antihypertensives: Excess calcium may reduce the efficacy of some antihypertensive drugs. Ensure doses are spaced by at least 2 hours.
Iron supplements + calcium: Calcium can inhibit iron absorption, so doses should be taken at different times if included in the multivitamin.",
	110:"Fluconazole + Butoconazole:
No significant interaction; combining systemic and topical antifungals enhances treatment efficacy for recurrent infections.

Fluconazole + Hyperglycemia:
Fluconazole may rarely increase blood glucose levels; monitoring is advised in diabetic patients.

Potential Drug Interactions with Diabetes Medications:
Fluconazole may interact with sulfonylureas (e.g., glimepiride) or insulin, increasing the risk of hypoglycemia.",
	111:"Cabergoline + Metformin:
No direct interaction, but both drugs contribute positively to improving ovulatory function in PCOS.

Cabergoline + Vitamin B6 (in OCTATRON):
Vitamin B6 may further support prolactin level reduction, enhancing cabergoline's effect.",
	112:"Prednisolone + Cetirizine:
No significant interaction; both work synergistically to reduce inflammation and allergic symptoms.

Mometasone + Salicylic Acid + Urea:
No direct interaction, but salicylic acid enhances the penetration of mometasone, improving efficacy in reducing inflammation.
Ensure urea application is timed appropriately to prevent interference with the absorption of topical steroids.",
	113:"Prednisolone + Paracetamol:
No direct interaction. However, long-term use of prednisolone may mask the symptoms of infections,
and liver function should be monitored if high doses of paracetamol are used concurrently.",
	114:"Pizotifen + Multivitamins:
No direct interactions. However, monitor for excessive weight gain with prolonged use of pizotifen in children.",
	115:"Flubendazole + Multivitamins:
No direct interactions.
Multivitamins can aid in replenishing deficiencies caused by malabsorption during the parasitic infection.",
	116:"Carbimazole + Tianeptine:
No significant interactions. Monitoring thyroid levels is essential as psychological symptoms could overlap with thyroid dysfunction.

Omeprazole + Tianeptine:
Potential reduction in Tianeptine absorption due to changes in stomach pH caused by Omeprazole. Adjust doses if psychiatric symptoms persist or worsen.",
	117:"Pioglitazone + Rosuvastatin:
Possible increased risk of edema. Monitor for signs of fluid retention or heart failure.

Vildagliptin + Pioglitazone:
Complementary mechanism of action with no major interactions; however, monitor for hypoglycemia.

Iron Supplements + Rosuvastatin:
Iron may interfere with the absorption of statins. Recommend taking these medications at different times.",
	118:"No significant interactions expected with Cefixime in this patient.",
	119:"Omeprazole + Ketoprofen/Ibuprofen:
Omeprazole mitigates potential gastric side effects of NSAIDs.

Prednisolone + NSAIDs (Ketoprofen/Ibuprofen):
Increased risk of gastrointestinal bleeding or ulcers.
Omeprazole provides a protective effect but close monitoring is needed.

Prednisolone + Chymotrypsin:
Combined anti-inflammatory effects but may require dose adjustment if bleeding risk increases.",
	120:"Iron + EPICOGEL:
EPICOGEL may reduce the absorption of iron supplements.
Recommendation: Administer iron 2 hours before or after antacids.

Iron + Indomethacin:
Combined use increases the risk of gastrointestinal irritation or bleeding.
EPICOGEL provides partial protection but requires monitoring.

Indomethacin + NAVIDOXINE:
Possible additive side effects such as dizziness or drowsiness.
Advise the patient to avoid driving or operating machinery until effects are known.",
	121:"BRUFEN + Diabetes:
Risk of gastrointestinal irritation and potential nephrotoxicity, especially in patients with diabetes.
Recommend monitoring kidney function and avoiding prolonged use.

VALTREX + Renal Function:
Dose adjustments may be necessary in case of impaired renal function, though current labs show normal values.

CEPOREX + Diabetes:
Antibiotics may interfere with blood glucose control. Frequent monitoring is advised.

NEUROVIT + Diabetes:
No significant interactions, but could improve symptoms of neuropathy with consistent use.",
	122:"KLACID + Dexamethasone:
Clarithromycin can increase the serum concentration of dexamethasone, potentially enhancing corticosteroid side effects (e.g., mood changes, glucose elevation).
Monitoring for any signs of corticosteroid-related side effects is recommended.

KLACID + Allergy History:
Alternative to penicillin-based antibiotics to avoid allergic reactions.",
	123:"URSOPLUS + Antiviral Therapy:
No significant drug interactions reported with common antiviral medications for hepatitis C.
Monitor liver function tests regularly to assess effectiveness of both the antiviral therapy and URSOPLUS.

URSOPLUS + Other Medications:
Consideration for potential interactions with any future medications prescribed for diabetes or hypertension should be monitored.",
	124:"Piroxicam + Carbamazepine:
Increased risk of gastrointestinal side effects, such as bleeding or ulceration.
Carbamazepine may reduce the effectiveness of NSAIDs due to its metabolism effects. Monitor for any signs of increased toxicity from Carbamazepine.

B Complex Vitamins:
No significant interactions with Piroxicam or Carbamazepine.
Supportive role in maintaining nerve health, especially considering the patient's symptoms of numbness.",
	125:"Nimesulide:
No significant interactions noted with other medications as the patient is currently not taking any other medications. However, caution is advised in patients with a history of gastrointestinal issues or renal impairment.

General Considerations:
Patients should be educated about potential gastrointestinal side effects associated with NSAID use, such as stomach irritation or bleeding, especially with prolonged use.",
	126:"Celecoxib:
Increased risk of gastrointestinal bleeding when used with other NSAIDs like Flurbiprofen. It is essential to monitor for gastrointestinal symptoms.
Celecoxib can increase blood pressure; monitor in patients with hypertension.

Flurbiprofen:
Potential renal impairment when used with other NSAIDs or in patients with pre-existing kidney issues; monitor renal function if used long-term.

Pantoprazole:
Generally well tolerated, but caution in long-term use due to potential for vitamin B12 deficiency.
Monitor for any signs of gastrointestinal infection (e.g., Clostridium difficile).",
	127:"Neomycin:
May cause allergic reactions in sensitive individuals; careful history taking is necessary to avoid this.
Minimal systemic absorption; thus, drug interactions are rare.

Polymyxin:
Generally safe with minimal systemic absorption. Monitor for signs of allergy.

Econazole:
Use with caution in patients with a history of allergic reactions to azole antifungals.

Triamcinolone:
Prolonged use of topical corticosteroids can lead to skin thinning; monitor for signs of local adverse effects.",
	128:"Caffeine:
May enhance the efficacy of ergotamine but can also increase the risk of side effects (e.g., increased blood pressure).

Domperidone:
Generally safe; monitor for QT prolongation, especially in patients taking other medications that may affect cardiac conduction.

Ergotamine:
Caution with use of other vasoconstrictors. Should not be used within 24 hours of another triptan or ergot derivative.

Carbamazepine:
May interact with domperidone; monitor for increased sedation or side effects.
Carbamazepine can induce its own metabolism and that of other drugs, potentially reducing efficacy.",
	129:"Tamoxifen:
Metabolized by CYP2D6; caution with concomitant use of strong CYP2D6 inhibitors (e.g., fluoxetine, paroxetine) as they may reduce tamoxifen efficacy.
Consideration for drugs affecting estrogen levels (e.g., hormonal contraceptives) and their potential interactions with tamoxifen’s mechanism of action.",
	130:"Calcium Carbonate:
May decrease the absorption of certain medications such as tetracyclines and fluoroquinolones; advised to space dosing accordingly.
Monitor for potential hypercalcemia if taking other calcium supplements.

Aescin (Reparil):
Generally considered safe with most medications; however, caution is advised in patients taking anticoagulants due to potential effects on blood clotting.",
	131:"Acyclovir:
Minimal systemic absorption when used topically; therefore, drug interactions are rare.
Avoid concomitant nephrotoxic drugs if oral therapy is initiated due to potential renal impairment.

Sunsola Gel:
Topical use, no significant systemic absorption or interactions anticipated.",
	132:"Nexium + Domperidone:
Minimal interaction but may enhance motility, improving GERD symptoms.

Nexium + Sulpiride:
Potential increase in plasma levels of Sulpiride due to reduced gastric acidity, leading to enhanced effects.

Domperidone + Ondansetron:
Both drugs may prolong QT interval; caution in patients with a history of cardiac arrhythmias.

Overall Monitoring:
Monitor for symptoms of QT prolongation, such as dizziness or palpitations.",
	133:"Gemifloxacin + Omeprazole:
Reduced absorption of Gemifloxacin when combined with PPIs; advise administration at least 2 hours apart.

Omeprazole + Dexamethasone:
Both may increase the risk of hypomagnesemia; monitor electrolyte levels during prolonged use.

Chlorpheniramine + Dexamethasone:
Risk of additive CNS depressant effects; advise against operating heavy machinery or consuming alcohol.",
	134:"MEKAKO (Acne Soap):
Antibacterial and cleansing agent to manage acne by reducing bacterial load and oil production.
Instructions: Use twice daily (morning and evening) on affected areas, followed by rinsing with lukewarm water.

MAREXAL (Skin Moisturizing Cream):
Hydrating cream to restore the skin barrier and combat dryness caused by acne treatments.
Instructions: Apply to clean, dry skin once daily or as needed, avoiding areas with active acne.",
	135:"OLFEN + EPICOTIL (NSAID Overlap):
Increased risk of gastrointestinal irritation, ulceration, and bleeding.
Recommendation: Use gastroprotective agents such as proton pump inhibitors (e.g., omeprazole) and avoid prolonged dual NSAID use.

MULTIRELAX + OLFEN/EPICOTIL:
Potential additive sedation effects; caution advised with activities requiring alertness.

MASSAGIL + Systemic NSAIDs:
No systemic interactions; complementary for localized symptom relief.",
	136:"No significant interactions with current medications; however, patients should avoid medications like corticosteroids or certain beta-blockers as they may interfere with glycemic control.
Advise against alcohol consumption, as it may cause hypoglycemia.",
	137:"Possible Interactions:
Avoid concomitant use of gonadotropins with other hormonal therapies unless directed by the physician.
Caution when combining with medications that affect the pituitary-gonadal axis, such as certain corticosteroids or thyroid medications.",
	138:"Ibuprofen + Paracetamol: May be alternated for fever management, but avoid simultaneous administration to prevent overdose or adverse effects.
Ibuprofen + Cefotaxime: Minimal risk, but monitor for signs of gastrointestinal upset.
Pseudoephedrine: Avoid use close to bedtime to minimize restlessness or insomnia.",
	139:"Prednisolone + Vitamin A Palmitate:
No significant interaction; both support healing and inflammation reduction.
Long-term use of corticosteroids like OPTIPRED should be monitored for increased intraocular pressure or cataract formation.",
	140:"Digoxin + Amiodarone:
Amiodarone increases serum Digoxin levels, raising the risk of Digoxin toxicity. Close monitoring of Digoxin levels is required.

Warfarin + Amiodarone:
Amiodarone potentiates the anticoagulant effect of Warfarin, increasing the risk of bleeding. Regular INR monitoring is essential.

Digoxin + Furosemide (component of LASILACTONE):
Furosemide may cause hypokalemia, enhancing the risk of Digoxin toxicity. Monitor potassium levels closely.

Warfarin + Piracetam (component of CERVITAM):
Piracetam may have antiplatelet effects, increasing the risk of bleeding when combined with Warfarin.",
	141:"EUCARBON (Activated Charcoal):
Can adsorb other medications, reducing their efficacy if taken concurrently. It’s important to space out EUCARBON from other medications by at least 2 hours.

B Complex Vitamins:
Generally safe with most medications but should be monitored for any possible allergic reactions or gastrointestinal upset.",
	142:"Ofloxacin:
May interact with antacids or supplements containing calcium, magnesium, or aluminum, reducing its absorption. It should be taken 2 hours apart from these products.

Carbinoxamine + Ephedrine + Pholcodine:
Caution should be taken with other CNS depressants (e.g., alcohol, benzodiazepines) as this combination may increase sedative effects.

Ethamsylate and Tranexamic Acid:
Both have anticoagulant properties, and caution should be taken in patients with a history of clotting disorders or when combined with other anticoagulants.",
	143:"Chlorzoxazone:
May increase the effects of other central nervous system depressants (e.g., alcohol, benzodiazepines). Caution is advised in patients who are using these substances concurrently.
Risk of liver toxicity, especially in patients with pre-existing liver conditions or those who consume alcohol regularly.

Paracetamol:
Excessive alcohol consumption may increase the risk of liver damage. The patient should be advised to limit alcohol intake while taking this medication.
Caution should be exercised if the patient is taking other medications that contain paracetamol to avoid overdose.",
	144:"Azithromycin:
Potential for increased effects of anticoagulants (e.g., warfarin). Monitor INR if the patient is taking warfarin concurrently.
May interact with drugs that are metabolized by cytochrome P450 enzymes (CYP3A4).

Diclofenac Sodium:
Caution advised when used with other NSAIDs or anticoagulants due to increased risk of gastrointestinal bleeding and renal impairment.
Can potentially reduce the effectiveness of antihypertensive medications.

Multivitamins + Minerals:
Generally considered safe; however, iron supplements can interfere with the absorption of certain antibiotics. Ensure that there is no iron in the multivitamins if azithromycin is taken at the same time.",
	145:"",
	146:"",
	147:"",
	148:"",
	149:"",
	150:"",
	151:"",
	152:"",
	153:"",
	154:"",
	155:"",
	156:"",
	157:"",
	158:"",
	159:"",
	160:"",
	161:"",
	162:"",
	163:"",
	164:"",
	165:"",
	166:"",
	167:"",
	168:"",
	169:"",
	170:"",
	171:"",
	172:"",
	173:"",
	174:"",
	175:"",
	176:"",
	177:"",
	178:"",
	179:"",
	180:"",
	181:"",
	182:"",
	183:"",
	184:"",
	185:"",
	186:"",
	187:"",
	188:"",
	189:"",
	190:"",
	191:"",
	192:"",
	193:"",
	194:"",
	195:"",
	196:"",
	197:"",
	198:"",
	199:"",
	200:"",
	201:"",
	202:"",
	203:"",
	204:"",
	205:"",
	206:"",
	207:"",
	208:"",
	209:"",
	210:"",
	211:"",
	212:"",
	213:"",
	214:"",
	215:"",
	216:"",
	217:"",
	218:"",
	219:"",
	220:"",
	221:"",
	222:"",
	223:"",
	224:"",
	225:"",
	226:"",
	227:"",
	228:"",
	229:"",
	230:"",
	231:"",
	232:"",
	233:"",
	234:"",
	235:"",
	236:"",
	237:"",
	238:"",
	239:"",
	240:"",
	241:"",
	242:"",
	243:"",
	244:"",
	245:"",
	246:"",
	247:"",
	248:"",
	249:"",
	250:"",
}

var parent :Node

func _on_button_button_down() -> void:
	hide()
	ScriptGlobal.get_node("BackAudio").play()
	%RichTextLabel.scroll_to_line(0)
	parent = get_parent()
	parent.get_node("VirtualKeyboard/SolvingPanel/VBoxContainer/LineEdit").grab_focus()
