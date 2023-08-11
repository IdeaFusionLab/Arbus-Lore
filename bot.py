import json, os
from discord.ext import commands
import discord
from discord import app_commands, Intents, Interaction, Client
from dotenv import load_dotenv

class LoreBot(Client):
    #region BOT Disc
    def __init__(self, *, intents: Intents):
        super().__init__(intents=intents)
        self.tree = app_commands.CommandTree(self)
    
    async def on_ready(self):
        print(f'{self.user} se ha conectado a Discord!')
        await self.tree.sync(guild=None)
    #endregion


load_dotenv()
DISCORD_BOT_TOKEN = os.getenv('TOKEN')

#Permisos

bot = LoreBot(intents=Intents.default())

# Comandos
@bot.tree.command()
async def lore(interaction: Interaction, cmd: str):
    await interaction.response.send_message(f'El comando introducido es: {cmd}' )
# Eventos
bot.run(DISCORD_BOT_TOKEN) 



