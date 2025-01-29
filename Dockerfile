# Rasmiy Python image-dan foydalanamiz
FROM python:3.10-slim

# Ishchi katalogni yaratamiz
WORKDIR /app

RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*


RUN apt-get update && apt-get install -y build-essential wget
RUN wget https://sqlite.org/2016/sqlite-autoconf-3100100.tar.gz
RUN tar -xvzf sqlite-autoconf-3100100.tar.gz
RUN cd sqlite-autoconf-3100100 && ./configure && make && make install


# Barcha kerakli fayllarni konteynerga ko‘chiramiz
COPY . .

# Kerakli kutubxonalarni o‘rnatamiz
RUN pip install -r requirements.txt

RUN mkdir -p /app/db

# Konteyner ishga tushganda bajariladigan buyruq
CMD ["python", "instasave.py"]
