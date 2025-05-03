-- 1. Auto-level-up when reaching a certain experience
-- Automatically increases the player's level if his experience exceeds 1000:
CREATE OR REPLACE FUNCTION auto_level_up()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.experience >= 1000 AND NEW.level < 100 THEN
    NEW.level := NEW.level + 1;
    NEW.experience := 0;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER level_up_trigger
BEFORE UPDATE ON Player
FOR EACH ROW
EXECUTE FUNCTION auto_level_up();

-- 2. Prevent purchase if item is already in inventory
CREATE OR REPLACE FUNCTION prevent_duplicate_items()
RETURNS TRIGGER AS $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM Item
    WHERE item_name = NEW.item_name
    AND nickname = NEW.nickname
    AND number = NEW.number
  ) THEN
    RAISE EXCEPTION 'Item already exists in inventory!';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER no_duplicates_trigger
BEFORE INSERT ON Item
FOR EACH ROW
EXECUTE FUNCTION prevent_duplicate_items();

-- 3. Prevent a player from having negative gold after UPDATE
CREATE OR REPLACE FUNCTION prevent_negative_gold()
RETURNS TRIGGER AS $$
BEGIN
 IF NEW.gold < 0 THEN
 RAISE EXCEPTION 'Gold cannot be negative!';
 END IF;
 RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_gold
BEFORE UPDATE ON Player
FOR EACH ROW
EXECUTE FUNCTION prevent_negative_gold();
