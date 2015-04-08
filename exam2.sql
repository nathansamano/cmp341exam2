--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: a_c; Type: TABLE; Schema: public; Owner: nathan; Tablespace: 
--

CREATE TABLE a_c (
    cssn character(9) NOT NULL,
    ano integer NOT NULL
);


ALTER TABLE a_c OWNER TO nathan;

--
-- Name: account; Type: TABLE; Schema: public; Owner: nathan; Tablespace: 
--

CREATE TABLE account (
    acctno integer NOT NULL,
    balance numeric,
    type character varying,
    bno integer
);


ALTER TABLE account OWNER TO nathan;

--
-- Name: bank; Type: TABLE; Schema: public; Owner: nathan; Tablespace: 
--

CREATE TABLE bank (
    code character varying NOT NULL,
    name character varying,
    addr character varying
);


ALTER TABLE bank OWNER TO nathan;

--
-- Name: bank_branch; Type: TABLE; Schema: public; Owner: nathan; Tablespace: 
--

CREATE TABLE bank_branch (
    branchno integer NOT NULL,
    addr character varying,
    bcode character varying
);


ALTER TABLE bank_branch OWNER TO nathan;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: nathan; Tablespace: 
--

CREATE TABLE customer (
    ssn character(9) NOT NULL,
    name character varying,
    addr character varying
);


ALTER TABLE customer OWNER TO nathan;

--
-- Name: l_c; Type: TABLE; Schema: public; Owner: nathan; Tablespace: 
--

CREATE TABLE l_c (
    cssn character(9) NOT NULL,
    lno integer NOT NULL
);


ALTER TABLE l_c OWNER TO nathan;

--
-- Name: loan; Type: TABLE; Schema: public; Owner: nathan; Tablespace: 
--

CREATE TABLE loan (
    loanno integer NOT NULL,
    amount numeric,
    type character varying,
    bno integer
);


ALTER TABLE loan OWNER TO nathan;

--
-- Data for Name: a_c; Type: TABLE DATA; Schema: public; Owner: nathan
--

COPY a_c (cssn, ano) FROM stdin;
\.


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: nathan
--

COPY account (acctno, balance, type, bno) FROM stdin;
\.


--
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: nathan
--

COPY bank (code, name, addr) FROM stdin;
\.


--
-- Data for Name: bank_branch; Type: TABLE DATA; Schema: public; Owner: nathan
--

COPY bank_branch (branchno, addr, bcode) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: nathan
--

COPY customer (ssn, name, addr) FROM stdin;
\.


--
-- Data for Name: l_c; Type: TABLE DATA; Schema: public; Owner: nathan
--

COPY l_c (cssn, lno) FROM stdin;
\.


--
-- Data for Name: loan; Type: TABLE DATA; Schema: public; Owner: nathan
--

COPY loan (loanno, amount, type, bno) FROM stdin;
\.


--
-- Name: accountpkey; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT accountpkey PRIMARY KEY (acctno);


--
-- Name: acpk; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY a_c
    ADD CONSTRAINT acpk PRIMARY KEY (cssn, ano);


--
-- Name: branchpk; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY bank_branch
    ADD CONSTRAINT branchpk PRIMARY KEY (branchno);


--
-- Name: customerpkey; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customerpkey PRIMARY KEY (ssn);


--
-- Name: lcpk; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY l_c
    ADD CONSTRAINT lcpk PRIMARY KEY (cssn, lno);


--
-- Name: loanpkey; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY loan
    ADD CONSTRAINT loanpkey PRIMARY KEY (loanno);


--
-- Name: pkey; Type: CONSTRAINT; Schema: public; Owner: nathan; Tablespace: 
--

ALTER TABLE ONLY bank
    ADD CONSTRAINT pkey PRIMARY KEY (code);


--
-- Name: acacctnofk; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY a_c
    ADD CONSTRAINT acacctnofk FOREIGN KEY (ano) REFERENCES account(acctno);


--
-- Name: acctfk; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY account
    ADD CONSTRAINT acctfk FOREIGN KEY (bno) REFERENCES bank_branch(branchno);


--
-- Name: acssnfk; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY a_c
    ADD CONSTRAINT acssnfk FOREIGN KEY (cssn) REFERENCES customer(ssn);


--
-- Name: bbfk; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY bank_branch
    ADD CONSTRAINT bbfk FOREIGN KEY (bcode) REFERENCES bank(code);


--
-- Name: lccssnfk; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY l_c
    ADD CONSTRAINT lccssnfk FOREIGN KEY (cssn) REFERENCES customer(ssn);


--
-- Name: lcloannofk; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY l_c
    ADD CONSTRAINT lcloannofk FOREIGN KEY (lno) REFERENCES loan(loanno);


--
-- Name: loanfk; Type: FK CONSTRAINT; Schema: public; Owner: nathan
--

ALTER TABLE ONLY loan
    ADD CONSTRAINT loanfk FOREIGN KEY (bno) REFERENCES bank_branch(branchno);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

