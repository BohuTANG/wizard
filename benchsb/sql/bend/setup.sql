CREATE OR REPLACE TABLE customer (
    c_custkey    BIGINT NOT NULL,
    c_name       VARCHAR NOT NULL,
    c_address    VARCHAR NOT NULL,
    c_nationkey  INT NOT NULL,
    c_phone      VARCHAR NOT NULL,
    c_acctbal    DECIMAL(15, 2) NOT NULL,
    c_mktsegment VARCHAR NOT NULL,
    c_comment    VARCHAR NOT NULL
);

CREATE OR REPLACE TABLE lineitem (
    l_orderkey       BIGINT NOT NULL,
    l_partkey        BIGINT NOT NULL,
    l_suppkey        BIGINT NOT NULL,
    l_linenumber     BIGINT NOT NULL,
    l_quantity       DECIMAL(15, 2) NOT NULL,
    l_extendedprice  DECIMAL(15, 2) NOT NULL,
    l_discount       DECIMAL(15, 2) NOT NULL,
    l_tax            DECIMAL(15, 2) NOT NULL,
    l_returnflag     VARCHAR NOT NULL,
    l_linestatus     VARCHAR NOT NULL,
    l_shipdate       DATE NOT NULL,
    l_commitdate     DATE NOT NULL,
    l_receiptdate    DATE NOT NULL,
    l_shipinstruct   VARCHAR NOT NULL,
    l_shipmode       VARCHAR NOT NULL,
    l_comment        VARCHAR NOT NULL
);

CREATE OR REPLACE TABLE nation (
    n_nationkey INT NOT NULL,
    n_name      VARCHAR NOT NULL,
    n_regionkey INT NOT NULL,
    n_comment   VARCHAR
);

CREATE OR REPLACE TABLE orders (
    o_orderkey      BIGINT NOT NULL,
    o_custkey       BIGINT NOT NULL,
    o_orderstatus   VARCHAR NOT NULL,
    o_totalprice    DECIMAL(15, 2) NOT NULL,
    o_orderdate     DATE NOT NULL,
    o_orderpriority VARCHAR NOT NULL,
    o_clerk         VARCHAR NOT NULL,
    o_shippriority  INT NOT NULL,
    o_comment       VARCHAR NOT NULL
);

CREATE OR REPLACE TABLE partsupp (
    ps_partkey     BIGINT NOT NULL,
    ps_suppkey     BIGINT NOT NULL,
    ps_availqty    BIGINT NOT NULL,
    ps_supplycost  DECIMAL(15, 2) NOT NULL,
    ps_comment     VARCHAR NOT NULL
);

CREATE OR REPLACE TABLE part (
    p_partkey      BIGINT NOT NULL,
    p_name         VARCHAR NOT NULL,
    p_mfgr         VARCHAR NOT NULL,
    p_brand        VARCHAR NOT NULL,
    p_type         VARCHAR NOT NULL,
    p_size         INT NOT NULL,
    p_container    VARCHAR NOT NULL,
    p_retailprice  DECIMAL(15, 2) NOT NULL,
    p_comment      VARCHAR NOT NULL
);

CREATE OR REPLACE TABLE region (
    r_regionkey INT NOT NULL,
    r_name      VARCHAR NOT NULL,
    r_comment   VARCHAR
);

CREATE OR REPLACE TABLE supplier (
    s_suppkey   BIGINT NOT NULL,
    s_name      VARCHAR NOT NULL,
    s_address   VARCHAR NOT NULL,
    s_nationkey INT NOT NULL,
    s_phone     VARCHAR NOT NULL,
    s_acctbal   DECIMAL(15, 2) NOT NULL,
    s_comment   VARCHAR NOT NULL
);

-- ETL
COPY INTO customer
    FROM 's3://redshift-downloads/TPC-H/2.18/100GB/customer/'
    FILE_FORMAT = (TYPE = CSV, FIELD_DELIMITER = '|');

COPY INTO lineitem
    FROM 's3://redshift-downloads/TPC-H/2.18/100GB/lineitem/'
    FILE_FORMAT = (TYPE = CSV, FIELD_DELIMITER = '|');

COPY INTO nation
    FROM 's3://redshift-downloads/TPC-H/2.18/100GB/nation/'
    FILE_FORMAT = (TYPE = CSV, FIELD_DELIMITER = '|');

COPY INTO orders
    FROM 's3://redshift-downloads/TPC-H/2.18/100GB/orders/'
    FILE_FORMAT = (TYPE = CSV, FIELD_DELIMITER = '|');

COPY INTO part
    FROM 's3://redshift-downloads/TPC-H/2.18/100GB/part/'
    FILE_FORMAT = (TYPE = CSV, FIELD_DELIMITER = '|');

COPY INTO partsupp
    FROM 's3://redshift-downloads/TPC-H/2.18/100GB/partsupp/'
    FILE_FORMAT = (TYPE = CSV, FIELD_DELIMITER = '|');

COPY INTO region
    FROM 's3://redshift-downloads/TPC-H/2.18/100GB/region/'
    FILE_FORMAT = (TYPE = CSV, FIELD_DELIMITER = '|');

COPY INTO supplier
    FROM 's3://redshift-downloads/TPC-H/2.18/100GB/supplier/'
    FILE_FORMAT = (TYPE = CSV, FIELD_DELIMITER = '|');
