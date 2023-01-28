import tkinter as tk
import requests
import pickle

def save_api_key():
    api_key = api_key_entry.get()
    with open("api_key.pkl", "wb") as f:
        pickle.dump(api_key, f)
    label.config(text="API Key gespeichert.")

def show_balance():
    with open("api_key.pkl", "rb") as f:
        api_key = pickle.load(f)
    response = requests.get(f"https://www.9kw.eu/index.cgi?action=usercaptchaguthaben&apikey={api_key}")
    balance = response.text
    label.config(text=f"Restguthaben: {balance}")

root = tk.Tk()
root.geometry("300x150")
root.title("9kw.eu Restguthaben")

label = tk.Label(root, text="API Keyl eingeben:")
label.pack()

api_key_entry = tk.Entry(root)
api_key_entry.pack()

save_api_key_button = tk.Button(root, text="API Key Speichern", command=save_api_key)
save_api_key_button.pack()

try:
    with open("api_key.pkl", "rb") as f:
        api_key = pickle.load(f)
        api_key_entry.delete(0,tk.END)
        api_key_entry.insert(0,api_key)
    show_balance()
except:
    label.config(text="Gib denn API Key ein und Drücke Enter")

button = tk.Button(root, text="Aktualisieren", command=show_balance)
button.pack()

button_quit = tk.Button(root, text="Beenden", command=root.quit)
button_quit.pack()

root.mainloop()