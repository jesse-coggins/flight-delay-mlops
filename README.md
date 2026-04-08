# Flight Delay MLOps Pipeline

## Overview
This project builds an end-to-end machine learning workflow for predicting average departure delay in minutes for flights leaving a selected origin airport. It combines data preparation, DVC-based data versioning, MLflow experiment tracking, a FastAPI prediction service, unit tests, and deployment-oriented assets.

## Coursework Context
This repository packages work originally completed as part of Western Governors University's (WGU) M.S. in Data Analytics program and reorganizes it into a public portfolio format.

## Project Goal
Create a reproducible pipeline that prepares airline on-time data, trains a delay prediction model, logs experiments, and serves predictions through an API.

## Pipeline Summary
1. Import and format airline on-time performance data
2. Filter the dataset to departures from Atlanta
3. Clean the data by removing missing departures, removing duplicates, and standardizing spacing
4. Train a Ridge regression model using encoded destination airports plus departure and arrival times
5. Track experiments, metrics, parameters, and artifacts in MLflow
6. Expose predictions through a FastAPI endpoint
7. Validate endpoint behavior with pytest

## Stack
- Python
- scikit-learn
- DVC
- MLflow
- FastAPI
- pytest

## Model
- Problem type: regression
- Algorithm: Ridge regression
- Features: one-hot encoded destination airport, scheduled departure time, scheduled arrival time
- Alpha sweep: 20 values from 0.0 to 3.8
- Logged metrics: mean squared error and average predicted delay

## Results
- Final test MSE: 82.51
- Average predicted delay: 4.68 minutes

## Selected Visuals

![Performance plot](assets/performance_plot.png)

![Model performance output](assets/model_performance_test.jpg)

## API
### Endpoints
- `GET /`
- `GET /predict/delays`

### Example
`/predict/delays?dest_airport=LAX&departure_time=14:30&arrival_time=17:45`

## Testing
The copied test suite covers:
- valid request returns `200`
- invalid airport returns `400`
- invalid time format returns `400`
- missing required parameters returns `422`

## Included Files
- `src/Task_2.py`
- `src/Task_2_MLFlow.py`
- `src/deployment_api.py`
- `src/airport_encodings.json`
- `src/finalized_model.pkl`
- `tests/api_tests.py`
- `data/cleaned_data.csv`
- `data/T_ONTIME_REPORTING.csv`
- `data/*.dvc`
- `.dvc/config`
- `.dvcignore`
- `.gitignore`
- `requirements.txt`
- `assets/model_performance_test.jpg`
- `assets/performance_plot.png`

## Note
The original GitLab-hosted `MLproject`, `Dockerfile`, and `.gitlab-ci.yml` files were not present in the local coursework folders, so they are not included in this staging copy.
