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
    name character varying(50),
    galaxy_types character varying(50),
    distance_from_earth integer NOT NULL,
    size numeric(10,2) NOT NULL,
    age_in_million_of_year numeric(10,2),
    note text
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
    name character varying(50) NOT NULL,
    planet_id integer,
    mean_radius numeric(8,2),
    has_life boolean,
    note text
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
    name character varying(50) NOT NULL,
    star_id integer,
    type character varying(50),
    has_life boolean,
    distance_from_star integer,
    note text
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
-- Name: space_object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_object (
    space_object_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    discovered_by character varying(100),
    orbit_type character varying(50),
    is_natural boolean DEFAULT true,
    note text
);


ALTER TABLE public.space_object OWNER TO freecodecamp;

--
-- Name: space_object_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_object_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_object_object_id_seq OWNER TO freecodecamp;

--
-- Name: space_object_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_object_object_id_seq OWNED BY public.space_object.space_object_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    mass integer,
    age_in_millions_of_year integer,
    is_spherical boolean,
    note text
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
-- Name: space_object space_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object ALTER COLUMN space_object_id SET DEFAULT nextval('public.space_object_object_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 105000.00, 13600.00, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 220000.00, 10000.00, 'Nearest spiral galaxy; future merger with Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2730000, 60000.00, 12000.00, 'Member of the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'Spiral', 29000000, 50000.00, 10000.00, 'Distinctive bright bulge and dark dust lane');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'Spiral', 23000000, 60000.00, 11000.00, 'Interacting with companion galaxy NGC 5195');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 53000000, 980000.00, 13000.00, 'Hosts a supermassive black hole');
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 'Irregular', 158200, 14000.00, 13000.00, 'Satellite galaxy of the Milky Way');
INSERT INTO public.galaxy VALUES (8, 'Small Magellanic Cloud', 'Irregular', 197000, 7000.00, 12000.00, 'Companion to LMC');
INSERT INTO public.galaxy VALUES (9, 'Bode’s Galaxy (M81)', 'Spiral', 11800000, 90000.00, 12000.00, 'Active galactic nucleus');
INSERT INTO public.galaxy VALUES (10, 'Cigar Galaxy (M82)', 'Irregular', 12000000, 37000.00, 11000.00, 'Starburst galaxy with intense outflows');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737.40, false, 'Earth’s only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.10, false, 'Larger of Mars’ two moons');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.20, false, 'Smaller moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.60, false, 'Most volcanically active body in the solar system');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.80, false, 'May have subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.10, false, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.30, false, 'Heavily cratered surface');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575.50, false, 'Thick atmosphere; possible lakes of methane');
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 764.00, false, 'Second-largest moon of Saturn');
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 734.50, false, 'Two-tone coloration');
INSERT INTO public.moon VALUES (11, 'Dione', 6, 561.40, false, 'Bright ice cliffs');
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 531.10, false, 'Large impact crater Odysseus');
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 252.10, false, 'Geysers suggest subsurface ocean');
INSERT INTO public.moon VALUES (14, 'Mimas', 6, 198.20, false, 'Has a crater resembling the Death Star');
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 235.80, false, 'Patchwork surface features');
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 578.90, false, 'Bright icy surface');
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 584.70, false, 'Dark surface; least reflective');
INSERT INTO public.moon VALUES (18, 'Titania', 7, 788.40, false, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 761.40, false, 'Second-largest Uranian moon');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 1353.40, false, 'Retrograde orbit; geysers of nitrogen');
INSERT INTO public.moon VALUES (21, 'Proteus', 8, 210.00, false, 'Irregular shape');
INSERT INTO public.moon VALUES (22, 'Charon', 9, 606.00, false, 'Largest moon of Pluto');
INSERT INTO public.moon VALUES (23, 'Nix', 9, 49.80, false, 'Small outer moon of Pluto');
INSERT INTO public.moon VALUES (24, 'Hydra', 9, 43.00, false, 'Pluto’s outermost known moon');
INSERT INTO public.moon VALUES (25, 'Selene', 3, 1737.40, false, 'Mythical name for Earth’s moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, 58, 'Closest planet to the Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, 108, 'Thick atmosphere with runaway greenhouse effect');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, 150, 'Supports life; home to humanity');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, 228, 'Known as the Red Planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, 778, 'Largest planet in the solar system');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', false, 1430, 'Famous for its ring system');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, 2870, 'Rotates on its side');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, 4490, 'Strongest winds in the solar system');
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, 'Exoplanet', false, 600, 'Potentially habitable exoplanet');
INSERT INTO public.planet VALUES (10, 'Proxima b', 3, 'Exoplanet', false, 7, 'Orbits the closest star to the Sun');
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 4, 'Exoplanet', false, 20, 'Candidate for habitability');
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 5, 'Hot Jupiter', false, 7, 'First exoplanet observed transiting its star');
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', 6, 'Terrestrial', false, 0, 'One of seven Earth-sized planets');
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1f', 6, 'Terrestrial', false, 0, 'May have liquid water');
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1g', 6, 'Terrestrial', false, 0, 'Located in the habitable zone');


--
-- Data for Name: space_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_object VALUES (1, 'Sagittarius A*', 'Black Hole', 'Radio astronomers', 'None', true, 'Supermassive black hole at the center of the Milky Way');
INSERT INTO public.space_object VALUES (3, 'Voyager 1', 'Probe', 'NASA', 'Hyperbolic', false, 'Farthest human-made object from Earth');
INSERT INTO public.space_object VALUES (4, 'Oumuamua', 'Interstellar Object', 'Pan-STARRS', 'Hyperbolic', true, 'First known interstellar visitor to our solar system');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 4600, true, 'Main sequence G-type star; center of our solar system');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 2, 242, true, 'Brightest star in the night sky; binary system');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 20, 10, true, 'Red supergiant in Orion; nearing supernova');
INSERT INTO public.star VALUES (4, 'Rigel', 1, 21, 8, true, 'Blue supergiant; one of Orion’s brightest stars');
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 0, 4500, true, 'Closest known star to the Sun');
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1, 1, 5000, true, 'Part of the Alpha Centauri triple system');
INSERT INTO public.star VALUES (7, 'Vega', 1, 2, 455, true, 'Bright star in Lyra; used as a photometric standard');
INSERT INTO public.star VALUES (8, 'Polaris', 1, 6, 70, true, 'North Star; part of a multiple star system');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: space_object_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_object_object_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: star name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_object space_object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object
    ADD CONSTRAINT space_object_name_key UNIQUE (name);


--
-- Name: space_object space_object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object
    ADD CONSTRAINT space_object_pkey PRIMARY KEY (space_object_id);


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

