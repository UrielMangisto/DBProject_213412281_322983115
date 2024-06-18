
-- 1. Add a CHECK constraint to the Dosage column in the Medicine table, ensuring it is greater than 0
ALTER TABLE Medicine
ADD CONSTRAINT chk_medicine_dosage_positive CHECK (Dosage > 0);

-- 2. Add a DEFAULT constraint to the Position column in the Doctor table, setting the default value to 'Junior'
ALTER TABLE Doctor
MODIFY Position VARCHAR2(30) DEFAULT 'Junior';

-- 3. Add a CHECK constraint to the SurgeryType column in the Surgery table, ensuring it is one of the predefined values
ALTER TABLE Surgery
ADD CONSTRAINT chk_surgery_type CHECK (SurgeryType IN ('Short_surgery','Intermediate_surgerie','Long_surgery'))
