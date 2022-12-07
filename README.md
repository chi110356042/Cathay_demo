# Data governance on GCP

This project explores the issue of **data governance(DG)** and focus on the topic of **data loss prevention(DLP)** to prevent data leakage.

## Overview
<img width="642" alt="截圖 2022-12-07 下午4 12 33" src="https://user-images.githubusercontent.com/92499570/206124123-c0c195de-76c7-403a-bfd4-4bfdc93d54ad.png">

## Manual setup process
* Create a taxonomy and a policy tag
<img width="581" alt="截圖 2022-12-07 下午10 17 16" src="https://user-images.githubusercontent.com/92499570/206202541-9cbc76ec-9b4f-4dd6-8e5b-5e3179b3c8b4.png">

* Create data policies for policy tags
<img width="678" alt="截圖 2022-12-07 下午10 18 01" src="https://user-images.githubusercontent.com/92499570/206202710-8776331d-2a52-49f7-aa8d-985e321686f9.png">

* Add policy tag to the company column
<img width="550" alt="截圖 2022-12-07 下午10 18 27" src="https://user-images.githubusercontent.com/92499570/206202821-bff5e0ee-3438-4925-8332-365fc405586d.png">
<img width="633" alt="截圖 2022-12-07 下午10 18 49" src="https://user-images.githubusercontent.com/92499570/206202891-69d39432-bb6e-4c4b-89d3-04d948dca4f1.png">


* Add the fine-grained reader role to view the protected column
<img width="756" alt="截圖 2022-12-07 下午10 19 04" src="https://user-images.githubusercontent.com/92499570/206202951-b001701a-4e6a-4f94-8e43-ac3fdf29ac6f.png">

## Description

### Create mockdata
Download the `create_mockdata.ipynb` and upload it to your google drive, then you can use google colaboratory to run it.

### Setup by terraform
Run `terraform init` to add the necessary plugins and build the **.terraform** directory
Run `terraform plan` to create an execution plan (what terraform need to do in order to achieve the desired state)
Run `terraform apply` to execute a plan (configuration file)
