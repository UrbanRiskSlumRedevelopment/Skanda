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

