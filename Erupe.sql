PGDMP     1    .                z            erupe    14.3    14.3 ?               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    26636    erupe    DATABASE     e   CREATE DATABASE erupe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Australia.1252';
    DROP DATABASE erupe;
                postgres    false            j           1247    26638    festival_colour    TYPE     R   CREATE TYPE public.festival_colour AS ENUM (
    'none',
    'red',
    'blue'
);
 "   DROP TYPE public.festival_colour;
       public          postgres    false            m           1247    26646    guild_application_type    TYPE     T   CREATE TYPE public.guild_application_type AS ENUM (
    'applied',
    'invited'
);
 )   DROP TYPE public.guild_application_type;
       public          postgres    false            p           1247    26652    uint16    DOMAIN     m   CREATE DOMAIN public.uint16 AS integer
	CONSTRAINT uint16_check CHECK (((VALUE >= 0) AND (VALUE <= 65536)));
    DROP DOMAIN public.uint16;
       public          postgres    false            t           1247    26655    uint8    DOMAIN     j   CREATE DOMAIN public.uint8 AS smallint
	CONSTRAINT uint8_check CHECK (((VALUE >= 0) AND (VALUE <= 255)));
    DROP DOMAIN public.uint8;
       public          postgres    false                       1255    26657 
   raviinit() 	   PROCEDURE     ?  CREATE PROCEDURE public.raviinit()
    LANGUAGE plpgsql
    AS $$
BEGIN
 
INSERT INTO public.raviregister(
	refid, nextravi, ravistarted, raviposttime, ravitype, maxplayers, ravikilled, carvequest, register1, register2, register3, register4, register5)
	VALUES (12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	
INSERT INTO public.ravistate(
	refid, phase1hp, phase2hp, phase3hp, phase4hp, phase5hp, phase6hp, phase7hp, phase8hp, phase9hp, unknown1, unknown2, unknown3, unknown4, unknown5, unknown6, unknown7, unknown8, unknown9, unknown10, unknown11, unknown12, unknown13, unknown14, unknown15, unknown16, unknown17, unknown18, unknown19, unknown20, damagemultiplier)
	VALUES (29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
	
INSERT INTO public.ravisupport(
	refid, support1, support2, support3, support4, support5, support6, support7, support8, support9, support10, support11, support12, support13, support14, support15, support16, support17, support18, support19, support20, support21, support22, support23, support24, support25)
	VALUES (25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    COMMIT;
END;
$$;
 "   DROP PROCEDURE public.raviinit();
       public          postgres    false                       1255    26658    ravireset(integer) 	   PROCEDURE     ?  CREATE PROCEDURE public.ravireset(IN zeroed integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
 
UPDATE public.ravistate
	SET refid=29, phase1hp=zeroed, phase2hp=zeroed, phase3hp=zeroed, phase4hp=zeroed, phase5hp=zeroed, phase6hp=zeroed, phase7hp=zeroed, phase8hp=zeroed, phase9hp=zeroed, unknown1=zeroed, unknown2=zeroed, unknown3=zeroed, unknown4=zeroed, unknown5=zeroed, unknown6=zeroed, unknown7=zeroed, unknown8=zeroed, unknown9=zeroed, unknown10=zeroed, unknown11=zeroed, unknown12=zeroed, unknown13=zeroed, unknown14=zeroed, unknown15=zeroed, unknown16=zeroed, unknown17=zeroed, unknown18=zeroed, unknown19=zeroed, unknown20=zeroed, damagemultiplier=1
	WHERE refid = 29;

UPDATE public.raviregister
	SET refid=12, nextravi=zeroed, ravistarted=zeroed, raviposttime=zeroed, ravitype=zeroed, maxplayers=zeroed, ravikilled=zeroed, carvequest=zeroed, register1=zeroed, register2=zeroed, register3=zeroed, register4=zeroed, register5=zeroed
	WHERE refid = 12;

UPDATE public.ravisupport
	SET refid=25, support1=zeroed, support2=zeroed, support3=zeroed, support4=zeroed, support5=zeroed, support6=zeroed, support7=zeroed, support8=zeroed, support9=zeroed, support10=zeroed, support11=zeroed, support12=zeroed, support13=zeroed, support14=zeroed, support15=zeroed, support16=zeroed, support17=zeroed, support18=zeroed, support19=zeroed, support20=zeroed, support21=zeroed, support22=zeroed, support23=zeroed, support24=zeroed, support25=zeroed
	WHERE refid = 25;

    COMMIT;
END;
$$;
 4   DROP PROCEDURE public.ravireset(IN zeroed integer);
       public          postgres    false            ?            1259    26659    account_sub    TABLE     ?   CREATE TABLE public.account_sub (
    id integer NOT NULL,
    discord_id text,
    erupe_account text,
    erupe_password text,
    date_inscription date,
    country text,
    presentation text
);
    DROP TABLE public.account_sub;
       public         heap    postgres    false            ?            1259    26664    account_auth_id_seq    SEQUENCE     ?   ALTER TABLE public.account_sub ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.account_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            ?            1259    26665    account_ban    TABLE     ?   CREATE TABLE public.account_ban (
    user_id integer NOT NULL,
    title text,
    reason text,
    date text,
    pass_origin text,
    pass_block text
);
    DROP TABLE public.account_ban;
       public         heap    postgres    false            ?            1259    26670    account_history    TABLE     ?   CREATE TABLE public.account_history (
    report_id integer NOT NULL,
    user_id integer,
    title text,
    reason text,
    date date
);
 #   DROP TABLE public.account_history;
       public         heap    postgres    false            ?            1259    26675    account_history_report_id_seq    SEQUENCE     ?   ALTER TABLE public.account_history ALTER COLUMN report_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.account_history_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212            ?            1259    26676    account_moderation    TABLE     y   CREATE TABLE public.account_moderation (
    id integer NOT NULL,
    username text,
    password text,
    type text
);
 &   DROP TABLE public.account_moderation;
       public         heap    postgres    false            ?            1259    26681    account_moderation_id_seq    SEQUENCE     ?   ALTER TABLE public.account_moderation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.account_moderation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            ?            1259    26682    airou_id_seq    SEQUENCE     u   CREATE SEQUENCE public.airou_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.airou_id_seq;
       public          postgres    false            ?            1259    26683 
   characters    TABLE     ?  CREATE TABLE public.characters (
    id integer NOT NULL,
    user_id bigint,
    is_female boolean,
    is_new_character boolean,
    name character varying(15),
    unk_desc_string character varying(31),
    gr public.uint16,
    hrp public.uint16,
    weapon_type public.uint16,
    last_login integer,
    savedata bytea,
    decomyset bytea,
    hunternavi bytea,
    otomoairou bytea,
    partner bytea,
    platebox bytea,
    platedata bytea,
    platemyset bytea,
    rengokudata bytea,
    savemercenary bytea,
    restrict_guild_scout boolean DEFAULT false NOT NULL,
    minidata bytea,
    gacha_trial integer,
    gacha_prem integer,
    gacha_items bytea,
    daily_time timestamp without time zone,
    frontier_points integer,
    netcafe_points integer,
    house_info bytea,
    login_boost bytea,
    skin_hist bytea,
    kouryou_point integer,
    gcp integer,
    trophy bytea,
    guild_post_checked timestamp without time zone DEFAULT now() NOT NULL,
    time_played integer DEFAULT 0 NOT NULL,
    weapon_id integer DEFAULT 0 NOT NULL,
    house bytea,
    scenariodata bytea,
    savefavoritequest bytea,
    friends text DEFAULT ''::text NOT NULL,
    blocked text DEFAULT ''::text NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);
    DROP TABLE public.characters;
       public         heap    postgres    false    880    880    880            ?            1259    26695    characters_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.characters_id_seq;
       public          postgres    false    217                       0    0    characters_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.characters_id_seq OWNED BY public.characters.id;
          public          postgres    false    218            ?            1259    26696    distribution    TABLE     h  CREATE TABLE public.distribution (
    id integer NOT NULL,
    character_id integer,
    type integer NOT NULL,
    deadline timestamp without time zone,
    event_name text DEFAULT 'GM Gift!'::text NOT NULL,
    description text DEFAULT '~C05You received a gift!'::text NOT NULL,
    times_acceptable integer DEFAULT 1 NOT NULL,
    min_hr integer DEFAULT 65535 NOT NULL,
    max_hr integer DEFAULT 65535 NOT NULL,
    min_sr integer DEFAULT 65535 NOT NULL,
    max_sr integer DEFAULT 65535 NOT NULL,
    min_gr integer DEFAULT 65535 NOT NULL,
    max_gr integer DEFAULT 65535 NOT NULL,
    data bytea NOT NULL
);
     DROP TABLE public.distribution;
       public         heap    postgres    false            ?            1259    26710    distribution_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.distribution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.distribution_id_seq;
       public          postgres    false    219                       0    0    distribution_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.distribution_id_seq OWNED BY public.distribution.id;
          public          postgres    false    220            ?            1259    26711    distributions_accepted    TABLE     f   CREATE TABLE public.distributions_accepted (
    distribution_id integer,
    character_id integer
);
 *   DROP TABLE public.distributions_accepted;
       public         heap    postgres    false            ?            1259    26714 
   event_week    TABLE     ?   CREATE TABLE public.event_week (
    id integer NOT NULL,
    event_id integer NOT NULL,
    date_expiration integer NOT NULL
);
    DROP TABLE public.event_week;
       public         heap    postgres    false            ?            1259    26717    fpoint_items    TABLE     ?   CREATE TABLE public.fpoint_items (
    hash integer,
    itemtype public.uint8,
    itemid public.uint16,
    quant public.uint16,
    itemvalue public.uint16,
    tradetype public.uint8
);
     DROP TABLE public.fpoint_items;
       public         heap    postgres    false    884    880    880    880    884            ?            1259    26720 
   gacha_shop    TABLE     ?  CREATE TABLE public.gacha_shop (
    hash bigint NOT NULL,
    reqgr integer NOT NULL,
    reqhr integer NOT NULL,
    gachaname character varying(255) NOT NULL,
    gachalink0 character varying(255) NOT NULL,
    gachalink1 character varying(255) NOT NULL,
    gachalink2 character varying(255) NOT NULL,
    extraicon integer NOT NULL,
    gachatype integer NOT NULL,
    hideflag boolean NOT NULL
);
    DROP TABLE public.gacha_shop;
       public         heap    postgres    false            ?            1259    26725    gacha_shop_items    TABLE     ?  CREATE TABLE public.gacha_shop_items (
    shophash integer,
    entrytype public.uint8,
    itemhash integer NOT NULL,
    currtype public.uint8,
    currnumber public.uint16,
    currquant public.uint16,
    percentage public.uint16,
    rarityicon public.uint8,
    rollscount public.uint8,
    itemcount public.uint8,
    dailylimit public.uint8,
    itemtype integer[],
    itemid integer[],
    quantity integer[]
);
 $   DROP TABLE public.gacha_shop_items;
       public         heap    postgres    false    884    884    880    880    880    884    884    884    884            ?            1259    26730    gook    TABLE     ?   CREATE TABLE public.gook (
    id integer NOT NULL,
    gook0 bytea,
    gook1 bytea,
    gook2 bytea,
    gook3 bytea,
    gook4 bytea
);
    DROP TABLE public.gook;
       public         heap    postgres    false            ?            1259    26735    gook_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.gook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.gook_id_seq;
       public          postgres    false    226                       0    0    gook_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.gook_id_seq OWNED BY public.gook.id;
          public          postgres    false    227            ?            1259    26736    guild_adventures    TABLE       CREATE TABLE public.guild_adventures (
    id integer NOT NULL,
    guild_id integer NOT NULL,
    destination integer NOT NULL,
    charge integer DEFAULT 0 NOT NULL,
    depart integer NOT NULL,
    return integer NOT NULL,
    collected_by text DEFAULT ''::text NOT NULL
);
 $   DROP TABLE public.guild_adventures;
       public         heap    postgres    false            ?            1259    26743    guild_adventures_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.guild_adventures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.guild_adventures_id_seq;
       public          postgres    false    228                        0    0    guild_adventures_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.guild_adventures_id_seq OWNED BY public.guild_adventures.id;
          public          postgres    false    229            ?            1259    26744    guild_alliances    TABLE     ?   CREATE TABLE public.guild_alliances (
    id integer NOT NULL,
    name character varying(24) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    parent_id integer NOT NULL,
    sub1_id integer,
    sub2_id integer
);
 #   DROP TABLE public.guild_alliances;
       public         heap    postgres    false            ?            1259    26748    guild_alliances_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.guild_alliances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.guild_alliances_id_seq;
       public          postgres    false    230            !           0    0    guild_alliances_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.guild_alliances_id_seq OWNED BY public.guild_alliances.id;
          public          postgres    false    231            ?            1259    26749    guild_applications    TABLE     %  CREATE TABLE public.guild_applications (
    id integer NOT NULL,
    guild_id integer NOT NULL,
    character_id integer NOT NULL,
    actor_id integer NOT NULL,
    application_type public.guild_application_type NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);
 &   DROP TABLE public.guild_applications;
       public         heap    postgres    false    877            ?            1259    26753    guild_applications_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.guild_applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.guild_applications_id_seq;
       public          postgres    false    232            "           0    0    guild_applications_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.guild_applications_id_seq OWNED BY public.guild_applications.id;
          public          postgres    false    233            ?            1259    26754    guild_characters    TABLE     
  CREATE TABLE public.guild_characters (
    id integer NOT NULL,
    guild_id bigint,
    character_id bigint,
    joined_at timestamp without time zone DEFAULT now(),
    avoid_leadership boolean DEFAULT false NOT NULL,
    order_index integer DEFAULT 1 NOT NULL
);
 $   DROP TABLE public.guild_characters;
       public         heap    postgres    false            ?            1259    26760    guild_characters_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.guild_characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.guild_characters_id_seq;
       public          postgres    false    234            #           0    0    guild_characters_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.guild_characters_id_seq OWNED BY public.guild_characters.id;
          public          postgres    false    235            ?            1259    26761    guild_hunts    TABLE     ?  CREATE TABLE public.guild_hunts (
    id integer NOT NULL,
    guild_id integer NOT NULL,
    host_id integer NOT NULL,
    destination integer NOT NULL,
    level integer NOT NULL,
    return integer NOT NULL,
    acquired boolean DEFAULT false NOT NULL,
    claimed boolean DEFAULT false NOT NULL,
    hunters text DEFAULT ''::text NOT NULL,
    treasure text DEFAULT ''::text NOT NULL,
    hunt_data bytea NOT NULL,
    cats_used text NOT NULL
);
    DROP TABLE public.guild_hunts;
       public         heap    postgres    false            ?            1259    26770    guild_hunts_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.guild_hunts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.guild_hunts_id_seq;
       public          postgres    false    236            $           0    0    guild_hunts_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.guild_hunts_id_seq OWNED BY public.guild_hunts.id;
          public          postgres    false    237            ?            1259    26771    guild_meals    TABLE     ?   CREATE TABLE public.guild_meals (
    id integer NOT NULL,
    guild_id integer NOT NULL,
    meal_id integer NOT NULL,
    level integer NOT NULL,
    expires integer NOT NULL
);
    DROP TABLE public.guild_meals;
       public         heap    postgres    false            ?            1259    26774    guild_meals_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.guild_meals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.guild_meals_id_seq;
       public          postgres    false    238            %           0    0    guild_meals_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.guild_meals_id_seq OWNED BY public.guild_meals.id;
          public          postgres    false    239            ?            1259    26775    guild_posts    TABLE     \  CREATE TABLE public.guild_posts (
    id integer NOT NULL,
    guild_id integer NOT NULL,
    author_id integer NOT NULL,
    post_type integer NOT NULL,
    stamp_id integer NOT NULL,
    title text NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    liked_by text DEFAULT ''::text NOT NULL
);
    DROP TABLE public.guild_posts;
       public         heap    postgres    false            ?            1259    26782    guild_posts_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.guild_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.guild_posts_id_seq;
       public          postgres    false    240            &           0    0    guild_posts_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.guild_posts_id_seq OWNED BY public.guild_posts.id;
          public          postgres    false    241            ?            1259    26783    guilds    TABLE     ?  CREATE TABLE public.guilds (
    id integer NOT NULL,
    name character varying(24),
    created_at timestamp without time zone DEFAULT now(),
    leader_id integer NOT NULL,
    main_motto integer DEFAULT 0,
    rank_rp integer DEFAULT 0 NOT NULL,
    comment character varying(255) DEFAULT ''::character varying NOT NULL,
    festival_colour public.festival_colour DEFAULT 'none'::public.festival_colour,
    icon bytea,
    sub_motto integer DEFAULT 0,
    item_box bytea,
    event_rp integer DEFAULT 0 NOT NULL,
    pugi_name_1 character varying(12) DEFAULT ''::character varying,
    pugi_name_2 character varying(12) DEFAULT ''::character varying,
    pugi_name_3 character varying(12) DEFAULT ''::character varying
);
    DROP TABLE public.guilds;
       public         heap    postgres    false    874    874            ?            1259    26798    guilds_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.guilds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.guilds_id_seq;
       public          postgres    false    242            '           0    0    guilds_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.guilds_id_seq OWNED BY public.guilds.id;
          public          postgres    false    243            ?            1259    26799    history    TABLE     ?   CREATE TABLE public.history (
    user_id integer,
    admin_id integer,
    report_id integer NOT NULL,
    title text,
    reason text
);
    DROP TABLE public.history;
       public         heap    postgres    false            ?            1259    26804    login_boost_state    TABLE     ?   CREATE TABLE public.login_boost_state (
    char_id bigint,
    week_req public.uint8,
    week_count public.uint8,
    available boolean,
    end_time integer,
    "ID" integer NOT NULL
);
 %   DROP TABLE public.login_boost_state;
       public         heap    postgres    false    884    884            ?            1259    26807    login_boost_state_ID_seq    SEQUENCE     ?   ALTER TABLE public.login_boost_state ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."login_boost_state_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    245            ?            1259    26808    lucky_box_state    TABLE     x   CREATE TABLE public.lucky_box_state (
    char_id bigint,
    shophash integer NOT NULL,
    used_itemhash integer[]
);
 #   DROP TABLE public.lucky_box_state;
       public         heap    postgres    false            ?            1259    26813    mail    TABLE     Y  CREATE TABLE public.mail (
    id integer NOT NULL,
    sender_id integer NOT NULL,
    recipient_id integer NOT NULL,
    subject character varying DEFAULT ''::character varying NOT NULL,
    body character varying DEFAULT ''::character varying NOT NULL,
    read boolean DEFAULT false NOT NULL,
    attached_item_received boolean DEFAULT false NOT NULL,
    attached_item integer,
    attached_item_amount integer DEFAULT 1 NOT NULL,
    is_guild_invite boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);
    DROP TABLE public.mail;
       public         heap    postgres    false            ?            1259    26826    mail_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.mail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.mail_id_seq;
       public          postgres    false    248            (           0    0    mail_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.mail_id_seq OWNED BY public.mail.id;
          public          postgres    false    249            ?            1259    26827    normal_shop_items    TABLE     ?  CREATE TABLE public.normal_shop_items (
    shoptype integer,
    shopid integer,
    itemhash integer NOT NULL,
    itemid public.uint16,
    points public.uint16,
    tradequantity public.uint16,
    rankreqlow public.uint16,
    rankreqhigh public.uint16,
    rankreqg public.uint16,
    storelevelreq public.uint16,
    maximumquantity public.uint16,
    boughtquantity public.uint16,
    roadfloorsrequired public.uint16,
    weeklyfataliskills public.uint16,
    enable_weeks character varying(8)
);
 %   DROP TABLE public.normal_shop_items;
       public         heap    postgres    false    880    880    880    880    880    880    880    880    880    880    880            ?            1259    26830 
   questlists    TABLE     R   CREATE TABLE public.questlists (
    ind integer NOT NULL,
    questlist bytea
);
    DROP TABLE public.questlists;
       public         heap    postgres    false            ?            1259    26847    schema_migrations    TABLE     c   CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         heap    postgres    false            ?            1259    26850    servers    TABLE     ?   CREATE TABLE public.servers (
    server_id integer NOT NULL,
    season integer NOT NULL,
    current_players integer NOT NULL
);
    DROP TABLE public.servers;
       public         heap    postgres    false            ?            1259    26853    shop_item_state    TABLE     ?   CREATE TABLE public.shop_item_state (
    char_id bigint,
    itemhash integer NOT NULL,
    usedquantity integer,
    week integer
);
 #   DROP TABLE public.shop_item_state;
       public         heap    postgres    false            ?            1259    26856    sign_sessions    TABLE     ?   CREATE TABLE public.sign_sessions (
    user_id integer NOT NULL,
    char_id integer,
    token character varying(16) NOT NULL,
    server_id integer
);
 !   DROP TABLE public.sign_sessions;
       public         heap    postgres    false                        1259    26859    stepup_state    TABLE     ?   CREATE TABLE public.stepup_state (
    char_id bigint,
    shophash integer NOT NULL,
    step_progression integer,
    step_time timestamp without time zone
);
     DROP TABLE public.stepup_state;
       public         heap    postgres    false                       1259    26862    user_binaries    TABLE     a   CREATE TABLE public.user_binaries (
    id integer NOT NULL,
    type2 bytea,
    type3 bytea
);
 !   DROP TABLE public.user_binaries;
       public         heap    postgres    false                       1259    26867    users    TABLE     ?   CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    item_box bytea,
    rights integer DEFAULT 14 NOT NULL,
    last_character integer DEFAULT 0
);
    DROP TABLE public.users;
       public         heap    postgres    false                       1259    26874    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    258            )           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    259                       2604    26875    characters id    DEFAULT     n   ALTER TABLE ONLY public.characters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);
 <   ALTER TABLE public.characters ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217                       2604    26876    distribution id    DEFAULT     r   ALTER TABLE ONLY public.distribution ALTER COLUMN id SET DEFAULT nextval('public.distribution_id_seq'::regclass);
 >   ALTER TABLE public.distribution ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219                       2604    26877    gook id    DEFAULT     b   ALTER TABLE ONLY public.gook ALTER COLUMN id SET DEFAULT nextval('public.gook_id_seq'::regclass);
 6   ALTER TABLE public.gook ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226                       2604    26878    guild_adventures id    DEFAULT     z   ALTER TABLE ONLY public.guild_adventures ALTER COLUMN id SET DEFAULT nextval('public.guild_adventures_id_seq'::regclass);
 B   ALTER TABLE public.guild_adventures ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228                       2604    26879    guild_alliances id    DEFAULT     x   ALTER TABLE ONLY public.guild_alliances ALTER COLUMN id SET DEFAULT nextval('public.guild_alliances_id_seq'::regclass);
 A   ALTER TABLE public.guild_alliances ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230                       2604    26880    guild_applications id    DEFAULT     ~   ALTER TABLE ONLY public.guild_applications ALTER COLUMN id SET DEFAULT nextval('public.guild_applications_id_seq'::regclass);
 D   ALTER TABLE public.guild_applications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232                       2604    26881    guild_characters id    DEFAULT     z   ALTER TABLE ONLY public.guild_characters ALTER COLUMN id SET DEFAULT nextval('public.guild_characters_id_seq'::regclass);
 B   ALTER TABLE public.guild_characters ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234                       2604    26882    guild_hunts id    DEFAULT     p   ALTER TABLE ONLY public.guild_hunts ALTER COLUMN id SET DEFAULT nextval('public.guild_hunts_id_seq'::regclass);
 =   ALTER TABLE public.guild_hunts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236                        2604    26883    guild_meals id    DEFAULT     p   ALTER TABLE ONLY public.guild_meals ALTER COLUMN id SET DEFAULT nextval('public.guild_meals_id_seq'::regclass);
 =   ALTER TABLE public.guild_meals ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238            #           2604    26884    guild_posts id    DEFAULT     p   ALTER TABLE ONLY public.guild_posts ALTER COLUMN id SET DEFAULT nextval('public.guild_posts_id_seq'::regclass);
 =   ALTER TABLE public.guild_posts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240            .           2604    26885 	   guilds id    DEFAULT     f   ALTER TABLE ONLY public.guilds ALTER COLUMN id SET DEFAULT nextval('public.guilds_id_seq'::regclass);
 8   ALTER TABLE public.guilds ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242            7           2604    26886    mail id    DEFAULT     b   ALTER TABLE ONLY public.mail ALTER COLUMN id SET DEFAULT nextval('public.mail_id_seq'::regclass);
 6   ALTER TABLE public.mail ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248            :           2604    26890    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    258            <           2606    26892    account_sub account_auth_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.account_sub
    ADD CONSTRAINT account_auth_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.account_sub DROP CONSTRAINT account_auth_pkey;
       public            postgres    false    209            @           2606    26894 $   account_history account_history_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.account_history
    ADD CONSTRAINT account_history_pkey PRIMARY KEY (report_id);
 N   ALTER TABLE ONLY public.account_history DROP CONSTRAINT account_history_pkey;
       public            postgres    false    212            B           2606    26896 *   account_moderation account_moderation_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.account_moderation
    ADD CONSTRAINT account_moderation_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.account_moderation DROP CONSTRAINT account_moderation_pkey;
       public            postgres    false    214            >           2606    26898    account_ban ban_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.account_ban
    ADD CONSTRAINT ban_pkey PRIMARY KEY (user_id);
 >   ALTER TABLE ONLY public.account_ban DROP CONSTRAINT ban_pkey;
       public            postgres    false    211            D           2606    26900    characters characters_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.characters DROP CONSTRAINT characters_pkey;
       public            postgres    false    217            F           2606    26902    distribution distribution_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.distribution
    ADD CONSTRAINT distribution_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.distribution DROP CONSTRAINT distribution_pkey;
       public            postgres    false    219            H           2606    26904    event_week event_week_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.event_week
    ADD CONSTRAINT event_week_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.event_week DROP CONSTRAINT event_week_pkey;
       public            postgres    false    222            L           2606    26906 .   gacha_shop_items gacha_shop_items_itemhash_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.gacha_shop_items
    ADD CONSTRAINT gacha_shop_items_itemhash_key UNIQUE (itemhash);
 X   ALTER TABLE ONLY public.gacha_shop_items DROP CONSTRAINT gacha_shop_items_itemhash_key;
       public            postgres    false    225            J           2606    26908    gacha_shop gacha_shop_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.gacha_shop
    ADD CONSTRAINT gacha_shop_pkey PRIMARY KEY (hash, reqgr, reqhr, gachaname, gachalink0, gachalink1, gachalink2, extraicon, gachatype, hideflag);
 D   ALTER TABLE ONLY public.gacha_shop DROP CONSTRAINT gacha_shop_pkey;
       public            postgres    false    224    224    224    224    224    224    224    224    224    224            N           2606    26910    gook gook_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.gook
    ADD CONSTRAINT gook_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.gook DROP CONSTRAINT gook_pkey;
       public            postgres    false    226            P           2606    26912 &   guild_adventures guild_adventures_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.guild_adventures
    ADD CONSTRAINT guild_adventures_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.guild_adventures DROP CONSTRAINT guild_adventures_pkey;
       public            postgres    false    228            R           2606    26914 $   guild_alliances guild_alliances_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.guild_alliances
    ADD CONSTRAINT guild_alliances_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.guild_alliances DROP CONSTRAINT guild_alliances_pkey;
       public            postgres    false    230            T           2606    26916 1   guild_applications guild_application_character_id 
   CONSTRAINT     ~   ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_application_character_id UNIQUE (guild_id, character_id);
 [   ALTER TABLE ONLY public.guild_applications DROP CONSTRAINT guild_application_character_id;
       public            postgres    false    232    232            W           2606    26918 *   guild_applications guild_applications_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_applications_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.guild_applications DROP CONSTRAINT guild_applications_pkey;
       public            postgres    false    232            Z           2606    26920 &   guild_characters guild_characters_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.guild_characters
    ADD CONSTRAINT guild_characters_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.guild_characters DROP CONSTRAINT guild_characters_pkey;
       public            postgres    false    234            \           2606    26922    guild_hunts guild_hunts_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.guild_hunts
    ADD CONSTRAINT guild_hunts_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.guild_hunts DROP CONSTRAINT guild_hunts_pkey;
       public            postgres    false    236            ^           2606    26924    guild_meals guild_meals_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.guild_meals
    ADD CONSTRAINT guild_meals_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.guild_meals DROP CONSTRAINT guild_meals_pkey;
       public            postgres    false    238            `           2606    26926    guild_posts guild_posts_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.guild_posts
    ADD CONSTRAINT guild_posts_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.guild_posts DROP CONSTRAINT guild_posts_pkey;
       public            postgres    false    240            b           2606    26928    guilds guilds_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.guilds
    ADD CONSTRAINT guilds_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.guilds DROP CONSTRAINT guilds_pkey;
       public            postgres    false    242            d           2606    26930    history history_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (report_id);
 >   ALTER TABLE ONLY public.history DROP CONSTRAINT history_pkey;
       public            postgres    false    244            f           2606    26932    login_boost_state id_week 
   CONSTRAINT     a   ALTER TABLE ONLY public.login_boost_state
    ADD CONSTRAINT id_week UNIQUE (char_id, week_req);
 C   ALTER TABLE ONLY public.login_boost_state DROP CONSTRAINT id_week;
       public            postgres    false    245    245            h           2606    26934 (   login_boost_state login_boost_state_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.login_boost_state
    ADD CONSTRAINT login_boost_state_pkey PRIMARY KEY ("ID");
 R   ALTER TABLE ONLY public.login_boost_state DROP CONSTRAINT login_boost_state_pkey;
       public            postgres    false    245            j           2606    26936 +   lucky_box_state lucky_box_state_id_shophash 
   CONSTRAINT     s   ALTER TABLE ONLY public.lucky_box_state
    ADD CONSTRAINT lucky_box_state_id_shophash UNIQUE (char_id, shophash);
 U   ALTER TABLE ONLY public.lucky_box_state DROP CONSTRAINT lucky_box_state_id_shophash;
       public            postgres    false    247    247            l           2606    26938    mail mail_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.mail
    ADD CONSTRAINT mail_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.mail DROP CONSTRAINT mail_pkey;
       public            postgres    false    248            o           2606    26940 0   normal_shop_items normal_shop_items_itemhash_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.normal_shop_items
    ADD CONSTRAINT normal_shop_items_itemhash_key UNIQUE (itemhash);
 Z   ALTER TABLE ONLY public.normal_shop_items DROP CONSTRAINT normal_shop_items_itemhash_key;
       public            postgres    false    250            q           2606    26942 (   normal_shop_items normal_shop_items_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.normal_shop_items
    ADD CONSTRAINT normal_shop_items_pkey PRIMARY KEY (itemhash);
 R   ALTER TABLE ONLY public.normal_shop_items DROP CONSTRAINT normal_shop_items_pkey;
       public            postgres    false    250            s           2606    26944    questlists questlists_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.questlists
    ADD CONSTRAINT questlists_pkey PRIMARY KEY (ind);
 D   ALTER TABLE ONLY public.questlists DROP CONSTRAINT questlists_pkey;
       public            postgres    false    251            u           2606    26952 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public            postgres    false    252            w           2606    26954 +   shop_item_state shop_item_state_id_itemhash 
   CONSTRAINT     s   ALTER TABLE ONLY public.shop_item_state
    ADD CONSTRAINT shop_item_state_id_itemhash UNIQUE (char_id, itemhash);
 U   ALTER TABLE ONLY public.shop_item_state DROP CONSTRAINT shop_item_state_id_itemhash;
       public            postgres    false    254    254            y           2606    26956 %   stepup_state stepup_state_id_shophash 
   CONSTRAINT     m   ALTER TABLE ONLY public.stepup_state
    ADD CONSTRAINT stepup_state_id_shophash UNIQUE (char_id, shophash);
 O   ALTER TABLE ONLY public.stepup_state DROP CONSTRAINT stepup_state_id_shophash;
       public            postgres    false    256    256            {           2606    26958     user_binaries user_binaries_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.user_binaries
    ADD CONSTRAINT user_binaries_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.user_binaries DROP CONSTRAINT user_binaries_pkey;
       public            postgres    false    257            }           2606    26960    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    258                       2606    26962    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    258            U           1259    26963    guild_application_type_index    INDEX     g   CREATE INDEX guild_application_type_index ON public.guild_applications USING btree (application_type);
 0   DROP INDEX public.guild_application_type_index;
       public            postgres    false    232            X           1259    26964    guild_character_unique_index    INDEX     h   CREATE UNIQUE INDEX guild_character_unique_index ON public.guild_characters USING btree (character_id);
 0   DROP INDEX public.guild_character_unique_index;
       public            postgres    false    234            m           1259    26965 '   mail_recipient_deleted_created_id_index    INDEX     ?   CREATE INDEX mail_recipient_deleted_created_id_index ON public.mail USING btree (recipient_id, deleted, created_at DESC, id DESC);
 ;   DROP INDEX public.mail_recipient_deleted_created_id_index;
       public            postgres    false    248    248    248    248            ?           2606    26966 "   characters characters_user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 L   ALTER TABLE ONLY public.characters DROP CONSTRAINT characters_user_id_fkey;
       public          postgres    false    3453    258    217            ?           2606    26971 3   guild_applications guild_applications_actor_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_applications_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.characters(id);
 ]   ALTER TABLE ONLY public.guild_applications DROP CONSTRAINT guild_applications_actor_id_fkey;
       public          postgres    false    217    232    3396            ?           2606    26976 7   guild_applications guild_applications_character_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_applications_character_id_fkey FOREIGN KEY (character_id) REFERENCES public.characters(id);
 a   ALTER TABLE ONLY public.guild_applications DROP CONSTRAINT guild_applications_character_id_fkey;
       public          postgres    false    3396    217    232            ?           2606    26981 3   guild_applications guild_applications_guild_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_applications_guild_id_fkey FOREIGN KEY (guild_id) REFERENCES public.guilds(id);
 ]   ALTER TABLE ONLY public.guild_applications DROP CONSTRAINT guild_applications_guild_id_fkey;
       public          postgres    false    232    3426    242            ?           2606    26986 3   guild_characters guild_characters_character_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.guild_characters
    ADD CONSTRAINT guild_characters_character_id_fkey FOREIGN KEY (character_id) REFERENCES public.characters(id);
 ]   ALTER TABLE ONLY public.guild_characters DROP CONSTRAINT guild_characters_character_id_fkey;
       public          postgres    false    3396    234    217            ?           2606    26991 /   guild_characters guild_characters_guild_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.guild_characters
    ADD CONSTRAINT guild_characters_guild_id_fkey FOREIGN KEY (guild_id) REFERENCES public.guilds(id);
 Y   ALTER TABLE ONLY public.guild_characters DROP CONSTRAINT guild_characters_guild_id_fkey;
       public          postgres    false    3426    242    234            ?           2606    26996 0   login_boost_state login_boost_state_char_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.login_boost_state
    ADD CONSTRAINT login_boost_state_char_id_fkey FOREIGN KEY (char_id) REFERENCES public.characters(id);
 Z   ALTER TABLE ONLY public.login_boost_state DROP CONSTRAINT login_boost_state_char_id_fkey;
       public          postgres    false    217    3396    245            ?           2606    27001 ,   lucky_box_state lucky_box_state_char_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.lucky_box_state
    ADD CONSTRAINT lucky_box_state_char_id_fkey FOREIGN KEY (char_id) REFERENCES public.characters(id);
 V   ALTER TABLE ONLY public.lucky_box_state DROP CONSTRAINT lucky_box_state_char_id_fkey;
       public          postgres    false    3396    217    247            ?           2606    27006    mail mail_recipient_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.mail
    ADD CONSTRAINT mail_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.characters(id);
 E   ALTER TABLE ONLY public.mail DROP CONSTRAINT mail_recipient_id_fkey;
       public          postgres    false    248    217    3396            ?           2606    27011    mail mail_sender_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.mail
    ADD CONSTRAINT mail_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.characters(id);
 B   ALTER TABLE ONLY public.mail DROP CONSTRAINT mail_sender_id_fkey;
       public          postgres    false    3396    248    217            ?           2606    27016 ,   shop_item_state shop_item_state_char_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.shop_item_state
    ADD CONSTRAINT shop_item_state_char_id_fkey FOREIGN KEY (char_id) REFERENCES public.characters(id);
 V   ALTER TABLE ONLY public.shop_item_state DROP CONSTRAINT shop_item_state_char_id_fkey;
       public          postgres    false    3396    217    254            ?           2606    27021 &   stepup_state stepup_state_char_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.stepup_state
    ADD CONSTRAINT stepup_state_char_id_fkey FOREIGN KEY (char_id) REFERENCES public.characters(id);
 P   ALTER TABLE ONLY public.stepup_state DROP CONSTRAINT stepup_state_char_id_fkey;
       public          postgres    false    217    3396    256           