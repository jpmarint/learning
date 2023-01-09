PGDMP         3                z         
   transporte    15.1    15.1 4    [           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            \           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ]           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ^           1262    24586 
   transporte    DATABASE     �   CREATE DATABASE transporte WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE transporte;
                postgres    false                        3079    24714    dblink 	   EXTENSION     :   CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;
    DROP EXTENSION dblink;
                   false            _           0    0    EXTENSION dblink    COMMENT     _   COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';
                        false    2            �            1255    24663 
   primerpl()    FUNCTION     Z  CREATE FUNCTION public.primerpl() RETURNS integer
    LANGUAGE plpgsql
    AS $$
	declare
		rec record;
		contador integer := 0;
	begin
		for rec in select * from pasajero loop
			Raise Notice 'Un pasajero se llama %', rec.nombre;
			contador := contador + 1;
		end loop;
		raise notice '# Pasajeros es %', contador;
		Return contador;
	end
	$$;
 !   DROP FUNCTION public.primerpl();
       public          postgres    false            �            1259    24597    estacion    TABLE     y   CREATE TABLE public.estacion (
    id integer NOT NULL,
    nombre character varying,
    direccion character varying
);
    DROP TABLE public.estacion;
       public         heap    postgres    false            `           0    0    TABLE estacion    ACL     I   GRANT SELECT,INSERT,UPDATE ON TABLE public.estacion TO usuario_consulta;
          public          postgres    false    218            �            1259    24596    estacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.estacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.estacion_id_seq;
       public          postgres    false    218            a           0    0    estacion_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.estacion_id_seq OWNED BY public.estacion.id;
          public          postgres    false    217            �            1259    24588    pasajero    TABLE     �   CREATE TABLE public.pasajero (
    id integer NOT NULL,
    nombre character varying(100),
    direccion_residencia character varying,
    fecha_nacimiento date
);
    DROP TABLE public.pasajero;
       public         heap    postgres    false            b           0    0    TABLE pasajero    ACL     I   GRANT SELECT,INSERT,UPDATE ON TABLE public.pasajero TO usuario_consulta;
          public          postgres    false    216            �            1259    24587    pasajero_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pasajero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.pasajero_id_seq;
       public          postgres    false    216            c           0    0    pasajero_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.pasajero_id_seq OWNED BY public.pasajero.id;
          public          postgres    false    215            �            1259    24658 
   rango_view    VIEW     �  CREATE VIEW public.rango_view AS
 SELECT pasajero.id,
    pasajero.nombre,
    pasajero.direccion_residencia,
    pasajero.fecha_nacimiento,
        CASE
            WHEN (pasajero.fecha_nacimiento < '2014-01-01'::date) THEN 'Mayor'::text
            ELSE 'Niño'::text
        END AS tipo
   FROM public.pasajero
  ORDER BY
        CASE
            WHEN (pasajero.fecha_nacimiento < '2014-01-01'::date) THEN 'Mayor'::text
            ELSE 'Niño'::text
        END;
    DROP VIEW public.rango_view;
       public          postgres    false    216    216    216    216            �            1259    24613    trayecto    TABLE     �   CREATE TABLE public.trayecto (
    id integer NOT NULL,
    id_tren integer,
    id_estacion integer,
    nombre character varying(100)
);
    DROP TABLE public.trayecto;
       public         heap    postgres    false            d           0    0    TABLE trayecto    ACL     I   GRANT SELECT,INSERT,UPDATE ON TABLE public.trayecto TO usuario_consulta;
          public          postgres    false    222            �            1259    24612    trayecto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trayecto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.trayecto_id_seq;
       public          postgres    false    222            e           0    0    trayecto_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.trayecto_id_seq OWNED BY public.trayecto.id;
          public          postgres    false    221            �            1259    24606    tren    TABLE     p   CREATE TABLE public.tren (
    id integer NOT NULL,
    modelo character varying(200),
    capacidad integer
);
    DROP TABLE public.tren;
       public         heap    postgres    false            f           0    0 
   TABLE tren    ACL     E   GRANT SELECT,INSERT,UPDATE ON TABLE public.tren TO usuario_consulta;
          public          postgres    false    220            �            1259    24605    tren_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tren_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.tren_id_seq;
       public          postgres    false    220            g           0    0    tren_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.tren_id_seq OWNED BY public.tren.id;
          public          postgres    false    219            �            1259    24620    viaje    TABLE     �   CREATE TABLE public.viaje (
    id integer NOT NULL,
    id_pasajero integer,
    id_trayecto integer,
    inicio timestamp without time zone,
    fin timestamp without time zone
);
    DROP TABLE public.viaje;
       public         heap    postgres    false            h           0    0    TABLE viaje    ACL     F   GRANT SELECT,INSERT,UPDATE ON TABLE public.viaje TO usuario_consulta;
          public          postgres    false    224            �            1259    24619    viaje_id_seq    SEQUENCE     �   CREATE SEQUENCE public.viaje_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.viaje_id_seq;
       public          postgres    false    224            i           0    0    viaje_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.viaje_id_seq OWNED BY public.viaje.id;
          public          postgres    false    223            �           2604    24600    estacion id    DEFAULT     j   ALTER TABLE ONLY public.estacion ALTER COLUMN id SET DEFAULT nextval('public.estacion_id_seq'::regclass);
 :   ALTER TABLE public.estacion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    24591    pasajero id    DEFAULT     j   ALTER TABLE ONLY public.pasajero ALTER COLUMN id SET DEFAULT nextval('public.pasajero_id_seq'::regclass);
 :   ALTER TABLE public.pasajero ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    24616    trayecto id    DEFAULT     j   ALTER TABLE ONLY public.trayecto ALTER COLUMN id SET DEFAULT nextval('public.trayecto_id_seq'::regclass);
 :   ALTER TABLE public.trayecto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    24609    tren id    DEFAULT     b   ALTER TABLE ONLY public.tren ALTER COLUMN id SET DEFAULT nextval('public.tren_id_seq'::regclass);
 6   ALTER TABLE public.tren ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    24623    viaje id    DEFAULT     d   ALTER TABLE ONLY public.viaje ALTER COLUMN id SET DEFAULT nextval('public.viaje_id_seq'::regclass);
 7   ALTER TABLE public.viaje ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            R          0    24597    estacion 
   TABLE DATA           9   COPY public.estacion (id, nombre, direccion) FROM stdin;
    public          postgres    false    218   m8       P          0    24588    pasajero 
   TABLE DATA           V   COPY public.pasajero (id, nombre, direccion_residencia, fecha_nacimiento) FROM stdin;
    public          postgres    false    216   �A       V          0    24613    trayecto 
   TABLE DATA           D   COPY public.trayecto (id, id_tren, id_estacion, nombre) FROM stdin;
    public          postgres    false    222   [J       T          0    24606    tren 
   TABLE DATA           5   COPY public.tren (id, modelo, capacidad) FROM stdin;
    public          postgres    false    220   N       X          0    24620    viaje 
   TABLE DATA           J   COPY public.viaje (id, id_pasajero, id_trayecto, inicio, fin) FROM stdin;
    public          postgres    false    224   �Q       j           0    0    estacion_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.estacion_id_seq', 203, true);
          public          postgres    false    217            k           0    0    pasajero_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pasajero_id_seq', 101, true);
          public          postgres    false    215            l           0    0    trayecto_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.trayecto_id_seq', 102, true);
          public          postgres    false    221            m           0    0    tren_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tren_id_seq', 105, true);
          public          postgres    false    219            n           0    0    viaje_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.viaje_id_seq', 500, true);
          public          postgres    false    223            �           2606    24604    estacion estacion_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.estacion
    ADD CONSTRAINT estacion_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.estacion DROP CONSTRAINT estacion_pkey;
       public            postgres    false    218            �           2606    24595    pasajero pasajero_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.pasajero
    ADD CONSTRAINT pasajero_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.pasajero DROP CONSTRAINT pasajero_pkey;
       public            postgres    false    216            �           2606    24618    trayecto trayecto_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.trayecto
    ADD CONSTRAINT trayecto_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.trayecto DROP CONSTRAINT trayecto_pkey;
       public            postgres    false    222            �           2606    24611    tren tren_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tren
    ADD CONSTRAINT tren_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tren DROP CONSTRAINT tren_pkey;
       public            postgres    false    220            �           2606    24625    viaje viaje_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.viaje
    ADD CONSTRAINT viaje_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.viaje DROP CONSTRAINT viaje_pkey;
       public            postgres    false    224            �           2606    24637    trayecto trayecto_estacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trayecto
    ADD CONSTRAINT trayecto_estacion_fkey FOREIGN KEY (id_estacion) REFERENCES public.estacion(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 I   ALTER TABLE ONLY public.trayecto DROP CONSTRAINT trayecto_estacion_fkey;
       public          postgres    false    218    222    3253            �           2606    24642    trayecto trayecto_tren_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trayecto
    ADD CONSTRAINT trayecto_tren_fkey FOREIGN KEY (id_tren) REFERENCES public.tren(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public.trayecto DROP CONSTRAINT trayecto_tren_fkey;
       public          postgres    false    3255    220    222            �           2606    24652    viaje viaje_pasajero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.viaje
    ADD CONSTRAINT viaje_pasajero_fkey FOREIGN KEY (id_pasajero) REFERENCES public.pasajero(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 C   ALTER TABLE ONLY public.viaje DROP CONSTRAINT viaje_pasajero_fkey;
       public          postgres    false    216    3251    224            �           2606    24647    viaje viaje_trayecto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.viaje
    ADD CONSTRAINT viaje_trayecto_fkey FOREIGN KEY (id_trayecto) REFERENCES public.trayecto(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 C   ALTER TABLE ONLY public.viaje DROP CONSTRAINT viaje_trayecto_fkey;
       public          postgres    false    224    222    3257            R   #	  x��X�r�]C_��Y��J��{i�m{FVۑ<��T6�� @��ȿ�Oȏ� e�w�uY p�sn��{��Z��ߚ�	�YCV��ل]����N�_���ׄ̍P��O�ř%M솮:+D7I��t��_~�5������^X�����o�K5�����>
��!U�g�.������݉�'9�kao��l�zC���MGb�.�ҙ�uC�q� B��}��l���ZX�DY���GaE��ۣн������X�w���T�T�;k�wO*��6ә��N(nI�)������^ם4zGdf���	��x�%��w���U�O>�c���O��)Şk�C��;���HA�
A������7!��^���W���5&��t��b}C��Q��wF	$_�?Jq�\��{�_Ϯ������Rm�Ed$��Y�G7pUo�I��o6����-�:G��KNf
_N���ۑ���X[~U�����>*!�Ƶ�,��ƴ�т>I�&qI�f��:�THn�TY�X�Ex�N⊬��������$�?�r��[y�^�=���X`�.��=,&K���Gm�f���_��	���s-�B��=�����f	y�T'�}�Gk���2��B��9�9��R�� 2]p(<0�B!�ț9i1]��"�����ظ@�~��<X)Z���Ҽ�O\�m�+�+�a��)�9UE�yừWK�pu!�,�����@֛�A�"3d�0��R@K �k��HV��3#��#}�ZL��<Kܣ��e1��e�u,s�e�W� �]3�,adɻf:��'�҈>��uA�ȔlQ`+CU�6�'C�nn�G��z!;4_)�TE~��KA��	�I���C��"�c��(l��d�{�N1[j�:�f�f<r�" w��qR�1�ݛ���I�)�
6�"�3��mqkx�"/��B|��Χ�Q�#Gd�7ʡ�#;.34	|�\>�O��7tQυ��ᾃ�5�|���
9�r!�$e�v�6��!�[�qs7:Mȓ9!����	ˢ��Oƀ��LҔ�Y�?��prP�v�D1�?�Px7#�5�s(
+
���]c=�oQ��$�~�k%��s��=��W�Ck���h�:CK��,Ņ��\��Z�d��_A�}�jNʜڝ$̅�H}�~TҊ,���Ty?�����z6$�Dtb��%FNʢ���s��ބ�gRVI>H �	r������i�J�f�y\�1��.�qu�^}F�I�W��/��A�!,r�:	�	�u�A��M�4��B�ڡ�����B�8��mV]T��A����4�u��.?�?�⨛$�Dj��u�CnyDW�e4 +����b��|��~�;���}���$���C�,�I\!-�o�nPlw��k���R��k��������͝�h�@
\�BA1[���`���jp�Ѐ<vb����,x�x>�/���� ����{��+���V9��8���;��9}2Ì�Υ!N��6H���@4����P�60M2b�ݖ�0?Y���<�k9:g,��m]7��+�ձ�=?ʋ����E��5�APx*W,? yA�Żv#��'�<`�{���\)T^:߯13���J��AvR50�`��
EW A;}�3yAz�6C#�L���{І�j0}K~�^�(� �M�8P����Vނ�G�-��a"��!�Er9�,�Y�+�)R�E_7��_��K~EF0m��J x�
u;H�s��+�i?�ENF&��j�)�B�س�.��L�QBo��4�
��K��wR�a��z0��$����q���|��d��r���**X�Y;J7�8J¦0�]���~W[n�)crϝp?yP�=`�D9��U	��̇&��m�Е�Lf2XցYʄ,,���;N���`a[X.���8R��8�^s+�ޭ�dKg�8����N���I�^Qr��T���� �5eXA�5mƷ
�طr����r�� ���ܲ�t:�X�!���gP{��a�5R���Ep�~��N5z�P�*���'_�w� �$?����tP�JF3���!���On��`g����y�2`v�*�$e�l���@g<����t+��}�I�����-�U�����a��J/0�Ho�W�E������#����{Rx�b��]0[��>���격U�-T����Aqיd�O�]VL�K�~ij0 +�RU� ��c~�	��M�����zȢbJ���cⰫE1q�S�pl�N��z@���Y������g�
ns� �&�(	�5�?a��n=ƿ�=L����~�������d2�/�;O�      P   �  x�]W�v�]�_�]V������ݖݎ�q'9�@$L"� �Q}n��;'��9���[�QL؋SG���ſ���F9ٶ��w�4M���UZG){�;I�$�/�%�WI'��Wq�J�(cOҝ��A������kg���r׫��rv%���x���:9z���rU���`��}��Z��������'�ג8*�w��N��?J1z�Ì�p�י��*�l�$���IÞ줽�|
��Q;[�	c����̞�Ñ�	Gʨa躿��s/{�ֺ��PL�7��$f7�J����n5��#U�����nQ{���R���>Jv#4*	e竤���=�Q��}��E���g�& =NV�,J2vm�1^��ߜ��gi���*��ٓ:�Qf�+�T/B���g�q�=i���n���d���;���l��D/�ƾ���3je�W�N�_�tBw���A�^iͮe�=,C�	�8�{��a�����4Nb�B�DI�~8I��� �ð+g�F��*�WqBCOc��{�\�AQ��?�</�h�i�6��=Ӱ�ٕpFzOa行Ҕm�V�Np�s~���*IVY���P_���}ݪ��Y�p���|S��3��%��LL"�҂��1 ����.$,G�%@�ʢ�d�V�w�J &?JǴ�Y� ZF�ɴb�	XI��z(W�'t쎪�} 5�����t����;�}0�4(@a����
-�8���(�ٵ4��_'���'���4�����bO5�;'́mUo��P�J�(K�8v�H�I�*��@���n��N�4m��OJ���Y��㠥��6-U����:��c��_{O������f6A�E��g� ���Ik�{�*G:�s('7U�A8�u.�v7���.����m- �߂�w';����&ʚP���_����?�m�5�1��QӰ�O�7˅�` ��	�1O�V\ y�m{ �}���[�S�v��=I�J��dWz��SNm���F9@��	n�&̕ݟ�?qH��y�Ȥ�W��=HCw6eH��=B)��r<�G�h\Z$�H�[%�=j�4�$�>��Y$�WH*Iva�Z�g�@��Mʴ�H�3�2�k�S�!Ok�qg�3�ǪPP���қ@Z��<�g8FA�fa8H��m.��e�3p��9r�Px�P��m0���Z�����l��2;m�#~��/0q-��,F;_��-~���̣nqa�D���4Q�a�Ҿ�K������_�Avg��ǋiu���44��()����F��A���b� ��4#T��Ԓ0J4�`)lq2Vtj(@��^��n�k4ނ��8��@���ao�C	C����N���AF�)c��Ȗ�1ht�%A1�`I�T&�.$��r�2̜�do%)�Lٳ�����>`.�"�ʌݜ�7�G,
L�����b;]�0��wS+!);�9YH�UT�|�`Y�wh��>,t�����X�	b@8M��:��#.��� �1*���{�ýQ|��	;ѧ�O%�a��o�~2(mRny��'*�O\Ebc���c���%/�"S��]�m/�[�[���(@g��FU¶���vh|�Ȣ�ml�p2oEIT� �a�@����� ���
���XB��$�pIA�519,fX�P)j#K�n��w,�l�
v��	Y-zX�vX�_Ф�
����ԝ$.ߒY��@hXzUaD���;9��S�y�A�iU56&`����.����wՀ��?ٱ�6:��<���@��?%
w�GZ���gl�%(��a��Q}]o���~E��Q��Ɣ[bĥd��o�)�65���z~3yZ��{	x� �,m���9�gx���a5|
����A���0-Lm�i6�5��J(���J���;�S೸`�u�u��*��V/d�Y��eu��#V(���{��S�a��`�u�`H���5�a��񋨴�#PQa���%���C�%�;�4����q��gJ:ظΩ�&���G��-��j2 I���%�MF��.�^�V[�H��/�sô�F_���_���p��`N`6�>���02:��7QS~���|�}�F��U�-{Aә5��+3�w��34
�*j��@��iR6��=�b	�@��a�N��C�����4�O�y���1\��s�c����/9o� 2��+���Gpy�a�Ƿ��4�Ќ�=��Q���?]      V   �  x�U��n"G�����HD�_w_�Ym��������4f���iî���Wm�u������S�*�X>�1ά)��~�_H��8��f4���[�pN��7��FJ/������M#M[�m�w�qR}��O�ԧ��7^ʹ4�э�S�1A����i��=;�1���{
Y��a.�����K���u{z6����i4�N���㐯֊�+���=�R�6��Јo�>����X�Jt��epn��9�b-u#�v0�\���C��<vߢ)
Ew^��q���Ij�pv��%%�,d]�_q:�.j�A*Y�F*'u"�z���ؽ��s�͕�M�Q0pn.�q{y}�W&�J��h�To����Q�*K��4��c7lMYI5.��������+�9��hм���e:ow�����<�1�YM�s��5F}�P����3�7݋��I�]ڷ�OP�
5��ֱ�f(XeM6}˃�:�<��nE�Z;F��M(G�b?n��ʐ�j���ʫ�4:��
>?X�qG�Fۙ��˨=�T�Pr�/�a�"�8�|h�h@&F�J���-�eƃP]o;ij	�,������ȵ�)�qe�&J'��^p�?�ih��'Y�W��!^���3�D+t�0"�vp��M�wŤ��`
Ƨ�1S����2�y��cM@1Pc������P ���4�͇�8�q�����y\q�J�%��3_���3����r�v	��2&)�Ľ�+����9�>I�ԗ�|���g>)eto�zӵk��\�C҃�f3y���z�u�
��jZ�9*�v�{�2��^I�w�zeƧ�&���턃������6躺�&��΋CE
�<�U�n�jt����WF#�x�:�O*5��,�#E0��Q��D#�@\b�o7y\�54'+�����^�w$�l���#��      T   �  x�mT[r�F��9.�v��S4�TQH��J�gE"4*0������ϑ��e�������t����P5]�H�%��(�lɚ�];�mՎ�!����}jҡ"Q�-=�Ǯ'=;zklIbJ���-6���~���__�t�HJϑ�6����J���S�{�IћŶ��j@dd%�>���
XR�N�%񁕡�t�6!�aei��ڮ�b�<bmsD*pdW����T��=ZV�V��;������)�}�#T�Y�oI(�;�Q�V��#X�"��nØ��d��z��8������L�e����F%(G+<�=z	 D�n�����gS��.�D���]; �8ӡKz�W՟�#����ܜb-����CK���w[Rα6�zH�"��t3��ŠpiGk��C_FU$�1�9a �A�g�rіM	����x<�ك���Z8
0���a�i2�x1�@�(�ƾ�|vį���0e�k�l 1x�a�1_}����-�i�
�u�l���Z�
m�HFo5m� _�v(=����c�Y�Wlm����'��Zm@���w��l̉_���bw~�b)�)��2�(��-�J������G��[�H���mݜ�>�YZ�������W��r��fj۬t�"�KH*2X٥��&p��u�VC=0\�	X^(b�
8��֟�j
�}��lh��1og�T�a:��uOME�y����O��a��>�:e�3N�~<����[�b(�Ų�R�DP���:k�B�I�`8�X^i
�v���4������L�+�+Bt�����.}��!�O �q,�S�=�����9ђ����-��n�A��������`�Sn��ʾr_�W�0�w奣Q1|�4����׿^�ؼ�PA�=��M���N�+�z^a[��׽>f���������y���_�c�g�
      X      x�m]�q�0��>�b�[|��c��� Zg��l�|٦$��@�AN����Ƨ�V���_�S�O�?������맴�Y��9�3��������R~����v��󧭟y_�S�g�>��?u�`H����}�����Y���O�Z����x����??{}n�{�q����ߏ?e����\�gL��;���cz#��(�o�������Բ����Z�����Z�����i��S~������3�u>����S�퇏���6��xg9W-��?������N�p8�q�)W��c�Z^=~�i�v���xE����\�YƲ��ǎ|�׼J0~F}m7a\u|���)��$�?e�]u~��7�8|C-�9��h����9����ض�;��gaa�'���4h�;�O������m��F��ŝ�?���'��i���io��V	/����^��5�(�O��QW�����`�t��E������s�������UR�}�͍��wNx�U��\nSzk�C:��' ����c�ŹB������g���x=�y�=nn~[����P@*y�`[�l����<�*;+>m~�6lZj�{�X���#�KݰJ�1��a%l��m���C�ϽhI��.e��3�3��_��IcJ���fܭ�gxIof{Χ���'����g�u�O�o#=M��u*���t������}Fܫ���b����R��.3��ۜ�Q0�<��3|��ȶ�M�iQv`�:z6�2�L�H|�lxx9�L�-�i���su-h
?C'�FP�6�\�0��YM[���qmrM�?�3�7�0KṶf�0��B�A��闷��E����k�7wφĐ4͟;M�\�5�S~k�I3O�4.�`X��iwʔ���)]=��g\�~�5l��˚�R�$h�n!)���˝���i��U�''Ĉ?�+��0��*6�Ĳ��qy
M��9�kb�aëa��6�@B΀h����������מ�1�d�����
��ߟa c
��0��_0�AW;f��c��Mo�
y�p�mч��~�<zT%�`X@�\�k7ߐ�m��#�&�ݭ1�1l�m^�O�Z-�g$I(���_ U��޽��_ٰ��tn�]8����[���Md��'!bc������Pe�D�.4�G�hU��37�h���3�P#�c��k�q�B8Zw�#��B����>\�;���u���(�?�
�SQ�����.�d���.�a�u='�'¨B�Ͷ��*氙l�b�n��3���S��n��n8�y���O�`r��b��2z
�L�3�6�a�q�*o3��cȵ��"JB��usƯ��&+��k]�jVI��+��} ����w�H�y�1�egXBp�q-R^%9�l��ar��hH#'\<��G2xA-�>i1�/p��e�����{j�b��kZ=Z�ӑ1�m��!i�Y��r�P��fi��^��[�fm����h8Vl�Z����ʜ%l?��G1F!��,M�(b���0"7�L����[��"�KK]����Y�$F빂�}�0�\�y��Y�����[Y�b�"t�V
�Tm�ߕ��³a�W��eT�t��!V=V�2�"��l-DJ4����TA�Y�ʠ�	f1��fa���U0��*�N��eW��ʱ�NX��N��&"�)KJ&b�0�:a
C��_t�)�HT7B+ =�����%�Z���ɍ#5���|�ԆϞ��v �����f��k�u��6��P5Vp%nc�13w
����k��m_xY��i�Vґ0�Ӌ�a��Qr�g"LXY�)�JwRFTD�6T��Y���9Xfw��"Y25�i��˩���0�-DI�]��R9�����������7�t0�����`R��Pr�;on$ΙW�w*����uQaV��#�\��8���B�l�ah���UQ�n'U�ay��9�*��!>AM�EM�+N�j�$b.�".���E���_��m��sQg��;��]��>\k�H6�꛴�c���� q}��
���	��3�o���h��qgm3!-}��|Sq��J��1��]sFT����cl�P͖��DY��a�G�1� *L
y�6򠒦�,��v`xGZ�#q�K�3��8��a.{��`�t�U��H4�A�����7C=F�w�yĕ�N-����?k����f�ԫ�Bb�Fq�c�KpmV�"��WR���yX�Η�c�0J3�@?.A:�I�1U�"��ۦ~�p$@��Q"[_U���A �,Wx�^4"� �R0�Ju[I"'��NB�1������t�K�f�b���V���g���-�[�b=f�L2�U���,��9�E��~D���y7�L�Q��WEĐ��s&�F��m[Oghz#�3��$�%�C+kw���䒦1��^y�ÀZJh*�H>"u��n��æq��?YpDg�$%ᮘK$���oB�<�g�!Zy�P
�Ңz�O�4{�ʷ��E���_B�o�E�{�j��%�8�\i��V�룫'�'힓�س2�'gQ��pr|ұ&=A�H΋��=�W�K�/R� ���&~�;��V���#��rB��V`��幆T�dd=ħC�w����T�WT,V}v����M�F�����W�gͨVѪ�~��"�p#��@�7��e��+?kq��j���U�2�w�i�:l{��I�-�d=��&�Pi�����vf뤵Eě�##�&����Bvh�-|����!����u{e�3�v:}��=��[U�~��n�MU�AJSr�M��}Q�ܭc־h���[fx�����A51^�Q8�JL��Q��r���&ږ�H5����<gt?0d3ZO�Cl�5�o�H�A�C�
�Ꭹ
�n#��nK/-z-)�QZ]�?h�a�K	V��3��
�Ѹ���Hb{��� �PH�7'���4T�KTY�W4x�@Ra3��i
p���a$By���ZqTt�9�E#��+U��=N1"ܼ���b3S25Ec��
����7ⶩ�,NCm��B��V�۱԰��.��*a]W�ܞr�`�<�-q?P�0ɠ+�`9끡)�T9��&�fySو$F{�D:e ���J^��t�*<��f�Y�|�oՎN�mq0\z�xQЬ6U�r����3�$uraM��d+1wo���s�*�4lDns+__�2�òe5M�S�E|�d�@1,���[�V��]���E黗�*Q^M1[vFf#z�R�E��e�o|��?�q����C.�4���Y!k���3�#nFo�	��N�ZܣFT�o"v��ŉ՟��IFl
�
�r��^E����������(�UC���u��8��eG�IS�4z�6�ۅ(�#������v1��j����+K��7`d���6�jнS9�����W���|ǔ����g[l*�j�yQޥ�0��Qi��$�K{��z.��l�6�-{敯����R(l�J#�n��B�d����$�#1`���r|� �GȩS�$������;���<���r[��Z`�Av�h�&��OR0$R��)P���b"j�ߋ�JW=�ȽU���1�3�A�z��"l,2�n�iI��X��^�>�m9V�#�r��z���
�� ��,w�A�b��j���|�Ms��;O��GY��c�vu�d<ZE��eaE�'���ê�#��U*:�D'�G�fg^4@���Cq���!�XZQ��b�_��:I�&gr3�yG��k�K�#�dTl�&�H�Z6��N����$�͒5����.�	�`?��bQ���^	��V�D��<l���V�к���N
�V�]�:uj]�=��y(��%�Q�[H���t@�V#fX��*�1y��Z6�!�_��,�FL��պ	?��7c�(��;�^��1b!٠08��%�+/_P�ԯ3w5��(~7!Ֆǈ�1-GQV�쵁~���.I0@�c��-(�����*;G��Wˏ.��3"���v��MBGf#۳������iN~��B-�7%�GQ��
��3�n���ųZ���W��3��ۖ�X�T�� f  �`Ģ�{���W�7������8&��&/wB��w���Hc���Cuͨ;=#a�F�n���R��*���i���ɧ�8���-�}6�RMj�Y5fٲ8�����Ncϱ�&���Y_��e)�5b����~ՒjEb��//������_@F�@9^����f��	���܋�>/�a�Ũ+�J�wZ����ZF�hɷ��Q8R)�m7��5֊��c�YQ�Ӵ�O�jJ�He�L_U^��B��F�ze8�(�zw /����f3_�,�5b�VU���Ҧ�^�R�h$��:���f�*��!�n�l�{��ʋ+jX�֤Eh"b`.�77v�u���`#�Ku�*�Q(D+v�&���0�����m��5�hb���}[>�X5�� b4��Ҭ��L�����t��.7�X�b8n����av�h�K���sm��g'bTS�> B�{�m�-�Plh����gt��,��:�]�e��ݧ�b�j�޴
�u���P�^mo���b���oy5��W�����W��������V���Q�&�Yl1�>""����vAh�]Օ ����z��ޙ�_�nXRD�\���1>Wp�j#W���l��-f�v��86,����\r�`����M���b5�~"No���<Q�F�#�Y�亘7��U���s=�ބ�_.�ci𦣠�e��$��>��ބ�����">���;��щ`��oL֣
�A��evA�T��Fi��{t�l8�T_�9�(L?lf�hAZ���	*�g�]���Q�����?�����r,a�8F�sq�������I��{���}�Jq0B��L`�E�)����a�۹�a��8�^"��,��R�(6Fՙ��?c�y)���i2	H�5CJ(Z��"o/�8z�ѵ��1��7F,5LwLс���4,Fl�?��$j�H��S�#�'D��R�s*mx$	��Q�zf�q�"]2��ul�F��jnL�����C���I��g�JSD�?���I���Q1��jD��Xu��ˆ��߅Bщ����]rV�ؐz���h��-r��y��5�z|�Ւ���A�^1BB��%�İӺU"���=��rw�[��:��tu�m�J���0"N���vF>SG��{���$�ɷjM���dP�=��w���s;4�olN�#��>�,/��K�%:�GE�5����6��-c����im3��G׎�k�x�`���c�H�Ƶ�4+!��O;����C.��pZCS�	��Q���h�S��u8�����l��p�\�tj�W_��\��{�b3+����*A5�:�!U`N��T���V:9�Cz<G��u�-б��1%���g )�9KN���C��k�Yv#m����'1���0[��D�!�~�z+�K�o,�1K�48�DJUj��g�y*�[���dQ�s)�(P��>�c�$K�����Z�[x�t�h�*�mο�U3��{0�o�w�D�%/_���e�A$ϛ:��	���ezä!��oU�vb�o��c�I�ʛcԨ��C���݋�`W��t���PY>,"�r+��6N�$߬��+v0��U�����!�3�dH�Hu�r��T��"�(gҨ��ۓ�~�t",t��4��?�.UF�)�<��$~�8`bGWt�F�|ꮇ4�G���΍�nk!��b�i򤸝AmX��j�a�wA�2�a��߾�tg5E�ЗB��3��5� ��ב�[�w;<u��7<TĽ�¦�r+���`7n��q��>��B359B�^�۠����|��#'���U}����dp��&�*�Ů�;� ��q�5��Є��E�U�l�X		WU��jLL��q��q��AQU���=��QX�s剋�:����j|]���-O��x���#�bf^
<۳���g2Ό#�Dc<_Z��o��#7�9�����D�OϹ:��D�|��#�
��ϼ�O�
Υ�-�+N.ح1|}�-\�Y-Mc1cNO������à��},AƩ���Ih�����۩�-�ޝ�Z�2���z�۠��~G� ��a@�u9V0��[���M[�4�4Ql;��;���Ռj�t?�$���v7��"�?�;�u�о6/-Dl0���(��ĒX��>6U�\*\��eU���݀�n��@�h]\$n��#�%[Uk�I��[�GIM�O�j�EAt�t�B����r���x���Z�8"�^'F�bu
tF��w��%j=�ǈ�أ�|ku>�;ٕm��N<KA�7�q���u�A�Ʒ	K	�rs	V��y3�(�#�z.��i��s0�?Ի�g��"�C������cİ �v9�����tzt9B�Ue�M���	�!��ƈ�C�����4~����0�sDf�J��f���䈡�uŊ��[(�:a��,<yn�J�DQm���g�C=��N+�;g�sQbIFQ#�w��.�l��_� ���Y▊ilY�#E^~,�DCr�#J4���u�ρ��}���MM�Qun�x�µ>�-��kB|����oE�JUXǈ�y$]iG瓼/&�{��)��֬�y����QM kI���,r�N��G�6j �w%>p�F�����)=Cvˋ<���fԏ8$<�vPn��lq�j���9pP^���:�h���T�;�|_�?ϑ`�M��|�14�΅J����tV%s�� "�9i�:�1Ĉ���D�K�y�H�<����ng��JM*�������-�㰅uK�����e��H��фݺcT<�2��LB��S�:q<r��1�8���u?m�S��� qPist[��q�Kj�V1�^_�5��4�?e1>��W�{i_�8�%m}�E^�o{��"\���\�ot���s�+0��Mїr����
jn�Q��HH�Fud��r!+dڄ����x���`ƝS���UiqH�/n[%=ޡ#��v��y��=RO�Qw膾�b�&j~u��v������~k�KD{�PzJ��̯��vC�jau㶪nU�s��9mC4����=_�f��!��
��Q%r�a݅�խ�9$�q���i�55uG�F��^��_���7�0f��1��Q@��Sz��q�ԛ�%�l���)�k�o3��!.��m������~Pnl�`���8��
A���o�]�H����?^���N	��PZ_���芿)5�K�w?�=`�D�н59��0�ז��M��t��B���~/e�CB͕�G��M�"_��An[?{=�vfEI�j���.h\^6�h0��ܒ������d?��b�%.�R2�=��=�����#� ֽ�]�\u�WyV^����j .ôR��zx�"�f���P�fE���H�߇���Yw����q\��Z�Q_�B�{�@}KC;�=B�9�ܣPr��4�Pt#WM�11D�����9�P"=�b����8��-�7j�1q�ߧzg�4�����M��w��T�����Y��Ctx�rK �nl��2�P�+͹��ucO�Х�b��������Ʒ��*��*^�Ξ�k��G�"��o�n¬\�-���Pv����q�#��[�2�z޷���⬉<wZM�v��F���>�*2��n��^��]}[!!�5���i+{��Ɔ�=cǖ;�a��.z���g���)�B�x�d-���|롴3��>u��@���%縼�Y%a�@F,.VV0���|�X�BW�`��^��	�l��8�p�
�|��Cr,�o�T�QG��׵qɞ��s�#���7R�ג�ÎI@<�o�XR�b7hD�u��8��e��L���(���L�G�T�Oc��Uhoڏ.�-��8��h(Nmbq���g����ٞ���F��?��wM��|��g1xD��m�=�u�{{:���N7�\{W��s͢[�������j�n('Q��?�u�?G`c     