--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50),
    size numeric NOT NULL,
    description text NOT NULL,
    dangerous boolean
);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_name character varying(50),
    age numeric NOT NULL,
    description text NOT NULL,
    known boolean,
    name character varying(50)
);


--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    related boolean,
    exist boolean,
    size numeric NOT NULL,
    description text NOT NULL,
    planet_id integer NOT NULL
);


--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    related boolean,
    description text NOT NULL,
    destination numeric,
    size integer NOT NULL
);


--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_name character varying(50),
    galaxy_name character varying(50),
    destination numeric,
    size integer NOT NULL,
    gigantic boolean,
    age numeric NOT NULL,
    name character varying(50)
);


--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.asteroid (asteroid_id, name, size, description, dangerous) FROM stdin;
1	Ceres	939.4	A dwarf planet and asteroid belt object.	f
2	Vesta	525.4	One of the largest objects in the asteroid belt.	f
3	Pallas	512.0	A large asteroid in the main belt.	f
4	Hygiea	434.0	A large asteroid in the main belt.	f
5	Eros	16.8	A near-Earth asteroid.	t
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.galaxy (galaxy_id, galaxy_name, age, description, known, name) FROM stdin;
1	Andromeda	10.0	A large spiral galaxy near the Milky Way.	t	Andromeda Galaxy
2	Milky Way	13.6	The galaxy containing our Solar System.	t	Milky Way Galaxy
3	Triangulum	10.0	A spiral galaxy in the Local Group.	t	Triangulum Galaxy
4	Whirlpool	8.5	A classic interacting spiral galaxy.	t	Whirlpool Galaxy
5	Sombrero	9.0	A galaxy with a prominent central bulge.	t	Sombrero Galaxy
6	Pinwheel	7.8	A face-on spiral galaxy.	t	Pinwheel Galaxy
7	Cartwheel	8.0	A ring galaxy formed by a cosmic collision.	t	Cartwheel Galaxy
8	Messier 87	13.0	A massive elliptical galaxy.	t	Messier 87
9	Large Magellanic	12.0	A satellite galaxy of the Milky Way.	t	Large Magellanic Cloud
10	Small Magellanic	11.5	A dwarf galaxy near the Milky Way.	t	Small Magellanic Cloud
11	Centaurus A	12.0	A peculiar galaxy with an active nucleus.	t	Centaurus A
12	Bode	12.5	A nearby spiral galaxy.	t	Bode Galaxy
13	Cigar	12.0	A starburst galaxy with intense activity.	t	Cigar Galaxy
14	Black Eye	10.5	A spiral galaxy with a dark dust lane.	t	Black Eye Galaxy
15	Sunflower	11.0	A bright spiral galaxy.	t	Sunflower Galaxy
16	Sculptor	12.0	A nearby starburst galaxy.	t	Sculptor Galaxy
17	Tadpole	8.2	A galaxy with a long tidal tail.	f	Tadpole Galaxy
18	Fireworks	9.5	An active galaxy with many star-forming regions.	f	Fireworks Galaxy
19	NGC 1300	7.0	A barred spiral galaxy.	f	NGC 1300
20	NGC 4258	10.0	A spiral galaxy with a distinctive structure.	f	NGC 4258
21	NGC 253	11.0	A bright galaxy in the Sculptor Group.	f	NGC 253
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.moon (moon_id, name, related, exist, size, description, planet_id) FROM stdin;
1	Moon	t	t	3474	The natural satellite of Earth.	1
2	Phobos	f	t	22.4	The larger moon of Mars.	2
3	Deimos	f	t	12.4	The smaller moon of Mars.	2
4	Europa	\N	t	3121.6	An icy moon of Jupiter.	5
5	Ganymede	\N	t	5268.2	The largest moon in the Solar System.	5
6	Callisto	\N	t	4820.6	A heavily cratered moon of Jupiter.	5
7	Io	\N	t	3643.2	A volcanically active moon of Jupiter.	5
8	Titan	\N	t	5149.5	A large moon with a thick atmosphere.	6
9	Enceladus	\N	t	504.2	An icy moon with active geysers.	6
10	Rhea	\N	t	1527.0	A large icy moon of Saturn.	6
11	Titania	\N	t	1577.8	The largest moon of Uranus.	7
12	Oberon	\N	t	1522.8	An outer moon of Uranus.	7
13	Ariel	\N	t	1157.8	An icy moon of Uranus.	7
14	Umbriel	\N	t	1169.4	A dark moon of Uranus.	7
15	Triton	\N	t	2706.8	The largest moon of Neptune.	8
16	Nereid	\N	t	340.0	An irregular moon of Neptune.	8
17	Charon	\N	t	1212.0	The largest moon of Pluto.	9
18	Iapetus	\N	t	1469.0	A moon of Saturn with contrasting hemispheres.	6
19	Dione	\N	t	1122.8	An icy moon of Saturn.	6
20	Tethys	\N	t	1062.0	An icy moon of Saturn.	6
21	Mimas	\N	t	396.4	A small moon of Saturn.	6
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.planet (planet_id, name, related, description, destination, size) FROM stdin;
1	Earth	t	A rocky planet with abundant liquid water.	1001	12742
2	Mars	f	A cold rocky planet with a thin atmosphere.	1002	6779
3	Venus	\N	A hot rocky planet with a dense atmosphere.	1003	12104
4	Mercury	\N	The smallest planet in the system.	1004	4879
5	Jupiter	\N	The largest planet with a powerful magnetic field.	1005	139820
6	Saturn	\N	A gas giant famous for its rings.	1006	116460
7	Uranus	\N	An ice giant rotating on its side.	1007	50724
8	Neptune	\N	A distant blue ice giant.	1008	49244
9	Kepler-22b	\N	A planet located in a potentially habitable region.	1009	24000
10	Kepler-62f	\N	A potentially habitable exoplanet.	1010	13000
11	Proxima b	\N	An exoplanet orbiting a nearby star.	1011	12000
12	TRAPPIST-1d	\N	A small rocky exoplanet.	1012	8000
13	TRAPPIST-1e	\N	A rocky planet in a potentially habitable zone.	1013	9000
14	TRAPPIST-1f	\N	A cool rocky exoplanet.	1014	9500
15	TRAPPIST-1g	\N	A larger planet in the TRAPPIST system.	1015	11000
16	Gliese 581c	\N	A well-known nearby exoplanet candidate.	1016	10000
17	Gliese 667Cc	\N	A planet orbiting a nearby red dwarf.	1017	10500
18	HD 209458b	\N	A gas giant known for atmospheric studies.	1018	140000
19	WASP-12b	\N	A hot Jupiter with an extremely short orbit.	1019	180000
20	55 Cancri e	\N	A dense super-Earth exoplanet.	1020	15000
21	K2-18b	\N	A sub-Neptune-sized exoplanet.	1021	27000
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.star (star_id, star_name, galaxy_name, destination, size, gigantic, age, name) FROM stdin;
1	Sol	Milky Way	1001	1	f	4.6	Sun
2	Sirius	Milky Way	1002	2	t	0.24	Sirius A
3	Betelgeuse	Milky Way	1003	900	t	8.0	Betelgeuse
4	Rigel	Milky Way	1004	70	t	8.0	Rigel
5	Vega	Milky Way	1005	2	f	0.45	Vega
6	Polaris	Milky Way	1006	40	t	70.0	Polaris
7	Antares	Milky Way	1007	700	t	12.0	Antares
8	Aldebaran	Milky Way	1008	44	t	6.4	Aldebaran
9	Procyon	Milky Way	1009	2	f	1.7	Procyon
10	Altair	Milky Way	1010	2	f	1.2	Altair
11	Deneb	Milky Way	1011	200	t	10.0	Deneb
12	Spica	Milky Way	1012	8	t	12.5	Spica
13	Arcturus	Milky Way	1013	25	t	7.1	Arcturus
14	Capella	Milky Way	1014	12	t	0.6	Capella
15	Regulus	Milky Way	1015	3	f	0.9	Regulus
16	Alpheratz	Andromeda	1016	3	f	0.1	Alpheratz
17	Mirach	Andromeda	1017	100	t	3.5	Mirach
18	Algol	Andromeda	1018	3	f	0.1	Algol
19	Mira	Triangulum	1019	300	t	6.0	Mira
20	Rasalhague	Whirlpool	1020	3	f	1.0	Rasalhague
21	Fomalhaut	Sombrero	1021	2	f	0.4	Fomalhaut
\.


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 21, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.planet_id_seq', 21, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.star_id_seq', 21, true);


--
-- Name: asteroid asteroid_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_id UNIQUE (asteroid_id);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (galaxy_name);


--
-- Name: planet planet_have_moon_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_have_moon_key UNIQUE (related);


--
-- Name: planet planet_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_destination_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_destination_key UNIQUE (destination);


--
-- Name: star star_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_key UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_destination_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_destination_fkey FOREIGN KEY (destination) REFERENCES public.star(destination);


--
-- Name: star star_location_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_location_fkey FOREIGN KEY (galaxy_name) REFERENCES public.galaxy(galaxy_name);


--
-- PostgreSQL database dump complete
--

