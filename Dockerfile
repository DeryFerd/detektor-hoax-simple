# Dockerfile

# LANGKAH 1: Mulai dari "dapur" yang sudah terinstall Python 3.9
FROM python:3.9-slim

# LANGKAH 2: Tentukan folder kerja di dalam server
WORKDIR /code

# LANGKAH 3: Salin daftar "bahan" kita dan install semuanya
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# LANGKAH 4: Salin semua file kode aplikasi kita ke dalam server
COPY . /code/

# LANGKAH 5: Perintah final untuk "menyalakan kompor" saat server dimulai
# Hugging Face Spaces menggunakan port 7860 secara default
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "7860"]
