-- Table: public.stock

-- DROP TABLE public.stock;

CREATE TABLE public.stock
(
  prod character varying(50),
  dep character varying(50),
  quantity character varying(50),
  CONSTRAINT stock_dep_fkey FOREIGN KEY (dep)
      REFERENCES public.depot (dep) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT stock_prod_fkey FOREIGN KEY (prod)
      REFERENCES public.product (prod) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.stock
  OWNER TO postgres;
