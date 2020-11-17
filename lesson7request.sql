SELECT 
    u.id_user,
    u.user_first_name,
    u.user_last_name,
    COUNT(like.like_user_g) AS col_like_g,
    COUNT(like1.id_user_p) AS col_like_p
FROM
    social_network.user_tbl u
        JOIN
    social_network.like_tbl like ON like.like_user_g = u.id_user
        JOIN
    social_network.like_tbl like1 ON like1.id_user_p = u.id_user
GROUP BY like.like_user_g , like1.id_user_p
;