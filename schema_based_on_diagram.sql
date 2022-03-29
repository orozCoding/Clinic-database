CREATE DATABASE clinic;

CREATE TABLE patients (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
name VARCHAR(100),
date_of_birth DATE,
PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  admitted_at TIMESTAMP,
  status VARCHAR(100),
  patient_id INT,

  PRIMARY KEY (id),
  CONSTRAINT fk_Patients FOREIGN KEY(patient_id) REFERENCES patients (id)
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  type VARCHAR(100),
  name VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE invoices ( 
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  PRIMARY KEY (id),
  CONSTRAINT fk_medical_histories FOREIGN KEY(medical_history_id) REFERENCES medical_histories (id)
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  PRIMARY KEY (id),
  CONSTRAINT fk_invoices FOREIGN KEY(invoice_id) REFERENCES invoices (id),
  CONSTRAINT fk_treatments FOREIGN KEY(treatment_id) REFERENCES treatments (id)
);

CREATE TABLE medical_orders (
  medical_history_id INT NOT NULL,
  treatment_id INT NOT NULL,
  CONSTRAINT fk_medical_histories FOREIGN KEY(medical_history_id) REFERENCES medical_histories (id),
  CONSTRAINT fk_treatments FOREIGN KEY(treatment_id) REFERENCES treatments (id)
);

-- Foreign key indexes
CREATE INDEX medical_histories_patient_id_asc ON medical_histories(patient_id ASC);
CREATE INDEX invoices_medical_history_id_asc ON invoices(medical_history_id ASC);
CREATE INDEX invoice_items_invoice_id_asc ON invoice_items(invoice_id ASC);
CREATE INDEX invoice_items_treatment_id_asc ON invoice_items(treatment_id ASC);
CREATE INDEX medical_orders_medical_history_id_asc ON medical_orders(medical_history_id ASC);
CREATE INDEX medical_orders_treatment_id_asc ON medical_orders(treatment_id ASC);