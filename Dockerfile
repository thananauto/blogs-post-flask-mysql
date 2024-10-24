# start by pulling the python image
FROM python:3.8-slim-buster

# set the workdir
WORKDIR /app

# copy the requirements.txt file
COPY requirements.txt requirements.txt

# install all dependencies
RUN pip3 install -r requirements.txt

#copy rest of the code
COPY . .

# expose the port
EXPOSE 5000

# run the application in  any port
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0", "--port=5000"]