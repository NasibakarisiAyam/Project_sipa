from PIL import Image
import pytesseract
import os

# Ganti path di bawah ini dengan lokasi install Tesseract di laptop kamu
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'

# Buat list semua nama file gambar dari 1.jpg sampai 10.jpg
image_files = [f"{i}.jpg" for i in range(1, 11)]

# Tempat menyimpan semua hasil teks
hasil_akhir = ""

for filename in image_files:
    if os.path.exists(filename):
        print(f"[✓] Memproses {filename}...")
        img = Image.open(filename)
        teks = pytesseract.image_to_string(img, lang='eng')  # pakai lang='ind' jika bahasa Indonesia
        hasil_akhir += f"--- {filename} ---\n{teks}\n\n"
    else:
        print(f"[✗] File {filename} tidak ditemukan!")

# Simpan hasil ke dalam file teks
with open("hasil.txt", "w", encoding="utf-8") as f:
    f.write(hasil_akhir)

print("✅ Selesai! Hasil disimpan di hasil.txt")
