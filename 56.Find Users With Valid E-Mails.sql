SELECT user_id, name, mail
FROM users
WHERE REGEXP_LIKE(mail, '^[a-z]+[0-9a-zA-Z_.-]*@leetcode[.]{1}com$');