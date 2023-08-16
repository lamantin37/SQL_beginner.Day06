SELECT
    p.name AS person_name,
    m.pizza_name,
    m.price AS actual_price,
    ROUND(m.price * (1 - pd.discount / 100), 2) AS discount_price,
    pz.name AS pizzeria_name
FROM person p
JOIN person_order po ON p.id = po.person_id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
LEFT JOIN person_discounts pd ON p.id = pd.person_id AND pz.id = pd.pizzeria_id
ORDER BY p.name, m.pizza_name;
