DROP TABLE IF EXISTS public.provider_power_daily;
CREATE TABLE public.provider_power_daily (
    provider character varying(20) NOT NULL,
    date date,
    "avg(rawBytePower)" double precision,
    "avg(qualityAdjPower)" double precision
);
ALTER TABLE public.provider_power_daily OWNER TO postgres;
CREATE INDEX provider_power_daily_date_idx ON public.provider_power_daily USING btree (date);

DROP TABLE IF EXISTS public.synthetic_regions;
CREATE TABLE public.synthetic_regions (
    provider character varying(255),
    region character varying(255),
    "numRegions" integer,
    delegate character varying(255)
);
ALTER TABLE public.synthetic_regions OWNER TO postgres;
CREATE INDEX synthetic_regions_delegate_idx ON public.synthetic_regions USING btree (delegate);
CREATE INDEX synthetic_regions_provider_idx ON public.synthetic_regions USING btree (provider);
CREATE INDEX synthetic_regions_region_idx ON public.synthetic_regions USING btree (region);

DROP TABLE IF EXISTS public.deals_daily;
CREATE TABLE public.deals_daily (
    date date NOT NULL,
    provider character varying NOT NULL,
    "verifiedDeal" boolean NOT NULL,
    count numeric NOT NULL,
    "sum(pieceSizeDouble)" numeric NOT NULL,
    "avg(pieceSizeDouble)" numeric NOT NULL,
    "min(pieceSizeDouble)" numeric NOT NULL,
    "max(pieceSizeDouble)" numeric NOT NULL,
    "avg(storagePricePerEpochDouble)" numeric NOT NULL,
    "min(storagePricePerEpochDouble)" numeric NOT NULL,
    "max(storagePricePerEpochDouble)" numeric NOT NULL,
    "approx_count_distinct(label)" numeric NOT NULL,
    "sum(lifetimeValue)" numeric NOT NULL,
    "avg(lifetimeValue)" numeric NOT NULL,
    "min(lifetimeValue)" numeric NOT NULL,
    "max(lifetimeValue)" numeric NOT NULL,
    "approx_count_distinct(provider)" boolean NOT NULL,
    "approx_count_distinct(client)" numeric NOT NULL,
    "approx_count_distinct(clientProvider)" numeric NOT NULL
);
ALTER TABLE public.deals_daily OWNER TO postgres;

DROP TABLE IF EXISTS public.csp_regions_monthly;
CREATE TABLE public.csp_regions_monthly (
    year_month character varying(255),
    location_date date,
    location_epoch integer,
    provider character varying(255),
    region character varying(255),
    num_regions integer
);
ALTER TABLE public.csp_regions_monthly OWNER TO postgres;
