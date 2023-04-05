
/*
*	ATENÇÃO DEVE-SE CRIAR UM DATABASE COM O NOME DE sop-financeiro
*	
*	CREATE DATABASE sop-financeiro;
*/

-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION postgres;

COMMENT ON SCHEMA public IS 'standard public schema';

-- DROP SEQUENCE public.despesas_id_despesa_seq;

CREATE SEQUENCE public.despesas_id_despesa_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.despesas_id_despesa_seq OWNER TO postgres;
GRANT ALL ON SEQUENCE public.despesas_id_despesa_seq TO postgres;

-- DROP SEQUENCE public.empenhos_id_empenho_seq;

CREATE SEQUENCE public.empenhos_id_empenho_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.empenhos_id_empenho_seq OWNER TO postgres;
GRANT ALL ON SEQUENCE public.empenhos_id_empenho_seq TO postgres;

-- DROP SEQUENCE public.pagamentos_id_pagamento_seq;

CREATE SEQUENCE public.pagamentos_id_pagamento_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.pagamentos_id_pagamento_seq OWNER TO postgres;
GRANT ALL ON SEQUENCE public.pagamentos_id_pagamento_seq TO postgres;

-- DROP SEQUENCE public.usuarios_id_seq;

CREATE SEQUENCE public.usuarios_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;
GRANT ALL ON SEQUENCE public.usuarios_id_seq TO postgres;
-- public.despesas definition

-- Drop table

-- DROP TABLE public.despesas;

CREATE TABLE public.despesas (
	id_despesa int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	credor_despesa varchar(255) NULL,
	data_protocolo timestamp NULL,
	data_vencimento timestamp NULL,
	descricao_despesa varchar(255) NULL,
	numero_protocolo varchar(255) NULL,
	tipo_despesa varchar(255) NULL,
	valor_despesa float4 NULL,
	CONSTRAINT despesas_pkey PRIMARY KEY (id_despesa)
);

-- Permissions

ALTER TABLE public.despesas OWNER TO postgres;
GRANT ALL ON TABLE public.despesas TO postgres;


-- public.usuarios definition

-- Drop table

-- DROP TABLE public.usuarios;

CREATE TABLE public.usuarios (
	id int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	email varchar(255) NOT NULL,
	nome varchar(255) NOT NULL,
	senha varchar(255) NOT NULL,
	CONSTRAINT uk_kfsp0s1tflm1cwlj8idhqsad0 UNIQUE (email),
	CONSTRAINT usuarios_pkey PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.usuarios OWNER TO postgres;
GRANT ALL ON TABLE public.usuarios TO postgres;


-- public.empenhos definition

-- Drop table

-- DROP TABLE public.empenhos;

CREATE TABLE public.empenhos (
	id_empenho int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	ano_empenho int4 NULL,
	data_empenho date NULL,
	numero_empenho varchar(255) NULL,
	observacao varchar(255) NULL,
	valor_empenho float4 NULL,
	id_despesa int8 NULL,
	CONSTRAINT empenhos_pkey PRIMARY KEY (id_empenho),
	CONSTRAINT fk9q6k5kmo80u9biat3fx7toqx3 FOREIGN KEY (id_despesa) REFERENCES public.despesas(id_despesa)
);

-- Permissions

ALTER TABLE public.empenhos OWNER TO postgres;
GRANT ALL ON TABLE public.empenhos TO postgres;


-- public.pagamentos definition

-- Drop table

-- DROP TABLE public.pagamentos;

CREATE TABLE public.pagamentos (
	id_pagamento int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	ano_pagamento int4 NULL,
	data_pagamento timestamp NULL,
	numero_pagamento varchar(255) NULL,
	observacao varchar(255) NULL,
	valor_pagamento float4 NULL,
	id_empenho int8 NULL,
	CONSTRAINT pagamentos_pkey PRIMARY KEY (id_pagamento),
	CONSTRAINT fkt41bem80489lrye7n4d3c1002 FOREIGN KEY (id_empenho) REFERENCES public.empenhos(id_empenho)
);

-- Permissions

ALTER TABLE public.pagamentos OWNER TO postgres;
GRANT ALL ON TABLE public.pagamentos TO postgres;




-- Permissions

GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;

