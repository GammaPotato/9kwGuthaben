import tkinter as tk
import requests


def show_balance():
    response = requests.get("https://www.9kw.eu/index.cgi?action=usercaptchaguthaben&apikey=APISchlüssel")
    balance = response.text
    label.config(text=f"Restguthaben: {balance}")

root = tk.Tk()
root.geometry("300x100")
root.title("9kw.eu Restguthaben")


root.title("9kw.eu Restguthaben")

label = tk.Label(root, text="Drücke Aktualisieren")
label.pack()

button = tk.Button(root, text="Aktualisieren", command=show_balance)
button.pack()

button_quit = tk.Button(root, text="Beenden", command=root.quit)
button_quit.pack()

root.after(300000, show_balance)
root.mainloop()
