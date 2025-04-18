WITH aggregated_data AS (
    SELECT
        zona_interes_750m,
        SUM(cant_trx) AS cant_trx
    FROM dm_sube.viajes_agreg_cubo_prim_v vacpv
    WHERE
        hora = 12
        AND descripcion = 'BONIFICADA'
        AND nombre_empresa = 'TRANSPORTES 25 DE MAYO SRL'
        and zona_interes_750m != 'SIN ZONA ASOCIADA'
    GROUP BY zona_interes_750m
)
SELECT
    zona_interes_750m,
    cant_trx
FROM aggregated_data
WHERE cant_trx = (SELECT MAX(cant_trx) FROM aggregated_data);