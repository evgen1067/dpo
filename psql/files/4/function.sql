CREATE
OR REPLACE FUNCTION random_between(
  min_val numeric, max_val numeric, round_to int = 0
) RETURNS numeric AS $$ DECLARE value NUMERIC = random()* (min_val - max_val) + max_val;
BEGIN IF round_to = 0 THEN RETURN floor(value);
ELSE RETURN round(value, round_to);
END IF;
END $$ language 'plpgsql';

CREATE
OR REPLACE FUNCTION random_text(min_val INT = 0, max_val INT = 50) RETURNS text AS $$ DECLARE word_length NUMERIC = floor(
  random() * (max_val - min_val) + min_val
):: INTEGER;
random_word TEXT = '';
BEGIN
SELECT
  * INTO random_word
FROM
  (
    WITH symbols(characters) AS (
      VALUES
        (
          'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
        )
    )
    SELECT
      string_agg(
        substr(
          characters,
          (
            random() * length(characters) + 1
          ) :: INTEGER,
          1
        ),
        ''
      ),
      'g1' AS idx
    FROM
      symbols
      JOIN generate_series(1, word_length) AS word(chr_idx) on 1 = 1 -- word length
    group by
      idx
  ) a;
RETURN random_word;
END $$ LANGUAGE 'plpgsql';