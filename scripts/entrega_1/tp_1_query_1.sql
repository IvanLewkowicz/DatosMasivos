SELECT
	dia,
	tipo_transporte,
	provincia,
	SUM(cant_viajes) as total_viajes
FROM
	sube_agreg.viajes_transp_ene20 vte
GROUP BY
	GROUPING SETS (
		(dia),
		(dia, tipo_transporte),
		(dia, tipo_transporte, provincia)
	)
ORDER BY
	dia DESC,
	tipo_transporte DESC,
	provincia DESC