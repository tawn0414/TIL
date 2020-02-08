DROP TABLE refrigerator;

CREATE TABLE refrigerator (
    refrigerator_id varchar2(20)         primary key,
    name    varchar2(200)        NOT  NULL,
    register_date   date         NOT  NULL,
    member_id   varchar2(20)         NOT  NULL
);

DROP TABLE refrigerator_detail;

CREATE TABLE refrigerator_detail (
    refrigerator_detail_id  varchar2(20)         primary key,
    code    number       NOT  NULL,
    ingredient_id   varchar2(20)         NOT  NULL,
    amount  number        , 
    unit    varchar2(10)         , 
    expire_date_rt  date         ,
    expire_date_cold    date         ,
    register_date   date         NOT  NULL,
    user_expire_date    date         ,
    refrigerator_id varchar2(20)         NOT  NULL
);

DROP TABLE food_nutrient;

CREATE TABLE food_nutrient (
    food_id varchar2(20)         primary key,
    name    varchar2(200)        NOT  NULL,
    sort    varchar2(100)        NOT  NULL,
    vitaminC    number(4,2)      ,
    vitaminB1   number(4,2)      ,
    vitaminB2   number(4,2)      ,
    zn  number(4,2)      ,
    protein number       ,
    amino   number(6,2)      ,
    dha number(2,1)      ,
    mg  number(5,2)      ,
    fe  number(6,5)      ,
    ca  number       
);

DROP TABLE point_rule;

CREATE TABLE point_rule (
    id  varchar2(20)         primary key,
    rule_name   varchar2(200)        NOT  NULL,
    point   number       NOT  NULL
);

DROP TABLE recipe_score;

CREATE TABLE recipe_score (
    recipe_score_id varchar2(20)         primary key,
    score   number       NOT  NULL,
    content varchar2(2000)       ,
    recipe_id   varchar2(20)         NOT  NULL,
    member_id   varchar2(20)         NOT  NULL,
    regdate date         not NULL
);

DROP TABLE recipe;

CREATE TABLE recipe (
    recipe_id   varchar2(20)         primary key,
    name    varchar2(200)        NOT  NULL,
    content_intro   varchar2(2000)       NOT  NULL,
    recipe_category varchar2(30)         NOT  NULL,
    recipe_sort varchar2(30)         NOT  NULL,
    register_date   date         NOT  NULL,
    hit number  DEFAULT 0    NOT  NULL,
    like_num    number  DEFAULT 0    NOT  NULL,
    cook_time    number       NOT  NULL,
    cook_level   varchar2(10)         NOT  NULL,
    kcal    number       ,
    member_id   varchar2(20)         NOT  NULL
);

DROP TABLE recipe_favorite;

CREATE TABLE recipe_favorite (
    recipe_favorite_id  varchar2(20)         primary key,
    recipe_id   varchar2(20)         NOT  NULL,
    member_id   varchar2(20)         NOT  NULL,
    favorite_date   date,
	memo varchar2(2000)
	
);

DROP TABLE recipe_reply;

CREATE TABLE recipe_reply (
    recipe_reply_id varchar2(20)         primary key,
    content varchar2(2000)       NOT  NULL,
    member_id   varchar2(20)         NOT  NULL,
    like_num    number   DEFAULT 0    NOT  NULL,
    regdate date         not NULL,
    recipe_id   varchar2(20)         NOT  NULL
);

DROP TABLE cook_tip;

CREATE TABLE cook_tip (
    id  varchar2(20)         NULL,
    name    varchar2(100)        NOT  NULL,
    link    varchar2(1000)       NOT  NULL
);**

DROP TABLE member;

CREATE TABLE member (
    member_id   varchar2(20)         primary key,
    pass    varchar2(20)         NOT  NULL,
    name    varchar2(20)         NOT  NULL,
    ssn  number         NOT  NULL,
    phonenum   number        NOT  NULL,
    height  number       NOT  NULL,
    weight  number       NOT  NULL,
    gender  varchar2(10)         NOT  NULL,
    grade   varchar2(20)         NOT  NULL,
    point   number   DEFAULT 0    NOT  NULL,
    my_money   number  DEFAULT 0     NOT  NULL,
    regdate date         NOT  NULL,
    mgr_id  varchar2(20)         
);

DROP TABLE QnA;

CREATE TABLE QnA (
    QnA_id  varchar2(20)         primary key,
    qna_title   varchar2(300)        NULL,
    qna_content varchar2(2000)       NULL,
    qna_num number       NULL,
    mgr_id  varchar2(20)         NULL
);**

DROP TABLE realchat;

CREATE TABLE chat (
    chat_id varchar2(20)         primary key,
    chat_content    varchar2(500)       ,
    chat_time   timestamp        NOT  NULL,
    member_id   varchar2(20)         NOT  NULL
);

DROP TABLE company;

CREATE TABLE company (
    comp_id varchar2(20)         NOT  NULL,
    comp_name   varchar2(20)         NOT  NULL,
    mgr_id  varchar2(20)         NULL
);**

DROP TABLE s_basket;

CREATE TABLE s_basket (
    ingredient_id   varchar2(20)     not null, 
    ig_amount   number       ,
    ig_unit    varchar2(10)         ,
    member_id   varchar2(20)         NOT  NULL
);

DROP TABLE ask;

CREATE TABLE ask (
    ask_id  varchar2(20)         primary key,
    ask_title   varchar2(300)        not NULL,
    ask_content varchar2(2000)       not NULL,
    ask_regdate date         NOT  NULL,
    ask_mgr_reply   varchar2(2000)       ,
    member_id   varchar2(20)         NOT  NULL
);

DROP TABLE keyword_search;

CREATE TABLE keyword_search (
    keyword varchar2(300)       not NULL,
    searchdate date         not NULL,
    member_id   varchar2(20)         NOT  NULL
);

DROP TABLE restaurant;

CREATE TABLE restaurant (
    rest_id varchar2(20)         primary key,
    rest_name   varchar2(50)         NOT  NULL,
    rest_loc    varchar2(100)        NOT  NULL,
    rest_good   number DEFAULT 0     not NULL,
    mgr_id  varchar2(20)         
);

DROP TABLE restaurant_detail;

CREATE TABLE restaurant_detail (
    rest_detail_id  varchar2(20)         primary key,
    rest_menu   varchar2(20)         NOT  NULL,
    rest_id varchar2(20)         NOT  NULL
);**

DROP TABLE exercise;

CREATE TABLE exercise (
    exer_num    number       NOT  NULL,
    exer_name   varchar2(20)         NOT  NULL,
    exer_kcal   number       NULL
);**

DROP TABLE restaurant_review;

CREATE TABLE restaurant_review (
	review_score number not null, 
    review_content  varchar2(2000)      not NULL,
    review_regidate date         NOT  NULL,
    rest_id varchar2(20)         NOT  NULL,
    member_id   varchar2(20)         NOT  NULL
);

DROP TABLE meal_planner;

CREATE TABLE meal_planner (
    meal_planner_id varchar2(20)       primary key,
    meal_name   varchar2(200)         NOT  NULL,
    planner_regdate date          NOT  NULL,
    planner_date date          NOT  NULL,
    planner_code    number       not NULL,
    member_id   varchar2(20)         NOT  NULL );

DROP TABLE meal_planner_detail;

CREATE TABLE meal_planner_detail (
    meal_planner_detail_id  varchar2(20)         primary key,
    recipe_id   varchar2(20)         NOT  NULL,
    meal_code   number      not NULL,
    meal_planner_id varchar2(20)         NOT  NULL
);

DROP TABLE weather;

CREATE TABLE weather (
    weather_id  varchar2(20)         primary key,
    weather_kind    varchar2(20)       not  NULL
);

DROP TABLE weather_detail;

CREATE TABLE weather_detail (
    food_keyword    varchar2(20)         not NULL,
    weather_id  varchar2(20)         NOT  NULL
);

DROP TABLE ingredients;

CREATE TABLE ingredients (
    ingredient_id   varchar2(20)         primary key,
    name    varchar2(200)        NOT  NULL,
    volume  varchar2(100)        NOT  NULL,
    recipe_id   varchar2(20)         NOT  NULL
);

DROP TABLE recipe_detail;

CREATE TABLE recipe_detail (
    recipe_detail_id    varchar2(20)         primary key,
    recipe_order_num    number       NOT  NULL,
    recipe_describe varchar2(2000)       NOT  NULL,
    recipe_tip  varchar2(1000)        ,
    recipe_id   varchar2(20)         NOT  NULL,
	img_url varchar2(1000) 
);

DROP TABLE image;

CREATE TABLE etc_image (
	_id  varchar2(20)         primary key
    board_code    number       not null,
    url varchar2(1000)       NOT  NULL,

);***************보류*******************

ALTER TABLE refrigerator ADD CONSTRAINT PK_REFRIGERATOR PRIMARY KEY (
    refrigerator_id
);

ALTER TABLE refrigerator_detail ADD CONSTRAINT PK_REFRIGERATOR_DETAIL PRIMARY KEY (
    refrigerator_detail_id
);

ALTER TABLE food_nutrient ADD CONSTRAINT PK_FOOD_NUTRIENT PRIMARY KEY (
    food_id
);

ALTER TABLE recipe_score ADD CONSTRAINT PK_RECIPE_SCORE PRIMARY KEY (
    recipe_score_id
);

ALTER TABLE recipe ADD CONSTRAINT PK_RECIPE PRIMARY KEY (
    recipe_id
);

ALTER TABLE recipe_favorite ADD CONSTRAINT PK_RECIPE_FAVORITE PRIMARY KEY (
    recipe_favorite_id
);

ALTER TABLE recipe_reply ADD CONSTRAINT PK_RECIPE_REPLY PRIMARY KEY (
    recipe_reply_id
);

ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
    member_id
);

ALTER TABLE QnA ADD CONSTRAINT PK_QNA PRIMARY KEY (
    QnA_id
);

ALTER TABLE realchat ADD CONSTRAINT PK_REALCHAT PRIMARY KEY (
    chat_id
);

ALTER TABLE company ADD CONSTRAINT PK_COMPANY PRIMARY KEY (
    comp_id
);

ALTER TABLE ask ADD CONSTRAINT PK_ASK PRIMARY KEY (
    ask_id
);

ALTER TABLE keyword_search ADD CONSTRAINT PK_KEYWORD_SEARCH PRIMARY KEY (
    search_id
);

ALTER TABLE restaurant ADD CONSTRAINT PK_RESTAURANT PRIMARY KEY (
    rest_id
);

ALTER TABLE restaurant_detail ADD CONSTRAINT PK_RESTAURANT_DETAIL PRIMARY KEY (
    rest_detail_id
);

ALTER TABLE exercise ADD CONSTRAINT PK_EXERCISE PRIMARY KEY (
    exer_num
);

ALTER TABLE restaurant_review ADD CONSTRAINT PK_RESTAURANT_REVIEW PRIMARY KEY (
    review_num
);

ALTER TABLE meal_planner ADD CONSTRAINT PK_MEAL_PLANNER PRIMARY KEY (
    meal_planner_id
);

ALTER TABLE meal_planner_detail ADD CONSTRAINT PK_MEAL_PLANNER_DETAIL PRIMARY KEY (
    meal_planner_detail_id
);

ALTER TABLE weather ADD CONSTRAINT PK_WEATHER PRIMARY KEY (
    weather_id
);

ALTER TABLE weather_detail ADD CONSTRAINT PK_WEATHER_DETAIL PRIMARY KEY (
    weather_detail_id
);

ALTER TABLE ingredients ADD CONSTRAINT PK_INGREDIENTS PRIMARY KEY (
    ingredient_id
);

ALTER TABLE recipe_detail ADD CONSTRAINT PK_RECIPE_DETAIL PRIMARY KEY (
    recipe_detail_id
);

ALTER TABLE refrigerator ADD CONSTRAINT FK_member_TO_refrigerator_1 FOREIGN KEY (
    member_id
)
REFERENCES member (
    member_id
);

ALTER TABLE refrigerator_detail ADD CONSTRAINT FK_ig_TO_fridge_detail_1 FOREIGN KEY (
    ingredient_id
)
REFERENCES ingredients (
    ingredient_id
);

ALTER TABLE refrigerator_detail ADD CONSTRAINT FK_fridge_TO_fridge_detail_1 FOREIGN KEY (
    refrigerator_id
)
REFERENCES refrigerator (
    refrigerator_id
);

ALTER TABLE recipe_score ADD CONSTRAINT FK_recipe_TO_recipe_score_1 FOREIGN KEY (
    recipe_id
)
REFERENCES recipe (
    recipe_id
);

ALTER TABLE recipe_score ADD CONSTRAINT FK_member_TO_recipe_score_1 FOREIGN KEY (
    member_id
)
REFERENCES member (
    member_id
);

ALTER TABLE recipe ADD CONSTRAINT FK_member_TO_recipe_1 FOREIGN KEY (
    member_id
)
REFERENCES member (
    member_id
);

ALTER TABLE recipe_favorite ADD CONSTRAINT FK_recipe_TO_recipe_favorite_1 FOREIGN KEY (
    recipe_id
)
REFERENCES recipe (
    recipe_id
);

ALTER TABLE recipe_favorite ADD CONSTRAINT FK_member_TO_recipe_favorite_1 FOREIGN KEY (
    member_id
)
REFERENCES member (
    member_id
);

ALTER TABLE recipe_reply ADD CONSTRAINT FK_recipe_TO_recipe_reply_1 FOREIGN KEY (
    recipe_id
)
REFERENCES recipe (
    recipe_id
);

ALTER TABLE realchat ADD CONSTRAINT FK_member_TO_realchat_1 FOREIGN KEY (
    member_id
)
REFERENCES member (
    member_id
);

ALTER TABLE s_basket ADD CONSTRAINT FK_ingredients_TO_s_basket_1 FOREIGN KEY (
    ingredient_id
)
REFERENCES ingredients (
    ingredient_id
);

ALTER TABLE s_basket ADD CONSTRAINT FK_member_TO_s_basket_1 FOREIGN KEY (
    member_id
)
REFERENCES member (
    member_id
);

ALTER TABLE ask ADD CONSTRAINT FK_member_TO_ask_1 FOREIGN KEY (
    member_id
)
REFERENCES member (
    member_id
);

ALTER TABLE keyword_search ADD CONSTRAINT FK_member_TO_keyword_search_1 FOREIGN KEY (
    member_id
)
REFERENCES member (
    member_id
);

ALTER TABLE restaurant_detail ADD CONSTRAINT FK_rt_TO_rt_detail_1 FOREIGN KEY (
    rest_id
)
REFERENCES restaurant (
    rest_id
);

ALTER TABLE restaurant_review ADD CONSTRAINT FK_rt_TO_rt_review_1 FOREIGN KEY (
    rest_id
)
REFERENCES restaurant (
    rest_id
);

ALTER TABLE restaurant_review ADD CONSTRAINT FK_member_TO_rt_review_1 FOREIGN KEY (
    member_id
)
REFERENCES member (
    member_id
);

ALTER TABLE meal_planner ADD CONSTRAINT FK_member_TO_meal_planner_1 FOREIGN KEY (
    member_id
)
REFERENCES member (
    member_id
);

ALTER TABLE meal_planner_detail ADD CONSTRAINT FK_recipe_TO_mplan_detail_1 FOREIGN KEY (
    recipe_id
)
REFERENCES recipe (
    recipe_id
);

ALTER TABLE meal_planner_detail ADD CONSTRAINT FK_mplan_TO_meal_plan_detail_1 FOREIGN KEY (
    meal_planner_id
)
REFERENCES meal_planner (
    meal_planner_id
);

ALTER TABLE weather_detail ADD CONSTRAINT FK_weather_TO_weather_detail_1 FOREIGN KEY (
    weather_id
)
REFERENCES weather (
    weather_id
);

ALTER TABLE ingredients ADD CONSTRAINT FK_recipe_TO_ingredients_1 FOREIGN KEY (
    recipe_id
)
REFERENCES recipe (
    recipe_id
);

ALTER TABLE recipe_detail ADD CONSTRAINT FK_recipe_TO_recipe_detail_1 FOREIGN KEY (
    recipe_id
)
REFERENCES recipe (
    recipe_id
);











