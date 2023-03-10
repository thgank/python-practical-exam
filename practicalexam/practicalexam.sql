PGDMP                         {         	   horoscope    15.1    15.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16928 	   horoscope    DATABASE     ?   CREATE DATABASE horoscope WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Kazakhstan.1251';
    DROP DATABASE horoscope;
                postgres    false            ?            1259    16954 
   horoscopes    TABLE     ?   CREATE TABLE public.horoscopes (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying
);
    DROP TABLE public.horoscopes;
       public         heap    postgres    false            ?            1259    16953    horoscopes_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.horoscopes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.horoscopes_id_seq;
       public          postgres    false    215            	           0    0    horoscopes_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.horoscopes_id_seq OWNED BY public.horoscopes.id;
          public          postgres    false    214            ?            1259    16977    predictions    TABLE     u   CREATE TABLE public.predictions (
    id integer NOT NULL,
    horoscope_id integer,
    prediction text NOT NULL
);
    DROP TABLE public.predictions;
       public         heap    postgres    false            ?            1259    16976    predictions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.predictions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.predictions_id_seq;
       public          postgres    false    217            
           0    0    predictions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.predictions_id_seq OWNED BY public.predictions.id;
          public          postgres    false    216            j           2604    16957    horoscopes id    DEFAULT     n   ALTER TABLE ONLY public.horoscopes ALTER COLUMN id SET DEFAULT nextval('public.horoscopes_id_seq'::regclass);
 <   ALTER TABLE public.horoscopes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            k           2604    16980    predictions id    DEFAULT     p   ALTER TABLE ONLY public.predictions ALTER COLUMN id SET DEFAULT nextval('public.predictions_id_seq'::regclass);
 =   ALTER TABLE public.predictions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217                       0    16954 
   horoscopes 
   TABLE DATA           ;   COPY public.horoscopes (id, name, description) FROM stdin;
    public          postgres    false    215   ?                 0    16977    predictions 
   TABLE DATA           C   COPY public.predictions (id, horoscope_id, prediction) FROM stdin;
    public          postgres    false    217   ?                  0    0    horoscopes_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.horoscopes_id_seq', 12, true);
          public          postgres    false    214                       0    0    predictions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.predictions_id_seq', 10, true);
          public          postgres    false    216            m           2606    16961    horoscopes horoscopes_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.horoscopes
    ADD CONSTRAINT horoscopes_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.horoscopes DROP CONSTRAINT horoscopes_pkey;
       public            postgres    false    215            o           2606    16984    predictions predictions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.predictions
    ADD CONSTRAINT predictions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.predictions DROP CONSTRAINT predictions_pkey;
       public            postgres    false    217            p           2606    16985 )   predictions predictions_horoscope_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.predictions
    ADD CONSTRAINT predictions_horoscope_id_fkey FOREIGN KEY (horoscope_id) REFERENCES public.horoscopes(id);
 S   ALTER TABLE ONLY public.predictions DROP CONSTRAINT predictions_horoscope_id_fkey;
       public          postgres    false    3181    215    217                ?  x?uT?n?0<?_?H?n?>.r(?? AN?pm,:z??_J??4??$??pfHm??3s%n?=?x?z????x??|???0&?,aON? @{?9@?`/??%w???4??|
??c?C{!??R???r?????ɕq ?`?H {??O?s	1?g??$
?Ņ??d~?Ȏ????s?.y?*F?N?Z?aڮ'x|????{?ǒ?;?g??????8&E?6??????#?Ϫ???Uv??K???}??|7D/??9?$:????Dbe?e+m??sC?ڵ	??O?V<Ջ?4??^?ۉw????????r[?iMuW???\5?b?Jh^??^L?ez?????Li????q^?????\Z????X??Z?m???y4WJh,??<Y)̖	ҋ?<s??L'F|?D???&?\K\Uu?6??6??]'~b1?ڼ????? ?`???'geF?l[q??V??0wx??݉mT?ɗI?)?????2?f?{?nJ?x$[???????G?ɳ6??v??9ˀo??Щ???q?	?WN?????j?e???l??)U?ׯ?!?c\U??:q??~^???_?????u1V?{?{#?"_?[e??6OXwsٰ?? 2???B??F?????\ޞ?_??,?r?^???m?4?Z??         ?  x?UR?r?0????$??y?L??U?̸??Ep????> %??Fs:a????{~????2????ȡ?+? ???[??Y????l*̦???c%?#?.?W(?Z,ejat??n?L(?
3??v<Ǎ?????$?X?|??u'˲?;?r>w?CG?t?I"??iL?ȫ?q??^?z-j?3;M????6g?^?e??j?'1???]i?n?Ef|F?u<C5?.??d?,?0z?ZS+s'*Ta???\?8??ע<;	?(???nd4N???RUŜ?ڢ??p?<R?*?.T?.??)??&QKXr? g?oG)????*F̾?L????H??)?9d?"????]Һ?(c???=?Ó??J	4?g	/?H?E??l6??Pt???!0cgf??i???̃[?Jud?? ?Ѽ*_?NE=2??E????]?"q*u?T?ێ?I?T????????l?`[+$???D?V!u????q????=     