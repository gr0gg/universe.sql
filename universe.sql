--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text NOT NULL,
    galaxy_type character varying(20),
    name character varying(20) NOT NULL,
    explored boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_gaxlaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_gaxlaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_gaxlaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_gaxlaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_gaxlaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: joint_data; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.joint_data (
    name character varying(40) NOT NULL,
    joint_data_id integer NOT NULL,
    done boolean
);


ALTER TABLE public.joint_data OWNER TO freecodecamp;

--
-- Name: joint_data_joint_data_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.joint_data_joint_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.joint_data_joint_data_id_seq OWNER TO freecodecamp;

--
-- Name: joint_data_joint_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.joint_data_joint_data_id_seq OWNED BY public.joint_data.joint_data_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    discovered date,
    planet_id integer NOT NULL,
    name character varying(40),
    orbit_period_in_days numeric(4,1)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    number_of_moons integer,
    is_spherical boolean NOT NULL,
    name character varying(40) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    number_of_planets integer,
    temperature_in_k integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_gaxlaxy_id_seq'::regclass);


--
-- Name: joint_data joint_data_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joint_data ALTER COLUMN joint_data_id SET DEFAULT nextval('public.joint_data_joint_data_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'our home in this universe. also a great candy bar', 'spiral', 'milky_way', true);
INSERT INTO public.galaxy VALUES (2, 'second biggest galaxy to the milky way', 'barred spiral', 'andromeda', false);
INSERT INTO public.galaxy VALUES (3, 'This galaxy is filled with bright blue star clusters', 'barred spiral', 'tadpole', false);
INSERT INTO public.galaxy VALUES (4, 'simliar in apperance to a sombrero', 'unclassified', 'sombreo', false);
INSERT INTO public.galaxy VALUES (5, 'was hidden behind a fast moving star and recently became observable', 'dwarf', 'peekaboo', false);
INSERT INTO public.galaxy VALUES (6, 'a nearly perfect ring of young hot blue stars cirling an old yellow nucleus', 'ring', 'hoags object', false);


--
-- Data for Name: joint_data; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.joint_data VALUES ('chris', 1, true);
INSERT INTO public.joint_data VALUES ('lisa', 2, true);
INSERT INTO public.joint_data VALUES ('Bubby', 3, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, '1609-01-01', 3, 'moon', 27.0);
INSERT INTO public.moon VALUES (4, '1887-03-30', 4, 'phobos', 12.0);
INSERT INTO public.moon VALUES (5, '1887-03-29', 4, 'deimos', 1.6);
INSERT INTO public.moon VALUES (6, '1610-01-07', 5, 'europa', 3.6);
INSERT INTO public.moon VALUES (7, '1610-01-08', 5, 'io', 1.8);
INSERT INTO public.moon VALUES (8, '1610-01-08', 5, 'callisto', 17.0);
INSERT INTO public.moon VALUES (9, '1938-07-30', 5, 'carme', 720.0);
INSERT INTO public.moon VALUES (10, '1655-03-25', 6, 'titan', 16.0);
INSERT INTO public.moon VALUES (11, '1684-03-30', 6, 'dione', 2.7);
INSERT INTO public.moon VALUES (12, '1789-01-01', 6, 'mimas', 0.9);
INSERT INTO public.moon VALUES (13, '1672-12-23', 6, 'rhea', 4.5);
INSERT INTO public.moon VALUES (14, '2000-01-01', 6, 'ymir', 131.0);
INSERT INTO public.moon VALUES (15, '2006-01-01', 6, 'loge', 131.0);
INSERT INTO public.moon VALUES (16, '2009-02-17', 6, 'skoll', 869.0);
INSERT INTO public.moon VALUES (17, '2004-06-01', 6, 'pallene', 1.0);
INSERT INTO public.moon VALUES (18, NULL, 20, 'kaz', 27.0);
INSERT INTO public.moon VALUES (19, NULL, 20, 'flume', 999.0);
INSERT INTO public.moon VALUES (20, NULL, 18, 'surtur', 2.0);
INSERT INTO public.moon VALUES (21, NULL, 20, 'bolg', 69.0);
INSERT INTO public.moon VALUES (22, NULL, 20, 'dio', 420.0);
INSERT INTO public.moon VALUES (23, NULL, 20, 'ugo', 20.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, NULL, true, 'mercury', 1);
INSERT INTO public.planet VALUES (2, NULL, true, 'venus', 1);
INSERT INTO public.planet VALUES (3, 1, true, 'earth', 1);
INSERT INTO public.planet VALUES (4, 2, true, 'mars', 1);
INSERT INTO public.planet VALUES (5, 95, false, 'jupiter', 1);
INSERT INTO public.planet VALUES (6, 146, false, 'saturn', 1);
INSERT INTO public.planet VALUES (7, 5, false, 'uranus', 1);
INSERT INTO public.planet VALUES (8, 7, false, 'neptune', 1);
INSERT INTO public.planet VALUES (9, NULL, true, 'plato', 1);
INSERT INTO public.planet VALUES (10, 3, true, 'Tattoine', 6);
INSERT INTO public.planet VALUES (11, 2, false, 'jaku', 5);
INSERT INTO public.planet VALUES (12, 40, false, 'zeus', 5);
INSERT INTO public.planet VALUES (13, NULL, false, 'sett', 2);
INSERT INTO public.planet VALUES (14, 240, true, 'mobo', 4);
INSERT INTO public.planet VALUES (15, 7, false, 'yogi', 4);
INSERT INTO public.planet VALUES (16, 2, true, 'ato', 6);
INSERT INTO public.planet VALUES (17, 3, false, 'bowie', 6);
INSERT INTO public.planet VALUES (18, 2, false, 'cade', 5);
INSERT INTO public.planet VALUES (19, 7, true, 'ixit', 2);
INSERT INTO public.planet VALUES (20, 1000, true, 'grog', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'sun', 9, 5778);
INSERT INTO public.star VALUES (2, 6, 'ab7', 3, 10500);
INSERT INTO public.star VALUES (3, 1, 'vy_canis_majoris', 0, 3490);
INSERT INTO public.star VALUES (4, 1, 'woh_g64', 6, 3500);
INSERT INTO public.star VALUES (5, 2, 'ky_cygni', 10, 3500);
INSERT INTO public.star VALUES (6, 4, 'xx_peresi', 40, 3700);


--
-- Name: galaxy_gaxlaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_gaxlaxy_id_seq', 6, true);


--
-- Name: joint_data_joint_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.joint_data_joint_data_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: joint_data joint_data_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joint_data
    ADD CONSTRAINT joint_data_name_key UNIQUE (name);


--
-- Name: joint_data joint_data_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joint_data
    ADD CONSTRAINT joint_data_pkey PRIMARY KEY (joint_data_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

