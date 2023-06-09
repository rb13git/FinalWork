PGDMP     :    5                {            Shop    15.2    15.2 5    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    16606    Shop    DATABASE     z   CREATE DATABASE "Shop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Shop";
                postgres    false            �            1259    16608    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16607    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    215            9           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    214            �            1259    16615    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    16614    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    217            :           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    216            �            1259    16695    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16694    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    225            ;           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    224            �            1259    16622    person    TABLE     �   CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    16621    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    219            <           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    218            �            1259    16631    product    TABLE     y  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16678    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    16677    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    223            =           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    222            �            1259    16630    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    221            >           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    220            ~           2604    16611    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215                       2604    16618    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    16698 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    16625 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    16634 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    16681    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            (          0    16608    category 
   TABLE DATA                 public          postgres    false    215   g9       *          0    16615    image 
   TABLE DATA                 public          postgres    false    217   �9       2          0    16695    orders 
   TABLE DATA                 public          postgres    false    225   f?       ,          0    16622    person 
   TABLE DATA                 public          postgres    false    219   �@       .          0    16631    product 
   TABLE DATA                 public          postgres    false    221   �A       0          0    16678    product_cart 
   TABLE DATA                 public          postgres    false    223   �X       ?           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    214            @           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 45, true);
          public          postgres    false    216            A           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 4, true);
          public          postgres    false    224            B           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 2, true);
          public          postgres    false    218            C           0    0    product_cart_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_cart_id_seq', 11, true);
          public          postgres    false    222            D           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 10, true);
          public          postgres    false    220            �           2606    16613    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    215            �           2606    16620    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    217            �           2606    16700    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    225            �           2606    16629    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    219            �           2606    16683    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    223            �           2606    16639    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    221            �           2606    16641 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    221            �           2606    16701 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    219    225    3210            �           2606    16647 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    215    3206    221            �           2606    16706 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    221    225    3212            �           2606    16642 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    221    3212    217            �           2606    16689 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    221    223    3212            �           2606    16684 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    223    3210    219            (      x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�0����x��uMk.OҌ01���ۀ�2�01�b�Ŧ�.l���b����b녽v\�1�� �6VG      *   `  x���ˎ]5E���;�H������bĀA$�)r�5�!��/pn澳�3X��]����7��������������ky��}���_ǻ�z�u��{�m��}���w�������ӗ_��������g9��<M+���LF!�W�"�%�����g�n��oޟ�u��g*"�$�E>f�>�谐J���,"�*��é��IX:��J��J�����"
���^2���aU�AuU�G�e/�,��h�$�
��	I�Hn��jk.��}R~�g�>�϶��!����ڤե��+9|J, ��c���YT�^��d�<%��Fx$�h ���G��ygU�,Y���[�ٕ�cb�9W/��k$��TՌb\�2=���=c �Ŝ1혌5�EbM�>鴹�e��
�9r[GJ[n�TZS#�l�AK�r0�ggn�3�ޑR��f��ОLHL�e�>�9Gn��҂2��ff\����9��Ŗ��s�6O���By��25����K&tW2�}�����M��I(!C�kN��V�n��Õ�s�vOh��X)L���K&6�kHS��r�#�|X�x�a��n�ɝr��` ,�z����3�c4=��|�'.TR����a�s��Ou�d\7ֈ'ܥ�@	L��S��12m���޵5,潹fǮLq��l#j
^������� i�CI�J�9J�˾Ⓩ��>�-<9�jPAZP����e�Z��s���A�@��f���f�ڂ}X��R7Ԟs䶏�ֵ-`{U����ъZzb����s�O�s��ea�a$�uT�<Q���:���#�}J+b�3*��c�����lm,���?l9��T�J���Ǹg�B�XSǦ�W�Αw��(���ZH�A�B�F��SK�I�i�m ����Qp�(����D��e�e�?"t��p��QV�:p�:�/chb�%]:GnȠd5��bA)@e�(�.!���Ȏ��A�p�ܔr(u�Ѥq6��6w��
�9r;H��Wό�dv�"�ao���W�I��s�v����	���,��<���g�khW�Α�Ak����'��2N��tD�o2�OW�9r;H=��]��\�� j�L�,��Zfy4�z���iԮF���"�~��IM�&��g>����#�M�»vo�B��!9��-��\�9G�_`��Y�P_�ldxC������9ǔm �tz�A�t ̨MT��kae�
��9rh�~L�׬���v`�������~b8fn|Bζ+WF��O��8��y�0�dl�'0��J_EzDQ��w?TJQj-�b��O��V���*�#�x5E�-])ս�g�t]
zs;HG��Oֶߚ�QfDv1Aq:�º"tg�y��Jи      2     x���;k�0 �=�B[��t�I:w�!PRhҮA/�!��c�������p�������������:�S�~Hy��U�*��2V,�1��+v��!�],�m��t+eY�/�y�:�i�c������}�g+Y�K�������AQJc`Y�)��c=��Y���M��*s���:%�O��c�dP[kP�� �J'y�-q-��.�)g�G+h��;A=�����Ѫv��Lp�j�k�ȵu��ϑ��"cRF'�_п�#�@��,�����م      ,   �   x���Oo�0 �;��4!hq��Hh��Z��"��c�J��1���˲�n//y/?Lb�&{
ڞ	�[m�)ـ/L d��g��ME'E9w��̠	���Ƙ�n�u��s�i��q�.75���z�XG!�a�X3�=D��
vǗ<��Y?�ݡ7�{�Ę�h�_0{��U��?��U�I?��7�K���E���W��ݣ!��;u�:u�!��_X2q.M��]�      .      x��\�nWv}�WTK�&��ټ�����o�%�e�HDB�l��o�)J�lZ�O[�d����&�})�������ԩ��F��aKbWW�˾���.���;7�~7y��w�L>�����Z�������M���n$�o�n�fw��m�q���{;������|xo�\��}����F���{G>���{��|�����-y�����7;��'��k��x'��n$o���k�����y??ϧ�h�7?J����_ȟ�׷���F{~�Y���&�n>]N��L���a���Q��{���������P����8?�?�<M�q>�o��<�ly��C��/�>�%ɓ����4���b$S�F����*�=]L_��p�4�/9����.Sgzq��dT<��2�@x$/��Ot���r!�Ī�6� ����XI3M���t~��`|�u~��P���HCG����.�U8�e8��O�R&�CF���D.���C7�N�e�L����R*O����
z&�������P��-�L"��R��yW�ߓ�N�ދH�����0*�6Z$�B�:��:�#���ȅ� _��2HGf��dc�<՝���y��LOu�ݸ<N��Fa���G>��D�i� ��WC���?Q�UCٟ���j�:�/��3�������Mc�4�����i ��j�Fs�k_�x��4(�Y��.͔��߁ks���xd�1���F'�����H�2#?<��E�	��f-c5�P��H�R�pzy�|,�TG��w���r�KP���)����kV��0����edH,��{l �U7��ʮ�X�_�}C�cY�v���l�;+�Ϊ��Ʌ�++�T���������z=L�gA�S�ac �c��n�iM��G\�H����~{�Q�
5>�?�Oe�ϱ�uR�����t�����A�~Xuu(OE���x�m}� ��C��[��z{c��]��,�[��Pw���B5�����tV��5��7��b�cx"������m�al��TE���B�L�ra�?}l]W<6J��!I&?��A=�i�/��w�>�}*`�eAo����.ƅI`��#8c ��W��FV?��ΐ/��j��P�L�����;D��krVIt2�|{N�0�i�	����>�2��u��0|�|
���<�y�Bh��Úo!��U�z�m���)�������eL6߯o�3��$�2tzӿhSz�<��4d^2DkL�fTU�1��REc!K1ӗ\q�G!�/�ڹ��m�扥�����t'��%&��p�����a�RŴ�b�Y�� q	�2V�\V��o%�vba�z��HV6ך
�b�Tu���|�svP �@)�}/��:���_þF��Ur�u�o_z�'��+��v�����,�:I������n.o�l�4;X�3�f�����k��A{�� x���f9V������d4&b%��zB�C�f����[�)�̹� �gN' ��s 761�P=��!�{��>�xj�`#�g�TX9"��B�����"x�PR��>x˒@������0w�{l*��Q�`�M����O�<�wJV���6���e�>t�`�Q5�XBgp��O�djĊ�����^��_U�L5�8:�!u�Z�ৠrQ���S̥+;F�A�����A6SU������@���r%&6�-�}��ի(���J8�2@��z��U��Kɒқ��k�R�J������2�l�!��A��z!��=
Vkf�z��%֧Q���O����}���¹�}{�*�'pk��paH�v�?]��YU(t�*��:�Z��r<��LZ�M���>!��!Pmj�H��Y���c²���|Ia���j�i�N��fTeL�Ľ=�^�W�ㅕ&�'eLT��V�C��_- �4(pc�Pe��֭�&�/���(������U���1[���Eΰ�:�k�ً��fͪ����MlSi�80ԶT�Td�pԭ���o����)3��/������$�}�%o Q(�|0m>O����!ap[V���:���+�	�Y�u��v���c_Sg���OS��}�_��C���C��9]����%
�i�NIhyqޫ���?�*�^��Z��6ϊ�<,���D,ȘɎȔ@P��n�f�"����T���'T��6�%�`�#�Vg�Q��(x����Z����V{sY�\{��c��[(�!pcMl�g�;u8���n/������%p���\ـAvk0I�.5<YO��9#���1r�cz�2@Q{�r_�0U��e%�n�Y�K�>-$�r�JQ'ZD��A��#^X�XQ�c��1��B)�"���ɵ�6,≇u�)G35��A��C%���>���4U~R$Q�SW�ժ�"��H� �5���Z8;V����Ĝ���h۳�{�KP�N}�3���Ϩ2+�P��<Z<)٧�gd�*�A�;t\�f%k�D�9�B5���̎�R'n���S�%F��p�Գ���{�"t�26,����+���[-(|Xiʴ�O���K�B����"���sO��u���N@� �S-'8�I_�5 �aFP��/Ng�'��U�)���zJ���(��{"b�l�_ó�t�w��p��BD� ��H �1׏���j6�����u� �"�A���
�?��Z�ޝ��Jsy}uu���2�%�R��91:scA�d|�,��σ���@��B���1�$|1O�x�h�!�!\�p
�#e5�>�犰1r�Q���K������V#��4^PH�s�9�8D�H�PhC����و�֥E��"���!pR�X�"�R�lxX3�ɔF2}�F���= �̙N��Vm���/D`�m�g����j����H̕0oˁ��1�/�H�r�T̋c�~%�E|�4�'��?�M��8A���U)-
{��hde�3�|q��(Ed��f��������7^[�I��S;8�	uP]�� ���a4^��q�\c���l8_oTp�\�H	� ��CC]+���j��@���\5�ӐyJ4��
IW�\+��5�XE��)�?���c��a��n'���� ��y/0�v:5`��(�U�����QUq{��RZ���� 	`�rG6�;l�+�r�1����?��d���n�U�J����/�^>�#�?+�8c��W�=vn����D,�U�z +}�Џs���"�I������`k�-P�	(�ǉA]��&����C?�'��D��(�yy��!qT�����o�a��C�EڃǀJh*��0E�(K�Ʀ�(EbP��EnA3��U�6@ʆ��ZƉ���T�������M�T�3�+2�������aL$ս}��e���������ݼ��8C1h�͔�c�	���[��Dr��;|𱵔d�X0��`uQNM� ��Ӊ���%��,P�PM��d!�V�֞V��1"E��Z����0��s�W�ml�;��t�p�ݸ�������ܮ�ër�(����Ե:Jmm������+D��	�-'�|a~ ���j��[f[f~� �}z���	��It������X̓'B�$�����t)4��J�aZ4��6���iiҡl!m���豨T���Ŵ;�J�ȓ�G~�3�<��O�����||&����y�f�5��?���}���6�����*b !�-.�8�d�WSlM6V͏ Ja�*f\�Y�sV�O_��(|����{N=�����x`%Gh7t�֖�4�:�[0`d���C[�9b�1��"6e1��u/�ٵ���E�E Rπ��y(>AR{�8��&]�%"�dD�ű��Fݠ���Z��'ʱ'-P�U���SVHY�)A��΄��(���O2�y�>[���
4��;L��{\Q�yOC ���5��L��Z_e	Z�.��(�g�ơ���=�z���`/)�����q&�V�E�eA�.�κ.����iIq[��{�nS;�E?�n�t'uDj�����U�W�J-P]�Ĳ��=����bi��g�����!�?�!��NyqZ������ �  |��JC��0�Y	��J�y�pYc�M.vh]ĉ�q�s�JM��q_�I4h�}�f����`ݡ�5
?f���ĩ�ޙOHICV�?�6Y#��)�MZ*�dZu�WJ��l(x�n��ݽ������O�~6�i������r��^���2��2�5��e/2��>��s�$�h�P�f1�2�5n�a����JF����V�Y ���W �>�濪��2���yJfƂ�E�Uc-�Cv�ÞK��<����I�pi�}�</��J\�Z�Φ*����D�����_��n�޹}�Fʠ����m����l.�oll���2ѻ��RP8����G��5/�)�^Y=�㴉��`��6�������W���ΤFb�3Ö�z������Z ��`1}���b�m���3�z��32�n�)`C������_��)��O2 e�v_j�y�y`��z����[�C��-����/�>�tN��l�o���q�����E�v��j/bҧd������HE�9?H�����΀����R�(�����GpB�4�gy�^Z�j�L��&��F�3�5���2� �ԣ�	h?��#,��J��M��~l0Ơi� o8��pH��z���>:%����|�����xv�R��o�@P��qR!��p� ��^��k޷���:���K�����M�c�������I��a̘�/�����g�&���V!BN��(90=DN=�����w�4e�=�h�t�|��9���X�GA��P�qO�PL{Ѱ}�;��jQ���]������Ֆd�fS�e騹���t���;7������Kf��9���\o���:}��\{���^y��w�_��V~�ԶYOm�[���J���a��R��m��E�.O�V:48B���Z��U}����&�����>���U���&]��;<}��`�C��7V�{�.
%��X�u
/��`�ىb(��PB�@�~��-��6�^Y<�]!2���mfk�1M�,�Z�>*h��=�{�Se׼�>������Â��Qh�"o����#����9��i؅�B����	l�VlVl�'Q�eVZ	�A1?�y��`.g�+�#���>���cd��Q�ѵ0��v\�dvtD���i�7�s��):�L.�cn�b��8z�<~��H��U�W(=_��M�l`Gm�DT �A�?���ه�?�v�e�!���%�����۩n��9K7 ����>�f�p�|��7K�@�V��PAW�CO��R?�^­u�i��rt͢޺T
.�ا��0K,�h�}{��o�?f�TY��&Dʋ��٤�V��kֶ���띵�U���d*�.��qZ}���^y�]�1#�![Jn��-�W���NE�Ql|rP�e:1��w��UO�����3D��Li%��"C"�������y�^�0�>���SutG���zG�݀�C�pNN�c�D�� ��9�C��<`MH �|�ޤ���8+X�i�l�i�� �>���?�&؄���)��a]~�}��x���_=��>�
��L�r^��e5�a(F��d�UR�?�7�t��d~�G��.~+�l)t�T_*��|��*R��p2D?�<r�Y*��4��+��~��~1��Ox_cqe��u��ǡ��ڛ�����aXG�70�O�X4j՗�BjT;�!� �m�*�(a(�q0rN� �����(��d]-t�-se����r�bF��~��+K��WI���,5[ω�/���<��v      0   
   x���         