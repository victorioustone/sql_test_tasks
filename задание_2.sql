-- Посчитать затраты на трафик и маржинальность в разрезе типов устройств в абсолютных значениях и в %.
-- Стоимость 1 Мб трафика принять равной 1 коп.

-- charges - заработанные
with a as (
  select gadget, sum(charges) as revenue, 
  sum(trafic) * 0.01 as costs 
  from simulative.trafic
  group by gadget
  ) select gadget, round(costs) as costs, round(revenue - costs) as marginality, 
  round((revenue - costs) / revenue * 100) as marginality_percent from a
order by marginality_percent