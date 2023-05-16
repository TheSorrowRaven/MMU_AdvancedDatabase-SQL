--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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

ALTER TABLE ONLY public.sales DROP CONSTRAINT size_fk;
ALTER TABLE ONLY public.sales DROP CONSTRAINT salesp_fk;
ALTER TABLE ONLY public.sales DROP CONSTRAINT prd_fk;
ALTER TABLE ONLY public.sales DROP CONSTRAINT col_fk;
ALTER TABLE ONLY public.size DROP CONSTRAINT size_pk;
ALTER TABLE ONLY public.salesperson DROP CONSTRAINT salesperson_pk;
ALTER TABLE ONLY public.product DROP CONSTRAINT product_pk;
ALTER TABLE ONLY public.colour DROP CONSTRAINT colour_pk;
DROP TABLE public.size;
DROP TABLE public.salesperson;
DROP TABLE public.sales;
DROP TABLE public.product;
DROP TABLE public.colour;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: colour; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colour (
    colourcode character varying(21) NOT NULL,
    description character varying(21),
    category character varying(21)
);


ALTER TABLE public.colour OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    productid character varying(21) NOT NULL,
    description character varying(21),
    cost numeric(7,2),
    sellingprice numeric(7,2)
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    salesperson character varying(21),
    product character varying(21),
    size character varying(21),
    colour character varying(21),
    sales_quantity integer
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- Name: salesperson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salesperson (
    salesid character varying(21) NOT NULL,
    name character varying(21),
    region character varying(21)
);


ALTER TABLE public.salesperson OWNER TO postgres;

--
-- Name: size; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.size (
    sizecode character varying(21) NOT NULL,
    size character varying(21)
);


ALTER TABLE public.size OWNER TO postgres;

--
-- Data for Name: colour; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.colour VALUES ('C001', 'Red', 'Warm');
INSERT INTO public.colour VALUES ('C002', 'Yellow', 'Warm');
INSERT INTO public.colour VALUES ('C003', 'Beige', 'Warm');
INSERT INTO public.colour VALUES ('C004', 'Black', 'Black');
INSERT INTO public.colour VALUES ('C005', 'Pink', 'Warm');
INSERT INTO public.colour VALUES ('C006', 'Green', 'Cool');
INSERT INTO public.colour VALUES ('C007', 'Blue', 'Cool');
INSERT INTO public.colour VALUES ('C008', 'Grey', 'Cool');


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product VALUES ('P01', 'T-Shirt', 29.50, 45.00);
INSERT INTO public.product VALUES ('P02', 'Raincoat', 15.00, 22.00);
INSERT INTO public.product VALUES ('P03', 'Pants', 35.00, 59.50);


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sales VALUES ('S01', 'P01', 'X03', 'C001', 100);
INSERT INTO public.sales VALUES ('S02', 'P02', 'X02', 'C001', 20);
INSERT INTO public.sales VALUES ('S01', 'P01', 'X03', 'C002', 50);
INSERT INTO public.sales VALUES ('S03', 'P03', 'X04', 'C003', 15);
INSERT INTO public.sales VALUES ('S03', 'P03', 'X03', 'C004', 40);
INSERT INTO public.sales VALUES ('S01', 'P03', 'X03', 'C004', 50);
INSERT INTO public.sales VALUES ('S02', 'P02', 'X03', 'C005', 60);
INSERT INTO public.sales VALUES ('S03', 'P02', 'X01', 'C006', 50);
INSERT INTO public.sales VALUES ('S04', 'P01', 'X03', 'C007', 35);
INSERT INTO public.sales VALUES ('S04', 'P03', 'X02', 'C008', 150);


--
-- Data for Name: salesperson; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.salesperson VALUES ('S01', 'Sandy', 'East Malaysia');
INSERT INTO public.salesperson VALUES ('S02', 'Ally', 'South Malaysia');
INSERT INTO public.salesperson VALUES ('S03', 'William', 'North Malaysia');
INSERT INTO public.salesperson VALUES ('S04', 'Joshua', 'West Malaysia');
INSERT INTO public.salesperson VALUES ('S05', 'Amanda', 'West Malaysia');


--
-- Data for Name: size; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.size VALUES ('X01', 'S');
INSERT INTO public.size VALUES ('X02', 'M');
INSERT INTO public.size VALUES ('X03', 'L');
INSERT INTO public.size VALUES ('X04', 'XL');


--
-- Name: colour colour_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colour
    ADD CONSTRAINT colour_pk PRIMARY KEY (colourcode);


--
-- Name: product product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pk PRIMARY KEY (productid);


--
-- Name: salesperson salesperson_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salesperson
    ADD CONSTRAINT salesperson_pk PRIMARY KEY (salesid);


--
-- Name: size size_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.size
    ADD CONSTRAINT size_pk PRIMARY KEY (sizecode);


--
-- Name: sales col_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT col_fk FOREIGN KEY (colour) REFERENCES public.colour(colourcode);


--
-- Name: sales prd_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT prd_fk FOREIGN KEY (product) REFERENCES public.product(productid);


--
-- Name: sales salesp_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT salesp_fk FOREIGN KEY (salesperson) REFERENCES public.salesperson(salesid);


--
-- Name: sales size_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT size_fk FOREIGN KEY (size) REFERENCES public.size(sizecode);


--
-- PostgreSQL database dump complete
--

