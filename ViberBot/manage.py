from flask import Flask
from flask_script import Manager
from flask_migrate import Migrate, MigrateCommand
from database import db

app = Flask(__name__)
app.config.from_object('ViberBot.config.config')
db.init_app(app)

migrate = Migrate(app, db)

manager = Manager(app)
manager.add_command('db', MigrateCommand)

if __name__ == '__main__':
    manager.run()
