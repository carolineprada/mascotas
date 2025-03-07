PGDMP     -    0                {            mascotas    14.7    14.7 -    2           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            3           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            4           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            5           1262    16406    mascotas    DATABASE     g   CREATE DATABASE mascotas WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE mascotas;
                postgres    false                        2615    16407    dim    SCHEMA        CREATE SCHEMA dim;
    DROP SCHEMA dim;
                postgres    false                        2615    16408    prc    SCHEMA        CREATE SCHEMA prc;
    DROP SCHEMA prc;
                postgres    false            �            1259    16412    dim_articulo    TABLE     }   CREATE TABLE dim.dim_articulo (
    codi_arti character varying(6) NOT NULL,
    tipo_arti character varying(15) NOT NULL
);
    DROP TABLE dim.dim_articulo;
       dim         heap    postgres    false    6            �            1259    16416 	   dim_clase    TABLE     |   CREATE TABLE dim.dim_clase (
    codi_clase character varying(6) NOT NULL,
    clase_cate character varying(15) NOT NULL
);
    DROP TABLE dim.dim_clase;
       dim         heap    postgres    false    6            �            1259    16420 
   dim_edades    TABLE     �   CREATE TABLE dim.dim_edades (
    codi_edad character varying(6) NOT NULL,
    edad character varying(15) NOT NULL,
    edades character varying(15) NOT NULL
);
    DROP TABLE dim.dim_edades;
       dim         heap    postgres    false    6            �            1259    16424 
   dim_imagen    TABLE     t   CREATE TABLE dim.dim_imagen (
    id_prod character varying(6) NOT NULL,
    url character varying(300) NOT NULL
);
    DROP TABLE dim.dim_imagen;
       dim         heap    postgres    false    6            �            1259    16428    dim_medidas    TABLE     �   CREATE TABLE dim.dim_medidas (
    codi_medi character varying(6) NOT NULL,
    und character varying(4) NOT NULL,
    desc_unid character varying(15) NOT NULL,
    valor character varying(10) NOT NULL,
    tipo_medi character varying(3) NOT NULL
);
    DROP TABLE dim.dim_medidas;
       dim         heap    postgres    false    6            �            1259    16432    dim_tamanos    TABLE     z   CREATE TABLE dim.dim_tamanos (
    codi_tama character varying(6) NOT NULL,
    tamanos character varying(25) NOT NULL
);
    DROP TABLE dim.dim_tamanos;
       dim         heap    postgres    false    6            �            1259    16436    dim_tipo    TABLE     w   CREATE TABLE dim.dim_tipo (
    codi_tpo character varying(6) NOT NULL,
    desc_tpo character varying(15) NOT NULL
);
    DROP TABLE dim.dim_tipo;
       dim         heap    postgres    false    6            �            1259    16465    base_general    TABLE     A  CREATE TABLE prc.base_general (
    id integer NOT NULL,
    codigo character varying(6) NOT NULL,
    marca character varying(15) NOT NULL,
    descripcion character varying(80) NOT NULL,
    codi_tpo character varying(6) NOT NULL,
    codi_edad character varying(5) NOT NULL,
    codi_tama character varying(5) NOT NULL,
    codi_medi character varying(5) NOT NULL,
    codi_clase character varying(5) NOT NULL,
    codi_arti character varying(5) NOT NULL,
    presentacion character varying(10) NOT NULL,
    prec_publi integer NOT NULL,
    estado character varying(12)
);
    DROP TABLE prc.base_general;
       prc         heap    postgres    false    4            �            1259    16464    base_general_id_seq    SEQUENCE     �   ALTER TABLE prc.base_general ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME prc.base_general_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            prc          postgres    false    224    4            �            1259    16445    base_referencias    TABLE     �  CREATE TABLE prc.base_referencias (
    marca character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL,
    codi_tpo character varying(50) NOT NULL,
    codi_edad character varying(50) NOT NULL,
    codi_tama character varying(50) NOT NULL,
    codi_medi character varying(50) NOT NULL,
    codi_clase character varying(50) NOT NULL,
    codi_arti character varying(50) NOT NULL,
    presentacion character varying(50) NOT NULL,
    precio_public integer NOT NULL
);
 !   DROP TABLE prc.base_referencias;
       prc         heap    postgres    false    4            �            1259    16451    compras    TABLE     �   CREATE TABLE prc.compras (
    id integer NOT NULL,
    codigo character varying(4),
    cantidad integer,
    valo_fact integer
);
    DROP TABLE prc.compras;
       prc         heap    postgres    false    4            �            1259    16450    compras_id_seq    SEQUENCE     �   ALTER TABLE prc.compras ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME prc.compras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            prc          postgres    false    4    220            �            1259    16456    ventas    TABLE        CREATE TABLE prc.ventas (
    id integer NOT NULL,
    codigo character varying(4),
    cantidad integer,
    total integer
);
    DROP TABLE prc.ventas;
       prc         heap    postgres    false    4            �            1259    16455    ventas_id_seq    SEQUENCE     �   ALTER TABLE prc.ventas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME prc.ventas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            prc          postgres    false    222    4            �            1259    16478 	   vw_datos1    VIEW     5  CREATE VIEW prc.vw_datos1 AS
 SELECT t1.codigo,
    t1.marca,
    t1.descripcion,
    t2.tipo_arti,
    t1.presentacion,
    t1.prec_publi,
    t1.estado
   FROM (prc.base_general t1
     JOIN dim.dim_articulo t2 ON ((((t1.codi_arti)::text = (t2.codi_arti)::text) AND ((t1.estado)::text ~~ 'Disp%'::text))));
    DROP VIEW prc.vw_datos1;
       prc          postgres    false    224    224    224    211    224    224    211    224    224    4            "          0    16412    dim_articulo 
   TABLE DATA           9   COPY dim.dim_articulo (codi_arti, tipo_arti) FROM stdin;
    dim          postgres    false    211   �/       #          0    16416 	   dim_clase 
   TABLE DATA           8   COPY dim.dim_clase (codi_clase, clase_cate) FROM stdin;
    dim          postgres    false    212   �/       $          0    16420 
   dim_edades 
   TABLE DATA           :   COPY dim.dim_edades (codi_edad, edad, edades) FROM stdin;
    dim          postgres    false    213   [0       %          0    16424 
   dim_imagen 
   TABLE DATA           /   COPY dim.dim_imagen (id_prod, url) FROM stdin;
    dim          postgres    false    214   �0       &          0    16428    dim_medidas 
   TABLE DATA           O   COPY dim.dim_medidas (codi_medi, und, desc_unid, valor, tipo_medi) FROM stdin;
    dim          postgres    false    215   �b       '          0    16432    dim_tamanos 
   TABLE DATA           6   COPY dim.dim_tamanos (codi_tama, tamanos) FROM stdin;
    dim          postgres    false    216   �c       (          0    16436    dim_tipo 
   TABLE DATA           3   COPY dim.dim_tipo (codi_tpo, desc_tpo) FROM stdin;
    dim          postgres    false    217   #d       /          0    16465    base_general 
   TABLE DATA           �   COPY prc.base_general (id, codigo, marca, descripcion, codi_tpo, codi_edad, codi_tama, codi_medi, codi_clase, codi_arti, presentacion, prec_publi, estado) FROM stdin;
    prc          postgres    false    224   nd       )          0    16445    base_referencias 
   TABLE DATA           �   COPY prc.base_referencias (marca, descripcion, codi_tpo, codi_edad, codi_tama, codi_medi, codi_clase, codi_arti, presentacion, precio_public) FROM stdin;
    prc          postgres    false    218   �       +          0    16451    compras 
   TABLE DATA           ?   COPY prc.compras (id, codigo, cantidad, valo_fact) FROM stdin;
    prc          postgres    false    220   ��       -          0    16456    ventas 
   TABLE DATA           :   COPY prc.ventas (id, codigo, cantidad, total) FROM stdin;
    prc          postgres    false    222   ��       6           0    0    base_general_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('prc.base_general_id_seq', 680, true);
          prc          postgres    false    223            7           0    0    compras_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('prc.compras_id_seq', 1, false);
          prc          postgres    false    219            8           0    0    ventas_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('prc.ventas_id_seq', 1, false);
          prc          postgres    false    221            �           1259    16415    dim_arti    INDEX     J   CREATE UNIQUE INDEX dim_arti ON dim.dim_articulo USING btree (codi_arti);
    DROP INDEX dim.dim_arti;
       dim            postgres    false    211            �           1259    16419    dim_clas    INDEX     H   CREATE UNIQUE INDEX dim_clas ON dim.dim_clase USING btree (codi_clase);
    DROP INDEX dim.dim_clas;
       dim            postgres    false    212            �           1259    16423    dim_edad    INDEX     H   CREATE UNIQUE INDEX dim_edad ON dim.dim_edades USING btree (codi_edad);
    DROP INDEX dim.dim_edad;
       dim            postgres    false    213            �           1259    16427    dim_imag    INDEX     F   CREATE UNIQUE INDEX dim_imag ON dim.dim_imagen USING btree (id_prod);
    DROP INDEX dim.dim_imag;
       dim            postgres    false    214            �           1259    16431 	   dim_medid    INDEX     J   CREATE UNIQUE INDEX dim_medid ON dim.dim_medidas USING btree (codi_medi);
    DROP INDEX dim.dim_medid;
       dim            postgres    false    215            �           1259    16435    dim_tam    INDEX     H   CREATE UNIQUE INDEX dim_tam ON dim.dim_tamanos USING btree (codi_tama);
    DROP INDEX dim.dim_tam;
       dim            postgres    false    216            �           1259    16439    dim_tip    INDEX     D   CREATE UNIQUE INDEX dim_tip ON dim.dim_tipo USING btree (codi_tpo);
    DROP INDEX dim.dim_tip;
       dim            postgres    false    217            �           1259    16454    prc_compras    INDEX     A   CREATE UNIQUE INDEX prc_compras ON prc.compras USING btree (id);
    DROP INDEX prc.prc_compras;
       prc            postgres    false    220            �           1259    16468    prc_general    INDEX     F   CREATE UNIQUE INDEX prc_general ON prc.base_general USING btree (id);
    DROP INDEX prc.prc_general;
       prc            postgres    false    224            �           1259    16459 
   prc_ventas    INDEX     ?   CREATE UNIQUE INDEX prc_ventas ON prc.ventas USING btree (id);
    DROP INDEX prc.prc_ventas;
       prc            postgres    false    222            "   O   x�sv400��(�MM��rr�8�S�!Lc����l0ۄ�199�8�(3�,`��U�^�Z�
�qzd�g��r��qqq 	��      #   [   x�sv600�.-H-R(J��,��r�q���d&'�䃹Ɯ~�%�E�9`�	'�RS���ļ�Ģ0׌�59?/?��7j������ �R�      $   L   x�sv500�tNL��/*��tq�@��cJiN	D�,dR�6��EMࢆ`a��)gH~Jb1XĔ+F��� �P�      %      x��}is۸�������o��/�j�^EvO����Ro$A�cITHɱ��o��DJvl���̙�%���4����)B����d��w���Ǐ=������^��3�Qb:���A�4���sxc;�E!F!��Bt$Q$9�C&"E;~w|��s�C�o�������s����b�7��l3J�f&�����8�c/LG;�t��Aj��C��;���7�f�L���^����v�+�+_�]�hw`�[3��t���td~�n*:����os6	y�!&��-[��� �#�}�Ol?�i"�Xb��>������h����?L���";4y�NL�=���С &�cm�E���h��PV�w�N�	�,H}h�7�t0I�ar�q�w*ᓅ@-	4�N�$�{�(���|����~-� [ncB%8�&RY�t�j���('i6~f��`�!J2or���Az�G66 ������f^�L�C3)'ՍD�ei��ULvW��l�&�- ��PN��������|63U�l�M��7)����F>4�����u���G��~w������a� J��a�kf�(w�X1 MsϚ|��̙0�U\
��������)�R��0�*,�;,���$���}����aa��v���@u�I�(�"�m:f�����D,!"bʋ0�T���y~X������60,��1��E28�mm��jnx+a�y�"a)6*4Z�H�X(j���4�
Ε�K�62���`x��dd�߿���i6)��3�0yJ��A�J��[����K�ϗ�`�ɵ���pR��Kb���	з91x 3���)tc��&` 'A�&��w����p���מ�F�	e\PE�?@����6䞭��7�'M�%-�|�n����YP��S��͐ٛ!�Ȣ@�Uȇe$1C���E��E��ָXC���N"�_��)1%�>�ٔ�Z`��\%4'�cR�@�����I:I�r��Xާ
��G%BC�ڦk�"4�.��l:�~D �v��pI J=��!um�!um�1������?�}�Y�_p���)�f�Y�h� �ɕ�q20qZY��Ea�vd$&L��N������֡���cs!�\�p�&��:+�!d�P�{+�bFE���b%��.�������[�~�D���iP(J�$��17B+f�e�U�>L��O��X2b�@�1U�<�`)f��tR�F��_��m \�q,t`���LSI��
�_�#Z���0�6��F�ZjX���NlH���܈V@5���S�H�I���`"�0�X�a�b�<e�g�� ��aӊ�(�Q�*�`>����:%��Bj*�V,�95akDZ��5��%R3�bbd#Z�@C(E��JD,��AEVTG��! Z�	��tt�P8J���<\�I1ψ�V}ъ� �1�1���TRF1AQ�X�������#m����dl
ψ1�a�hQ��l�b��G\�4��҉&	�r�d�U,�
"����"w�Zi��+�V�x}�V�8��G�����U�C�#+#���a\��Z�Ф�`��c@�[�B�Z�X^��*���)��a�")�ˊCY���o��*~�\R�~�^��݋�ؽ:�:��⠤|��t���m�o�N7h^5X�E��_m�l~F��(�0��sh��Ʀ�c
F��^�v+�K��w�μ���hQ�)��QM��0�Z������9�偵QP��Z��ôZ��ô��?��paB#h�BE%�2d�
�L+=.�D��,(�Q�4��(�	*�S����ô��c�kq�^����bK���������>L+�Jd�j�C��ǘƆ�04�J�ѭ,��0�X�i(q,
!4g�h�#�)Ҋ֎8u+X����6L+�#��=��`��,~�	FD��V0�X@a�!,��J���XB�f���Ӓ���s�8м�{"1sᨩ���'T!���4$A������g�G�4��~0��u�*�pG��9�P>�4K�\�����?�Kw�*f�ٽ����#¿HB�{�,+�B5��� �Z�Ϳ4�a:�_�X������F�����z�HT�\�taېk+<F!�03�����8d�DL���
��q�p�'_z���WK>,h>̪Ԛ-�*pMOD�5��fp�)�H�hn��V")��c��ǝT3h��>���M�ANg��\
� <A>��^2961n��0	������G_�����	|-�ҝ`~��Tk�!�p��ZP���������߇?�ή/���p��k�G�w�*Ԧi�P[y)*b��� SÔ �D)��ű��!m�&�ǘ!(I#Cd*5ҁV���~+/�P�!�x%0�ƥ�ֈX�ޓ`��vy�Z""��x=3�e�Y�e.gx��I�X%�B�r�pb�&#D8�L�
�U��!D�B�8��hU z��2B��]ri���T�1��	y�c�c��x�+�v�� �֡QV#[�ZA�S���L�Xŝ�H�`BXh@D�p*P++�ƹW�#,H�A�����Q�}wv
��Wׅ!D�A���3���4ה�Ԍ�f�~�ڥɢ�HB�����V��R���	�yf������"�#7t;2
������en@3�8z��q��	�y�d�5V�&� ^������L�'�lbC�9H-`���P��uȦ�W�a��yb]��l���_�(7�V�#ű�5�J-u`C<LG*�V��>L+�Y�iҔ�Z����J�����߱�3��Ht�6����{:@����9�H(�`O6Md@�x��&��I���k�����M������rO�Va����;�����-�
���mb�ܓ�aڥ>X�98[��c$	q�	s�8^��dh>q`C�����L:O�B���&`�*]�Ƥ��o�ˉC�6�����&3� �OS���C�O3�">D���F���BE��
|�W�h��$��gQm�Zm���*�Y�U �D�9��Q&2���	Ʊ�!�$�D�.�Y�S��.�&[d�bx��$2QHBʐ5A��y+�X�ezź0�R%�2.��b0�Qȩ�컽�(`F�L�@&D��4@R��� �&���X�J�v���ôb��aZ�@���JhaxD�]8G1VP�y57ME�b��dn-+o�s�$#�<ޝ�#�͑D�}P��y<9�^��],�[���m��S�HMo�m���>��H�HAJB��Ɛ �."�CMl��F2+�V��>L��L����'I�%�~Z���Gb��6�hz)ZTR郕;���[
Ms(7�i�%X,�b�(�N���*�0��@������� �V!1,�(c%b�TH��l�%��.���p�A�d�Bk�
4�!�V;��0ׇiE��4<Ѻ��K]��I:�nk��l8�Y��sP�+#�	M4�^�uِ+`Ei��..�n���<�h]m����J�)!��O��z�N��٢��c�/K�Tr#b�1�/�
����Ye�j���݈J���Zq���J�� ���BP�7��h��D��CIj��$QQX�A���E1���vG(kôK�����XI�)n).	�bMxu��K�\�U�b��X*L�O�   L���n���X�#�N��F�*�K����4�<(��
_���nT��qO��P��cc �0���D��\|h9���E#�S����aZq��0��@pX8(����*w/�!���Si���>L��ϵaZ�B� �r`CF�P�@�X��r��0��ׄ!��M�M�fC���JX�CmiT�i���4�y`,�,�<���|qb0�X���z����E5$�)M�SǬd���HюClF�8`EHD����0�D����q��0�8�"I*�y���$�)�j�1��ZV0�8���x������4$�H�R�i�O��ϧ.�?�����i =��g�I���    ]E* �Lh%KY�i���fn��Sb��0��Pc�#��Ҙ���vN��0휒�a�(G�|P���d(U(�`�E!���
��.(0��/�����~v�����|�=>9;u�*U�a!�3���=Ҽ �"���l'���.��H0���<�9U7.C
]F��N�w��:?���|p?8>>�w]0�3EU�k^�e#��7�؉��g�^)A$v��\��~������d0���:��Ȇ߂�_�������/�n	�wTK�ўI���d �㎻�ޑ����u#{�D�No�]�)H�w4fM<W�/y�,3��Q���#F��Y)�rm��dC`�B�8��2�L���,�;;�Il������K0���Z���J�t�V�K�A~��<��=�q������]=�E��UZ�-���S�$K��F�s�|!Ľ�)'S��d���-@���ق�~Y��k7��(1��$a5�����: |�K��w0<��]2Y�@��%@e��G����~�����,ţ����:H�V��I-�ss��q��f^��MP�vg�J���%"�9"�9b�'�՗,���CW�.�
Y�,C
� +�7+˵T��%f�{� �4�x=3�3��C�� �*I=�yE��]ͽq�{��w��o9�L�����,�����Qm/��(�`��3s�NX�}ۑJ�S���tM�^Ձ�0��&L!��i�w7��ɰ_�a�uL�}�
�vX���	A=G�jD�,���JS�!N��F%O�;�*Or�>j��'@��������t�X�`����v6�x�1�~�cJW�%z6P��O�c��#rq���R;�W�7�c���ھ��z.�F{'�3�Y1�F�Gŝ�j�"��t<N���<;.Xb�tMώ�6�<o��waG�ͼ���|����tj�RVz�^�}�����gg���0�E��н<�M�U,��N�ڨ������BH%��X"I\�EL�c��rXRk\��Z����K�z�3�{�k݁VE����^in��-=�1cS��D�p�c�C�6%<_��Ke4ݹ�Z2حJx�Ů�֌�ϫ,�
̦��t�N�|�݀���;��K1�0��+��j"���J�k髿�4���F�V�T������G��CG�Ͽ�������<�>�G����_��`�旽1�tX,�8�����I�N�W����l���T�[$hg��	FK�%v�ԏ�w�ԏ��7�=�����!ͅ��Uq�l�j�k��eQ�t��W�ʠr�CP�!~y�SB��+��?>|:&}�������+������~����ՁBCp��f��ǬeZ)ت@$�%�d4�W�����?�E*i���>Di�o�_�u���)_��\�~��AI�yդ�~�z�MJ�~6y�/̀J-񛢓�`ҙ]t��_!�J�Ffo�̗���3���ޏ3���W/��|��a2z�z4Q�/^�}�����KA4��˲@�W�wZm�j�`	$q���o���&L-C�Uav�����(�B��}X����+�;{�=�I+\�F��MpYm7���U��`���RXh🤲�FV�����^-�+#�%�����t��/����<��LqѼ~����B+wqd)�л�c�.�z�݆��b��!�K�;�7��2�)�������{�^�6Z��o	OQv�|��x!c��4T"�QS�i�eX,P�*q[��+�^��$�!(,V�"2EU�*qr}��������9��θ(�r�� H��b���6ܴ/B��˚҆�� /�d̛��L��;AQ�����g�⬆^U,�@���,JI^[6;�&D��K�۽H#���81$��Xc9#$�$�Y�7�K�".��q�"p-W�R)��4�]�R�q\ʲZ+�( �NG63^���=���r�h-;6�Q��׍;A1�����Z��ި��,���2��OS5(�5�KA�I]��d�6�bN��6[�/޻q��B�ŤԲ�'{��y2ߤ�5
�2鞞��t`]v�~�w��f^>I�[����f*H�z�{I���F��=f-g���U�E�2I�#)����_
W�|���ڞO,�)��^�%��3�U�r���(�A��e7�� ���Ul�&P���y�j�o(����jD4Z5 7l�u@?���eW|\��z�RfX��$���,��L��!�x��|�P|I�����=�[&���� 	;�����]�����gޥL#��$O\N�b�;q�����̌"�.Ez�� =����O?���g���_)6E�N��Sl���nA��̸K3?åi�������Ћ��ؤKF��2SI�����ۋRz��������j��Z�V���t��g����.�L��| =p��I��� �dA%�N�ϙ���ۑ��2q[����ڒo`|z��e��۷����|�niN��?w��ʶai^[�mؓM�x29iQ��W&�.q������R�mؐ�J���[���7�Z�[;�}���C����wyt��Ύ�.��W�4�G^�쐲�v�8�UJ0�U����ҿ�\�:ڿ�\o��WD��72wF�����mU����_�'_�^�E ��^�������q�Ӄ�{��-�Vk���r��-�Wk����\��i�p%*��>�����R��i�p]���O��п�.��B�N{�k���8B�3kw���E����tw�6J�� ��_�Y	Ά����J�w�9X��=��<���x�ϽwpR�ڪR}~��-wg�w�ta�����cr�.��N�p��E'��փ�'�?������GR��ikw�ӡ����������Q)�6���x8c���O��U�����������G"�.����L���Mmp��'�ע2��k ���ߤ.�)�t����_(@�(<���O���=�I�6δY���𝕅�I^��t.��	{g��H�(�l��N�&߃�8����.�s�=>>��^z�������������W��d������{��>dS��P������V�޲Yy.�V�eo�K*Z!�{��%�"M_�`�r����#��~f��s:JҬ�)��B����mw9xD��<��u� Z�L�A>2.a��&����+n,�{�;��U{y��l��y>�~%GHx
�2���K�um������Ȝ�s �V�l��:(�a)Q�,�B(c��"��qi#��/�����Z���]m��(��x%o� Ŝ�RV�5��\r�Ԣ��]��%*y���`��i6����7��J����-�Md��|�ڝ�WjZ1U���`�]_��"�݋�����~�?9�r�u�$F��Go-QմTj̦eR�`6��m���l�%�a.�M���\t�.]�0�z$z��m�*���N��v,T��� ��c�5��v_jw��o!��	�����l�D-��vCj���*y�'Pu��V��MP7��ιF�q1��V�Y����.�O3��2��JL�VT��,;C�\YߑH��VؑHd)Bzx9+��b��wu���1|@L�]��-��}��˛�N�o�#׳���Y��3�^���(�P��{0���㎭�B�LF�l��
�r��*�T��j<{�z�w
P�eu��3�����
�՛9�0��a�ZCPDe���!�,.�vW�ևiu�RZĔrO:RA�H�asT�F��=R�>L��ݤ eM݊���
��i�Yy�l��M��P�D{��}]V��E�W���q��b%2�A&�������}<U�O����������������VG�h̻#{�$u ����`B<��qE��$�?�q.��"����ܯ�_�TU�_ܱw�eF�KQ�Bb�a��]!*jp�`�7#�[{���F޻�{��ϔ����kF�ƚ��(}w� �C%ig�����d�&�3	�J�ԝ?�8ۿ�]��!gA�q)���������H[�E��ЗL�J�;c	6�b����_���C2�S� p����#˞�m2��.����>��Th�i59�i�0����I��    �"���p�����Gg��6�����U�ƕE,����5���-����o�>�
5�m�	/�s4�1�El!�L�{?��b�x��VC��ȥ�3�-��� +n���Q��
��ð>L+��[b�ĉ�*
�5# �bRQ�iU�a}�x���2��8

�,f#�U��m���
��/'s���Z	&� ��8�W�E\VfDgЉ:�����]�W������U�bl����6����e�`�Tm�����c�&�ŉ��γ4�y^L=vO]�.�wb&���y�y�Q��d�9Z���`� b9C�i q�PF���T@�j[^fw�X!��%mjQ��~�ZT�������R/�"���n�N�ҩ�غܙ�2y?�c;����m߂�5�%3���N3���4^N�6���l�n��-��c7�����3ɻ�W�h^#�ꙉG�8��@�'�f�G�����<2R�$ı	MLQ�	Ø�|2T��q�ua�֨�:9���sK����/�M'E2x�����v���m�4��%ه�0�Ⱥ�d�TY��`%o��T���f�ʷ(�����
[�fwn�XVk������W�.�[�]�R,���� ��<>�+6I��"J�u�$m���np[��e.���E��/s�]�:��( ��\r�0"qƚF�r��1�xM��B5��=�`༛�!�����Ȼ�N<w�t־�D̵L�W�Я�R�|6y��f�	%�"�Xǈ��Đ�"	��=F
\��8
�k^��\c%%+Q�NP�W�5�����T
���{���{~Y���BQ�� ���\c�l���a;©���	�T�Z�֟����������t�muQ�Q����0l<�����0�0{x�<.�e��i����ڵ��'R܍����v�Rʓ�N���Y�pIV��6�If*�V۱��Զc�(z�a{�u����˃ӣ��jJl�)���Z�?(f-�a�,�1�V�(V0�.����V���� �T�	���c��p�`�b[��ec=�N��:�SHx��??���ؼ3��ŵDrۯ��[l�l�-�Ŷ���[l�5�ʘo��b"x��V�Q��B*�۝�:Q��Y��fc�Z�vҼA;H&ֻ�ٓ��U$N�_1�-��r��=x�y4���%�`&�~�txqp�w��NN���u�.�����/)̗��{���	-��NvX���TiD����w���S�{��)��m>����M�Y�N*��m�=���-�'���.�@�a���!�J.��P��I��@t��E3_ݪ*ŕ�ҿ�L��"4�ڻE���ݢM/�nQ�LH#���tQ�E`�Q<��+��3��p9�K�چ	�c��Y��i�������gNr�Q���/_QK�
Sʋ�>��%��!F�kk�J#!���V�t��
:���j��G7��l\Lg�=�(�?ԅ�(i��j����+T�6�\�0~��4WO�/��m|)ءRZ��&�V��B�Z__ӡ��1��{���7���7��OX��KR+-X7�@��_g ��A�Ad��M����^�q$�}ps����]�<�}���c���{�P�4�B��t�*����[��;+3Է#�%�?4���$���T�y����w=�{����,u�f��Q�a_k�t��C'����GJ��X"j7o���n�a�Y��k�$����7�xQ��9�ۿ�-�J������E)��nS�>0"��0ՠ�����q�����9|�9U�8;?�:=9��{2���Y����%|��O��[�v�_�<;�����'��?�P�ϗQ
�ص�p|��^9������]]_T�ÿ���=Em��9�Y�`��p�-��y�h���^�v�������?��˭w�^���f��&����lfp9�;,�����vpɝ��[�[m��,>Y���|�U�/e'Z�D|I�"�k&M��$�z�/����]�t*��"�JC3?��-�+����S�+�~%�+#���L�n�zn]��Ԥ�����yrt���j����:�/�5����2}v�}7�9��])�odH�����Fn������\���FFfc�_նԝ�G��[)������:/�ꦱ�/��ɟi��%�as�э̂���!����&\�����IVvaWa�+v�Uฉ2�:J�u�]y��(ox����Q�jG�)7��T�սT��W��K�+k��/],RK�����5��R�gG^���ɓA5RM��"�7�wn���N���_<�{7I���=pOf�<�~�]Rh��C�k-q�J� b�Ř��8r%���bZ�U��0�yQO�}F(�����!L������I�Ȧ@������ˢ�&..��h�T��ۓ���Vehx��U6�K\�����c�d�O�0K��'��d%�v��ա��ds�����n�2�;�}�v�yBXS��%�W�»�*���S�_ԟ�K@�d�0;7�N1*Sݢv�-����B���Z^��5qg��Q���٭��JM��a�sQL�߳���i�g˛
�1�Mur��(���.�ڵ��c�7��o�-P�q�o�|�b<����	oA�&^p3³���+��nY��j����ׯ����|ٹ#�ko�x��x*g���O��X3��xE�ĥ��6LKl����+�#"a>��4_g�'��Jab3��#E)�CŶfv��ǤH�'�'6��o�އ���W�M�⏚��kJ�?Y���~�P�����4�߇��A玒�Tߋ������bUԖHq�(0Z�3�MH�8���?�;wXu����a����w��o<XˠB�hRbn�����*�!�7���<�����J���3���%����r����Z��)^�y���G�#�¡̇�T�w�t�'ł6Q�}����ۿ���9X��tt���UR*'���y���|S��N��۫lX�~��c���6��~up7 �F d ��u�9_���u  \8��E�X�`vh@P�{��U�&,��_�٨R�����Ν�R�����fd�?mV�R���b�wiA)G_���2�}��ʃ�P5�%��'�~����x�ǢC���}X��������/-��r�9s�8��W�:Xp�&O�k�E���Ng�Z�O|w:#��3;
o�`:����ҞVp[��rK(����gx{�D�S���Q�j`��D`���`e����ӈ��߆��q���3�x�Oh���oo6�~�t�~�c�\���2U�lxyѡ�9?����ӟ�}ב��*�d���'�0Yt��y��
7�����C�Ɓ�/���o|6�i	���C��|L�Dݳ��s�`���5��4�X-]������fB�a�됗v.�`^���`vr�\�K7��og�wg���rN���*No��6��/�㺦x��s���4����s�A�/��?����>|�V*6q���5�����6����UaKl,M*�6ˉ���TlZ�ZFX�U���a�	��J\�W>vI]��$�(����`$�}J"8�E��AL��R��]����o�Z�j�Og�A���+r������
�v���R17@r���O�2��s�˅����)��]�šAD�����L�����p�N�8�/j�q:�Ci���JЙI�њ)��Ļ��B���Yё+P�X{:
�Alc����`�^��y7�l���熢�ѿY@�j�7���8��>j�b���(߰�=�� s�ݾ�:���:g_��^�{zt���z�.�g2�i�����w���+��fo��A\wy��_'��נ�";z����"�]��I���=Q��O�����gt�qH�7x^[���^zf��(��9#ԝ����3C��/��rf�;�<R���E-6�_0��Q}�/��}z�Eѕ���c���|\j�U8+����d��%��d�W$�y��/�l���QG�����+?��ݞy�8�� j�� �7�_<�B���WZ���� F&��JD�*�⥥�~t'M�����o��M�#�Ӫ��wF�M����$�٠����ߕ�RHl� �  �|T��3[jsȧA��r�c�Lݨ�
��Wt�Wk;7�i�=��:u�E�;O�ҝȄ7��t�|���c���H��+�*Q/�]>�1L���E�k�`�A��b�Q�a�W8���ŗ�e����E-oQ��ݼ����v�6�ef��s~`$g~�;y�X)�G�����UnӍ?���P�O���T�� (͋��0���c>�x�.�{g�O#�N|k�[s�����Jg�{�[�e����xFc%(u��0�$�����H��V����5����n��7D ���9��=�"�i����O��b��H_C6\���ٗr�G�˚�d&�ջ@��!�w	 ��
��w�a�˲�w�If�t�vdcGg.�}��%V�yEse�e�N�";N�dRv��%v��v�֪�t ��,����Bkx@��W��C��6�=g�d�{qZ�6��Y�[X�"F�VX�����?��?ت�      &   �   x�E��n�0E��߂PI�e$�(e�đ��8��n�z�_�ι��wת� ��� ��C���74��.F;�fT+�h��#b���8��4��@ђUr8��x�*�&�젂PJr��xz�p�8��2��T�[�I�M�R���b�_���(�ق{|���6�k���d�5�4���esyu��������nO����M���{�#��x��;�?��c�"�{�Ȋߵ�+$zc      '   l   x�s100��OI,V��Ī�b.g��!gnf^fbIiQ�B�~�BAjaijT҈��妦d&��9}�\�\zQb^J*Dʄ��g
�7h/�$�&��s��qqq �a.�      (   ;   x�s�400�tO,��r��8R���cNǲT�(��Z�r姦��1z\\\ �M)      /      x��}]��8��3�Wp_*v��vD �z��U�����V�#����L��b6%yl������yR�Dǔ����!�{/.� 
n��f�(xv_-�͏�u�\t��.6�:�����n_�fB�E�w�۷�Y���f*�}F���f���E�~�W��e�
q&Eu(��8�b֥����P� ��.���� ")T�!C<�P1�h�+D�%I@��M�ꌘuF
�t*�fR(27�=Q�Sw��zS6�_�Q&Y�� ̃�U�Ɵ�m�	�-��M�����Kם�*�L�z
_/��ͪ?����\�Ə.�(ϻt��y��bj�����=�����Y�	��aR&$2�]& n&4�g��������]_��0��k���GF�{n��+�0��H��q��5L�!�<�~�a��U�M��G�<=��k���Q����+WUݴ��C�x��p��Ựr[�7͈�Dyʈ�����#��>g����a�]���Y�W|]t|�u�\��b�8��K�/J��]������ς��!�_ħ�^�k���MU�s1��/ܭ���������T����m���f���͸5"0����&��Z��_�ۚ��bbD�-��p��nS4:a��у@3�>��y��3�u�l����aO��yu�ɫyҋ(Bp�Pt�#�J��)�2]+�rT��B�K5�9���DD!8�ū�L�aq6"�E�5e�4T$Y�#Kw4���#8\V:5L̜Q" X��U-��X��Hˆ�����#���:f�Z���˽_��5����\՛j>j��'�
.�\.>��5�Rミ+��_ȧ�!�#j����E��{grεf
��~���tVXQ�x����X��5x�ry���}є�S2��
��\�?�|��+x������U�]�� Z�	�X-��s����^!�܇���j���l��!����(W�b�j���?�;���ȇ��f��f��p#*�¯n��?���Aʄ�a��@�]}��,���|�W�o:)me3"�r�c�Ɉ� ��J"�A��H���|�O!b����Z���!���u��Iw�x@�.{\�d5B ���]��	���[8=���gA�E��1��tJ7Fs%c�>f�6����&p����֘M߼��(�!�Z߆+'ܕ4�l������6Ϙ�Kc���|�}�)C�6�.�oX�K��I2�1� s���p�>�|�����f�@2��OM5����~�F�M�%��z*t�x�z}rpM���z}
�'��G�/ፘ"�_���/���E�>Ma�Tz��VMoiχ�ׁ]���l /�B7�b��b�m��z�����Wu�]��;E��S:c�H�8�ar�<�Ҝ�!h�3�#�Y��T��L�X���,>�ҭf�\)"�Π���.���M�V�}����}˙%53�
����y��ABËz�U7�otۛ6��Yg�L4\P��d�V���rS��n����rk�-�VS0���.,ZvĚ#��kx97���3=�+�cB���ǒnle)I nD�fe�l�����ϫj���1�!��d�i9&�q��A2����R� ��2���!��<d��0�b�Wެ���'�zuO+�c� ��"�6W�p�t���y�a@�����fʟ����\�I��K����rS�}�d�e�"Q��-u��k|���_��>��*N�﷕v;v��Sm��E�sף�.�" ��hЪ|�O�����Ϙ��>�p��#\�#��á��/�W��!�䃁g�W<�.�9bN>s]����)���Rp�C��=B�+=jl�綾Q�㌜�:��(�L�!���vs��ԣYV^���o�L�۸�}��_K�;�P���7{>ig`ѡ���Ul�L�U8Xo��z��fg��K{��$��lɍԳ�$�"���r����-:TG����4�
ir�9k��4q��n�jEK��y|=OQ�Y
J����Rϔ����$ϐ���{�,A6��F'�A�OA@#B�9���ű�b��Y��?���-��1H	\T���d�D�"�A���\V��g���/5z%ӝ�_>5� q$���6.e�G]�m��M��,�;-E3<��ɳX$]� g���|^C��}�)��d�'k��Ģ)wr�	,�ы�V��o�����ߖ���\ͫ�k/��n��ͣ��z�I�ڭ�\Q��}+e>��>�)��պ�]�*M�k��Z�?t���W����$Ձ��lA�|��S�!
��#��L����m����B9�'�#b��ƈ}D��w�,�Y,/�A$���͢���P 8���b�Yϗ�j��bB�Y?l=�������0!X����[��&����E07��X�2r2�S���*�8"���/Uk-��W�%PZ����"�EEG������.*[{�Ny��"��p��zS|+V�»id���z�Y�|�;~�pk=�uw�Y>�YC_U�K����h��X�Ï�����+O��W$��p2̜&����w�g��6�n"�
#@�H�G1�>�F���y5=Vx�)��4�_~�4�c��8y��@����l<��@Z�q"�:�����ޕ��N��k���LOy^8|[Å�����RD]���� p��'��Eՙ��c�~s�b6�E�#��a�Gf|l��`
=���D��P�Iv�̑���I�P�I�`�AuHp	���H�A��C�	�zZ@���;������L���羭�!�{� 1$h�9G��^M>�eu�\�42�E�9��&���FWErUJ�!A�g�ٺ_ܥ��P���#h	�4��Վ�N"J؈�!��k�0���c�c��q� ��t�>bC�Kʖ���	.)Y�+�����m�4��>��l����J�XP��a�<c���N
~Ģoֳ�|�����.}D
H�+7t�	.*��K+&C<H�^������)u_�lW��jp?��E � �&R*k��@�~k�V	?��9ۛ�	w�	.㲮�ȭ��R�`R�����5�	p��rY�7��"=���B��݊�u=l��B�;9:�V����m��9�ieeU;��D��|�x�����A��F8
�	D����:(�A	2A�iXd���$�����w���r���-|��_�uU���_��� �$��Ra�о��@���b��z�ʕ����zJ~=
��`4����&"��)I$��������.a��	(t�d� /$�	�T��f�c$Gf����2�Y�.��t��JԖ�Gq\��3�n� Y~Iə�c�������ONu<�):}>Њ��n�ï���ֿ�UIc���}�.�m�fL���n�|�6���*���`zFr�C�G���i���p$�?asF�]��d~M	��0-�nF~B0�����uW.���v��X�)¦n�byJ>l��&"u6�e1���JVʚ��_�I�����~�����?�/�?-k�Z���?���?�g�|S�"��ĝK����b`��r�c�?�@���zؿ`�\@�G0ED��>!H�t�_+��I�؟��ܮ@;�>m*����q%*�:;q��he	�`�&���Œ�b~(�y��ՖX�a$S�E	h��t{5�7��.�����I�+�v����<�&HH��8�� ˧%��Ik;(�&�2��L���H@�G�a���d"z2���.�(��!�#���X��<&��5�u{H�L$Ԫp�q�Q��y�����PP�l�����}6�K����B)�$���.7�ٛ��0D�(���N�N�CruG�ẋ`��c���C�Y��u�T��8�\���)���24LL���#�$�!�c��)�����h|�˓X��JB��J��~)?v�ˇ��� �|�S@AHp�uz"�^'� A��@؈j�-����<GE�=-�@�>�״�]�Ξ��?v"�$��ή-l06�}l��zc�p
g���b��>��咛f��ڜ�-�m\�#�$���Z����g��Ѭ�t4��33>������1��Q    !�UHu���!�U(s��MrND'9+]��/������%�0��7CZN�"A/����r1�|mq*�RF@�H0�y� צF��0�z���fFL�0�y���"�,�����U��">���� �HBI���Cǋ�v��.�8���NȺ��J'�ae(|�T���*�e�c�,��?BJ��	� �%�PV<���Ei]���S=�|jK��	�0c��A~I0}���_h1	�	ߗ����C�Q_��V"�h��Q��'�	�4	���6*��B@�I0@X��CGv�L�Y{�4�
�&�583�#עD�����9�k/]ԣ���!:	.�s5�5ǂ��`j>m�ϣ!�$���(b[��ړ���Ј���&��5�II���Ԡ
%�
%9F��A!%8�ǻ�59���`b:=>%�!+%��n4:�H���gV�t�-�=�j;���� B%An$k�Ǉr=���EJC�s��rf��d0�4�y,4�퇠^���9�U?>��<'�Ε���� ά�v�|���alu��}����Uޗ��^�G{�[0$�S��Ab��B�J�����Y�wq�p��j�h�+��D�ИE�P�a�i�3>�A�J���o��~Ͻ!A�;Ξ��>���h�y�/�ݙ��@��B�aˍvJ�x~�/���Qq�#���!-3[PA�j�q�vא{颞���t���S�:�B�o;�,3���A!�Wg�.��˞\�P�.Dn���]��V֛"W���5Y�������j�P��'�?HU�&�o��ۨ2�}���n�����_Zֶ(k)ZX�	x��7=
H_\\�vokJ�����σ��$������G��s���ՀW��i8��9w�i8U�X+hP��#=�Å��VJ�z�����O"�AX\V�,Ay�.��e�g�/2^x�¹ϓ�yA9Z+��V�����L��v}�d��.�h���ʜ�K�ہabvZ��{:U^��S�a���P��h����N�/�IaYh�އ5���,���T�iM�e`����7�a����� �eO���.0�=�K:�n��P���o��W+=���"�|�,����FՀ�:�x�g��عbDB�j��Ub9<�u��&\��]B�j ,���Ϻ����@u:1Y��|� �K5�y��s��Ғ��x6V`�a��U��ދG hx=�c��/)nO�*�t�����Q�G�,�pY�|�-�osBEj���%^��ᨁ��7[s\�(!5�i��)����X��M�*O��wXV�z��	Z,8cnH.������}�����g�$D��4�k�v�.��𙈄HԀ�������V�/Ϣ%D�z�kY���)�ٽ��,j]8<Y$=����:C�?��~��P���X�5����o���»=�s��7�Wo:^���by[.�beN��v��)�t��Ril'E�L��VE�}'��L��j�Y���ifE	�FK�L��d %��7)�d�%z��?�����2lE�,*�fN�ƾ�f�`JC�n��*����蚰%��Pj���bQ��P�Bd�Rz�������c��ϲ�iɄ�k�0 
�|�p�����`
�۹��EE�PPW���	Q'���^m�z�$g}\���t���V����\�G���;�!J^�5�_1��um�Z��53�3����о�_6m�����$*�-MV�"��䊵5#D�W�%��}ԇ�286�q�T���ځ@fd?mV��_��.J�Yר��$�+:7�W�HA	N2�;0&J��"J��Z���	W�J�A	N���6�}��$��J�4��|�Psz�:�:D	�k���w�$�1/���D	�իȜ�RQ��I���z,������	�P�L��1�A.Jp%RJf���!%��6b��/!%��ɡ��H	��-������2�(�*�MY	�(�Mee���}~ FB"J�͈*���	=ġ��ǧ�ϫ$�P�:����>3�>b��$K����ԈEI>��mQ��P�8�e�V7�[�/��1#(���ʟ���O��l��e���\�!!/%���wk�\fm��`-�1%d�N[�������].�L	����kʮ
Y͇���"΁��UU7>s#ڳ�M�.2)��<���m�Њ%���۽�Q���$ԧ2M{y>�ۈ��ޛÚNC�*Ӭ��sǊO5x�ݩL�^
���ړ%������T�����m�Xn��~�:��M�.�$��w�-#��T���'ᠼ`&��T�S��$���=���h�I��w�f�^s΋E��0�'"�AN	5)�ETv�I��������vE�T˥.�b٩�S�
])��⭏R����g�ťgA�_��Д\���Y�6�!%%pu�o˦�g/�;ל��:��IhH	�`��2���h�:$��E$��m�l��w��0�"���rBmWR��K	^ԫ�t�n��G�x�n��I�\�r_R������Q�]Ѧ]([�w�n��G	���	�(�%L�������H�`B&�|�KOB/*�Ϛ�����θ[�%��_����Bp6������

R��X���9O��L�H���LE���.�4�~�}�O��
bQ�8�(�d��&�`"�(d�75D��}3x�Ŷ2i��6G��\�O��+�'�4��,a��ʓ�E�WI����nU1��q�NƯ�Rw�y~/�艚�<<?UPyLǓ�g^%<	z�~<�4�n�������Z�'��t��I,9#�B${��#��!HA�I0��N�j
:P7����=`M]�4�l�Q29�
>�T���_�L�<s���
Tl��>�;)!h_ՠ,������tܨh8�]T
�Rw��lk�V�Д`R*c�3~U����
��(l��(䌋�4�-�7���&���d��e�D���[D_��e�О�+���3$��'����[~ׂ���ꢋ�;'���m߻{]�_W��u��e��/Ḑ��/�((S	�G��uGF�R	���9�D�۵�}˓�Y �tJA|Jpi�ڜS~a��Ĕ�S<V�J�f����]�>����`z�W�q�Q�7ł���(�Z����~��d�O�\�W�,c�	)���� |��}-�+M�l*�.KS�LL��%�yԀj��ئvK��f��s2�)���AKJ01��!+%����e�c
S�=�����b��ڶKE��pn�ځ�<�.+�D	��=�)�-�%8�TwW��Urv�.ۇ|���&���� �����l!�$�����!^<�T�_��X`��/}��?н�J5!�$�>����o5@���2�5���TRՅ5q��R�^Q��y��Zҁ�R�X�F6~���j��/����k���Z�ؐ`��C�#�̌7�-��t�m�_�� �T�����Cm�XI�j����s�,�'��)�3����9ȑ-w�� $�c�}_���y����|��Ky4.��m�<�A�IpMf:=�w�t�W��L�����_	��6��N��-���"r%�j��~+CA�Ip-��g-Wr*p�H줰��,#�O��S��<��!�D J�2��F���eb#56o#��7Y7�)H3	&&���h��$���07S���<=�V�d��gA���\���GdJOE&�4>֤o*���%��E�!���6	�oƛ�(��Fܕ�R��X��$
�M�	y� ��)�6	����m��8&��<��M�5�T�bA�Ǔ��WX�u(7	FouIjeqm\Z:��u���\�����g�f$����i4�f=C���y2y&���=| zL���u�<���p�-	�%ߕ�r�17䞺7ؽ�!��r�.	&"I��_%���$p��X�o�����
L�i8�Yn&�4�y�h\A�I�X��㯚bu�$��%ֽo�$��R��l�L�w�MS���:�]�F��·�!��!!�� ��Q�d\^�����75&��������.����x���3w=5�P�额��;�[�e��5LH�f�%�iL�e��? �$�R�-��F��ay�s�x���t {  1�BA�I0�Z�m鯚�`�5)�cH4	�E��n�����S����q��g,���B���Qt�2�Pg0���R7���E���� C��#�����2P���Y��L�.զ��ޟf'�lq4_'c�2	..��{�$�&��b��]���v��?�A^��6����E�8Q��ј�K�D�cP��!��Ώ[T\8CvIpV�J�/n������_�!�$8��8H�՘��H�٘��.+!�$8�X���z�,���`_(�#�5ޡR��9�Ky�#���F����P�W�
}��6�6%%ߓ��F$�ʖZ?�n�8��J�5R����^uߔ��R�~�:���!��Ա'}".Ό!.$8�P�6���i8�PX�[� ����Aʅt1T��V_�m�/S�!	$8�Z�����+��Q1���O��c$�~��O}��
��&h�*$�H�&h!�c>c���#`�c���R9�YE���x(�~��"�.v�di�YEj7�[C1Dw�e�[�Y�pBi9�gk���*�'[����~:�}�c{}i�p���ny��#��SzRa�O���`ԧv��:vWn��g^_�Wљ_�ݡ��qA�����%�g�o@ Q�o�i��߀ȣ����M��K�_a>/�����N���7cH	F�Q�*��~�=���`q:�Ƴ�&�RM��N��ԝ 0��vط<O&�P$8�+������y��F�s���O�m��>T@�H`��G�y��o�M�u��"��G�!x$��d'r��ʺx�4��`��s[�������n�ǧ%�O�?�6�zS4���Ll�'O�I2�]v;Wf7'�d<�����t����<��S��4�~@GU����?�������l�C����Ԩx��i��z��{ZzRe^膾�4۹��'.G;�o)��BO��wlz=�_W����Z��o���~���@�*g6������Y�>ó���2�Y,d��E���u��:�vb��ƨou,�W�ō�Dg3u��H�+r�7"�gYĬkvF8���yn���-��M�jsS�\�ݻ9b#	��ɛ$�q�uo���$8��/�W�z��hٻv6fkq��w	3�8A��t���!�j\�0c����Lx����ތo7v6K���kIv-R�- %�!�$8��C��v5q׮��$8�}v���d4�� X��P{.릢C��b;�ź[Uov{��X����z�P:;K��!�~��՗+��Q*IS�#@HI`�0��ø���y�� �IxԚ�Z+�T�-]�OW��S�4��VƱ�D2�b��ع��J���Ɵ���}g���{|�R�(��Vg��*W��N4�_�y8�?ZC@I�.y�Cn�Z��t�EǑS��O%�|-jJ�����"��AbI0y�p�*�Ct�05���vi��$��DS�d��f�ρ��c�)�����U��8D����#�o��P^8Z߿-���jK�r-GPVß���RE�Om��S�_�̾�/�x���rɄ�l,�R��]�_զXҕwۧ��=�7�X7U�PNL�'��0>�h���gN�p�����
J.~�;������KF�9�����y:9�������$��n����zK��k�#�����|��R�JOZ�)�z��C(�,'�G��MD�<��u�#0G��fiː�u=A�q�T��]q>���t���H���X������thh�0��E]7c��¢$�G�;t1��a�;Z{�v���<h�%|^|����=��*`�Ꙁ8�'.�#t�Q
�t4�=3?T�r%bƔ�);�i�4Ư��0�<��Gg���JT��BN���+���rڂJ2fwLŢ����q"���b�U�L���*��P�w%�7��,^w�-���#~�@7��5�Dt"H�`��jՌEX�G	Nxj�t��60AOJ0���OrW�̔`в{xz,[��h�)�T4T���-*Aϝ�<�ǟ[ߨ�Ǥ<aqjT�iX̎w�	���rQ��妩�oe�`�l>A��̏�]%���aUlj�ݚ��nBǊ���o�7l�-���`8����(R��(�@�8�a;��>�<Ix�,D�x����=�'Q�|��#^5�j�>�.�:09"}��i�'�l|�H�`zJ���Y��j��
u�)R��,PAGK�����L��Q�h��r��Z�>�}��Y]n&]1�Z�i��jɼˆP"�Cɞ�N��O]�Ҫ�
�j��!��ǋ�y,��㗺�����%Z|���.Aߧ���~��2��������>�9h�Xg��T��uDb nR�y4���}	&�J�K'V�v�����i��t� ���o�/��l�0ʍ��:��%��_���T��GZ�.��Y�H�Q?����\�����A�y,rB�K�����ES/�,�/�)�ݶ�92J�=5������!
��66���;�?�L��Nxc�B����O�hA�x_ *������/e���C�,��i�pR�'����=�J�����?���n�2���ft�Y�	�T�:�fm��vi�z�:��5D�ס�\+S��\��r�Y����-Aoh�?W�Uob#�7��S��e-����ya�"�P1�Bt���������W�ڧ'��)����}��k���_g�`KP�xO�G�%"��@Kp�2͓0~�ar.G&,��l�rq�����Q�]�7����òX-¿�:��~�%��l$��к���Y��V�烆���#�K�|�0�G��=�4"��$cfE+��tV҈а�d{Y4���Y��J<���*�����3t�'���Xo��z�Ʒ�9�X#�P���F�����	����Z=Q_?lW�Q�h��U��y
.{��4�ͨ�t{W%J٠u*A�j�WzO�Y[:�fy���T��V�3˵*��n���A�l�q*�/��zD;��T������bY��.�F�*���)�ѷ �Zw�j�T��D�I���~��k��SYkC�S�ބ�ԱU�7����)Gk��f<�B�JpRg�)*A�~`]�6��G&b�py���˗���]�*����X��2|]5ź�%7�u~.nI.Gե
�5�	��l��X>Uk������BN��L�<|�*��9�Q ��Щ�jA:���j����*�VǺ,���������G      )      x��]�w۸r��
�eO{��_��8_���n�nN��-16Y���4�����( A���s�%{��f0�����|�o�÷�j�h��M��&���{���uQ�%����:�TpuE<�z��W�(�xq!Gp�R�FS��@�d*0FyZ~�Gܢ#�<�$<F�d� >�b�=�ݣ��l��J���t9h���˼�+�3�J���n�-����I4H(�ĊsS�V��r��_l� &��eW�e��(48|m$	�EYzOR@�T�� f1��V�𜗀��7�2�� X'`a�X�s��a��U2�����=�n��7w$����m�΋���\���H�z�J7�r��N�	f+�S���':�6]��m�	[�/���U�fu.:��24�x�@�~���؁��+��֮��t�-�-��-��2_��sx�{z*ʭ<��*�f��o��������D�Z��6-��G������K�&���b��<�;&G1Q4��сˤZ�'�U�+���n�i�xƸ:F�������@���uF�$ )�_�2o�u����Y&q �!!�@��acxSfwy����ԬC�M�)'s@����Q�W�*�����{��c�[n� q��6����O�l�'��Ba�lYB����/�b�	Z�k߂������(<]
���`ߥy��������6]�o�l���x����T0_�W�O�}N�Xk��n��9�>��<X��c����\f� GC1)�
���jS�fi����4�j-��q�]�f����<��E���P�Gc�Oy�J�Q�����ݍ�ޝ��SY�,��B��+�"���H새�r�ȥ8¼)�Yx<�C����pC�2N�!�w���[�)!*��ȰmJ�̜��W�S
���9y�x��\�dRH>>��P|��e�|��!���2�yB�xI���F��`^�)�hԟ�t�+�զ��z����ݪ'%�tT2p�8���,�{WOV�#D+�O��5nf��9?g���6��y��!jh��w�:�C�{|T"0ByU���X�?�����H�A`���bB��(�B^i��Xb�4�� 3@�^�v�b��,�ʘ�?X��t����8��T���/Zɤ���M�z �:d#c0�t�jBL�c�b���z�3��X
�@����b}���!��Y�e6%���7�:?��/��?�����)��`���Җ�И+2�zh1pu�F��T���s�o�>�(Ă�xF
Zk�˩��?k��P��M�U*)m�RA���k8��8Ss80Y(����)r(�_���DL��[���l����Ԣ�4Y$�	)tVK)3��X}ς�CG\u���!_|���c��`�݉û^��Dy�����J70G��/��7�d��q���ثW.�Yl�{<||��ܿ-�|���lOc8�\'<^�Xd������!0�\�M��
�iB���N�Ă�TT��%����=ژ�A/��$݃1�1�x����^g��#|zEHG��;�	o'��S�?��v"1-�v���R����y��&�f͖6קIԞD�0�NwQ0�]g��2[/��+#iA���D}��k�z��nl{j��l�Ia2֙���1�~*�E�meʦ`���qS"�t]f����e�I�����A"��J�D"�۴\��ȁ`���\��o´�Ҩ�]~�ypޏ�]���Zh���V�&�H?d�5o%5��z�2�ʒ� �K����(T`EaF̬�O���e�=0]�f��#�����g@},6�6�l���1��D���1OwA�%Ԑ~ \�5�_��Q�a5XW���z2,E�6H�N�@�y��q��m�t �����-�Ǭ�� ����x�JOJ2`���3��Ǣ&s��J :&c�T@c`G������g�蟕����i�z��(��Z�&�A�>~?���Vb*0"1�N�j�v |�y���q�����;�h,�ֱ_�?�_U���CW�q{�U�XՐ��h<����X�A'�-�$X���1b�No��{��v!OX���=l6���@qI�.���>eP;�ц,�]��2&Gb(]�%lw�r�PPB���h�
	��i5�-�͌0�p�
RT�1 �#9��3U�g�^��RP�$����O�W=�G�&�&����/>��X�F�ܶJb���%x�L��V�b[� z�nݻa�Q5nS8�������)[�g�{�ua8��"i�2���H $�P� SN˩��.��i�X��-�;X���}��G��7e�5���:]�M�z+'���1�a�:]���y��:-l]}axeml�:I�z�U͗�l8{Y���H0p��2��>�����@4Eb#c�|R�T�ԟ>��m)&�NM�jV�C>�����O�Z���3�m�~�ڕY9$&QX�7�)O�Y�Q݄�2"nULhwЦJX5v� ��!(+�m��tP5D��A8�-�<]��i�px�P�s85�*�?v�;P=<ǀ�U�anX�y��_��gI1=!À`Otq�m�7M~�'���I��`�s��x��f�����g~�_�"��K;�M��i�#��}؛
}�=3��ӹJW����c��-��$�&����SboH���Օ�Z��鹑M�%bp`��Y���k���Q/��M����%2�!�)�(\=�|�Z��G�yU$]{����;J�����C�������tn���9�v�h�AO�|�l]	�\�OVq�)_>W��o���(�һU�w�7�gJ�0	`����}�ki[�R�HK�S����ɘ\��a��5�/����0�'�p<�nzX��P}MՆU�`M�����.���e*Z�dr�.ø9��6��C����3���}��m���o{.鷧��	���o����?���Q���'�G�a����ڸ �s�ú�T�<�	^�f>�	�P�KP.�)�6A������c��:�R�������+�9�Ơ��A$�4����[�pO��"�ocUQ�=Avca�vm��٢f�6�X�P���[Y�'s�<�o�Mf!y;���A�i�6'M.b&\]�`��:m����6�t'�#�����3&JN��&��;;���M1s��\l�:�ւ�"+�Hg��<[�~tnK[6Ȫ"��?Y���i���L�lԑhdԐ98�g�ܭ'�zJ�Czj�px<������Q�H��y��񴫃�AEz��y�br��̡�6t]v���Z�#�-��ч���c�N�=��t���4Ώt�V������{C����4��L$AO�������UۆU�K�Wv�m�*��'���\\đc�ӟ�6L��ZX�2%�Ě�����ui�����ӳ;��� �Іp��q#�Z)����n�� �π�Ad���Zg��ƆH��b&q
����95��Ɣ�Ŕձ����鎊� uG*I<P)(�V�%41Oj�]��x�܆��Y?ғD�S��	V��M�����l&Ҭn=P��ëq2�t��)	b�6��ZJ~ʕ�HDG��I��iйq}L��m��o�U�|J���c�1�c�NW�`�D���m�.��x��&���b(����"����ކӡ"�N[��xoCl����Z�L}�t�O���H��K�95 VK��Z6�/����� 1�,R�u�Z��>�|���3�'r�����}^=�@��.P�I!��{���QA�@x/��;�W��j���#�ð�׊t�@�.]W{O��<������X��bQuV���8�a�2W���WO:	���O��Ӻ��P@��Vt�
��t}��"�3+��[U����C��t���6;)���� 0Օ��;n\l��6r������F�*��@���zF JZ<�9���A8ZF����ԉ^_$�&��m��/��n	1�&���ù�u��ӵ�߭s�ݘ���)*79�Nh�c�ݝ��TB|9?%��+x�⿁��@-�\��p�ل����m    �S�B"���\*��>X���*��g��_���ET_r���C��I,��"��̾�&i�''��FP<:LL�
�Q"�ӂ�A�I�F��Tc���W�z[�ʏoٞm���ثt�>��h*��SBM�����{�43_1�C�%�-��ISz�ߺ�\9#ې���0�S�I�d��4��	���v�z��I��$��|~Bx��)�K���(�Q�q�����OJF�(�T���ŭ�+=�Q�秃��E���j���g����X��3��AIB���V$�5�IW�Z[l��{�I��ŉ��MJ���/��t��1�Ç�f�:
x�nmi�����M��SЎ�<m���dlv�Q"/t1 ��8�ƭ���a����\VMJ�<�I4
ߙ����5��2��S#��ܑ':Nӂ�K�J�D����~�:X�S������7�n��5�aM������Ã��h���}��<���nxɭ/��@E�Oؚ;_�{�%����k��'.��tQx�(�k�.v�c����ߚ� 0���2ݤ^�3q�j��G���X%Q>0�n���eqp��15J�Y�0a�2�(�Q7��R�[D}|W.�p�\Ҳ�W+����盏�6����0I��Rd!*`S22%��<�qy�(^eevZi� t$�ʲN���!�S�l
Ie���eֈx��΂�������t]��ޟY����"� �R�LN��H1�i����q��^���y
���Sܓ�9�A ������I��]��`�V�����>\X߼]���c�7��{�V���i��s��?��>S�B&1���d�����!��]aL��:�F�%�H��G k���2��Ů����6�3.��m���=akҁ��bw�Y�ug�8�a����Uy����!"�w�����"$�dt댁#���y�m8t5��l����p���{ g=7�D�;q�7��Ռ�t����-��c��u8�ש�qF;�a�E�����<&&b�c���_=�H)��W%��[~]h�%?&��1_=���ƌ^RH����w��ڸOH"m��QC-Ό'�f�L27B[W�՞Vb�	�4=��쾍9L�����t�gW%��/.�&?�����t�����oV�ÓL�>��X_?4�t��� �I
%m����e��S��fRwf��b����%*AP�v妽n��i�W�9 XK%����ק�Z��=L�{�!m�9�8Qs��S5؏� ��|����.�\��NN�٘�]8x����(L��U1��_�ʬLL�2��R\���H&��Y���Yf��><�&���.]a�~�͋-U;��>DBk|��Z���zq��8	�*m���H�1��2���@�0d�:����%�v*���.bsS���B�{�T1m��l#L�HA���[4��|��Ie�|�_�L���>�
�,:H��,�=tq��	��~��|ӭT�ص���V�B��s����_��6xڥ���Q��
X����H���Af�^�T��O�������Y�4��Z�(�6m�P�zj�0s1;�o�D���Z���Jв�]+��'[
�,c�*�Y�0s�*�!թ�r�d"�#ՙۊ�z��� �ǧl��9�ȶ�g�w�t#��З��\�xe����#gS�c'%�g�� R	�oXC�b�Oe��R��$��ψ�q0o�����0h*>V4�(Ę"Z���[̺A|:uTW;'B���p,�On��a�\_w/��x�tbXH��`����4)*θ0��8T����lr5o��4���5hG3���l;�|�N����k�`��n�:�@��W�P%#69�>BcQN����]x�5��?������Cؒ
���G@��������r҇��ws|XPG���/~�][�"��,�Z:���[:��W�bF����z�[�!��;�?�F�8r�~>:ѝ~�y'~k��U��-՗,q����D�m��Wi����N���t϶��&ǭT��Z�����������3��p=�ܤ�&��Դ@iu�~�ҫO��*N����(NƁ`�i"�HV`�b�Y�#����b��0�}/�R���؝\n�1�]�xn��-E��@}��M Oq^��m��9�0��Ot��$������ׄ�5H����K�e�͗��`�b�z"�j�����d�	>�ʜDl&l�#F�,�v����IB�����E��ʱ�7�&�$uQ��dh�흛Ǜ�j~���T�*{��PX4p@���v�S�8��c�c3 c*��YČ�26&�$�`]�헠��h���!��m:1�6��%F�����R�}n���v0-���bvz���K����f�Y�����6�qL�C���@mW�;-O!`ӯy ����,�FBE�\&xOr���[wU5r�#�مh����	�]������u�f�˷~AZ�~ڥ�}� ��P�=�ܪ,�V�����u{$�@��8�b�$s��w$��pnJI�6�RG�	�F�!�5n�,9�Kf%RF
ƕ�1i쿼HAL���B�����MK�N|�a@��H�������8����x�����*t����`((3���_��Y����́��ͷi@��J�"ɜT�%���3�L�P���F�z�u_�dLӃ���H���8`B*�ЃZt���� �a�tM߲����h<+m=a�����a[T*�s�W70s9s)��LGT��.�T{���Na��2�w�r�ȗ��}o:�w:`9xy�&�|թ�5��Pb��FoU=Q�0����b�Ai�&t�(7�ufr�6@?gۖ�� ��/�#����}�_ԝ3��!�O��_ X��h��Z�[�������:��Qu��԰4H"Mϭ�KL�FS�c䫲 뷵�o���S]���f����<Xҍ�R2j�����^a����>�~1ϳ��Ӭ!20��N��+ߦ�����SVvu�w��v���x��	�鑱��t�M$}�$����kKΑL�x�����t~� �O��ƒj�w*?ϺX{QX�;:ׇ]
������yǞ�r_%r	Q��E'�4�~���(��o���ǉ��^�&i %^[�
��=���������X�� '�-n�A'���|��LŽ'�F��~m�8����n)�L�'��
;�^s=��y ����1O\����7���kv�q����6Oa_<�Cl	��1WZ+����S|m����1��N���7�rِJ�-��<507.�9��s)���Eh�\k{  �17�#��:?����A��I�����E��X-a;�1ۖy�=�x��)��Nzy�xX��� [o��N-��Q�t+��u/��3FwH���0�Nh�>ov��3�"&V�7e�^<�/w�����K��q��<�f�aRF��OzJ�X���;��/)��'�%��Y{�ä���ʜ���(���y,�n����h�����|L��ע��Vܽ|i�����C^f�'�s0�Y���*Rܡu�H�z)i��_����Q��r�1n����9:�F H�0;U����w��P�SB�a�u�h�{�Ā���&w<
_�#p����yY�����,������N/�y��w�~49�ה��2�;����W�h�
���`��=��p9ܴ�$v���i�~4-4o��O�i�� �q�T��m���Oy*L��V��9jշ��0"��$wy�gB\<y��f��H%4�Nm���t{�����x��]��;� �ȡ"W��ݬY╈P�6��I�9%���
ݏ�o����\��Eı���m����a�����|{�Kz�O��D�J��Y�b}��B59�K݅z�����A���$�2{��r�o���(x߳5�80ڳ�6�lˢ�ؗ����Tt9��.B�`��yح���[[*�Z�:~��/~��Ll����"��4�7����ŝ^�J�]�ot��v�r�?��:��)���mC `p�vQ,��=�n0m������m�L�C�/���م�亼6�Gp�T|��~_�O�&�qh���G.{2�7������s� r   PQ������,��C�N����9n�-�y�n��I�VI�hj�{E2�^&À���|Nq�/���Qű�%��}��ú�:5�"�|��x��o����e��ԭL����׋����x��      +      x������ � �      -      x������ � �     