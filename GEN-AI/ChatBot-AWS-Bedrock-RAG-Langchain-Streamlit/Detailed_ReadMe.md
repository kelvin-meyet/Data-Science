# Multi-Purpose Gen AI ChatBot

This folder will help reader understand the work done in relation to the creation of this Chatbot using

## Admin Folder

- The materials and codes in the Admin folder is a Streamlit application that processes PDF files upon upload, splits its content into chunks, creates a FAISS vector store using Bedrock embeddings, and uploads the vector store to S3 the created S3 bucket.

This can be achieved when:

- A bucket is created on s3 & run the following codes in your terminal

```
   docker build -t pdf-reader-admin002 .
   docker run -e BUCKET_NAME=bedrock-llm-chatbot-files -v C:/Users/dumbl/.aws:/root/.aws -p 8083:8083 -it pdf-reader-admin002
```

## The User Folder

- The materials and codes in the Admin folder is a Streamlit application that processes PDF files upon upload, splits its content into chunks, creates a FAISS vector store using Bedrock embeddings, and uploads the vector store to S3 the created S3 bucket.

This can be achieved when:

- A bucket is created on s3 & run the following codes in your terminal

```
   docker build -t pdf-reader-admin002 .
   docker run -e BUCKET_NAME=bedrock-llm-chatbot-files -v C:/Users/dumbl/.aws:/root/.aws -p 8083:8083 -it pdf-reader-admin002
```

## Detailed Description of Admin Section

The code snippet in this section is basically Streamlit application that processes PDF files and creates vector stores for document embeddings. Here's a summary:

1. **Imports and Setup**:

   - Imports necessary libraries: `boto3`, `streamlit`, `os`, `uuid`, `BedrockEmbeddings`, `RecursiveCharacterTextSplitter`, `PyPDFLoader`, `FAISS`.
   - Initializes the S3 client and retrieves the bucket name from environment variables.
   - Sets up the Bedrock embedding model using AWS Titan.

2. **Utility Functions**:

   - `get_unique_id()`: Generates a unique ID using `uuid`.
   - `split_text(pages, chunk_size, chunk_overlap)`: Splits the text of PDF pages into chunks using the `RecursiveCharacterTextSplitter`.

3. **Vector Store Creation**:

   - `create_vector_store(request_id, documents)`: Creates a vector store from the document chunks using FAISS and the Bedrock embedding model. Saves the vector store locally and uploads the files to S3.

4. **Main Application Logic**:

   - The `main()` function sets up the Streamlit interface.
   - Allows the user to upload a PDF file.
   - Generates a unique request ID and saves the uploaded PDF locally.
   - Loads and splits the PDF into pages.
   - Splits the pages into document chunks.
   - Creates the vector store and uploads it to S3.
   - Displays success or error messages based on the process outcome.

5. **Execution**:
   - Runs the `main()` function if the script is executed directly.

This application is designed to handle PDF uploads, split the content into manageable chunks, create embeddings for the text, store the embeddings using FAISS, and upload the resulting files to an S3 bucket.

## About Me:

My name is Girish Jaju. I have been doing IT consulting for over 20 years. Last several years I have been working with AWS cloud architect, devops, developer (wearing many hats).

For any consulting opportunities, please reach out to me at girish@jajusoft.com.

## Connect with me:

LinkedIn: https://www.linkedin.com/in/girishjaju/
