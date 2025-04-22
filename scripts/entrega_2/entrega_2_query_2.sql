select
      barrio_nombre as nombre_barrio,
      count(distinct nombre_linea)	as cant_lineas,
      string_agg(distinct nombre_linea ,',' order by nombre_linea)	as lista_lineas_transp
FROM dm_sube.viajes_agreg_cubo_prim_v vacpv
	where barrio_nombre in('AREA CENTRO','ESTACION TERMINAL', 'PLAYA CHAPADMALAL')
group by barrio_nombre 
