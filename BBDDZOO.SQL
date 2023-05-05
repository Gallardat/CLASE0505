--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-05 16:14:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 218 (class 1259 OID 16645)
-- Name: seq_animal; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_animal
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_animal OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16646)
-- Name: animal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.animal (
    id_animal integer DEFAULT nextval('public.seq_animal'::regclass) NOT NULL,
    id_especie integer NOT NULL,
    id_zoo integer NOT NULL,
    anio_nacimiento date,
    pais_origen character varying(20),
    continente_origen character varying(20),
    sexo character(1)
);


ALTER TABLE public.animal OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16638)
-- Name: seq_especie; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_especie
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_especie OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16639)
-- Name: especie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especie (
    id_especie integer DEFAULT nextval('public.seq_especie'::regclass) NOT NULL,
    nombre_comun character varying(30) NOT NULL,
    nombre_cientifico character varying(40) NOT NULL,
    familia character varying(30),
    peligro_extincion boolean
);


ALTER TABLE public.especie OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16631)
-- Name: seq_zoo; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_zoo
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_zoo OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16632)
-- Name: zoo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zoo (
    id_zoo integer DEFAULT nextval('public.seq_zoo'::regclass) NOT NULL,
    nombre character varying(30) NOT NULL,
    pais character varying(30) NOT NULL,
    ciudad character varying(30) NOT NULL,
    "tamaño" integer,
    presupuesto integer
);


ALTER TABLE public.zoo OWNER TO postgres;

--
-- TOC entry 3341 (class 0 OID 16646)
-- Dependencies: 219
-- Data for Name: animal; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3339 (class 0 OID 16639)
-- Dependencies: 217
-- Data for Name: especie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3337 (class 0 OID 16632)
-- Dependencies: 215
-- Data for Name: zoo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 218
-- Name: seq_animal; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_animal', 100, false);


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 216
-- Name: seq_especie; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_especie', 100, false);


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 214
-- Name: seq_zoo; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_zoo', 100, false);


--
-- TOC entry 3191 (class 2606 OID 16651)
-- Name: animal pk_animal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animal
    ADD CONSTRAINT pk_animal PRIMARY KEY (id_animal);


--
-- TOC entry 3189 (class 2606 OID 16644)
-- Name: especie pk_especie; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especie
    ADD CONSTRAINT pk_especie PRIMARY KEY (id_especie);


--
-- TOC entry 3187 (class 2606 OID 16637)
-- Name: zoo pk_zoo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zoo
    ADD CONSTRAINT pk_zoo PRIMARY KEY (id_zoo);


--
-- TOC entry 3192 (class 2606 OID 16652)
-- Name: animal fk_especie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animal
    ADD CONSTRAINT fk_especie FOREIGN KEY (id_especie) REFERENCES public.especie(id_especie);


--
-- TOC entry 3193 (class 2606 OID 16657)
-- Name: animal fk_zoo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animal
    ADD CONSTRAINT fk_zoo FOREIGN KEY (id_zoo) REFERENCES public.zoo(id_zoo) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2023-05-05 16:14:30

--
-- PostgreSQL database dump complete
--

