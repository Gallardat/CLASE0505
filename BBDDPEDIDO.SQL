--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-05 16:13:54

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
-- TOC entry 214 (class 1259 OID 17039)
-- Name: seq_almacen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_almacen
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_almacen OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 17040)
-- Name: almacenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.almacenes (
    id_almacen integer DEFAULT nextval('public.seq_almacen'::regclass) NOT NULL,
    id_provincia integer NOT NULL,
    fecha_apertura date NOT NULL,
    direccion character varying(30)
);


ALTER TABLE public.almacenes OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17111)
-- Name: seq_coleccion; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_coleccion
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_coleccion OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17112)
-- Name: colecciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colecciones (
    id_coleccion integer DEFAULT nextval('public.seq_coleccion'::regclass) NOT NULL,
    volumen integer
);


ALTER TABLE public.colecciones OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17099)
-- Name: seq_detalle; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_detalle
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_detalle OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17100)
-- Name: detalle_pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_pedidos (
    id_detalle integer DEFAULT nextval('public.seq_detalle'::regclass) NOT NULL,
    id_pedido integer NOT NULL,
    isbn character(13) NOT NULL,
    cantidad integer NOT NULL
);


ALTER TABLE public.detalle_pedidos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17118)
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    isbn character(13) NOT NULL,
    id_coleccion integer NOT NULL,
    titulo character varying(20) NOT NULL,
    autor character varying(30) NOT NULL,
    editorial character varying(30) NOT NULL
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17087)
-- Name: seq_pedido; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_pedido
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_pedido OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17088)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    id_pedido integer DEFAULT nextval('public.seq_pedido'::regclass) NOT NULL,
    id_socio integer NOT NULL,
    forma_envio character varying(30) NOT NULL,
    forma_pago character varying(30) NOT NULL
);


ALTER TABLE public.pedidos OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17058)
-- Name: seq_poblacion; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_poblacion
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_poblacion OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17059)
-- Name: poblaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poblaciones (
    id_poblacion integer DEFAULT nextval('public.seq_poblacion'::regclass) NOT NULL,
    id_provincia integer NOT NULL,
    nombre character varying(30) NOT NULL,
    habitantes integer NOT NULL
);


ALTER TABLE public.poblaciones OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17046)
-- Name: seq_provincia; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_provincia
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_provincia OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17047)
-- Name: provincias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provincias (
    id_provincia integer DEFAULT nextval('public.seq_provincia'::regclass) NOT NULL,
    id_almacen integer NOT NULL,
    nombre character varying(30) NOT NULL,
    extencion integer NOT NULL
);


ALTER TABLE public.provincias OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17070)
-- Name: seq_socio; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_socio
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_socio OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17128)
-- Name: seq_stock; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_stock
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_stock OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17071)
-- Name: socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socios (
    id_socio integer DEFAULT nextval('public.seq_socio'::regclass) NOT NULL,
    id_avalador integer NOT NULL,
    id_poblacion integer NOT NULL,
    nombre character varying(20) NOT NULL,
    apellido character varying(20) NOT NULL,
    dni character(9) NOT NULL,
    telefono character varying(10)
);


ALTER TABLE public.socios OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17129)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    id_stock integer DEFAULT nextval('public.seq_stock'::regclass) NOT NULL,
    isbn character(13) NOT NULL,
    id_almacen integer NOT NULL,
    cantidad integer NOT NULL
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 3389 (class 0 OID 17040)
-- Dependencies: 215
-- Data for Name: almacenes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3401 (class 0 OID 17112)
-- Dependencies: 227
-- Data for Name: colecciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3399 (class 0 OID 17100)
-- Dependencies: 225
-- Data for Name: detalle_pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3402 (class 0 OID 17118)
-- Dependencies: 228
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3397 (class 0 OID 17088)
-- Dependencies: 223
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3393 (class 0 OID 17059)
-- Dependencies: 219
-- Data for Name: poblaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3391 (class 0 OID 17047)
-- Dependencies: 217
-- Data for Name: provincias; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3395 (class 0 OID 17071)
-- Dependencies: 221
-- Data for Name: socios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3404 (class 0 OID 17129)
-- Dependencies: 230
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 214
-- Name: seq_almacen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_almacen', 100, false);


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 226
-- Name: seq_coleccion; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_coleccion', 100, false);


--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 224
-- Name: seq_detalle; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_detalle', 100, false);


--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 222
-- Name: seq_pedido; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_pedido', 100, false);


--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 218
-- Name: seq_poblacion; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_poblacion', 100, false);


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 216
-- Name: seq_provincia; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_provincia', 100, false);


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 220
-- Name: seq_socio; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_socio', 100, false);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 229
-- Name: seq_stock; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_stock', 100, false);


--
-- TOC entry 3221 (class 2606 OID 17045)
-- Name: almacenes pk_almacen; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacenes
    ADD CONSTRAINT pk_almacen PRIMARY KEY (id_almacen);


--
-- TOC entry 3233 (class 2606 OID 17117)
-- Name: colecciones pk_coleccion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colecciones
    ADD CONSTRAINT pk_coleccion PRIMARY KEY (id_coleccion);


--
-- TOC entry 3231 (class 2606 OID 17105)
-- Name: detalle_pedidos pk_detalle; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedidos
    ADD CONSTRAINT pk_detalle PRIMARY KEY (id_detalle);


--
-- TOC entry 3235 (class 2606 OID 17122)
-- Name: libros pk_isbn; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT pk_isbn PRIMARY KEY (isbn);


--
-- TOC entry 3229 (class 2606 OID 17093)
-- Name: pedidos pk_pedido; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pk_pedido PRIMARY KEY (id_pedido);


--
-- TOC entry 3225 (class 2606 OID 17064)
-- Name: poblaciones pk_poblacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poblaciones
    ADD CONSTRAINT pk_poblacion PRIMARY KEY (id_poblacion);


--
-- TOC entry 3223 (class 2606 OID 17052)
-- Name: provincias pk_provincia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincias
    ADD CONSTRAINT pk_provincia PRIMARY KEY (id_provincia);


--
-- TOC entry 3227 (class 2606 OID 17076)
-- Name: socios pk_socio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT pk_socio PRIMARY KEY (id_socio);


--
-- TOC entry 3237 (class 2606 OID 17134)
-- Name: stock pk_stock; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT pk_stock PRIMARY KEY (id_stock);


--
-- TOC entry 3238 (class 2606 OID 17053)
-- Name: provincias fk_almacen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincias
    ADD CONSTRAINT fk_almacen FOREIGN KEY (id_almacen) REFERENCES public.almacenes(id_almacen) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3240 (class 2606 OID 17077)
-- Name: socios fk_avalador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT fk_avalador FOREIGN KEY (id_avalador) REFERENCES public.socios(id_socio);


--
-- TOC entry 3244 (class 2606 OID 17123)
-- Name: libros fk_coleccion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT fk_coleccion FOREIGN KEY (id_coleccion) REFERENCES public.colecciones(id_coleccion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3245 (class 2606 OID 17135)
-- Name: stock fk_isbn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT fk_isbn FOREIGN KEY (isbn) REFERENCES public.libros(isbn) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3243 (class 2606 OID 17106)
-- Name: detalle_pedidos fk_pedido; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedidos
    ADD CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES public.pedidos(id_pedido) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3241 (class 2606 OID 17082)
-- Name: socios fk_poblacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT fk_poblacion FOREIGN KEY (id_poblacion) REFERENCES public.poblaciones(id_poblacion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3239 (class 2606 OID 17065)
-- Name: poblaciones fk_provincia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poblaciones
    ADD CONSTRAINT fk_provincia FOREIGN KEY (id_provincia) REFERENCES public.provincias(id_provincia) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3242 (class 2606 OID 17094)
-- Name: pedidos fk_socio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT fk_socio FOREIGN KEY (id_socio) REFERENCES public.socios(id_socio) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2023-05-05 16:13:54

--
-- PostgreSQL database dump complete
--

