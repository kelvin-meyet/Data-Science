FROM python:3.11
EXPOSE 8083
WORKDIR /app 

# Copy requirements.txt to the working directory  
COPY requirements.txt ./

# Install or upgrade langchain (if needed)
RUN pip install --upgrade langchain boto3 --quiet

# Install dependencies from requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the application code to the working directory
COPY . ./

# Set the entry point command to execute when the container starts up
ENTRYPOINT [ "streamlit", "run", "admin.py", "--server.port=8083" , "--server.address=0.0.0.0"]
