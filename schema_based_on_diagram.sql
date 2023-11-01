CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIME NOT NULL,
    patient_id INTEGER NOT NULL,
    status VARCHAR(255)
);

ALTER TABLE medical_histories
ADD CONSTRAINT fk_patient_id
FOREIGN KEY (patient_id)
REFERENCES patients(id);

CREATE TABLE treatment (
    id SERIAL PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE medical_history_treatments (
    id SERIAL PRIMARY KEY,
    medical_history_id INTEGER NOT NULL,
    treatment_id INTEGER NOT NULL,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatment_id) REFERENCES treatment(id)
);
