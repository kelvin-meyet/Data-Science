# Building AI-Powered Chatbots on Cloud Run: A Step-by-Step Guide Using Google’s PaLM API and Cloud Run

This repository contains code for project to Build Gen-AI chatbot using PaLM API.
In this project, we'll explore the creation of sophisticated AI-powered chatbots on Cloud Run. Follow along this comprehensive, step-by-step guide to leverage Google’s PaLM API and Cloud Run. Learn how to build, deploy, and manage intelligent chatbots, empowering your applications with advanced conversational abilities.

## What we will cover ?

In this project, I delve into:

- Understanding Generative AI’s potential 🤖
- Exploring the Generative AI studio in Google Cloud ☁️
- Harnessing the Python SDK for Vertex AI PaLM API 🐍
- Building an AI-powered chatbot using PaLM API 🌴
- Crafting a Python Flask-based Web Chatbot App with PaLM API
- Dockerizing the Chatbot App for seamless deployment 🐳
- Deploying the containerized app on Cloud Run ☁️

## What is Generative AI

Generative AI is like having a creative partner capable of generating new ideas, images, and even code based on your instructions. It’s a type of artificial intelligence that can create novel things from scratch.

## Generative AI Studio in Google Cloud

Generative AI Studio is a cloud-based platform from Google Cloud that allows users to create, experiment with, and customize generative AI models. It’s a console tool for rapidly prototyping and testing generative AI models.

## PaLM API 🌴

The “Pathway Language Model API” provides access to Google’s Pathway Language Model (PaLM), a large language model trained on extensive text and code datasets. PaLM is versatile, capable of tasks like generating text, translating languages, and providing informative answers.

## Vertex AI SDK for Python

The Vertex AI SDK for Python streamlines data ingestion, model training, and predictions on Vertex AI. It enables programmatically accessing Vertex AI’s capabilities using Python code.

## --- Steps to Create Arifact Repository, Build & Run in GCP ---

## Syntax below

gcloud artifacts repositories create <name of repository> --project=<project_id> --repository-format=docker --location=us-central1 --description="describe repository"

## Run

gcloud artifacts repositories create genairepo --project=atomic-byway-423416-p2 --repository-format=docker --location=us-central1 --description="Docker Repokelvin"

## --- Build & Submit Image to Repository in GCP---

## Syntax below

gcloud builds submit --tag location-docker.pkg.dev/project id/name of repository/name of image .

## Run

gcloud builds submit --tag us-central1-docker.pkg.dev/atomic-byway-423416-p2/genairepo/chatbot1 .

## Go to CloudRun and start a new service with existing container image

1. Deploy one revision from an existing container image

2. Select from the directory the name of image you gave it

3. All other fields will be pre-populated

4. Allow unauthenticated invocations

5. Go to Containers section and make sure the listening port on the container corresponds to that in the app.py {i used 5000 for convenience sake}

6. create

7. When completed, click on the cloudrun job and copy and paste url in browser to access chatbot.
