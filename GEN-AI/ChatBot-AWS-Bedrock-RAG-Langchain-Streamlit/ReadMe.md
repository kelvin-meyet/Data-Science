# Multi-Purpose Gen AI ChatBot

This folder will help reader understand the work done in relation to the creation of this Chatbot using

## Part A - Admin Folder

- The materials and codes in the Admin folder is a Streamlit application that processes PDF files upon upload, splits its content into chunks, creates a FAISS vector store using Bedrock embeddings, and uploads the vector store to S3 the created S3 bucket.

- Containerize the code (admin.py) and its dependencies (requirements.txt) in a docker image.
- Run the application on the docker container in AWS Console.

This can be achieved when:

- Create an S3 bucket & run the following codes in your terminal

```
   docker build -t pdf-reader-admin002 .
   docker run -e BUCKET_NAME=bedrock-llm-chatbot-files -v C:/Users/dumbl/.aws:/root/.aws -p 8083:8083 -it pdf-reader-admin002
```

## Part B - The User Folder

- The materials and codes in the User folder querries the chatbot based on document supplied in Part A

This can be achieved when:

- best code to run docker image when querying the chatbot from client/user folder

```
docker build -t pdf-reader-client1 .

docker run -e BUCKET_NAME=bedrock-llm-chatbot-files -v C:/Users/dumbl/.aws:/root/.aws -p 8084:8084 -it pdf-reader-client1
```

1. Create bucket on s3
   s3 bucket name = bedrock-llm-chatbot-files

2. Create a Requirements file with needed libraries

3. Create a Dockerfile & begin the admin.py file (Just import the libraries) & Save the Dockerfile and admin file

4. Run this command in git bash in the respective directory
   ---> $docker build -t pdf-reader-admin002 .
   ---> $docker run -p 8083:8083 -it pdf-reader-admin002

5. We have been able to

#--> best code to run docker image when creating the vector store on s3 with a pdf file

# docker build -t pdf-reader-admin002 .

# docker run -e BUCKET_NAME=bedrock-llm-chatbot-files -v C:/Users/dumbl/.aws:/root/.aws -p 8083:8083 -it pdf-reader-admin002

#--> best code to run docker image when querying the chatbot from client/user folder

# docker build -t pdf-reader-admin002 .

# docker run -e BUCKET_NAME=bedrock-llm-chatbot-files -v C:/Users/dumbl/.aws:/root/.aws -p 8083:8083 -it pdf-reader-admin002
