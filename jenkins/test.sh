#!/bin/bash

echo "Test Stage"

# venv created, source
pytho3 -m venv venv
source venv/bin/activate

# pip3 installs, pytest, flask_testing, frontend requirements.txt and backend requirements.txt
pip3 install pytest pytest-cov flask_testing
pip3 install -r frontend/requirements.txt
pip3 install -r backend/requirements.txt

mkdir test_reports

# run pytest frontend
python3 -m pytest frontend \
    --cov=frontend/application \
    --cov-report term-misssing \
    --cov-report xml:test_reports/frontend/coverage.xml \
    --junitxml=test_reports/frontend/junit_report.xml

# run pytes backend
python3 -m pytest backend \
    --cov=backend/application \
    --cov-report term-misssing \
    --cov-report xml:test_reports/backend/coverage.xml \
    --junitxml=test_reports/backend/junit_report.xml


# remove venv
deactivate
rm -rf venv