select
	dia,
	tipo_transporte,
	provincia,
	sum(cant_viajes) as total_viajes
from
	sube_agreg.viajes_transp_ene20 vte
group by
	GROUPING sets ((dia), (tipo_transporte), (provincia))
order by
	dia,
	tipo_transporte,
	provincia