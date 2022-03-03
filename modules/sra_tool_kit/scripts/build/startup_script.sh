#!/bin/bash

# Copyright 2021 Google LLC
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     https://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Create dir for sample notebooks
echo "Creating directory to store samples."
# mkdir -p sample/bigquery-public-data
mkdir -p sample/sra_tool_kit

# Setting environment variabled for Project ID
echo "Setting Project ID variable."
export PROJECT_ID=$(gcloud config get-value project)

# install anaconda
# echo "Installing Miniconda"
# wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh 
# bash Miniconda3-py39_4.10.3-Linux-x86_64.sh
# you have to restart the shell after this step
# exec "$ScriptLoc"

# do we need to create a virtual env? 
# conda create -n sraenv python=3.7
# $ conda activate sraenv

# Install the necessary requirements
echo "Installing the SRA toolkit plus some additional requirements"
conda install -c bioconda sra-tools
conda install -c bioconda entrez-direct
conda install -c bioconda ipyrad
conda install -c conda-forge toytree

# Copy samples to the notebook
echo "Copying sample notebooks to the instance."
gsutil cp gs://user-scripts-${PROJECT_ID}/notebooks/SRA_Toolkit_tutorial.ipynb /home/jupyter/sample/sra_tool_kit/SRA_Toolkit_tutorial.ipynb
# gsutil cp gs://user-scripts-${PROJECT_ID}/notebooks/BigQuery_tutorial.ipynb /home/jupyter/sample/bigquery-public-data/BigQuery_tutorial.ipynb
# gsutil cp gs://user-scripts-${PROJECT_ID}/notebooks/Exploring_gnomad_on_BigQuery.ipynb /home/jupyter/sample/bigquery-public-data/Exploring_gnomad_on_BigQuery.ipynb
# gsutil cp gs://user-scripts-${PROJECT_ID}/notebooks/Quantum_Simulation_qsimcirq.ipynb /home/jupyter/sample/bigquery-public-data/Quantum_Simulation_qsimcirq.ipynb

echo "Startup script finished."

#auto-shutdown script - enable if needed

# wget https://raw.githubusercontent.com/GoogleCloudPlatform/ai-platform-samples/master/notebooks/tools/auto-shutdown/install.sh
# wget https://raw.githubusercontent.com/GoogleCloudPlatform/ai-platform-samples/master/notebooks/tools/auto-shutdown/ashutdown.service
# wget https://raw.githubusercontent.com/GoogleCloudPlatform/ai-platform-samples/master/notebooks/tools/auto-shutdown/ashutdown

# ./install.sh
