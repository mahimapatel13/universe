--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    diameter_in_kiloparsecs integer,
    distance_in_lightyears integer NOT NULL,
    type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_kms integer,
    orbital_period_in_days integer NOT NULL,
    planet_id integer
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(60) NOT NULL,
    ngc text,
    distance_in_lightyrs integer NOT NULL,
    radius_in_ltyrs integer,
    year_discovered numeric
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_in_earths integer,
    surface_features text,
    water_on_planet boolean,
    orbital_period_in_days integer NOT NULL,
    visible_to_naked_eye boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    mass_in_solarmass integer,
    distance_from_sun_in_ltyrs integer,
    about text NOT NULL,
    galaxy_id integer
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Sagittarius Dwarf Irregular', NULL, 3400000, 'Dwarf');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 46, 2500000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Milky Way Galaxy', 28, 26000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Bode’s Galaxy', 29, 1180000, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Butterfly Galaxies', NULL, 62000000, 'Unbarred Spiral');
INSERT INTO public.galaxy VALUES (6, 'Eye of Sauron Galaxy', NULL, 52000000, 'Intermediate Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1738, 29, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 0, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 1, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 26341, 7, 5);
INSERT INTO public.moon VALUES (5, 'lo', 1821, 2, 5);
INSERT INTO public.moon VALUES (6, 'Europa', 1560, 3, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4821, 17, 5);
INSERT INTO public.moon VALUES (8, 'Himalia', 70, 248, 5);
INSERT INTO public.moon VALUES (9, 'Titan', 2574, 16, 6);
INSERT INTO public.moon VALUES (10, 'Rhea', 763, 4, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 252, 1, 6);
INSERT INTO public.moon VALUES (12, 'lapetus', 734, 79, 6);
INSERT INTO public.moon VALUES (13, 'Mimas', 198, 1, 6);
INSERT INTO public.moon VALUES (14, 'Phoebe', 106, 550, 6);
INSERT INTO public.moon VALUES (15, 'Titania', 788, 9, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 761, 13, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 578, 2, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 584, 4, 7);
INSERT INTO public.moon VALUES (19, 'Miranda', 236, 1, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 1353, 6, 8);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', 'NGC 1976', 1344, 12, 1610);
INSERT INTO public.nebula VALUES (2, 'Crab Nebula', 'NGC 1952', 6500, 5, 1731);
INSERT INTO public.nebula VALUES (3, 'Cat’s Eye Nebula', 'NGC 6543', 3300, NULL, 1786);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, 'greyish with an expansive rupes system generated from thrust faults', true, 88, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, 'atmospheric pressure 90 times as dense as on earths sea level', false, 583, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'surface is shaped by plate tectonics that formed the continental masses', true, 365, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0, 'Most of the planet is red due to iron oxide in Martian soil, and the polar regions are covered in white ice caps made of water and carbon dioxide', true, 687, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 318, 'On the surface, there are orange-brown and white cloud bands moving via the principles of atmospheric circulation, with giant storms swirling on the surface such as the Great Red Spot and various white ovals', true, 4331, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 95, ' Saturn has a magnetosphere capable of producing weak auroras. As of 2024, Saturn has 146 confirmed satellites', true, 10756, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 16, 'Uranuss outer layer has a muted cyan color, but underneath these clouds contain many mysteries about its climate phenomena, such as its unusually low internal heat and erratic cloud formation', true, 30681, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 17, ' Its outer atmosphere has a slightly muted cyan color, with occasional storms on the surface that look like dark spots', true, 60193, false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 5, 'The clouds on the planet would be thick and misty, covering much of the surface as viewed from space', true, 385, false, 4);
INSERT INTO public.planet VALUES (10, 'AEgir', 2, 'The planet was discovered in 2000, and as of 2024 remains the only confirmed planet in its planetary system', NULL, 2688, false, 3);
INSERT INTO public.planet VALUES (12, 'Proxima d', NULL, 'It is the least massive and innermost known planet of the Proxima Centauri system', NULL, 5, false, 7);
INSERT INTO public.planet VALUES (13, 'Proxima b', 1, 'It is believed to be a potentially Earth-like plane', NULL, 11, false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'Kepler-452', 1, 1810, 'The name Kepler-452 derives directly from the fact that the star is the catalogued 452nd star discovered by Kepler to have confirmed planets', 3);
INSERT INTO public.star VALUES (5, 'Rigel', 17, 860, 'A star of spectral type B8Ia, Rigel is calculated to be anywhere from 61,500 to 363,000 times as luminous as the Sun, and 18 to 24 times as massive, depending on the method and assumptions used', 3);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 15, 642, 'The variation in Betelgueses brightness was described in 1836 by Sir John Herchel in Outlines of Astronomy', 3);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', NULL, 4, 'It was discovered in 1915 by Robert Innes and is the nearest-known star to the Sun', 3);
INSERT INTO public.star VALUES (1, 'Sun', 1, NULL, 'It formed approximately 4.6 billion years ago from the gravitational collapse of matter within a region of a large molecular cloud. Most of this matter gathered in the center, whereas the rest flattened into an orbiting disk that became the Solar System', 3);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 9, 'Its displacement from the ecliptic causes its heliacal rising to be remarkably regular compared to other stars, with a period of almost exactly 365.25 days holding it constant relative to the solar year', 3);
INSERT INTO public.star VALUES (3, 'Epsilon Eridani', NULL, 10, 'The star is estimated to be less than a billion years old', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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

