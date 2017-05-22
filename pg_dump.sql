--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: housing_survey; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE housing_survey WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


\connect housing_survey

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: skanda; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA skanda;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = skanda, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: survey_questions; Type: TABLE; Schema: skanda; Owner: -
--

CREATE TABLE survey_questions (
    questionnaire json NOT NULL,
    choicelists json NOT NULL,
    id bigint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    version double precision,
    author character varying,
    project character varying NOT NULL,
    city character varying NOT NULL,
    org character varying NOT NULL
);


--
-- Name: survey_questions_id_seq; Type: SEQUENCE; Schema: skanda; Owner: -
--

CREATE SEQUENCE survey_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: survey_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: skanda; Owner: -
--

ALTER SEQUENCE survey_questions_id_seq OWNED BY survey_questions.id;


--
-- Name: survey_raw; Type: TABLE; Schema: skanda; Owner: -
--

CREATE TABLE survey_raw (
    id bigint NOT NULL,
    data json NOT NULL
);


--
-- Name: survey_raw_id_seq; Type: SEQUENCE; Schema: skanda; Owner: -
--

CREATE SEQUENCE survey_raw_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: survey_raw_id_seq; Type: SEQUENCE OWNED BY; Schema: skanda; Owner: -
--

ALTER SEQUENCE survey_raw_id_seq OWNED BY survey_raw.id;


--
-- Name: survey_questions id; Type: DEFAULT; Schema: skanda; Owner: -
--

ALTER TABLE ONLY survey_questions ALTER COLUMN id SET DEFAULT nextval('survey_questions_id_seq'::regclass);


--
-- Name: survey_raw id; Type: DEFAULT; Schema: skanda; Owner: -
--

ALTER TABLE ONLY survey_raw ALTER COLUMN id SET DEFAULT nextval('survey_raw_id_seq'::regclass);


--
-- Data for Name: survey_questions; Type: TABLE DATA; Schema: skanda; Owner: -
--

COPY survey_questions (questionnaire, choicelists, id, "timestamp", version, author, project, city, org) FROM stdin;
{"resources":{"groups":{"group":[{"_attr":{"name":"general_info","no":"I"},"gtext":"General Information","question":[{"q":"1","_attr":{"name":"name_of_slum"},"qtext":"Name of Slum","qtype":"T","qhint":"","req":"T","uid":"T"},{"q":"2","_attr":{"name":"location_ward_name"},"qtext":"Location - Ward No / Name","qtype":"T","qhint":"","req":"T","uid":"T"},{"q":"3","_attr":{"name":"house_flat_door_no"},"qtext":"House / Flat / Door No","qtype":"T","qhint":"","req":"T","uid":"T"}]},{"_attr":{"name":"household_general_info","no":"II"},"gtext":"Household level general information","question":[{"q":"4","_attr":{"name":"name_of_head"},"qtext":"Name of head of family","qtype":"T","qhint":"","req":"T"},{"q":"5","_attr":{"name":"fathers_name"},"qtext":"Father's name","qtype":"T","qhint":"Name of head of family's father","req":"F"},{"q":"6","_attr":{"name":"sex"},"qtext":"Sex","qtype":"SC","qhint":"Select one","req":"T","choicelist":"sex","dependencies":{"02":"10"}},{"q":"7","_attr":{"name":"caste"},"qtext":"Caste","qtype":"SC","qhint":"Select one","req":"T","choicelist":"caste"},{"q":"8","_attr":{"name":"religion"},"qtext":"Religion","qtype":"SC","qhint":"Select one","req":"T","choicelist":"religion"},{"q":"9","_attr":{"name":"minority_status"},"qtext":"Minority status in State/UT","qtype":"SC","qhint":"Select one","req":"T","choicelist":"minority_status"},{"q":"10","_attr":{"name":"female_head_status"},"qtext":"If female headed household, status of female head","qtype":"SC","qhint":"Select one","inv":"T","req":"T","choicelist":"female_head_status"},{"q":"11","_attr":{"name":"family_members"},"qtext":"No of family members","qtype":"S","qhint":"","req":"T","factor":[{"ftext":"Male","fcode":"01"},{"ftext":"Female","fcode":"02"}]},{"q":"12","_attr":{"name":"illiterate_adult_members"},"qtext":"No of illiterate adult members","qtype":"S","qhint":"","req":"T","factor":[{"ftext":"Male","fcode":"01"},{"ftext":"Female","fcode":"02"}]},{"q":"13","_attr":{"name":"unattending_children"},"qtext":"No of children in age-group 6-14 not attending school","qtype":"S","qhint":"","req":"T","factor":[{"ftext":"Male","fcode":"01"},{"ftext":"Female","fcode":"02"}]},{"q":"14","_attr":{"name":"disabled_members"},"qtext":"No of family members with disabilities","qtype":"S","qhint":"","req":"T","factor":[{"ftext":"Physical","fcode":"01"},{"ftext":"Mental","fcode":"02"}]},{"q":"15","_attr":{"name":"earning_female_status"},"qtext":"If major earning member is female, whether","qtype":"SC","qhint":"Select one","req":"F","choicelist":"female_head_status"},{"q":"16","_attr":{"name":"below_poverty_line"},"qtext":"Is your family below poverty line","qtype":"SC","qhint":"Select one","req":"T","dependencies":{"01":"17"},"choicelist":"yes_no"},{"q":"17","_attr":{"name":"have_bpl_card"},"qtext":"Does the family possess BPL card","qtype":"SC","qhint":"Select one","req":"T","choicelist":"yes_no"}]},{"_attr":{"name":"household_detailed_info","no":"III"},"gtext":"Household level detailed information","question":[{"q":"18","_attr":{"name":"tenure_status"},"qtext":"Land tenure status","qtype":"SC","qhint":"Select one","req":"T","choicelist":"tenure_status"},{"q":"19","_attr":{"name":"house_type"},"qtext":"Type / Structure of house","qtype":"SC","qhint":"Select one","req":"T","choicelist":"house_type"},{"q":"20","_attr":{"name":"roof_type"},"qtext":"Type of roof","qtype":"MC","qhint":"Select all applicable","req":"T","choicelist":"roof_type"},{"q":"21","_attr":{"name":"floor_type"},"qtext":"Type of flooring","qtype":"MC","qhint":"Select all applicable","req":"T","choicelist":"floor_type"},{"q":"22","_attr":{"name":"house_lighting"},"qtext":"House lighting","qtype":"SC","qhint":"Select one","req":"T","choicelist":"house_lighting"},{"q":"23","_attr":{"name":"cooking_fuel"},"qtext":"Fuel for cooking","qtype":"SC","qhint":"Select one","req":"T","choicelist":"cooking_fuel"},{"q":"24a","_attr":{"name":"drinking_water_source"},"qtext":"Source of drinking water","qtype":"SC","qhint":"Select one","req":"T","choicelist":"drinking_water_source","dependencies":{"01":"24b","04":"25","05":"25","06":"25","07":"25","08":"25"}},{"q":"24b","_attr":{"name":"water_supply_duration"},"qtext":"Duration of water supply","qtype":"SC","qhint":"Select one","req":"T","inv":"T","choicelist":"water_supply_duration"},{"q":"25","_attr":{"name":"distance_from_source"},"qtext":"Distance from drinking water source","qtype":"SC","qhint":"Select one","req":"T","inv":"T","choicelist":"distance_from_source"},{"q":"26","_attr":{"name":"toilet_facility"},"qtext":"Existence of toilet facility","qtype":"SC","qhint":"Select one","req":"T","choicelist":"toilet_facility"},{"q":"27","_attr":{"name":"bathroom_facility"},"qtext":"Existence of bathroom facility","qtype":"SC","qhint":"Select one","req":"T","choicelist":"bathroom_facility"},{"q":"28","_attr":{"name":"front_road"},"qtext":"Road in front of house","qtype":"SC","qhint":"Select one","req":"T","choicelist":"front_road"},{"q":"29","_attr":{"name":"pre_school_availability"},"qtext":"Type of pre-school available","qtype":"MC","qhint":"Select all applicable","req":"T","choicelist":"education_facility"},{"q":"30","_attr":{"name":"primary_school_availability"},"qtext":"Type of primary school available","qtype":"MC","qhint":"Select all applicable","req":"T","choicelist":"education_facility"},{"q":"31","_attr":{"name":"high_school_availability"},"qtext":"Type of high school available","qtype":"MC","qhint":"Select all applicable","req":"T","choicelist":"education_facility"},{"q":"32","_attr":{"name":"health_facility_access"},"qtext":"Type of health facility access","qtype":"MC","qhint":"Select all applicable","req":"T","choicelist":"health_facility"},{"q":"33","_attr":{"name":"welfare_benefits_access"},"qtext":"Access to welfare benefits by any family member","qtype":"MC","qhint":"Select all applicable","req":"T","choicelist":"welfare_benefits"},{"q":"34","_attr":{"name":"consumer_durables"},"qtext":"Consumer durables","qtype":"MC","qhint":"Select all applicable","req":"T","choicelist":"consumer_durables"},{"q":"35a","_attr":{"name":"live_stock"},"qtext":"Live stock","qtype":"SC","qhint":"Select one","req":"T","choicelist":"yes_no","dependencies":{"01":"35b"}},{"q":"35b","_attr":{"name":"livestock_types"},"qtext":"Type of livestock","qtype":"MC","qhint":"Select all applicable","req":"T","inv":"T","choicelist":"livestock_types"}]},{"_attr":{"name":"migration_details","no":"IV"},"gtext":"Migration details of household, if applicable","question":[{"q":"36x","_attr":{"name":"whether_migrated"},"qtext":"Whether the head of family migrated to city/town","qtype":"SC","qhint":"Select one","req":"T","choicelist":"yes_no","dependencies":{"01":["36","37","38","39"]}},{"q":"36","_attr":{"name":"years_of_stay"},"qtext":"Number of years of stay in this town/city","qtype":"SC","qhint":"Select one","req":"T","inv":"T","choicelist":"years_of_stay"},{"q":"37","_attr":{"name":"migrated_from"},"qtext":"Whether migrated from","qtype":"SC","qhint":"Select one","req":"T","inv":"T","choicelist":"migrated_from"},{"q":"38","_attr":{"name":"migration_type"},"qtext":"Type of migration","qtype":"SC","qhint":"Select one","req":"T","inv":"T","choicelist":"migration_type"},{"q":"39","_attr":{"name":"reasons_for_migration"},"qtext":"Reasons for migration","qtype":"MC","qhint":"Select all applicable","req":"T","inv":"T","choicelist":"reasons_for_migration"}]},{"_attr":{"name":"income_expenditure_details","no":"V"},"gtext":"Income-expenditure details of household","question":[{"q":"40","_attr":{"name":"no_earning_adults"},"qtext":"Number of earning adult members","qtype":"S","qhint":"","req":"T","factor":[{"ftext":"Male","fcode":"01"},{"ftext":"Female","fcode":"02"}]},{"q":"41","_attr":{"name":"no_earning_nonadults"},"qtext":"Number of earning non-adult members","qtype":"S","qhint":"","req":"T","factor":[{"ftext":"Male","fcode":"01"},{"ftext":"Female","fcode":"02"}]},{"q":"42","_attr":{"name":"avg_monthly_income"},"qtext":"Average monthly income of household","qtype":"N","qhint":"Rupees","req":"T"},{"q":"43","_attr":{"name":"avg_monthly_expenditure"},"qtext":"Average monthly expenditure of household","qtype":"N","qhint":"Rupees","req":"T"},{"q":"44","_attr":{"name":"outstanding_debt"},"qtext":"Debt outstanding as on the date of survey","qtype":"N","qhint":"Rupees","req":"T"}]},{"_attr":{"name":"earning_member_details","_no":"VI"},"gtext":"Details of earning members of the household","rchunk":[{"_attr":{"name":"earning_member_repeatable"},"rtext":"Earning member details","rsize":"No. of earning members","rlimit":"20","rquestion":[{"q":"45","_attr":{"name":"general_details"},"qtext":"General details","qtype":"P"},{"q":"45.a","_attr":{"name":"earning_member_name"},"qtext":"Name of earning member","qtype":"T","qhint":"","req":"T","parent":"45"},{"q":"45.b","_attr":{"name":"relation_to_head"},"qtext":"Relation to head of family","qtype":"T","qhint":"","req":"T","parent":"45"},{"q":"45.c","_attr":{"name":"earning_member_age"},"qtext":"Age","qtype":"N","qhint":"","req":"T","parent":"45"},{"q":"45.d","_attr":{"name":"earning_member_sex"},"qtext":"Sex","qtype":"SC","qhint":"Select one","req":"T","parent":"45","choicelist":"sex"},{"q":"45.e","_attr":{"name":"caste"},"qtext":"Caste","qtype":"SC","qhint":"Select one","req":"T","parent":"45","choicelist":"caste"},{"q":"45.f","_attr":{"name":"religion"},"qtext":"Religion","qtype":"SC","qhint":"Select one","req":"T","parent":"45","choicelist":"religion"},{"q":"46","_attr":{"name":"education_training"},"qtext":"Education & training details","qtype":"P"},{"q":"46.g","_attr":{"name":"education_qualification"},"qtext":"Education qualification","qtype":"SC","qhint":"Highest level","req":"T","parent":"46","choicelist":"education_qualification"},{"q":"46.h","_attr":{"name":"skill_training"},"qtext":"Skill training acquired","qtype":"SC","qhint":"Select one","req":"T","parent":"46","choicelist":"skill_training"},{"q":"46.i","_attr":{"name":"training_institute"},"qtext":"Type of institution from whom skill training received, if applicable","qtype":"SC","qhint":"Select one","req":"F","parent":"46","choicelist":"training_institute"},{"q":"47","_attr":{"name":"employement_earning"},"qtext":"Employment & earning details","qtype":"P"},{"q":"47.j","_attr":{"name":"employment_status"},"qtext":"Employment status","qtype":"SC","qhint":"Select one","req":"T","parent":"47","choicelist":"employment_status"},{"q":"47.k","_attr":{"name":"place_of_work"},"qtext":"Place of work","qtype":"SC","qhint":"Select one","req":"T","parent":"47","choicelist":"place_of_work"},{"q":"47.l","_attr":{"name":"time_of_work"},"qtext":"Time of work","qtype":"SC","qhint":"Select one","req":"T","parent":"47","choicelist":"time_of_work"},{"q":"47.m","_attr":{"name":"monthly_earning"},"qtext":"Monthly earning","qtype":"SC","qhint":"Select one","req":"T","parent":"47","choicelist":"monthly_earning"}]}]},{"_attr":{"name":"livelihood_details","no":"VII"},"gtext":"Livelihood details of household","question":[{"q":"48","_attr":{"name":"livelihood_source"},"qtext":"Source of earning/livelihood","qtype":"P"},{"q":"48.1","_attr":{"name":"male_earners"},"qtext":"Male earners","qtype":"P","parent":"48"},{"q":"48.1.a","qtext":"Primary occupation","qtype":"SC","qhint":"Select one","req":"T","choicelist":"occupation"},{"q":"48.1.b","qtext":"Secondary occupation","qtype":"SC","qhint":"Select one","req":"T","choicelist":"occupation"},{"q":"48.2","_attr":{"name":"female_earners"},"qtext":"Female earners","qtype":"P","parent":"48"},{"q":"48.2.a","qtext":"Primary occupation","qtype":"SC","qhint":"Select one","req":"T","choicelist":"occupation"},{"q":"48.2.b","qtext":"Secondary occupation","qtype":"SC","qhint":"Select one","req":"T","choicelist":"occupation"},{"q":"49","_attr":{"name":"unemployment_reasons"},"qtext":"Main reason for unemployment of unemployed member, if any","qtype":"SC","qhint":"Select one","req":"F","choicelist":"unemployment_reasons"},{"q":"50","_attr":{"name":"preferred_training"},"qtext":"Preferred area for training / skill enhancement","qtype":"P"},{"q":"50.1","_attr":{"name":"male_earners"},"qtext":"Male earners","qtype":"P","parent":"50"},{"q":"50.1.a","qtext":"For primary occupation","qtype":"SC","qhint":"Select one","req":"T","choicelist":"preferred_training"},{"q":"50.1.b","qtext":"For secondary occupation","qtype":"SC","qhint":"Select one","req":"T","choicelist":"preferred_training"},{"q":"50.2","_attr":{"name":"female_earners"},"qtext":"Female earners","qtype":"P","parent":"50"},{"q":"50.2.a","qtext":"For primary occupation","qtype":"SC","qhint":"Select one","req":"T","choicelist":"preferred_training"},{"q":"50.2.b","qtext":"For secondary occupation","qtype":"SC","qhint":"Select one","req":"T","choicelist":"preferred_training"}]}]}}}	{"choicelists":{"sex":{"choices":{"choice":[{"ctext":"Male","ccode":"01"},{"ctext":"Female","ccode":"02"},{"ctext":"Other","ccode":"03"}]}},"caste":{"choices":{"choice":[{"ctext":"General","ccode":"01"},{"ctext":"SC","ccode":"02"},{"ctext":"ST","ccode":"03"},{"ctext":"OBC","ccode":"04"}]}},"religion":{"choices":{"choice":[{"ctext":"Hindu","ccode":"01"},{"ctext":"Muslim","ccode":"02"},{"ctext":"Christian","ccode":"03"},{"ctext":"Sikh","ccode":"04"},{"ctext":"Jainism","ccode":"05"},{"ctext":"Buddhism","ccode":"06"},{"ctext":"Zoroastrianism","ccode":"07"},{"ctext":"Others","ccode":"49"}]}},"minority_status":{"choices":{"choice":[{"ctext":"Non-minority","ccode":"01"},{"ctext":"Minority","ccode":"02"}]}},"female_head_status":{"choices":{"choice":[{"ctext":"Married","ccode":"01"},{"ctext":"Widowed","ccode":"02"},{"ctext":"Abandoned/Single","ccode":"03"},{"ctext":"Divorced","ccode":"04"},{"ctext":"Unwed mother","ccode":"05"},{"ctext":"Other","ccode":"49"}]}},"yes_no":{"choices":{"choice":[{"ctext":"Yes","ccode":"01"},{"ctext":"No","ccode":"02"},{"ctext":"Don't know","ccode":"99"}]}},"tenure_status":{"choices":{"choice":[{"ctext":"Patta","ccode":"01"},{"ctext":"Possession certificate / Occupancy right","ccode":"02"},{"ctext":"Private land encroached","ccode":"03"},{"ctext":"Public land encroached","ccode":"04"},{"ctext":"Rented","ccode":"05"},{"ctext":"Other","ccode":"49"}]}},"house_type":{"choices":{"choice":[{"ctext":"Pucca","ccode":"01"},{"ctext":"Semi-pucca","ccode":"02"},{"ctext":"Katcha","ccode":"03"}]}},"roof_type":{"choices":{"choice":[{"ctext":"Grass / thatched","ccode":"01"},{"ctext":"Tarpaulin","ccode":"02"},{"ctext":"Wooden","ccode":"03"},{"ctext":"Asbestos","ccode":"04"},{"ctext":"Tiled","ccode":"05"},{"ctext":"Cement / concrete slab","ccode":"06"},{"ctext":"Other","ccode":"49"}]}},"floor_type":{"choices":{"choice":[{"ctext":"Mud","ccode":"01"},{"ctext":"Brick","ccode":"02"},{"ctext":"Stone","ccode":"03"},{"ctext":"Cement","ccode":"04"},{"ctext":"Tiles","ccode":"05"},{"ctext":"Other","ccode":"49"}]}},"house_lighting":{"choices":{"choice":[{"ctext":"Electricity connection","ccode":"01"},{"ctext":"Kerosene","ccode":"02"},{"ctext":"Firewood","ccode":"03"},{"ctext":"Other","ccode":"49"}]}},"cooking_fuel":{"choices":{"choice":[{"ctext":"Gas","ccode":"01"},{"ctext":"Electricity","ccode":"02"},{"ctext":"Kerosene","ccode":"03"},{"ctext":"Charcoal","ccode":"04"},{"ctext":"Firewood","ccode":"05"},{"ctext":"Other","ccode":"49"}]}},"drinking_water_source":{"choices":{"choice":[{"ctext":"Tap within premises","ccode":"01"},{"ctext":"Tubewell / handpump within premises","ccode":"02"},{"ctext":"Open well within premises","ccode":"03"},{"ctext":"Public tap","ccode":"04"},{"ctext":"Tubewell / borewell / handpump outside premises","ccode":"05"},{"ctext":"Open well outside premises","ccode":"06"},{"ctext":"Tank / pond","ccode":"07"},{"ctext":"River / canal / lake / spring","ccode":"08"},{"ctext":"Water tanker","ccode":"09"},{"ctext":"Other","ccode":"49"}]}},"water_supply_duration":{"choices":{"choice":[{"ctext":"Less than 1 hour daily","ccode":"01"},{"ctext":"1 - 2 hrs daily","ccode":"02"},{"ctext":"More than 2 hrs daily","ccode":"03"},{"ctext":"Once a week","ccode":"04"},{"ctext":"Twice a week","ccode":"05"},{"ctext":"Not regular","ccode":"06"},{"ctext":"No supply","ccode":"99"}]}},"distance_from_source":{"choices":{"choice":[{"ctext":"Less than 0.5km","ccode":"01"},{"ctext":"0.5 to 1km","ccode":"02"},{"ctext":"1 to 2km","ccode":"03"},{"ctext":"2 to 5km","ccode":"04"},{"ctext":"More than 5km","ccode":"05"}]}},"toilet_facility":{"choices":{"choice":[{"ctext":"Own septic tank / flush latrine","ccode":"01"},{"ctext":"Own dry latrine","ccode":"02"},{"ctext":"Shared septic tank / flush latrine","ccode":"03"},{"ctext":"Shared dry latrine","ccode":"04"},{"ctext":"Community septic tank / flush latrine","ccode":"05"},{"ctext":"Community dry latrine","ccode":"06"},{"ctext":"Open defecation","ccode":"07"}]}},"bathroom_facility":{"choices":{"choice":[{"ctext":"Within premises","ccode":"01"},{"ctext":"Outside premises","ccode":"02"},{"ctext":"Community bath","ccode":"03"},{"ctext":"No bathroom","ccode":"04"}]}},"front_road":{"choices":{"choice":[{"ctext":"Motorable pucca","ccode":"01"},{"ctext":"Motorable katcha","ccode":"02"},{"ctext":"Non-motorable pucca","ccode":"03"},{"ctext":"Non-motorable katcha","ccode":"04"}]}},"education_facility":{"choices":{"choice":[{"ctext":"Municipal","ccode":"01"},{"ctext":"Government","ccode":"02"},{"ctext":"Private","ccode":"03"}]}},"health_facility":{"choices":{"choice":[{"ctext":"Primary health centre","ccode":"01"},{"ctext":"Government hospital","ccode":"02"},{"ctext":"Maternity centre","ccode":"03"},{"ctext":"Private clinic","ccode":"04"},{"ctext":"Rural medical practitioner (RMP)","ccode":"05"},{"ctext":"Ayurvedic doctor / Vaidya","ccode":"06"}]}},"welfare_benefits":{"choices":{"choice":[{"ctext":"Old age pension","ccode":"01"},{"ctext":"Widow pension","ccode":"02"},{"ctext":"Disabled pension","ccode":"03"},{"ctext":"Health insurance","ccode":"04"},{"ctext":"General insurance","ccode":"05"},{"ctext":"Other","ccode":"49"}]}},"consumer_durables":{"choices":{"choice":[{"ctext":"Electric fan","ccode":"01"},{"ctext":"Refrigerator","ccode":"02"},{"ctext":"Cooler","ccode":"03"},{"ctext":"Residential telephone","ccode":"04"},{"ctext":"Mobile phone","ccode":"05"},{"ctext":"B/W television","ccode":"06"},{"ctext":"Colour television","ccode":"07"},{"ctext":"Sewing machine","ccode":"08"},{"ctext":"Furniture","ccode":"09"},{"ctext":"Bicycle","ccode":"10"},{"ctext":"Rickshaw","ccode":"11"},{"ctext":"Push cart","ccode":"12"},{"ctext":"Bullock cart","ccode":"13"},{"ctext":"Two wheeler","ccode":"14"},{"ctext":"Three wheeler","ccode":"15"},{"ctext":"Taxi","ccode":"16"},{"ctext":"Car","ccode":"17"}]}},"livestock_types":{"choices":{"choice":[{"ctext":"Buffalo","ccode":"01"},{"ctext":"Cow","ccode":"02"},{"ctext":"Sheep / Goat","ccode":"03"},{"ctext":"Pig","ccode":"04"},{"ctext":"Hen / Cock","ccode":"05"},{"ctext":"Donkey","ccode":"06"}]}},"years_of_stay":{"choices":{"choice":[{"ctext":"0 - 1 year","ccode":"01"},{"ctext":"1 - 3 years","ccode":"02"},{"ctext":"3 - 5 years","ccode":"03"},{"ctext":"More than 5 years","ccode":"04"}]}},"migrated_from":{"choices":{"choice":[{"ctext":"Rural to urban area","ccode":"01"},{"ctext":"Urban to urban area","ccode":"02"}]}},"migration_type":{"choices":{"choice":[{"ctext":"Seasonal","ccode":"01"},{"ctext":"Permanent","ccode":"02"}]}},"reasons_for_migration":{"choices":{"choice":[{"ctext":"Unemployment","ccode":"01"},{"ctext":"Low wage","ccode":"02"},{"ctext":"Debt","ccode":"03"},{"ctext":"Drought","ccode":"04"},{"ctext":"Conflict","ccode":"05"},{"ctext":"Education","ccode":"06"},{"ctext":"Marriage","ccode":"07"},{"ctext":"Others","ccode":"49"}]}},"education_qualification":{"choices":{"choice":[{"ctext":"Primary school","ccode":"01"},{"ctext":"Middle school","ccode":"02"},{"ctext":"Matriculate","ccode":"03"},{"ctext":"Certificate","ccode":"04"},{"ctext":"Diploma","ccode":"05"},{"ctext":"Graduate","ccode":"06"},{"ctext":"Post-graduate","ccode":"07"},{"ctext":"Technical","ccode":"08"},{"ctext":"Other","ccode":"49"},{"ctext":"No education","ccode":"99"}]}},"skill_training":{"choices":{"choice":[{"ctext":"Pre-employment training","ccode":"01"},{"ctext":"In-service training","ccode":"02"},{"ctext":"Skill upgradation","ccode":"03"},{"ctext":"Apprenticeship","ccode":"04"},{"ctext":"Soft / Life skills programme","ccode":"05"},{"ctext":"Entrepreneurship","ccode":"06"},{"ctext":"Hereditary","ccode":"07"},{"ctext":"Other","ccode":"49"},{"ctext":"No skills training","ccode":"99"}]}},"training_institute":{"choices":{"choice":[{"ctext":"Industrial Training Institute","ccode":"01"},{"ctext":"Polytechnic","ccode":"02"},{"ctext":"Vocational schools","ccode":"03"},{"ctext":"Technical schools / institutes","ccode":"04"},{"ctext":"Other","ccode":"49"}]}},"employment_status":{"choices":{"choice":[{"ctext":"Self-employed","ccode":"01"},{"ctext":"Salaried","ccode":"02"},{"ctext":"Regular wage","ccode":"03"},{"ctext":"Casual labour","ccode":"04"},{"ctext":"Other","ccode":"49"}]}},"place_of_work":{"choices":{"choice":[{"ctext":"Within the slum area","ccode":"01"},{"ctext":"Distance less than 0.5km","ccode":"02"},{"ctext":"0.5 to 1.0km","ccode":"03"},{"ctext":"1.0 to 2.0km","ccode":"04"},{"ctext":"2.0 to 5.0km","ccode":"05"},{"ctext":"More than 5.0km","ccode":"06"}]}},"time_of_work":{"choices":{"choice":[{"ctext":"Whole day","ccode":"01"},{"ctext":"Half day","ccode":"02"},{"ctext":"Part time","ccode":"03"},{"ctext":"3 months in a year","ccode":"04"},{"ctext":"6 months in a year","ccode":"05"},{"ctext":"Whole year","ccode":"06"}]}},"monthly_earning":{"choices":{"choice":[{"ctext":"Less than Rs. 500","ccode":"01"},{"ctext":"Rs. 500 to 1000","ccode":"02"},{"ctext":"Rs. 1000 to 1500","ccode":"03"},{"ctext":"Rs. 1500 to 2000","ccode":"04"},{"ctext":"Rs. 2000 to 3000","ccode":"05"},{"ctext":"More than Rs. 3000","ccode":"06"}]}},"occupation":{"choices":{"choice":[{"ctext":"Agriculture / horticulture","ccode":"01"},{"ctext":"Hawking / Stree vending","ccode":"02"},{"ctext":"Domestic servant","ccode":"03"},{"ctext":"Sanitation worker","ccode":"04"},{"ctext":"Ragpicker","ccode":"05"},{"ctext":"Watchman","ccode":"06"},{"ctext":"Construction worker","ccode":"07"},{"ctext":"Industrial worker","ccode":"08"},{"ctext":"Contract worker","ccode":"09"},{"ctext":"Casual labourer","ccode":"10"},{"ctext":"Electrician","ccode":"11"},{"ctext":"Electronics gadget repairing","ccode":"12"},{"ctext":"Plumbing","ccode":"13"},{"ctext":"Tailoring","ccode":"14"},{"ctext":"Weaving","ccode":"15"},{"ctext":"Artisan / craftsman / handicraft & cottage based production","ccode":"16"},{"ctext":"Beautician / hairdressing & related","ccode":"17"},{"ctext":"Driving","ccode":"18"},{"ctext":"Auto repair / motor mechanic","ccode":"19"},{"ctext":"Mechanical engineering related","ccode":"20"},{"ctext":"Chemical engineering related","ccode":"21"},{"ctext":"Shoe making / leather related","ccode":"22"},{"ctext":"Photography & related","ccode":"23"},{"ctext":"Work related to childcare, nuitrition, pre-schools & creche","ccode":"24"},{"ctext":"Health & paramedical services related","ccode":"25"},{"ctext":"Office related","ccode":"26"},{"ctext":"Printing related","ccode":"27"},{"ctext":"Hotel & restaurant related","ccode":"28"},{"ctext":"Tourism related activity","ccode":"29"},{"ctext":"Security related","ccode":"30"},{"ctext":"Computer related","ccode":"31"},{"ctext":"Creative arts / artists","ccode":"32"},{"ctext":"Laundry related","ccode":"33"},{"ctext":"Toy making","ccode":"34"},{"ctext":"Candle making","ccode":"35"},{"ctext":"Artificial jewellery","ccode":"36"},{"ctext":"Embroidery / knitting","ccode":"37"},{"ctext":"Cooking","ccode":"38"},{"ctext":"Bakery","ccode":"39"},{"ctext":"Mason","ccode":"40"},{"ctext":"Carpenter","ccode":"41"},{"ctext":"Painter","ccode":"42"},{"ctext":"Food processing / preservation","ccode":"43"},{"ctext":"Petty trader","ccode":"44"},{"ctext":"Rickshaw puller","ccode":"45"},{"ctext":"Cyclerickshaw driver","ccode":"46"},{"ctext":"Pushcart driver","ccode":"47"},{"ctext":"Autorickshaw driver","ccode":"48"},{"ctext":"Retail sale","ccode":"49"},{"ctext":"Pig / poultry / cow / buffalo rearing","ccode":"50"},{"ctext":"Others","ccode":"99"}]}},"unemployment_reasons":{"choices":{"choice":[{"ctext":"Illiterate","ccode":"01"},{"ctext":"Lack of vocational skills","ccode":"02"},{"ctext":"Lack of job opportunities","ccode":"03"},{"ctext":"Disability","ccode":"04"},{"ctext":"Low wage","ccode":"05"},{"ctext":"Lack of capital to invest","ccode":"06"},{"ctext":"Loss of earlier job","ccode":"07"},{"ctext":"Closure of unit","ccode":"08"},{"ctext":"Lack of work in the enterprise (self-employed)","ccode":"09"},{"ctext":"Lack of work in the area (casual labour)","ccode":"10"},{"ctext":"Lay-off without pay","ccode":"11"},{"ctext":"Employer harsh","ccode":"12"},{"ctext":"Health hazard","ccode":"13"},{"ctext":"Other","ccode":"49"}]}},"preferred_training":{"choices":{"choice":[{"ctext":"Mechanical engineering","ccode":"01"},{"ctext":"Electrical & electronic engineering","ccode":"02"},{"ctext":"Computer","ccode":"03"},{"ctext":"Civil engineering & building construction related","ccode":"04"},{"ctext":"Chemical engineering","ccode":"05"},{"ctext":"Leather related","ccode":"06"},{"ctext":"Textile related","ccode":"07"},{"ctext":"Catering / nuitrition / hotel / restaurant related","ccode":"08"},{"ctext":"Artisan / craftsman / handicraft / cottage based production","ccode":"09"},{"ctext":"Creative arts / artists","ccode":"10"},{"ctext":"Agriculture & crop production related & food preservation related","ccode":"11"},{"ctext":"Non-crop based agriculture & other related activities","ccode":"12"},{"ctext":"Health & paramedical services related","ccode":"13"},{"ctext":"Office & business related","ccode":"14"},{"ctext":"Driving & motor mechanic","ccode":"15"},{"ctext":"Beautician / hairdressing & related","ccode":"16"},{"ctext":"Tour operators / travel managers related","ccode":"17"},{"ctext":"Photography & related","ccode":"18"},{"ctext":"Childcare / nuitrition / pre-school / creche related","ccode":"19"},{"ctext":"Journalism / mass communication / media related","ccode":"20"},{"ctext":"Printing technology related","ccode":"21"},{"ctext":"Tailoring / weaving","ccode":"22"},{"ctext":"Entrepreneurship development programmes","ccode":"23"},{"ctext":"Other","ccode":"49"}]}}}}	1	2017-05-20 19:15:06	0.100000000000000006	mayank.ojha	testing	Cambridge	urbanrisklab
\.


--
-- Name: survey_questions_id_seq; Type: SEQUENCE SET; Schema: skanda; Owner: -
--

SELECT pg_catalog.setval('survey_questions_id_seq', 1, true);


--
-- Data for Name: survey_raw; Type: TABLE DATA; Schema: skanda; Owner: -
--

COPY survey_raw (id, data) FROM stdin;
1	{"Name": "Hari Prasad Chaurasia"}
2	{"Name":"Hari Prasad Chaurasia"}
\.


--
-- Name: survey_raw_id_seq; Type: SEQUENCE SET; Schema: skanda; Owner: -
--

SELECT pg_catalog.setval('survey_raw_id_seq', 2, true);


--
-- Name: survey_questions survey_questions_pkey; Type: CONSTRAINT; Schema: skanda; Owner: -
--

ALTER TABLE ONLY survey_questions
    ADD CONSTRAINT survey_questions_pkey PRIMARY KEY (id);


--
-- Name: survey_raw survey_raw_pkey; Type: CONSTRAINT; Schema: skanda; Owner: -
--

ALTER TABLE ONLY survey_raw
    ADD CONSTRAINT survey_raw_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

