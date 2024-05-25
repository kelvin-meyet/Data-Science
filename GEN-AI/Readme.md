# -----Create Arifact Repository in GCP---

# Syntax below

# gcloud artifacts repositories create <name of repository> --project=<project_id> --repository-format=docker --location=us-central1 --description="describe repository"

gcloud artifacts repositories create hello --project=atomic-byway-423416-p2 --repository-format=docker --location=us-central1 --description="Docker Repokelvin"

# -----Build Docker Image & push to cloud run---

# Syntax below

# gcloud builds submit --tag <>/<project id>/<name of repository>/<name of image> .

gcloud builds submit --tag us-central1-docker.pkg.dev/atomic-byway-423416-p2/hello/hello-python .

# Go to CloudRun and start a new service with existing container image

1. Deploy one revision from an existing container image

2. Select from the directory the name of image you gave it

3. All other fields will be pre-populated

4. Allow unauthenticated invocations

5. Go to Containers section and make sure the listening port on the container corresponds to that in the app.py {i used 5000 for convenience sake}
6. create

7. When completed, click on the cloudrun job and copy and paste url in browser to access chatbot.
