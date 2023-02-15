FROM ubuntu:20.04

LABEL Maintainer="adgsenpai"

RUN  apt-get update \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/*

# Install build tools
RUN  apt-get update \
    && apt-get install -y build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install zlib
RUN  apt-get update \
    && apt-get install -y zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Install python
RUN  apt-get update \
    && apt-get install -y python3 \
    && rm -rf /var/lib/apt/lists/*

# Install python3-pip
RUN  apt-get update \
    && apt-get install -y python3-pip \
    && rm -rf /var/lib/apt/lists/*


RUN apt-get update \
 && apt-get install unixodbc -y \
 && apt-get install unixodbc-dev -y \
 && apt-get install freetds-dev -y \
 && apt-get install freetds-bin -y \
 && apt-get install tdsodbc -y \
 && apt-get install --reinstall build-essential -y

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y --allow-unauthenticated msodbcsql17
RUN ACCEPT_EULA=Y apt-get install -y --allow-unauthenticated mssql-tools
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc


# Copy directory
COPY . .

# Install requirements
RUN pip install -r requirements.txt

#time zone South Africa
ENV TZ=Africa/Johannesburg
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone    


# Install Graphviz
RUN  apt-get update \
    && apt-get install -y graphviz \
    && rm -rf /var/lib/apt/lists/*


# Running streamlit app
CMD streamlit run --server.port $PORT app.py
