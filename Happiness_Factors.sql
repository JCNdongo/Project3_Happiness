

CREATE TABLE "Happiness" (
    "Country" VARCHAR(100)   NOT NULL,
    "Happiness_Score" FLOAT   NOT NULL,
    "GDP_per_capita" FLOAT   NOT NULL,
    "Social_support" FLOAT   NOT NULL,
    "Healthy_life_expectancy" FLOAT   NOT NULL,
    "Corruption" FLOAT   NOT NULL,
    "Id" INT   NOT NULL
);

CREATE TABLE "Freedom" (
    "Id" INT   NOT NULL,
    "Country" VARCHAR(100)   NOT NULL,
    "Freedom_Score" FLOAT   NOT NULL,
    "Property_Rights" FLOAT   NOT NULL,
    "Government_Spending" FLOAT   NOT NULL,
    "Business" FLOAT   NOT NULL,
    "Trade" FLOAT   NOT NULL,
    "Investment" FLOAT   NOT NULL
);

CREATE TABLE "Crime" (
    "rank" INT   NOT NULL,
    "Country" VARCHAR(100)   NOT NULL,
    "Crime_Index" INT   NOT NULL,
    "Population" FLOAT   NOT NULL,
    "Id" INT   NOT NULL
);

CREATE TABLE "Happiness_Factors" AS
SELECT
    happiness."Country",
    happiness."Happiness_Score",
    happiness."GDP_per_capita",
    happiness."Social_support",
    happiness."Healthy_life_expectancy",
    happiness."Corruption",
    happiness."Id",
    freedom."Freedom_Score",
    freedom."Property_Rights",
    freedom."Government_Spending",
    freedom."Business",
    freedom."Trade",
    freedom."Investment",
    crime."rank",
    crime."Crime_Index",
    crime."Population"
FROM "Happiness" happiness
JOIN "Freedom" freedom ON happiness."Id" = freedom."Id"
JOIN "Crime" crime ON happiness."Id" = crime."Id";

SELECT *
FROM "Happiness_Factors"
LIMIT 5;