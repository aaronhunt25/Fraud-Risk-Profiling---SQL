select count(*) 
	from insurance_claims_dataset -- Expect 50000

	
select count(distinct "Claim_ID") as "distinct_count" 
	from insurance_claims_dataset -- 50000 : No Duplicates

	
-- Outliers : Claim_Amount
select min("Claim_Amount") as "MIN_CLAIM",
	max("Claim_Amount") as "MAX_CLAIM",
	round(percentile_cont(0.5) within group(order by "Claim_Amount")::numeric, 2) as "MEDIAN_CLAIM"
	from insurance_claims_dataset
-- "MIN_CLAIM" = 501.24, "MAX_CLAIM" = 49999.78, "MEDIAN_CLAIM" = 25059.06

	
-- Outliers : Premium_Amount
select min("Premium_Amount") as "MIN_PREMIUM",
	max("Premium_Amount") as "MAX_PREMIUM",
	round(percentile_cont(0.5) within group(order by "Premium_Amount"):: numeric, 2) as "MEDIAN_PREMIUM"
	from insurance_claims_dataset
-- "MIN_PREMIUM" = 200.05, "MAX_PREMIUM" = 4999.86, "MEDIAN_PREMIUM" = 2599.50
	
	
-- Outliers : Coverage_Amount
select min("Coverage_Amount") as "MIN_COVERAGE",
	max("Coverage_Amount") as "MAX_COVERAGE",
	round(percentile_cont(0.5) within group( order by "Coverage_Amount"):: numeric, 2) as "MEDIAN_COVERAGE"
	from insurance_claims_dataset
-- "MIN_COVERAGE" = 5001.71, "MAX_COVERAGE" = 99996.47, "MEDIAN_COVERAGE" = 52643.88

	
-- Average : Claim_Amount : Gender
select distinct "Gender",
	round(avg("Claim_Amount"):: numeric, 2) as "AVG_CLAIM_AMOUNT"
	from insurance_claims_dataset 
	group by "Gender"
-- Female : AVG_CLAIM_AMOUNT = 24967.27, Male : AVG_CLAIM_AMOUNT = 25205.62
		
	
-- Total Volume : Claim_Amouint : Gender
select distinct "Gender",
	sum("Claim_Amount") as "TOTAL_CLAIM_AMOUNT"
	from insurance_claims_dataset
	group by "Gender"
-- Female : "TOTAL_CLAIM_AMOUNT" = 622856000, Male : "TOTAL_CLAIM_AMOUNT" = 631478000
		
	
-- Average : Claim_Amount : Region
select distinct "Region",
	round(avg("Claim_Amount"):: numeric, 2) as "AVG_CLAIM_AMOUNT"
	from insurance_claims_dataset 
	group by "Region"
-- North : "AVG_CLAIM_AMOUNT" = 24948.08, South : "AVG_CLAIM_AMOUNT" = 25091.39, East : "AVG_CLAIM_AMOUNT" = 25090.75, West : "AVG_CLAIM_AMOUNT" = 25217.05,

	
-- Total Volume : Claim_Amouint : Region
select distinct "Region",
	sum("Claim_Amount") as "TOTAL_CLAIM_AMOUNT"
	from insurance_claims_dataset
	group by "Region"
-- North : "TOTAL_CLAIM_AMOUNT" = 310703000, South : "TOTAL_CLAIM_AMOUNT" = 313969000, East : "TOTAL_CLAIM_AMOUNT" = 316946000, West : "TOTAL_CLAIM_AMOUNT" = 312717000
	
	
-- Average : Claim_Amount : Policy_Type
select distinct "Policy_Type",
	round(avg("Claim_Amount"):: numeric, 2) as "AVG_CLAIM_AMOUNT" 
	from insurance_claims_dataset
	group by "Policy_Type"
-- Auto : "AVG_CLAIM_AMOUNT" = 25242.45, Health : "AVG_CLAIM_AMOUNT" = 25025.30, Home : "AVG_CLAIM_AMOUNT" = 25189.00, Life : "AVG_CLAIM_AMOUNT" = 24890.19
	
	
-- Total Volume : Claim_Amount : Policy_Type
select distinct "Policy_Type",
	sum("Claim_Amount") as "TOTAL_CLAIM_AMOUNT"
	from insurance_claims_dataset
	group by "Policy_Type"
-- Auto : "TOTAL_CLAIM_AMOUNT" = 317221792, Health : "TOTAL_CLAIM_AMOUNT" = 312490944, Home : "TOTAL_CLAIM_AMOUNT" = 312872928, Life : "TOTAL_CLAIM_AMOUNT" = 311749568

	
-- Average : Claim_Amount : Age
select distinct "Age",
	round(avg("Claim_Amount"):: numeric, 2) as "AVG_CLAIM_AMOUNT"
	from insurance_claims_dataset
	group by "Age"
	order by "AVG_CLAIM_AMOUNT"
-- Too many to type out
-- Get the MIN and MAX instead
select distinct "Age",
	round(avg("Claim_Amount"):: numeric, 2) as "AVG_CLAIM_AMOUNT"
	from insurance_claims_dataset
	group by "Age"
	order by "AVG_CLAIM_AMOUNT" desc
-- MIN(AVG_CLAIM_AMOUNT) = 22857.46 : Age = 53, MAX(AVG_CLAIM_AMOUNT) = 26334.95 : Age = 26
	
	
-- Total Volume : Claim_Amount : Age
select distinct "Age",
	sum("Claim_Amount") as "TOTAL_CLAIM_AMOUNT"
	from insurance_claims_dataset
	group by "Age"
	order by "TOTAL_CLAIM_AMOUNT" 
-- Too many to type out
-- Get the MIN and MAX instead
select distinct "Age",
	sum("Claim_Amount") as "TOTAL_CLAIM_AMOUNT"
	from insurance_claims_dataset
	group by "Age"
	order by "TOTAL_CLAIM_AMOUNT" desc
-- MIN(TOTAL_CLAIM_AMOUNT) = 17577382 : Age = 53, MAX(TOTAL_CLAIM_AMOUNT) = 21849436 : Age = 37
	

-- CLAIMS / COVERAGE RATIO
select 
	round(avg("Claim_Amount" / "Coverage_Amount"):: numeric, 2) as "CLAIMS_COVERAGE_RATIO"
	from insurance_claims_dataset
-- "CLAIMS_COVERAGE_RATIO" = 0.79
	

	
	
	
		