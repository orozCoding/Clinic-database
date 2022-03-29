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
