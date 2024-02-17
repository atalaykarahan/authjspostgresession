PGDMP                      |            home_library    16.1    16.1 p    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17162    home_library    DATABASE     n   CREATE DATABASE home_library WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE home_library;
                postgres    false                        3079    17163 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1255    17174    insert_timestamp_for_log()    FUNCTION     �   CREATE FUNCTION public.insert_timestamp_for_log() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.event_date := NOW();
    RETURN NEW;
END;
$$;
 1   DROP FUNCTION public.insert_timestamp_for_log();
       public          postgres    false            �            1259    17175    AUTHOR    TABLE     �   CREATE TABLE public."AUTHOR" (
    author_id bigint NOT NULL,
    author_name character varying(50) NOT NULL,
    author_surname character varying(50)
);
    DROP TABLE public."AUTHOR";
       public         heap    postgres    false            �            1259    17178 	   AUTHORITY    TABLE     o   CREATE TABLE public."AUTHORITY" (
    authority_id bigint NOT NULL,
    role character varying(16) NOT NULL
);
    DROP TABLE public."AUTHORITY";
       public         heap    postgres    false            �            1259    17181    AUTHORITY_id_seq    SEQUENCE     �   ALTER TABLE public."AUTHORITY" ALTER COLUMN authority_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."AUTHORITY_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    17182    AUTHOR_id_seq    SEQUENCE     �   ALTER TABLE public."AUTHOR" ALTER COLUMN author_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."AUTHOR_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    17183    BOOK    TABLE     �   CREATE TABLE public."BOOK" (
    book_id bigint NOT NULL,
    book_title text NOT NULL,
    author_id bigint NOT NULL,
    publisher_id bigint,
    status_id bigint NOT NULL,
    image_path text,
    book_summary text,
    book_isbn integer
);
    DROP TABLE public."BOOK";
       public         heap    postgres    false            �            1259    17188    BOOK_CATEGORY    TABLE     f   CREATE TABLE public."BOOK_CATEGORY" (
    book_id bigint NOT NULL,
    category_id bigint NOT NULL
);
 #   DROP TABLE public."BOOK_CATEGORY";
       public         heap    postgres    false            �            1259    17191    BOOK_TRANSLATOR    TABLE     j   CREATE TABLE public."BOOK_TRANSLATOR" (
    book_id bigint NOT NULL,
    translator_id bigint NOT NULL
);
 %   DROP TABLE public."BOOK_TRANSLATOR";
       public         heap    postgres    false            �            1259    17194    BOOK_id_seq    SEQUENCE     �   ALTER TABLE public."BOOK" ALTER COLUMN book_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."BOOK_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    17195    CATEGORY    TABLE     v   CREATE TABLE public."CATEGORY" (
    category_id bigint NOT NULL,
    category_name character varying(50) NOT NULL
);
    DROP TABLE public."CATEGORY";
       public         heap    postgres    false            �            1259    17198    CATEGORY_id_seq    SEQUENCE     �   ALTER TABLE public."CATEGORY" ALTER COLUMN category_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."CATEGORY_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    17199 
   DB_SESSION    TABLE     �   CREATE TABLE public."DB_SESSION" (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);
     DROP TABLE public."DB_SESSION";
       public         heap    postgres    false            �            1259    17204 
   EVENT_TYPE    TABLE     r   CREATE TABLE public."EVENT_TYPE" (
    event_id bigint NOT NULL,
    event_name character varying(50) NOT NULL
);
     DROP TABLE public."EVENT_TYPE";
       public         heap    postgres    false            �            1259    17207    EVENT_TYPE_id_seq    SEQUENCE     �   ALTER TABLE public."EVENT_TYPE" ALTER COLUMN event_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."EVENT_TYPE_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            �            1259    17208    LOG    TABLE     H  CREATE TABLE public."LOG" (
    log_id bigint NOT NULL,
    user_id bigint,
    event_type_id bigint NOT NULL,
    event_date timestamp without time zone NOT NULL,
    book_id bigint,
    description text,
    category_id bigint,
    translator_id bigint,
    publisher_id bigint,
    author_id bigint,
    reading_id bigint
);
    DROP TABLE public."LOG";
       public         heap    postgres    false            �            1259    17213 
   LOG_id_seq    SEQUENCE     �   ALTER TABLE public."LOG" ALTER COLUMN log_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."LOG_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            �            1259    17214 	   PUBLISHER    TABLE     y   CREATE TABLE public."PUBLISHER" (
    publisher_id bigint NOT NULL,
    publisher_name character varying(50) NOT NULL
);
    DROP TABLE public."PUBLISHER";
       public         heap    postgres    false            �            1259    17217    PUBLISHER_id_seq    SEQUENCE     �   ALTER TABLE public."PUBLISHER" ALTER COLUMN publisher_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."PUBLISHER_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    231            �            1259    17218    READING    TABLE     �   CREATE TABLE public."READING" (
    reading_id bigint NOT NULL,
    user_id bigint NOT NULL,
    book_id bigint NOT NULL,
    status_id bigint NOT NULL,
    comment text
);
    DROP TABLE public."READING";
       public         heap    postgres    false            �            1259    17223    READING_id_seq    SEQUENCE     �   ALTER TABLE public."READING" ALTER COLUMN reading_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."READING_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            �            1259    17224    STATUS    TABLE     p   CREATE TABLE public."STATUS" (
    status_id bigint NOT NULL,
    status_name character varying(50) NOT NULL
);
    DROP TABLE public."STATUS";
       public         heap    postgres    false            �            1259    17227    STATUS_id_seq    SEQUENCE     �   ALTER TABLE public."STATUS" ALTER COLUMN status_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."STATUS_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            �            1259    17228 
   TRANSLATOR    TABLE     �   CREATE TABLE public."TRANSLATOR" (
    translator_id bigint NOT NULL,
    translator_name character varying(30) NOT NULL,
    translator_surname character varying(30)
);
     DROP TABLE public."TRANSLATOR";
       public         heap    postgres    false            �            1259    17231    TRANSLATOR_id_seq    SEQUENCE     �   ALTER TABLE public."TRANSLATOR" ALTER COLUMN translator_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."TRANSLATOR_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            �            1259    17232    USER    TABLE     �   CREATE TABLE public."USER" (
    user_id bigint NOT NULL,
    user_name character varying(16) NOT NULL,
    password character varying(120) NOT NULL,
    email character varying(50),
    authority_id bigint NOT NULL
);
    DROP TABLE public."USER";
       public         heap    postgres    false            �            1259    17235    USER_id_seq    SEQUENCE     �   ALTER TABLE public."USER" ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."USER_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            w          0    17175    AUTHOR 
   TABLE DATA           J   COPY public."AUTHOR" (author_id, author_name, author_surname) FROM stdin;
    public          postgres    false    216   �       x          0    17178 	   AUTHORITY 
   TABLE DATA           9   COPY public."AUTHORITY" (authority_id, role) FROM stdin;
    public          postgres    false    217   �       {          0    17183    BOOK 
   TABLE DATA           ~   COPY public."BOOK" (book_id, book_title, author_id, publisher_id, status_id, image_path, book_summary, book_isbn) FROM stdin;
    public          postgres    false    220   #�       |          0    17188    BOOK_CATEGORY 
   TABLE DATA           ?   COPY public."BOOK_CATEGORY" (book_id, category_id) FROM stdin;
    public          postgres    false    221   ��       }          0    17191    BOOK_TRANSLATOR 
   TABLE DATA           C   COPY public."BOOK_TRANSLATOR" (book_id, translator_id) FROM stdin;
    public          postgres    false    222   '�                 0    17195    CATEGORY 
   TABLE DATA           @   COPY public."CATEGORY" (category_id, category_name) FROM stdin;
    public          postgres    false    224   D�       �          0    17199 
   DB_SESSION 
   TABLE DATA           9   COPY public."DB_SESSION" (sid, sess, expire) FROM stdin;
    public          postgres    false    226   ��       �          0    17204 
   EVENT_TYPE 
   TABLE DATA           <   COPY public."EVENT_TYPE" (event_id, event_name) FROM stdin;
    public          postgres    false    227   ��       �          0    17208    LOG 
   TABLE DATA           �   COPY public."LOG" (log_id, user_id, event_type_id, event_date, book_id, description, category_id, translator_id, publisher_id, author_id, reading_id) FROM stdin;
    public          postgres    false    229   ~�       �          0    17214 	   PUBLISHER 
   TABLE DATA           C   COPY public."PUBLISHER" (publisher_id, publisher_name) FROM stdin;
    public          postgres    false    231   ��       �          0    17218    READING 
   TABLE DATA           U   COPY public."READING" (reading_id, user_id, book_id, status_id, comment) FROM stdin;
    public          postgres    false    233   ��       �          0    17224    STATUS 
   TABLE DATA           :   COPY public."STATUS" (status_id, status_name) FROM stdin;
    public          postgres    false    235   Χ       �          0    17228 
   TRANSLATOR 
   TABLE DATA           Z   COPY public."TRANSLATOR" (translator_id, translator_name, translator_surname) FROM stdin;
    public          postgres    false    237   >�       �          0    17232    USER 
   TABLE DATA           S   COPY public."USER" (user_id, user_name, password, email, authority_id) FROM stdin;
    public          postgres    false    239   X�       �           0    0    AUTHORITY_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."AUTHORITY_id_seq"', 3, true);
          public          postgres    false    218            �           0    0    AUTHOR_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."AUTHOR_id_seq"', 74, true);
          public          postgres    false    219            �           0    0    BOOK_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."BOOK_id_seq"', 16, true);
          public          postgres    false    223            �           0    0    CATEGORY_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."CATEGORY_id_seq"', 4, true);
          public          postgres    false    225            �           0    0    EVENT_TYPE_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."EVENT_TYPE_id_seq"', 34, true);
          public          postgres    false    228            �           0    0 
   LOG_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public."LOG_id_seq"', 5, true);
          public          postgres    false    230            �           0    0    PUBLISHER_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."PUBLISHER_id_seq"', 25, true);
          public          postgres    false    232            �           0    0    READING_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."READING_id_seq"', 1, false);
          public          postgres    false    234            �           0    0    STATUS_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."STATUS_id_seq"', 6, true);
          public          postgres    false    236            �           0    0    TRANSLATOR_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."TRANSLATOR_id_seq"', 39, true);
          public          postgres    false    238            �           0    0    USER_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."USER_id_seq"', 141, true);
          public          postgres    false    240            �           2606    17238    AUTHORITY AUTHORITY_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."AUTHORITY"
    ADD CONSTRAINT "AUTHORITY_pkey" PRIMARY KEY (authority_id);
 F   ALTER TABLE ONLY public."AUTHORITY" DROP CONSTRAINT "AUTHORITY_pkey";
       public            postgres    false    217            �           2606    17240    AUTHORITY AUTHORITY_role_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."AUTHORITY"
    ADD CONSTRAINT "AUTHORITY_role_key" UNIQUE (role);
 J   ALTER TABLE ONLY public."AUTHORITY" DROP CONSTRAINT "AUTHORITY_role_key";
       public            postgres    false    217            �           2606    17242 ,   AUTHOR AUTHOR_author_name_author_surname_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."AUTHOR"
    ADD CONSTRAINT "AUTHOR_author_name_author_surname_key" UNIQUE (author_name, author_surname);
 Z   ALTER TABLE ONLY public."AUTHOR" DROP CONSTRAINT "AUTHOR_author_name_author_surname_key";
       public            postgres    false    216    216            �           2606    17244    AUTHOR AUTHOR_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."AUTHOR"
    ADD CONSTRAINT "AUTHOR_pkey" PRIMARY KEY (author_id);
 @   ALTER TABLE ONLY public."AUTHOR" DROP CONSTRAINT "AUTHOR_pkey";
       public            postgres    false    216            �           2606    17246     BOOK_CATEGORY BOOK_CATEGORY_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."BOOK_CATEGORY"
    ADD CONSTRAINT "BOOK_CATEGORY_pkey" PRIMARY KEY (book_id, category_id);
 N   ALTER TABLE ONLY public."BOOK_CATEGORY" DROP CONSTRAINT "BOOK_CATEGORY_pkey";
       public            postgres    false    221    221            �           2606    17248 $   BOOK_TRANSLATOR BOOK_TRANSLATOR_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."BOOK_TRANSLATOR"
    ADD CONSTRAINT "BOOK_TRANSLATOR_pkey" PRIMARY KEY (book_id, translator_id);
 R   ALTER TABLE ONLY public."BOOK_TRANSLATOR" DROP CONSTRAINT "BOOK_TRANSLATOR_pkey";
       public            postgres    false    222    222            �           2606    17250    BOOK BOOK_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public."BOOK"
    ADD CONSTRAINT "BOOK_pkey" PRIMARY KEY (book_id);
 <   ALTER TABLE ONLY public."BOOK" DROP CONSTRAINT "BOOK_pkey";
       public            postgres    false    220            �           2606    17252 #   CATEGORY CATEGORY_category_name_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."CATEGORY"
    ADD CONSTRAINT "CATEGORY_category_name_key" UNIQUE (category_name);
 Q   ALTER TABLE ONLY public."CATEGORY" DROP CONSTRAINT "CATEGORY_category_name_key";
       public            postgres    false    224            �           2606    17254    CATEGORY CATEGORY_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."CATEGORY"
    ADD CONSTRAINT "CATEGORY_pkey" PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public."CATEGORY" DROP CONSTRAINT "CATEGORY_pkey";
       public            postgres    false    224            �           2606    17256 $   EVENT_TYPE EVENT_TYPE_event_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public."EVENT_TYPE"
    ADD CONSTRAINT "EVENT_TYPE_event_name_key" UNIQUE (event_name);
 R   ALTER TABLE ONLY public."EVENT_TYPE" DROP CONSTRAINT "EVENT_TYPE_event_name_key";
       public            postgres    false    227            �           2606    17258    EVENT_TYPE EVENT_TYPE_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."EVENT_TYPE"
    ADD CONSTRAINT "EVENT_TYPE_pkey" PRIMARY KEY (event_id);
 H   ALTER TABLE ONLY public."EVENT_TYPE" DROP CONSTRAINT "EVENT_TYPE_pkey";
       public            postgres    false    227            �           2606    17260    LOG LOG_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "LOG_pkey" PRIMARY KEY (log_id);
 :   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "LOG_pkey";
       public            postgres    false    229            �           2606    17262    PUBLISHER PUBLISHER_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."PUBLISHER"
    ADD CONSTRAINT "PUBLISHER_pkey" PRIMARY KEY (publisher_id);
 F   ALTER TABLE ONLY public."PUBLISHER" DROP CONSTRAINT "PUBLISHER_pkey";
       public            postgres    false    231            �           2606    17264 &   PUBLISHER PUBLISHER_publisher_name_key 
   CONSTRAINT     o   ALTER TABLE ONLY public."PUBLISHER"
    ADD CONSTRAINT "PUBLISHER_publisher_name_key" UNIQUE (publisher_name);
 T   ALTER TABLE ONLY public."PUBLISHER" DROP CONSTRAINT "PUBLISHER_publisher_name_key";
       public            postgres    false    231            �           2606    17266    READING READING_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."READING"
    ADD CONSTRAINT "READING_pkey" PRIMARY KEY (reading_id);
 B   ALTER TABLE ONLY public."READING" DROP CONSTRAINT "READING_pkey";
       public            postgres    false    233            �           2606    17268    STATUS STATUS_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."STATUS"
    ADD CONSTRAINT "STATUS_pkey" PRIMARY KEY (status_id);
 @   ALTER TABLE ONLY public."STATUS" DROP CONSTRAINT "STATUS_pkey";
       public            postgres    false    235            �           2606    17270    STATUS STATUS_status_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."STATUS"
    ADD CONSTRAINT "STATUS_status_name_key" UNIQUE (status_name);
 K   ALTER TABLE ONLY public."STATUS" DROP CONSTRAINT "STATUS_status_name_key";
       public            postgres    false    235            �           2606    17272    TRANSLATOR TRANSLATOR_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."TRANSLATOR"
    ADD CONSTRAINT "TRANSLATOR_pkey" PRIMARY KEY (translator_id);
 H   ALTER TABLE ONLY public."TRANSLATOR" DROP CONSTRAINT "TRANSLATOR_pkey";
       public            postgres    false    237            �           2606    17274 <   TRANSLATOR TRANSLATOR_translator_name_translator_surname_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."TRANSLATOR"
    ADD CONSTRAINT "TRANSLATOR_translator_name_translator_surname_key" UNIQUE (translator_name, translator_surname);
 j   ALTER TABLE ONLY public."TRANSLATOR" DROP CONSTRAINT "TRANSLATOR_translator_name_translator_surname_key";
       public            postgres    false    237    237            �           2606    17276    USER USER_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."USER"
    ADD CONSTRAINT "USER_email_key" UNIQUE (email);
 A   ALTER TABLE ONLY public."USER" DROP CONSTRAINT "USER_email_key";
       public            postgres    false    239            �           2606    17278    USER USER_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public."USER"
    ADD CONSTRAINT "USER_pkey" PRIMARY KEY (user_id);
 <   ALTER TABLE ONLY public."USER" DROP CONSTRAINT "USER_pkey";
       public            postgres    false    239            �           2606    17280    USER USER_user_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."USER"
    ADD CONSTRAINT "USER_user_name_key" UNIQUE (user_name);
 E   ALTER TABLE ONLY public."USER" DROP CONSTRAINT "USER_user_name_key";
       public            postgres    false    239            �           2606    17282    DB_SESSION session_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."DB_SESSION"
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);
 C   ALTER TABLE ONLY public."DB_SESSION" DROP CONSTRAINT session_pkey;
       public            postgres    false    226            �           1259    17283    IDX_session_expire    INDEX     O   CREATE INDEX "IDX_session_expire" ON public."DB_SESSION" USING btree (expire);
 (   DROP INDEX public."IDX_session_expire";
       public            postgres    false    226            �           1259    17284    fki_FK_LOG.author_id    INDEX     M   CREATE INDEX "fki_FK_LOG.author_id" ON public."LOG" USING btree (author_id);
 *   DROP INDEX public."fki_FK_LOG.author_id";
       public            postgres    false    229            �           1259    17285    fki_FK_LOG.book_id    INDEX     I   CREATE INDEX "fki_FK_LOG.book_id" ON public."LOG" USING btree (book_id);
 (   DROP INDEX public."fki_FK_LOG.book_id";
       public            postgres    false    229            �           1259    17286    fki_FK_LOG.category_id    INDEX     Q   CREATE INDEX "fki_FK_LOG.category_id" ON public."LOG" USING btree (category_id);
 ,   DROP INDEX public."fki_FK_LOG.category_id";
       public            postgres    false    229            �           1259    17287    fki_FK_LOG.event_type_id    INDEX     U   CREATE INDEX "fki_FK_LOG.event_type_id" ON public."LOG" USING btree (event_type_id);
 .   DROP INDEX public."fki_FK_LOG.event_type_id";
       public            postgres    false    229            �           1259    17288    fki_FK_LOG.publisher_id    INDEX     S   CREATE INDEX "fki_FK_LOG.publisher_id" ON public."LOG" USING btree (publisher_id);
 -   DROP INDEX public."fki_FK_LOG.publisher_id";
       public            postgres    false    229            �           1259    17289    fki_FK_LOG.reading_id    INDEX     O   CREATE INDEX "fki_FK_LOG.reading_id" ON public."LOG" USING btree (reading_id);
 +   DROP INDEX public."fki_FK_LOG.reading_id";
       public            postgres    false    229            �           1259    17290    fki_FK_LOG.translator_id    INDEX     U   CREATE INDEX "fki_FK_LOG.translator_id" ON public."LOG" USING btree (translator_id);
 .   DROP INDEX public."fki_FK_LOG.translator_id";
       public            postgres    false    229            �           1259    17291    fki_FK_LOG.user_id    INDEX     I   CREATE INDEX "fki_FK_LOG.user_id" ON public."LOG" USING btree (user_id);
 (   DROP INDEX public."fki_FK_LOG.user_id";
       public            postgres    false    229            �           1259    17292    fki_FK_READING.book_id    INDEX     Q   CREATE INDEX "fki_FK_READING.book_id" ON public."READING" USING btree (book_id);
 ,   DROP INDEX public."fki_FK_READING.book_id";
       public            postgres    false    233            �           1259    17293    fki_FK_READING.user_id    INDEX     Q   CREATE INDEX "fki_FK_READING.user_id" ON public."READING" USING btree (user_id);
 ,   DROP INDEX public."fki_FK_READING.user_id";
       public            postgres    false    233            �           1259    17294    fki_sdfsdfsdfs    INDEX     G   CREATE INDEX fki_sdfsdfsdfs ON public."READING" USING btree (user_id);
 "   DROP INDEX public.fki_sdfsdfsdfs;
       public            postgres    false    233            �           2620    17295    LOG event_date    TRIGGER     y   CREATE TRIGGER event_date BEFORE INSERT ON public."LOG" FOR EACH ROW EXECUTE FUNCTION public.insert_timestamp_for_log();
 )   DROP TRIGGER event_date ON public."LOG";
       public          postgres    false    229    251            �           2606    17296 &   BOOK_CATEGORY FK_BOOK_CATEGORY_book_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."BOOK_CATEGORY"
    ADD CONSTRAINT "FK_BOOK_CATEGORY_book_id" FOREIGN KEY (book_id) REFERENCES public."BOOK"(book_id);
 T   ALTER TABLE ONLY public."BOOK_CATEGORY" DROP CONSTRAINT "FK_BOOK_CATEGORY_book_id";
       public          postgres    false    4771    221    220            �           2606    17301 *   BOOK_CATEGORY FK_BOOK_CATEGORY_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."BOOK_CATEGORY"
    ADD CONSTRAINT "FK_BOOK_CATEGORY_category_id" FOREIGN KEY (category_id) REFERENCES public."CATEGORY"(category_id);
 X   ALTER TABLE ONLY public."BOOK_CATEGORY" DROP CONSTRAINT "FK_BOOK_CATEGORY_category_id";
       public          postgres    false    224    221    4779            �           2606    17306 *   BOOK_TRANSLATOR FK_BOOK_TRANSLATOR_book_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."BOOK_TRANSLATOR"
    ADD CONSTRAINT "FK_BOOK_TRANSLATOR_book_id" FOREIGN KEY (book_id) REFERENCES public."BOOK"(book_id);
 X   ALTER TABLE ONLY public."BOOK_TRANSLATOR" DROP CONSTRAINT "FK_BOOK_TRANSLATOR_book_id";
       public          postgres    false    220    222    4771            �           2606    17311 0   BOOK_TRANSLATOR FK_BOOK_TRANSLATOR_translator_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."BOOK_TRANSLATOR"
    ADD CONSTRAINT "FK_BOOK_TRANSLATOR_translator_id" FOREIGN KEY (translator_id) REFERENCES public."TRANSLATOR"(translator_id);
 ^   ALTER TABLE ONLY public."BOOK_TRANSLATOR" DROP CONSTRAINT "FK_BOOK_TRANSLATOR_translator_id";
       public          postgres    false    237    4811    222            �           2606    17316    BOOK FK_BOOK_author_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."BOOK"
    ADD CONSTRAINT "FK_BOOK_author_id" FOREIGN KEY (author_id) REFERENCES public."AUTHOR"(author_id);
 D   ALTER TABLE ONLY public."BOOK" DROP CONSTRAINT "FK_BOOK_author_id";
       public          postgres    false    216    4765    220            �           2606    17321    BOOK FK_BOOK_publisher_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."BOOK"
    ADD CONSTRAINT "FK_BOOK_publisher_id" FOREIGN KEY (publisher_id) REFERENCES public."PUBLISHER"(publisher_id);
 G   ALTER TABLE ONLY public."BOOK" DROP CONSTRAINT "FK_BOOK_publisher_id";
       public          postgres    false    4798    231    220            �           2606    17326    BOOK FK_BOOK_status_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."BOOK"
    ADD CONSTRAINT "FK_BOOK_status_id" FOREIGN KEY (status_id) REFERENCES public."STATUS"(status_id);
 D   ALTER TABLE ONLY public."BOOK" DROP CONSTRAINT "FK_BOOK_status_id";
       public          postgres    false    220    4807    235            �           2606    17331    LOG FK_LOG_author_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_author_id" FOREIGN KEY (author_id) REFERENCES public."AUTHOR"(author_id);
 B   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_author_id";
       public          postgres    false    216    229    4765            �           2606    17336    LOG FK_LOG_book_id    FK CONSTRAINT     {   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_book_id" FOREIGN KEY (book_id) REFERENCES public."BOOK"(book_id);
 @   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_book_id";
       public          postgres    false    220    229    4771            �           2606    17341    LOG FK_LOG_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_category_id" FOREIGN KEY (category_id) REFERENCES public."CATEGORY"(category_id);
 D   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_category_id";
       public          postgres    false    224    229    4779            �           2606    17346    LOG FK_LOG_event_type_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_event_type_id" FOREIGN KEY (event_type_id) REFERENCES public."EVENT_TYPE"(event_id);
 F   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_event_type_id";
       public          postgres    false    229    227    4786            �           2606    17351    LOG FK_LOG_publisher_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_publisher_id" FOREIGN KEY (publisher_id) REFERENCES public."PUBLISHER"(publisher_id);
 E   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_publisher_id";
       public          postgres    false    229    4798    231            �           2606    17356    LOG FK_LOG_reading_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_reading_id" FOREIGN KEY (reading_id) REFERENCES public."READING"(reading_id);
 C   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_reading_id";
       public          postgres    false    229    233    4802            �           2606    17361    LOG FK_LOG_translator_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_translator_id" FOREIGN KEY (translator_id) REFERENCES public."TRANSLATOR"(translator_id);
 F   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_translator_id";
       public          postgres    false    4811    229    237            �           2606    17366    LOG FK_LOG_user_id    FK CONSTRAINT     {   ALTER TABLE ONLY public."LOG"
    ADD CONSTRAINT "FK_LOG_user_id" FOREIGN KEY (user_id) REFERENCES public."USER"(user_id);
 @   ALTER TABLE ONLY public."LOG" DROP CONSTRAINT "FK_LOG_user_id";
       public          postgres    false    4817    239    229            �           2606    17371    READING FK_READING_book_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."READING"
    ADD CONSTRAINT "FK_READING_book_id" FOREIGN KEY (book_id) REFERENCES public."BOOK"(book_id);
 H   ALTER TABLE ONLY public."READING" DROP CONSTRAINT "FK_READING_book_id";
       public          postgres    false    233    220    4771            �           2606    17376    READING FK_READING_status_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."READING"
    ADD CONSTRAINT "FK_READING_status_id" FOREIGN KEY (status_id) REFERENCES public."STATUS"(status_id);
 J   ALTER TABLE ONLY public."READING" DROP CONSTRAINT "FK_READING_status_id";
       public          postgres    false    235    4807    233            �           2606    17381    READING FK_READING_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."READING"
    ADD CONSTRAINT "FK_READING_user_id" FOREIGN KEY (user_id) REFERENCES public."USER"(user_id);
 H   ALTER TABLE ONLY public."READING" DROP CONSTRAINT "FK_READING_user_id";
       public          postgres    false    239    233    4817            �           2606    17386    USER FK_USER_authority_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."USER"
    ADD CONSTRAINT "FK_USER_authority_id" FOREIGN KEY (authority_id) REFERENCES public."AUTHORITY"(authority_id);
 G   ALTER TABLE ONLY public."USER" DROP CONSTRAINT "FK_USER_authority_id";
       public          postgres    false    4767    239    217            w   �  x��Kr�0���)t���,�I�W3v��f��%DBM���G�L�=H��*�%~ďX��,��e{��Zx{4K�1�h�G�ܠ��Ym�r�|�O8��ɟ�I�8p���+����w�(B����ؓ#�Q�Q"�/���{�xg����$�5 �!I��8b�1��ʲ���1{����!����la�GA�Y�]����!;-���\˟PM���G�_��p�e�'��J1�C�wt�z&nM�H�G��0�^yB��ԥX鼒U�A��w���%S��<HKn�1!,
x�x!�;����/�4��bւ5|��p���a����:R]c"H��܋D�&�!א$F��&�x��������V/	�i7�B�eݡ�r	x
�õ����=������\�b��Z��y�\�P�k8�;S��$�}��d�U]O*	6}��&�$��tT�6�Fm�� U�}0�.����or&k�z��u�ۆ�z���)��<�ؙu�����#�mf��Ap�)      x   $   x�3�L/M-.�2�LL����2�,-N-����� uh      {      x��[ˎWr]���zc� �Ii����=-�P["A�#��V孪;�*䣄�w�66 �����ኻj����D���j����̼q�F�8��/ξ	eV������,B�x��ݳ�ߟ}ʿ޽��*tK����\�䡭��xS1��r�����Uy�=w��6�o�.vmt�غ1��7/�kJ_g���n��p��և��"��
.���}�bY�"����'_����x@��>\w��-�r�+�ݼ��k���*�n&w�<�9><���X
���U�@>ܼ\�P�3��XU�_+,�R�V��.��^vcZ�ۛWX��� �;�⡈�/+�ՋJ&Y޽�/����o�K�ݣ��M��rlzA6���,�f߬z��8�
|��}(�8��Kd������6�Tt�����|�����KH����zp���
����q��>��e���9��᧮�`�{>6�y��U���(U��Pt�$ڇ"�Xw���]:O�\�myډ0 ���MwxS�� �rߺ�[<�������Bj��b��[�F��-oh���2nz,���?�/C��a�{<tN�����mG�����r�O�;���|��]�w��sI�5նlxP���s��=h�?��:�'���?\�L�_I�B�,�撇�ۗ�O���#�I��p4�=1YY�q5���'���>���:�dqe�����e�V�3Ϟ�*��Mr���Lr�>���u�K\��������ۗ�W����f��Zh۫�`�'��2���bt��z0�a�헧�r��v!K>�hV�Ĳ���rh�(_�:$꒮蹪��X�ۢ>Y�>�9����}4z8o��Va�CyQ㹞yF���m<lຼ�����"%y`cQ�BV=���W4��{ �r���z/k$��}�����$����@pW�<�zཕߟӖ?�-�;�<��S_C��O�6��{^��J�tOoZ�k �'��6n"����GPN����^W"g \7��Î�*|���� <o�r�G\Vo�L�*��5zX���^Ӥ(5=��P]��� �K� �">��졈�����r\�pa�����<\��#nB����C4v�Ʈ	��ɀ��������oܼ��ݵ�<I+�b��eU��%qG�Õ���T��/��;��N��^c����;wpW�P���,����� �3�;_���
.GH��^բ�9u �+ܛ���sH�gj��k��8��J%�$K�%��Q"
��/~EZ@�O�ћo^��f��5� �Ų�oǙ	�J�b����t�5���V��{Z1�(l����h�tD�]+AF�ھW�$���/4Lm�����i�Yc���V�>�����Ќ5ϰ�k\����B�iˡ���;Q<ZTi�/��D's[��С�8.�9]IG��ENXUL��V��#���$_mEcu�B/ �IJ����do^-U+�`*�� U��\�H���/����<5��'���=����aI��(��4Q���0xwY�!�$t5]vB�\�?wmO5+6���D<�V �Tr.&͠U���X!�(�t��Z�=6���Gd.0���8D�J�*l?Kߌ'`����;F�V� J�Űǒ�S�΂���� ��?�0H��oC��US�~�B��!.]��A��1�qp��P�������7B
[Uo�9��NCy5lz�M���Ò���{��ө���=���VO4�k�a:����<K^ħC�щ�IJхN����Rsk׈P���Ƣm����W�d�H�cÒ�k�Y���u��=Oȁ�Ј�	�%�t��Fxh���W��J�S��FP"��+�����>|0s�@͠°�Hz:F��1KK�h��#�4Va)K{���\����D�^7\ ��P�>`��Vv�3��A��݋�,�|���>��@^ڕ �'#b���;���(@�,��6m7�3��_��
p.?~�=|�����l}	P�
�LyHG�i%~���PӡV�RJ��:�Fb$߆	�(^�����|���_tۛY ��%���SlJ�����u��`�M�B,j%^��H0qLd �W���O�����h�GI�4�Li�A�m�/HW(*w�'�"Ae��@����l���}r��A~�)��n��!�K0�ߟ}���gj_�f�X��Q� O���<����x��~h�50���Z�Y-��J��Ů��b E���)�w��xJv"��,�E��Ps���T�9h<�D�ߧ_T�ySKH�DU�i ��-	��
�Q�߃�8�[��#�����'�V�OǬ ��J�!-���r3L�!����@d���4�0秷t~e*��=���� ��<�D>��Ş�p$`��Y�q@��Bjj��
���)����%�?qm���/n\7���+C�?�.&�F*�5a/�����L�w�`)��f�c{ݧ)�H�ne�MZ�G��<uC��"Zz�u�$U�?S*�A��`q)�)��Ѹ�z�S��	�.�,+�X�%
0�p`7/�E븈v(�@ş����R�>�����F�;�9�7����V�TI������7�EJ�KY�QT���'��MC��#�+_N�t��e��Ov� ##��J�@��fX�M4�qZ��E��is��ǃ~�`󚭹�e,���������z���H����.�ىWZ��K%�G+Rl[�-�<�x��X�b��Z��mIՍ�O�D���D9@�������tZRLB2?S��<�~L�1��/�|H��j�G	�xL��W�y�Xr�0��,�<; �k�4��-�����1.���5�� �K���碠����A$��\q����I����N�o��T���#�
�W��C���,Zy�(b�	�m޹f�<h��y(�q^mS�(*'C�x�gbV�����CE@#y�@y�hI�$,)��F�9�%��F�&�c)�|
#��R��"(TB�Ϣw�����aWm�Տf�[�:�>ZK�CFb�I���ȮGz�Nm^+yKK����Vb�-�p��VG���� 26����ޢM�I���0�(u9|Ēx!����QS�~,�Ɇ&��IU 	]�fH�+Z�l�<�]@�N�'��)�2c�XĄ>? ��CWb5�RI�E�����r��3\}�p�D%4o菅1�0��aPA&0�$z�����zJ�eB	�(?�AS���`�"mt(�#%��E��g��|Ǫ]B�'����Q�|�o��s���+�����`h"�c�_+��*��g3�ݰ��\�1�1��T�~��r�?���)���#��-p*�5��/w���<ΪC��4�g����=ꢖa�����Q%��UH)/BD+����/�>������{)�JQ��� �5P��.��͚� �7?):�q�+*��~�B�-��Lry;�)�L�a��Z�Z��!R��+&��:��si�>#�/EeD�Q"G��!,�E;�5٭m����H��
�ӝ��g�XWX�gL\U�3�WV�fi�U(��ag%�>�~-�(��詝_L%-.J��T�M�F��:�>�I�L���wyH�#�i<�])wԅ��]���gGm��
b*Z���FDQ������d��kIt�Z�R]�?vJ~�ɱ%�t �V�zf,�v{cUB�([D[�3�|Yl�|22rj��}�L�������xve�K�7�?��5Kד��6�aj�N�^�W��N�9ʳIE&Di�1�gCy*�*�>.�jJ���H�žX������Ɨ�zv3�g~T'{���{�prj�l���6H��Rp#�|���������T����O���0`�TO"Q�b��K-zX�k���gh_z	e��IR��6�8�{Xt��9��T���v�
��Daj&���JSp[���y�g��*�N�yL �,�����R�Cd�@�zE3����	b��`NH�MP�;��Ke����(hw��a�=����z� ����|����32x{�O̾�C����#�3�� G�ᶾe�Wd���|����L4j��Ou�-tS���o{�<�'a���R/�T����r�)� �  K~�	��D�b�߈��$O-�CZ��g��i׾�R:�O�� ��\ݏr`Q��^-��6O��>�3�����8�jd-2;�-��".Re���ZhzVHX�b4�l�Kk� iȗ\��ߔX�lA����i<)ja��&+�2�[�]��Jז�C��!%��'�%�`'8wǦ-�9u��qQy�1Z$��/��$��TpX!���^����7�ᮋ9^.�I+*qՑ���"&i,��~�3VmsE�R��iL����ul!.�����پd�oI2�LL�0�)������&.K���V�������	Gʨ��9)K�k���[�(]\i#i��1G
���I�v��W���@W�}�NBȪ&��:�P��-��4���n���'z��r�P0�T���J�݋���%�V�u�]䡒B�My�}r��L��C��o�"_Pn�Y$��/�/M�7B	�l/��9�ǰ���E��B�T���n���|5���e6QuHHJS��X� S0�*�[����|�-o�4:9��W��K_��R��	�Xs�N�V��wW��1�ʤ3�:��o=��i! �C(���c�E�ߩ�!q�iԃ�Z��������{�������?�5���}&O6_)$����*��"�^OЍM!aS�-�ҔYy��q�[V0�bo*���b�}3}T斈OŐ&�N��8��*�T���ݳ?{��/ǉ��܆�oQO�*+�Uq#���h��mdn�ܿNϵI���p"��z+\�rX�U�����ܬ�yѕJ4�+L��T8����Pס�\Y�S�Q�g���"ƕԭ��@:O<c��JY���(�oj��&���,�)��.J�1�C�(�����`	�X�MU"X´VҸ?J����S�7A(w���Ƚ���W���a��um��8GiG!5��j��:�T�����t�)/�� y÷�<�0�Jh\H�J:����/C�p<U��{R�x^_�v��qM��h6�=3ԩ�:�,�L�{�6���ʛ�륗W撝��/|����iM�������
u�Ȭ�[�ȣű�YW�k��̝N�ԡVZW�7��Y�~��e����w�\���L��4�%S���}*�i�N�F��8tw���g�9}8C�<L&7N:��,���2��J�-3M��>#C�� ��1M1� x<�&���0@L������䳝��$��֌��DM���AǺ�;�v��Pϑe_���#k�JmX��[��k��M���)+(��*K	zY]*�B��������w�L��(���P����~����\����҉w/��A���Ɍ$Nb�=�S�񋰞�QS"����d����	�<id�#%���t�C+ϵ�.��I"��e�j�ZP�2�#h��S��k��zMX�
��(�,�u���~��d������0�*=�M�u��<b(uv��܆�U�ǝ��,���a�>������x��i �a&-��G*]��b.�68p��]�Ϊ0��� S��Y���!�I��a�<�1#���$�hi�:WnA��a�����g�[Ә��~q瞐�̸'��}.�9)lU�4�w�	�o�p)�cS�Y�H5ˌ��F=��s�7k�>�������	Qiv	��Tc�g6�v��"�Td�*��hj����X۔b�@*G:�#��^��P�a�T�H͒�s&�BA���b%��l��Z��A]��Pd(�\+���ϔR�L�ItL�� ���j���h�Z�@?�p*R=M��������P�����B���=`�5TL��8�V�����h	�4�S�,�����=(��(7�OE5tE-n��-Yے�9*��Ͻ_��>��Mm]� O�/I�j)2�Ƀ�Ӌr[6�5�Âɂ��R�A&[��e�-OV�l0�������T���Y���.�����I"����"�8�M�j|rv���b>АZ5�9:u+�v�0zV�|�RwfC22�E���L��^��ނ
P)�F���Kc�$9���)+�kCH�Ow�B_a��n-[[�4	4v:�$Q�/�W�^���C}:���::#��}؁���3����%hxO��_��}�T~%\؋=2q��sp�e'��=�z��s�s�2�];=�+�E���h4|#�I�?��@�R�x�����a�M`���RH��cOE4َ@��S�XG�Cuv�{�r�(b#��]#,ަu~�`�����O�j�R���h���if�TZ�\�A��m)�)��V
2e̘6���m<��6�8�0_���Z�hd
�.#{�Yz(w�%ubUs��ӕ-�긕܎.���/�-C7�4�2V٭=�vR���F���j�������J��j�dX=���G�$�����$l"�Z��g�Z��N��	�T��ͽ���;SB 4%=���dD�;N_>�F���T���~�{��"�E��X��8�r���廴:_��m:���cׅ�V�'�����楡^�h�L���ί�c>
.�/��ӔKy{d�U�/�0������	�I��O0m`��{�޺+�;4Ҝ.�%�����Ug��׷d`V��N�!HĘ?���2�Z���P��\N"�k1�_l�u�8��Ч��x��Iq����*����=]�*��EěWa��q�%��A$��[��A��[��gkdZ�g��ֳ��2�{m^�絨4�&��2q<�#�C����mx�Rg\*���鮎S]��ʷ�ho�˔6/�om\+3��k�hMgb��܉����
�l��o��ե>�?]�����v�$��F��?�4�Q�v6�c�����6|����`yV��ep�%�Z	�8��^-�7O�i�Z��Ǒ��w�=����n�)�wX�b={	i��l�LL
v6���������_!�ٻgQ~���<��H,�ɫ6\pK���7Wf����	��;8�R��6�v8�-��ߤ�R��n&�5<Fo�uf3�R.���Zk�Lqz� �\�s��y}O�#�g�%�N90xi	���e�K!��]Ʃb�X*'��--�8�31�u&j����'*�������:r�H�>4�^ߜ�����O��-�_^����%Xzeo�iJ3��"�`��������]͐�s%�5�Z_�9K�ڥe'�~�Tq����Z�gr�Py��y[������_�/�I)��eS�p�s�=-� ayB���PG�K5����}��{��V��۵2���=J% �Z��������S      |      x�3�4�2�4�2�F@:F��� ��      }      x������ � �         ;   x�3����N�L�Q��M�SPS�M,N��2�tMIMʬL,�2�9��(���T�=... ��      �      x������ � �      �   �   x�m�A� E��)<A#`�.Q'jJ�AX4���Q3Jjw����Bo�ο�-�<Q|fG
�7�jMp������s��r�#�?�E���W��Nx2�1�Ai01LYcŀu��:=��<�a^F6�� ��⺍�7��*���`�8/z���Cs&I�R�1�~Bc^_�a��b �ò����X���&���$}�      �      x������ � �      �     x�M��m�0�������HǌkH�Ij�s�d�`u��h�F<��}$���P� ]�����,�k0ފI%�*Sr�	����>~�V�%c�l�V9��%HLx��T�a�'�����W�i}��R����Zv������B�A�ǒ]�ئ���(!Rmɶ/YC�ٻ<�a䐴h��h�
�:y����z�2X�:,���;ޮ�(Ey����KX�{v��&h[���k5qX���\���*������xA�o�>q(      �      x������ � �      �   `   x�3���.�+��/�2���,I,�9�1�$��,�R�e��Xtdc��ӑ�E��G6���e���W�� R�����e��Xrdc��#� �P� ��#�      �   
  x�5R�n"1�g��'8Ż��P"q$�A�����z2�H��W����6����}K.���o��Q�6�I�='4�;��1�˞S��A���:��q�n�|��I����ڒ[�l����ą3��^����8�zn�Cc�K/�>���X��w�Ӯ�[�t�5�h�����a.�n���5�u�ߕ�_�p��,;�8�Jh�2�|i�N�cUJ�r[�Bh +�4���~�¸O��E�r�,���ʱjC�ނ�L�eա{��+�
���Yua�7�1��\�(��
HO�TbVCQ��-�`�8��K��8�O�5

r�X
\mwB㲰�
ïNj��Ҹ�T[���^�Ӗ�&Ɒyj<,IZ4z��a�ts[#�}�:���Ǌ���Y4���d�k�K�R�����GەF����� n�hR;HϺ@М&tғ5� )��B�1����6a�{�Gg�b_Z�֢G_��ˁ�6�����~�ҡ9@d�u�iK�-h��Fs����p�U��f�0��_ߘ�3x]      �      x������ � �     