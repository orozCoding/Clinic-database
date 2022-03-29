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
