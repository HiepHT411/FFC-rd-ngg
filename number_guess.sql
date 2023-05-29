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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer NOT NULL,
    guesses integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (10, 1);
INSERT INTO public.games VALUES (12, 1);
INSERT INTO public.games VALUES (10, 1);
INSERT INTO public.games VALUES (10, 1);
INSERT INTO public.games VALUES (10, 1);
INSERT INTO public.games VALUES (1, 0);
INSERT INTO public.games VALUES (1, 23);
INSERT INTO public.games VALUES (1, 0);
INSERT INTO public.games VALUES (1, 4);
INSERT INTO public.games VALUES (19, 1);
INSERT INTO public.games VALUES (19, 2);
INSERT INTO public.games VALUES (20, 214);
INSERT INTO public.games VALUES (20, 916);
INSERT INTO public.games VALUES (21, 528);
INSERT INTO public.games VALUES (21, 31);
INSERT INTO public.games VALUES (20, 870);
INSERT INTO public.games VALUES (20, 242);
INSERT INTO public.games VALUES (20, 861);
INSERT INTO public.games VALUES (22, 733);
INSERT INTO public.games VALUES (22, 113);
INSERT INTO public.games VALUES (23, 346);
INSERT INTO public.games VALUES (23, 806);
INSERT INTO public.games VALUES (22, 846);
INSERT INTO public.games VALUES (22, 470);
INSERT INTO public.games VALUES (22, 90);
INSERT INTO public.games VALUES (24, 129);
INSERT INTO public.games VALUES (24, 669);
INSERT INTO public.games VALUES (25, 5);
INSERT INTO public.games VALUES (25, 637);
INSERT INTO public.games VALUES (24, 218);
INSERT INTO public.games VALUES (24, 255);
INSERT INTO public.games VALUES (24, 793);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'ryan');
INSERT INTO public.users VALUES (4, 'user_1685334725914');
INSERT INTO public.users VALUES (5, 'user_1685334725913');
INSERT INTO public.users VALUES (6, 'user_1685334908399');
INSERT INTO public.users VALUES (7, 'user_1685334908398');
INSERT INTO public.users VALUES (8, 'user_1685335032628');
INSERT INTO public.users VALUES (9, 'user_1685335032627');
INSERT INTO public.users VALUES (10, 'user_1685342879268');
INSERT INTO public.users VALUES (12, 'user_1685342879267');
INSERT INTO public.users VALUES (19, 'hiep');
INSERT INTO public.users VALUES (20, 'user_1685344102863');
INSERT INTO public.users VALUES (21, 'user_1685344102862');
INSERT INTO public.users VALUES (22, 'user_1685344134294');
INSERT INTO public.users VALUES (23, 'user_1685344134293');
INSERT INTO public.users VALUES (24, 'user_1685344730868');
INSERT INTO public.users VALUES (25, 'user_1685344730867');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 25, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games fk_users_games; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_users_games FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

