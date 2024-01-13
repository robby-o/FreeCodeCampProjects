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
-- Name: astronomical_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomical_event (
    event_type character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    astronomical_event_id integer NOT NULL
);


ALTER TABLE public.astronomical_event OWNER TO freecodecamp;

--
-- Name: astronomical_events_astronomical_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomical_events_astronomical_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomical_events_astronomical_event_id_seq OWNER TO freecodecamp;

--
-- Name: astronomical_events_astronomical_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomical_events_astronomical_event_id_seq OWNED BY public.astronomical_event.astronomical_event_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean,
    description text,
    distance_from_earth numeric(20,2),
    galaxy_type character varying(50)
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
    name character varying(100) NOT NULL,
    planet_id integer,
    discovery_year integer,
    discovered_by character varying(100)
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
    name character varying(100) NOT NULL,
    star_id integer,
    discovery_year integer,
    discovered_by character varying(100)
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer,
    is_spherical boolean,
    description text,
    distance_from_earth numeric(20,2),
    color character varying(50),
    planet_types character varying(100)
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
-- Name: star_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_system (
    number_of_stars integer NOT NULL,
    name character varying(100) NOT NULL,
    star_system_id integer NOT NULL
);


ALTER TABLE public.star_system OWNER TO freecodecamp;

--
-- Name: star_system_star_system_id_seq1; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_system_star_system_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_system_star_system_id_seq1 OWNER TO freecodecamp;

--
-- Name: star_system_star_system_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_system_star_system_id_seq1 OWNED BY public.star_system.star_system_id;


--
-- Name: astronomical_event astronomical_event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event ALTER COLUMN astronomical_event_id SET DEFAULT nextval('public.astronomical_events_astronomical_event_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_system star_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system ALTER COLUMN star_system_id SET DEFAULT nextval('public.star_system_star_system_id_seq1'::regclass);


--
-- Data for Name: astronomical_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomical_event VALUES ('Supernova', 'Supernova SN 1987A', 1);
INSERT INTO public.astronomical_event VALUES ('Eclipse', 'Solar Eclipse', 2);
INSERT INTO public.astronomical_event VALUES ('Comet', 'Halley''s Comet', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, true, 'Our home galaxy', 100000.25, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 20000, true, 'Nearest spiral galaxy', 200000.50, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5000, true, 'Small spiral galaxy', 75000.75, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 8000, true, 'Interacting spiral galaxies', 1200000.00, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 10000, true, 'Ellipitcal galaxy', 3000000.00, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 12000, true, 'Spiral galaxy with a bright nucleus', 1500000.00, 'Other');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (11, 'Moon', 15, 1610, 'Galileo Galilei');
INSERT INTO public.moon VALUES (12, 'Phobos', 16, 1877, 'Asaph Hall');
INSERT INTO public.moon VALUES (13, 'Deimos', 16, 1877, 'Asaph Hall');
INSERT INTO public.moon VALUES (14, 'Io', 17, 1610, 'Galileo Galilei');
INSERT INTO public.moon VALUES (15, 'Europa', 17, 1610, 'Galileo Galilei');
INSERT INTO public.moon VALUES (16, 'Ganymede', 17, 1610, 'Galileo Galilei');
INSERT INTO public.moon VALUES (17, 'Callisto', 17, 1610, 'Galileo Galilei');
INSERT INTO public.moon VALUES (18, 'Titan', 18, 1655, 'Christiaan HuygenE');
INSERT INTO public.moon VALUES (19, 'Enceladus', 18, 1789, 'William Herschel');
INSERT INTO public.moon VALUES (20, 'Triton', 20, 1846, 'William Lassell');
INSERT INTO public.moon VALUES (21, 'Charon', 21, 1978, 'James Christy');
INSERT INTO public.moon VALUES (22, 'Luna', 15, 1610, 'Galileo Galilei');
INSERT INTO public.moon VALUES (23, 'Phoebe', 16, 1898, 'William Henry Pickering');
INSERT INTO public.moon VALUES (24, 'Dione', 17, 1684, 'Giovanni Domenico Cassini');
INSERT INTO public.moon VALUES (25, 'Rhea', 17, 1672, 'Giovanni Domenico Cassini');
INSERT INTO public.moon VALUES (26, 'Miranda', 17, 1948, 'Gerard Kuiper');
INSERT INTO public.moon VALUES (27, 'Oberon', 17, 1787, 'William Herschel');
INSERT INTO public.moon VALUES (28, 'Nereid', 18, 1949, 'Gerard Kuiper');
INSERT INTO public.moon VALUES (29, 'Hydra', 18, 2005, 'Hydra');
INSERT INTO public.moon VALUES (30, 'Amalthea', 20, 1892, 'Edward Emerson Barnard');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 2, 0, 'Unknown');
INSERT INTO public.planet VALUES (14, 'Venus', 2, 0, 'Unknown');
INSERT INTO public.planet VALUES (15, 'Earth', 2, 0, 'Unknown');
INSERT INTO public.planet VALUES (16, 'Mars', 2, 0, 'Unknown');
INSERT INTO public.planet VALUES (17, 'Jupiter', 2, 0, 'Unknown');
INSERT INTO public.planet VALUES (18, 'Saturn', 2, 0, 'Unknown');
INSERT INTO public.planet VALUES (19, 'Uranus', 2, 0, 'Unknown');
INSERT INTO public.planet VALUES (20, 'Neptune', 2, 0, 'Unknown');
INSERT INTO public.planet VALUES (21, 'Pluto', 2, 0, 'Unknown');
INSERT INTO public.planet VALUES (22, 'Kepler-186f', 5, 2014, 'NASA Kepler Space Telescope');
INSERT INTO public.planet VALUES (23, 'TRAPPIST-1e', 6, 2017, 'TRAPPIST survey');
INSERT INTO public.planet VALUES (24, 'HD 219134 b', 7, 2015, 'NASA Kepler Space Telescope');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 1, 5000, true, 'The center of our soloar system', 0.00, 'Yellow', 'Terrestrial');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 2, 6000, true, 'Closest star system to us', 4.37, 'Yellow', 'Terrestrial');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 4, 8000, true, 'Red supregiant in Orion', 640.00, 'Red', 'Gas Giant');
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 2, 4000, true, 'Closest known star to the Sun', 4.24, 'Red', 'Ice Giant');
INSERT INTO public.star VALUES (6, 'Sirius', 1, 2000, true, 'Brightest star in the night sky', 8.60, 'White', 'Terrestrial');
INSERT INTO public.star VALUES (7, 'Alpha Centauri B', 2, 6000, true, 'Close companion to Alpha Centauri A', 4.37, 'Yellow', 'Terrestrial');


--
-- Data for Name: star_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_system VALUES (3, 'Apha Centauri', 1);
INSERT INTO public.star_system VALUES (1, 'Solar System', 2);
INSERT INTO public.star_system VALUES (7, 'Trappist-1', 3);


--
-- Name: astronomical_events_astronomical_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomical_events_astronomical_event_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: star_system_star_system_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_system_star_system_id_seq1', 3, true);


--
-- Name: astronomical_event astronomical_events_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_events_name_key UNIQUE (name);


--
-- Name: astronomical_event astronomical_events_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_events_pkey PRIMARY KEY (astronomical_event_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_system star_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_name_key UNIQUE (name);


--
-- Name: star_system star_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_pkey PRIMARY KEY (star_system_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet__name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet__name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

