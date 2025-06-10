import mysql.connector
import tkinter as tk
from tkinter import ttk, messagebox

# === Databaseverbinding ===
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="trigger"
)
cur = conn.cursor()

# === Functies ===
def voeg_klant_toe():
    naam = klant_naam.get()
    email = klant_email.get()
    if naam and email:
        try:
            cur.execute("INSERT INTO klanten (naam, email) VALUES (%s, %s)", (naam, email))
            conn.commit()
            messagebox.showinfo("Succes", "Klant succesvol toegevoegd.")
            klant_naam.delete(0, tk.END)
            klant_email.delete(0, tk.END)
        except Exception as e:
            messagebox.showerror("Fout", str(e))
    else:
        messagebox.showwarning("Waarschuwing", "Vul alle velden in om verder te gaan.")

def verwijder_klant():
    klant_id = klant_verwijder_id.get()
    if klant_id:
        try:
            cur.execute("DELETE FROM klanten WHERE id = %s", (klant_id,))
            conn.commit()
            messagebox.showinfo("Succes", f"Klant met ID {klant_id} is verwijderd.")
            klant_verwijder_id.delete(0, tk.END)
        except Exception as e:
            messagebox.showerror("Fout", str(e))
    else:
        messagebox.showwarning("Waarschuwing", "Voer een geldig klant-ID in.")

def voeg_bestelling_toe():
    klant_id = bestelling_klant_id.get()
    product = bestelling_product.get()
    bedrag = bestelling_bedrag.get()
    if klant_id and product and bedrag:
        try:
            cur.execute(
                "INSERT INTO bestellingen (klant_id, product, bedrag) VALUES (%s, %s, %s)",
                (klant_id, product, bedrag)
            )
            conn.commit()
            messagebox.showinfo("Succes", "Bestelling is succesvol toegevoegd.")
            bestelling_klant_id.delete(0, tk.END)
            bestelling_product.delete(0, tk.END)
            bestelling_bedrag.delete(0, tk.END)
        except Exception as e:
            messagebox.showerror("Fout", str(e))
    else:
        messagebox.showwarning("Waarschuwing", "Vul alle velden correct in.")

def verwijder_bestelling():
    bestelling_id = bestelling_verwijder_id.get()
    if bestelling_id:
        try:
            cur.execute("DELETE FROM bestellingen WHERE id = %s", (bestelling_id,))
            conn.commit()
            messagebox.showinfo("Succes", f"Bestelling met ID {bestelling_id} is verwijderd.")
            bestelling_verwijder_id.delete(0, tk.END)
        except Exception as e:
            messagebox.showerror("Fout", str(e))
    else:
        messagebox.showwarning("Waarschuwing", "Voer een geldig bestelling-ID in.")

def laad_data():
    klanten_tree.delete(*klanten_tree.get_children())
    bestellingen_tree.delete(*bestellingen_tree.get_children())

    cur.execute("SELECT id, naam, email FROM klanten")
    for row in cur.fetchall():
        klanten_tree.insert("", tk.END, values=row)

    cur.execute("SELECT id, klant_id, product, bedrag FROM bestellingen")
    for row in cur.fetchall():
        bestellingen_tree.insert("", tk.END, values=row)

# === GUI Opzet ===
root = tk.Tk()
root.title("Klant- en Bestelbeheer Systeem")
root.geometry("600x500")
root.configure(bg="#f0f4f8")

style = ttk.Style()
style.theme_use('clam')
style.configure("TNotebook", background="#e5eaf1", borderwidth=0)
style.configure("TNotebook.Tab", background="#cbd5e1", padding=[12, 6], font=('Segoe UI', 10, 'bold'))
style.map("TNotebook.Tab", background=[("selected", "#ffffff")], foreground=[("selected", "#0f172a")])
style.configure("TFrame", background="#ffffff")
style.configure("TLabel", background="#ffffff", foreground="#1e293b", font=('Segoe UI', 10))
style.configure("TEntry", padding=6, relief="flat", font=('Segoe UI', 10))
style.configure("TButton", background="#2563eb", foreground="#ffffff", font=('Segoe UI', 10, 'bold'), padding=8)
style.map("TButton", background=[('active', '#1e40af')])

notebook = ttk.Notebook(root)
notebook.pack(padx=20, pady=20, expand=True, fill='both')

ttkl = ttk.Label
ttke = ttk.Entry
ttkb = ttk.Button

# === Tab 1: Klant toevoegen ===
icon_plus = "➕"
tab1 = ttk.Frame(notebook)
notebook.add(tab1, text=f"{icon_plus} Klant")

ttkl(tab1, text="Naam:").grid(row=0, column=0, padx=10, pady=10, sticky='e')
klant_naam = ttke(tab1, width=30)
klant_naam.grid(row=0, column=1, padx=10, pady=10)

ttkl(tab1, text="E-mailadres:").grid(row=1, column=0, padx=10, pady=10, sticky='e')
klant_email = ttke(tab1, width=30)
klant_email.grid(row=1, column=1, padx=10, pady=10)

ttkb(tab1, text=icon_plus, command=voeg_klant_toe).grid(row=2, column=0, columnspan=2, pady=20)

# === Tab 2: Klant verwijderen ===
icon_trash = "🗑️"
tab2 = ttk.Frame(notebook)
notebook.add(tab2, text=f"{icon_trash} Klant")

ttkl(tab2, text="Klant-ID:").grid(row=0, column=0, padx=10, pady=10, sticky='e')
klant_verwijder_id = ttke(tab2, width=30)
klant_verwijder_id.grid(row=0, column=1, padx=10, pady=10)

ttkb(tab2, text=icon_trash, command=verwijder_klant).grid(row=1, column=0, columnspan=2, pady=20)

# === Tab 3: Bestelling toevoegen ===
tab3 = ttk.Frame(notebook)
notebook.add(tab3, text=f"{icon_plus} Bestelling")

ttkl(tab3, text="Klant-ID:").grid(row=0, column=0, padx=10, pady=10, sticky='e')
bestelling_klant_id = ttke(tab3, width=30)
bestelling_klant_id.grid(row=0, column=1, padx=10, pady=10)

ttkl(tab3, text="Product:").grid(row=1, column=0, padx=10, pady=10, sticky='e')
bestelling_product = ttke(tab3, width=30)
bestelling_product.grid(row=1, column=1, padx=10, pady=10)

ttkl(tab3, text="Bedrag:").grid(row=2, column=0, padx=10, pady=10, sticky='e')
bestelling_bedrag = ttke(tab3, width=30)
bestelling_bedrag.grid(row=2, column=1, padx=10, pady=10)

ttkb(tab3, text=icon_plus, command=voeg_bestelling_toe).grid(row=3, column=0, columnspan=2, pady=20)

# === Tab 4: Bestelling verwijderen ===
tab4 = ttk.Frame(notebook)
notebook.add(tab4, text=f"{icon_trash} Bestelling")

ttkl(tab4, text="Bestelling-ID:").grid(row=0, column=0, padx=10, pady=10, sticky='e')
bestelling_verwijder_id = ttke(tab4, width=30)
bestelling_verwijder_id.grid(row=0, column=1, padx=10, pady=10)

ttkb(tab4, text=icon_trash, command=verwijder_bestelling).grid(row=1, column=0, columnspan=2, pady=20)

# === Tab 5: Overzicht ===
tab5 = ttk.Frame(notebook)
notebook.add(tab5, text="📋 Overzicht")

ttkb(tab5, text="🔄 Ververs", command=laad_data).pack(pady=10)

ttkl(tab5, text="📇 Klanten").pack()
klanten_tree = ttk.Treeview(tab5, columns=("ID", "Naam", "Email"), show="headings")
for col in ("ID", "Naam", "Email"):
    klanten_tree.heading(col, text=col)
    klanten_tree.column(col, width=150)
klanten_tree.pack(pady=10)

ttkl(tab5, text="📦 Bestellingen").pack()
bestellingen_tree = ttk.Treeview(tab5, columns=("ID", "Klant-ID", "Product", "Bedrag"), show="headings")
for col in ("ID", "Klant-ID", "Product", "Bedrag"):
    bestellingen_tree.heading(col, text=col)
    bestellingen_tree.column(col, width=150)
bestellingen_tree.pack(pady=10)

# Automatisch verversen bij openen van tab
def on_tab_changed(event):
    selected_tab = event.widget.select()
    if notebook.tab(selected_tab, "text") == "📋 Overzicht":
        laad_data()

notebook.bind("<<NotebookTabChanged>>", on_tab_changed)

# === Start GUI ===
root.mainloop()

# === Sluit databaseverbinding ===
cur.close()
conn.close()


# Sluit de databaseverbinding
cur.close()
conn.close()
