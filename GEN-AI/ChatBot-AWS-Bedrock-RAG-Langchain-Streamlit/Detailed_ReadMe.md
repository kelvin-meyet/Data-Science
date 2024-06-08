# Detailed Description of Admin Section

![Architecture](ChatBot-architecture.png)

## PDF Processing and Vector Store Creation Application

This application processes a PDF file, splits its content into text chunks, creates a FAISS vector store using AWS Bedrock embeddings, and uploads the resulting vector store to AWS S3.

## Overview

The application:

1. Uploads a PDF file via a Streamlit web interface.
2. Splits the PDF content into text chunks.
3. Generates embeddings for the text chunks using AWS Bedrock embeddings.
4. Creates a FAISS vector store from the embeddings.
5. Uploads the FAISS vector store files to an AWS S3 bucket.

## Prerequisites

Ensure you have the following set up:

- AWS credentials configured (`~/.aws/credentials`).
- Docker installed on your machine.
- An S3 bucket to store the vector store files.

## Application Structure

### Python Script

The Python script performs the following tasks:

1. Initializes the S3 client and Bedrock embeddings.
2. Defines helper functions to generate unique IDs, split text into chunks, and create a vector store.
3. Provides the main function that:
   - Displays the Streamlit web interface.
   - Handles PDF file upload.
   - Splits the uploaded PDF into text chunks.
   - Creates a FAISS vector store from the text chunks.
   - Uploads the vector store files to S3.
   - Displays the processing status.

### Dockerfile

The Dockerfile:

1. Sets up the Python environment.
2. Installs required dependencies.
3. Copies the application code into the Docker image.
4. Sets the entry point to run the Streamlit application.

## Running the Application

### Step 1: Configure AWS Credentials

Ensure your AWS credentials are configured properly:

- On Windows: Store your credentials in `C:\Users\<YourUsername>\.aws\credentials`.
- On Linux/Mac: Store them in `~/.aws/credentials`.

### Step 2: Set Environment Variables

Set the `BUCKET_NAME` environment variable to your S3 bucket name.

### Step 3: Build and Run Docker Container

1. Open your terminal and navigate to the project directory.
2. Build the Docker image using:

   ```sh
   docker build -t pdf-reader-admin002 .
   ```

3. Run the Docker container using:

   ```sh
   docker run -e BUCKET_NAME=your-s3-bucket-name -v ~/.aws:/root/.aws -p 8083:8083 -it pdf-reader-admin002
   ```

### Step 4: Access the Application

Open your web browser and go to `http://localhost:8083` to access the application.

## Usage

1. Upload a PDF file via the web interface.
2. The application will process the PDF, create a FAISS vector store, and upload the store to your S3 bucket.
3. Check the logs for success or error messages.

## Conclusion

This application provides an end-to-end solution for processing PDF files, creating embeddings, and storing the resulting vector store in AWS S3.

## About Me:

My name is Girish Jaju. I have been doing IT consulting for over 20 years. Last several years I have been working with AWS cloud architect, devops, developer (wearing many hats).

For any consulting opportunities, please reach out to me at girish@jajusoft.com.

## Connect with me:

LinkedIn: https://www.linkedin.com/in/girishjaju/
