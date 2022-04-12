--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    id integer NOT NULL,
    message character varying(120) NOT NULL,
    location public.geography(Point,4326) NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.post OWNER TO postgres;

--
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_id_seq OWNER TO postgres;

--
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- Name: weather; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weather (
    id integer NOT NULL,
    weather bytea,
    location public.geometry(Point,4326)
);


ALTER TABLE public.weather OWNER TO postgres;

--
-- Name: weather_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weather_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weather_id_seq OWNER TO postgres;

--
-- Name: weather_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weather_id_seq OWNED BY public.weather.id;


--
-- Name: post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- Name: weather id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather ALTER COLUMN id SET DEFAULT nextval('public.weather_id_seq'::regclass);


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (id, message, location, created_at) FROM stdin;
1	 I love her humor, her grace and her heart! 	0101000020E6100000BCCFF1D1E2AC3340C64E78094E953140	2022-04-12 14:27:36
2	Ok, a few more... sorry I just had so much fun that day 	0101000020E61000004A287D21E4AC334090D959F44E953140	2022-04-12 14:27:36
3	This was one of my favorite shoots I have ever done!	0101000020E61000000F5EBBB4E1AC3340EFE192E34E953140	2022-04-12 14:27:36
4	Wrapped round my finger like a ring	0101000020E6100000F701486DE2AC334038F6ECB94C953140	2022-04-12 14:27:36
5	Yesterday was so much fun!! has been such a huge figure in my life.	0101000020E6100000F3ACA415DFAC3340AF5A99F04B953140	2022-04-12 14:27:36
6	Well..	0101000020E6100000F969DC9BDFAC3340AF5A99F04B953140	2022-04-12 14:27:36
7	Its officially out! I was a bit embarrassed asking so often	0101000020E610000052B5DD04DFAC3340FE2B2B4D4A953140	2022-04-12 14:27:36
8	 I love her humor, her grace and her heart! 	0101000020E6100000BCCFF1D1E2AC3340C64E78094E953140	2022-04-12 14:27:36
9	Ok, a few more... sorry I just had so much fun that day 	0101000020E61000004A287D21E4AC334090D959F44E953140	2022-04-12 14:27:36
10	This was one of my favorite shoots I have ever done!	0101000020E61000000F5EBBB4E1AC3340EFE192E34E953140	2022-04-12 14:27:36
11	Wrapped round my finger like a ring	0101000020E6100000F701486DE2AC334038F6ECB94C953140	2022-04-12 14:27:36
12	Yesterday was so much fun!! has been such a huge figure in my life.	0101000020E6100000F3ACA415DFAC3340AF5A99F04B953140	2022-04-12 14:27:36
13	Well..	0101000020E6100000F969DC9BDFAC3340AF5A99F04B953140	2022-04-12 14:27:36
14	Its officially out! I was a bit embarrassed asking so often	0101000020E610000052B5DD04DFAC3340FE2B2B4D4A953140	2022-04-12 14:27:36
15	I hope you guys are liking the album!	0101000020E610000026529ACDE3AC33402D7C7DAD4B953140	2022-04-12 14:27:36
16	Did it again ?	0101000020E610000004E44BA8E0AC33409696917A4F953140	2022-04-12 14:27:36
17	R.A.R.E	0101000020E61000004A287D21E4AC33403C4B901150953140	2022-04-12 14:27:36
18	Had so much fun at the premiere this morning	0101000020E6100000BCCFF1D1E2AC3340787DE6AC4F953140	2022-04-12 14:27:36
19	So my rare video is out!	0101000020E6100000E8323509DEAC334031D120054F953140	2022-04-12 14:27:36
20	HERE IT IS!!! My album is officially out in the universe.	0101000020E61000004B901150E1AC3340BC3C9D2B4A953140	2022-04-12 14:27:36
21	There must be a sweeter place.	0101000020E61000004A287D21E4AC3340EFE192E34E953140	2022-04-12 14:27:36
22	I gotta get you out my head now	0101000020E61000009961A3ACDFAC3340BC3C9D2B4A953140	2022-04-12 14:27:36
23	You may not be the one, but you look like fun. 	0101000020E61000007C48F8DEDFAC33405CCCCF0D4D953140	2022-04-12 14:27:36
24	I think you are kinda crazy and not the good kind, baby. 	0101000020E6100000CE6E2D93E1AC3340BF29AC5450953140	2022-04-12 14:27:36
25	People can go from people you know to people you donate	0101000020E6100000F3ACA415DFAC3340CC0BB08F4E953140	2022-04-12 14:27:36
26	If the only other options letting go stay vulnerable.	0101000020E6100000349C3237DFAC3340C19140834D953140	2022-04-12 14:27:36
27	Hi New Year.	0101000020E610000069A9BC1DE1AC3340DEAAEB504D953140	2022-04-12 14:27:36
28	Feels so good to dance again	0101000020E6100000E5620CACE3AC3340AF5A99F04B953140	2022-04-12 14:27:36
29	Merry Christmas and many, many blessings to you and your close loved ones!	0101000020E6100000E10D6954E0AC334072C0AE264F953140	2022-04-12 14:27:36
30	I will share so many of these stories and voices.	0101000020E6100000A643A7E7DDAC334038F6ECB94C953140	2022-04-12 14:27:36
31	I have so much to share about my trip to Kenya, London and Paris.	0101000020E61000009EB64604E3AC3340209A79724D953140	2022-04-12 14:27:36
32	Feels good to be back.	0101000020E61000008EE733A0DEAC33409241EE224C953140	2022-04-12 14:27:36
33	All combo -biker jacket and butterfly parker bag	0101000020E6100000C8B1F50CE1AC3340209A79724D953140	2022-04-12 14:27:36
34	It was my absolute honor to present the Bill of Rights Award to the incredible Activist	0101000020E61000001BD82AC1E2AC3340505260014C953140	2022-04-12 14:27:36
35	Well.. Still here.	0101000020E6100000151BF33AE2AC3340A37895B54D953140	2022-04-12 14:27:36
36	Grateful for ze pasta ∩┐╜∩┐╜	0101000020E6100000A3737E8AE3AC33404FEACBD24E953140	2022-04-12 14:27:36
37	Puma fam. In my Cali Sport.	0101000020E6100000FDBE7FF3E2AC33403EB324404D953140	2022-04-12 14:27:36
38	My love, my heart and my soul 	0101000020E6100000F24410E7E1AC3340EB8CEF8B4B953140	2022-04-12 14:27:36
39	So incredibly honored to be part of Start the conversation and make sure your voice is heard.	0101000020E6100000DFA5D425E3AC33400F63D2DF4B953140	2022-04-12 14:27:36
40	Hope I'm officially the best big sissy ever now.	0101000020E6100000C18C2958E3AC334097FE25A94C953140	2022-04-12 14:27:36
41	Appreciation post for the squad that's the loyalist since day 1	0101000020E610000069A9BC1DE1AC33405A643BDF4F953140	2022-04-12 14:27:36
42	My first number 1!! This song is so dear to my heart.	0101000020E61000002D776682E1AC334072C0AE264F953140	2022-04-12 14:27:36
43	I miss when was a bear	0101000020E6100000F24410E7E1AC334097FE25A94C953140	2022-04-12 14:27:36
44	Family photos	0101000020E610000052B5DD04DFAC3340E6CFB7054B953140	2022-04-12 14:27:36
45	Honestly my mom really killed it on my costumes growing up.	0101000020E6100000D593F947DFAC33403EB324404D953140	2022-04-12 14:27:36
46	Georgia, Toronto, Texas met in NY for a quick night 	0101000020E6100000D42B6519E2AC33401E32E54350953140	2022-04-12 14:27:36
47	Getting to celebrate this chapter with my friends means so much to me	0101000020E61000006B11514CDEAC33407E3A1E3350953140	2022-04-12 14:27:36
48	Some of my favorite moments on set	0101000020E6100000151BF33AE2AC33409C53C90050953140	2022-04-12 14:27:36
49	I went to Interscope today to thank everyone for all they do for me!	0101000020E6100000B2BD16F4DEAC334043705CC64D953140	2022-04-12 14:27:36
50	Made her more of a woman.	0101000020E6100000B05582C5E1AC33400F63D2DF4B953140	2022-04-12 14:27:36
51	You promised the world.	0101000020E610000087C267EBE0AC334090D959F44E953140	2022-04-12 14:27:36
52	I needed to lose you to love me. 10.23. Link in bio.	0101000020E610000081053065E0AC33408C84B69C4B953140	2022-04-12 14:27:36
53	I gave my all and they all know it.	0101000020E6100000037CB779E3AC3340B4AF3C484F953140	2022-04-12 14:27:36
54	Rose colored glasses all distorted.	0101000020E610000017838769DFAC334014200A664C953140	2022-04-12 14:27:36
55	We always go into it blindly.	0101000020E610000039F1D58EE2AC334003E962D34A953140	2022-04-12 14:27:36
56	Me, all the time 	0101000020E6100000151BF33AE2AC3340B517D1764C953140	2022-04-12 14:27:36
57	Everything is gooing good here!	0101000020E610000074232C2AE2AC334014200A664C953140	2022-04-12 14:27:36
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weather (id, weather, location) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_seq', 57, true);


--
-- Name: weather_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weather_id_seq', 1, false);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- Name: weather weather_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather
    ADD CONSTRAINT weather_pkey PRIMARY KEY (id);


--
-- Name: idx_post_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_post_location ON public.post USING gist (location);


--
-- Name: idx_weather_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_weather_location ON public.weather USING gist (location);


--
-- PostgreSQL database dump complete
--

