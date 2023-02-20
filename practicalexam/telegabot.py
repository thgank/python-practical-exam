import psycopg2, telebot, random

# Define the database connection parameters
db_host = "localhost"
db_name = "horoscope"
db_user = "postgres"
db_pass = "mercytop38"

# Connect to the database
conn = psycopg2.connect(host=db_host, dbname=db_name, user=db_user, password=db_pass)
cur = conn.cursor()

# Create the horoscopes table
cur.execute("CREATE TABLE IF NOT EXISTS horoscopes (id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL, description TEXT)")

# Create the predictions table
cur.execute("CREATE TABLE IF NOT EXISTS predictions (id SERIAL PRIMARY KEY, horoscope_id INTEGER REFERENCES horoscopes(id), prediction TEXT NOT NULL)")

# Commit the changes and close the database connection
conn.commit()
cur.close()
conn.close()


class HoroscopeBot:
    def __init__(self, token, db_host, db_name, db_user, db_pass):
        # Connect to the database
        self.conn = psycopg2.connect(host=db_host, dbname=db_name, user=db_user, password=db_pass)
        self.cur = self.conn.cursor()

        # Create the Telegram bot object
        self.bot = telebot.TeleBot(token)

        # Register the message handler
        @self.bot.message_handler(commands=['start'])
        def start_command(message):
            self.bot.reply_to(message, "Welcome to the Horoscope Bot! Please choose your horoscope sign by sending a message with the name of your sign, e.g. 'Aries'.")
        
        # Register the message handler for horoscope signs
        @self.bot.message_handler(func=lambda message: True)
        def horoscope_command(message):
            # Retrieve the horoscope description from the database
            self.cur.execute("SELECT description FROM horoscopes WHERE name = %s", (message.text,))
            result = self.cur.fetchone()
            if result is not None:
                horoscope_description = result[0]
                # Retrieve a random prediction from the database
                self.cur.execute("SELECT prediction FROM predictions ORDER BY RANDOM() LIMIT 1")
                result = self.cur.fetchone()
                if result is not None:
                    prediction = result[0]
                    # Send the horoscope description and prediction to the user
                    response = f"{horoscope_description}\n\nPrediction: {prediction}"
                else:
                    response = "Sorry, no prediction found."
            else:
                response = "Sorry, I don't recognize that horoscope. Please choose one of the following: Aries, Taurus, Gemini, Cancer, Leo, Virgo, Libra, Scorpio, Sagittarius, Capricorn, Aquarius, Pisces."
            self.bot.reply_to(message, response)
    
    def run(self):
        self.bot.polling()
        
    def stop(self):
        self.bot.stop_polling()
        self.cur.close()
        self.conn.close()

bot = HoroscopeBot(token='token', db_host='localhost', db_name='horoscope', db_user='postgres', db_pass='mercytop38')
bot.run()