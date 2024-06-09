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
    name character varying(255) NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_life boolean,
    galaxy_type character varying(255) NOT NULL,
    description text,
    number_of_stars bigint NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean,
    description text,
    orbit_period integer NOT NULL,
    diameter integer NOT NULL
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    distance_from_star numeric NOT NULL,
    has_life boolean,
    planet_type character varying(255) NOT NULL,
    mass bigint NOT NULL,
    radius integer NOT NULL
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    is_functional boolean,
    launch_date date,
    mission_duration integer NOT NULL,
    orbit_altitude bigint NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean,
    star_type character varying(255) NOT NULL,
    luminosity bigint NOT NULL,
    temperature integer NOT NULL
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, true, 'Spiral', 'Our home galaxy', 100000000000, 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, false, 'Spiral', 'Closest spiral galaxy to Milky Way', 1000000000000, 10000);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 29000000, false, 'Elliptical', 'Has a bright nucleus and a prominent dust lane', 80000000000, 13000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 23000000, false, 'Spiral', 'Interacting grand-design spiral galaxy', 200000000000, 8000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 3000000, false, 'Spiral', 'Third largest member of the Local Group', 40000000000, 12000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 53600000, false, 'Elliptical', 'Has a supermassive black hole in its center', 300000000000, 14000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 'Earth''s only natural satellite', 27, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, true, 'Mars''s larger moon', 0, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, true, 'Mars''s smaller moon', 1, 12);
INSERT INTO public.moon VALUES (4, 'Europa', 3, true, 'One of Jupiter''s largest moons', 4, 3122);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, true, 'The largest moon in the solar system', 7, 5268);
INSERT INTO public.moon VALUES (6, 'Titan', 4, true, 'Saturn''s largest moon', 16, 5150);
INSERT INTO public.moon VALUES (7, 'Enceladus', 4, true, 'Saturn''s icy moon', 1, 504);
INSERT INTO public.moon VALUES (8, 'Oberon', 4, true, 'One of Uranus''s largest moons', 14, 1523);
INSERT INTO public.moon VALUES (9, 'Triton', 5, true, 'Neptune''s largest moon', 6, 2706);
INSERT INTO public.moon VALUES (10, 'Charon', 5, true, 'Pluto''s largest moon', 6, 1212);
INSERT INTO public.moon VALUES (11, 'Dysnomia', 6, true, 'Eris''s moon', 16, 700);
INSERT INTO public.moon VALUES (12, 'Nix', 7, true, 'Pluto''s small moon', 25, 50);
INSERT INTO public.moon VALUES (13, 'Hydra', 7, true, 'Pluto''s small moon', 25, 45);
INSERT INTO public.moon VALUES (14, 'Kerberos', 7, true, 'Pluto''s small moon', 32, 19);
INSERT INTO public.moon VALUES (15, 'Styx', 7, true, 'Pluto''s small moon', 20, 16);
INSERT INTO public.moon VALUES (16, 'Mimas', 4, true, 'Saturn''s small moon', 1, 396);
INSERT INTO public.moon VALUES (17, 'Iapetus', 4, true, 'Saturn''s two-tone moon', 79, 1469);
INSERT INTO public.moon VALUES (18, 'Miranda', 4, true, 'Uranus''s small moon', 1, 472);
INSERT INTO public.moon VALUES (19, 'Ariel', 4, true, 'Uranus''s large moon', 3, 1158);
INSERT INTO public.moon VALUES (20, 'Umbriel', 4, true, 'Uranus''s dark moon', 4, 1170);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, true, 'Terrestrial', 5972, 6371);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 1.524, false, 'Terrestrial', 641, 3390);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 5.204, false, 'Gas Giant', 1898600, 69911);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 9.582, false, 'Gas Giant', 568340, 58232);
INSERT INTO public.planet VALUES (5, 'Alpha Centauri Bb', 3, 0.04, false, 'Terrestrial', 1750, 11300);
INSERT INTO public.planet VALUES (6, 'Proxima Centauri b', 3, 0.05, false, 'Terrestrial', 1180, 6530);
INSERT INTO public.planet VALUES (7, 'Gliese 581g', 3, 0.13, false, 'Super-Earth', 3980, 11000);
INSERT INTO public.planet VALUES (8, 'Kepler-22b', 2, 0.85, NULL, 'Super-Earth', 2610, 15910);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1d', 2, 0.022, NULL, 'Terrestrial', 390, 3190);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 2, 0.029, NULL, 'Terrestrial', 526, 3400);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1f', 2, 0.037, NULL, 'Terrestrial', 680, 3540);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1g', 2, 0.045, NULL, 'Terrestrial', 920, 3690);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Space Telescope', 1, true, '1990-04-24', 30, 547);
INSERT INTO public.satellite VALUES (2, 'International Space Station', 1, true, '1998-11-20', 23, 408);
INSERT INTO public.satellite VALUES (3, 'Voyager 1', 1, true, '1977-09-05', 44, 139820);
INSERT INTO public.satellite VALUES (4, 'Voyager 2', 1, true, '1977-08-20', 44, 139820);
INSERT INTO public.satellite VALUES (5, 'James Webb Space Telescope', 1, true, '2021-12-25', 2, 1510000);
INSERT INTO public.satellite VALUES (6, 'Galileo', 3, false, '1989-10-18', 14, 22950);
INSERT INTO public.satellite VALUES (7, 'Juno', 3, true, '2011-08-05', 11, 2145000);
INSERT INTO public.satellite VALUES (8, 'Cassini-Huygens', 4, false, '1997-10-15', 20, 1427400);
INSERT INTO public.satellite VALUES (9, 'Pioneer 11', 4, false, '1973-04-06', 22, 1448000);
INSERT INTO public.satellite VALUES (10, 'New Horizons', 5, true, '2006-01-19', 16, 6695000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, true, 'G-Type Main-Sequence', 1, 5778);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 242, true, 'A-Type Main-Sequence', 25, 9940);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 4500, true, 'G-Type Main-Sequence', 2, 5790);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 8000, true, 'Red Supergiant', 100000, 3500);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 8700, true, 'Blue Supergiant', 120000, 11000);
INSERT INTO public.star VALUES (6, 'Vega', 1, 455, true, 'A-Type Main-Sequence', 40, 9602);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 10, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


