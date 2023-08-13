import json, os
from discord.ext import commands
import discord
from discord import app_commands, Intents, Interaction, Client
from dotenv import load_dotenv
import mysql.connector

#Carga de env
load_dotenv()
DISCORD_BOT_TOKEN = os.getenv('TOKEN')
USERMDB = os.getenv('userMDB')
USERPASSWMDB = os.getenv('passwMB')

# Configura la conexión a la base de datos
db_connection = mysql.connector.connect(
    host="localhost",
    user=USERMDB,
    password=USERPASSWMDB,
    database="universe"
)

# Crea un cursor para realizar consultas SQL
db_cursor = db_connection.cursor()


class LoreBot(Client):

    #region BOT Disc
    def __init__(self, *, intents: Intents):
        super().__init__(intents=intents)
        self.tree = app_commands.CommandTree(self)
    
    async def on_ready(self):
        print(f'{self.user} se ha conectado a Discord!')
        print(f'Conectado')
        await self.tree.sync(guild=None)
    #endregion



#Permisos
bot = LoreBot(intents=Intents.default())

# Comandos
@bot.tree.command()
async def lore(interaction: Interaction, cmd: str):  
      # Insertar un saludo en la base de datos
    # sql = f"INSERT INTO Actor (nombre) VALUES ('{cmd}')"
    sql = "INSERT INTO Actor (nombre) VALUES (%s)"
    values = [cmd]
    try:
        db_cursor.execute("SELECT * FROM Actor")
        results = db_cursor.fetchall()
        # Imprime los resultados
        for row in results:
            print(row)

        db_cursor.execute(sql,values)
        db_connection.commit()
        #Cierre de conexiones
        db_cursor.close()
        db_connection.close()
        await interaction.response.send_message(f'El comando introducido es: {cmd}')
    except mysql.connector.Error as err:
        print("Error en la inserción:", err)

# Eventos
bot.run(DISCORD_BOT_TOKEN) 



