# Blog Post Flask MySQL

A lightweight blog application built with Flask, MySQL, Bootstrap 4, and Jinja templates. It allows users to register, log in, create blog posts, edit them, and read articles in a clean dashboard-driven interface.

This project includes a complete local development setup with Docker Compose, a Heroku deployment setup, and Kubernetes/Helm manifests for deployment experimentation.

## Features

- User registration and login flow
- Secure password hashing with Passlib / sha256_crypt
- Dashboard for managing blog posts
- CRUD support for articles
- Bootstrap-based responsive UI
- MySQL-backed persistence
- Docker Compose for local runtime
- Kubernetes and Helm deployment manifests
- Heroku-ready Procfile

## Tech Stack

- Python 3.9+
- Flask 1.1.2
- Flask-SQLAlchemy 2.4.4
- MySQL
- Bootstrap 4
- WTForms
- Docker / Docker Compose
- Kubernetes / Helm

## Repository Structure

```text
.
├── app.py                     # Flask application entry point
├── models.py                 # Database models and ORM configuration
├── requirements.txt          # Python dependencies
├── Dockerfile                # Container build for the Flask app
├── docker-compose.yml        # Local stack definition for Flask + MySQL
├── .env                      # Default environment variables
├── Procfile                  # Heroku runtime command
├── query/
│   └── init.sql             # MySQL schema initialization for the app
├── templates/               # HTML templates
├── static/                  # CSS, JS, images, and frontend assets
├── k8s/                     # Basic Kubernetes deployment manifests
├── helm/                    # Helm chart for deployment
├── README.md                # Project documentation
├── LICENSE                  # Project license
├── articles.db              # Local SQLite DB artifact (legacy/optional)
└── .gitignore
```

## Application Overview

The app exposes a simple blog experience:

- Home page with landing content and article discovery
- Articles list page
- Individual article view page
- User dashboard for article management
- Login and registration forms

The Flask application connects to a MySQL database named `flask_articles` and stores users and posts in separate tables.

## Prerequisites

Before running locally, make sure you have:

- Python 3.9+
- pip
- MySQL Server (or Docker)
- Virtual environment support
- Docker and Docker Compose (recommended for the full stack)

## Local Development Setup

### 1. Clone the project

```bash
git clone https://github.com/thananauto/blogs-post-flask-mysql.git
cd blogs-post-flask-mysql
```

### 2. Create and activate a virtual environment

```bash
python3 -m venv venv
source venv/bin/activate   # Linux/macOS
# or
venv\Scripts\activate      # Windows
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Configure environment variables

The app expects these variables to be available:

```bash
export MYSQL_USER=root
export MYSQL_PASSWORD=password
export MYSQL_HOST=localhost
export SECRET_KEY=secret
```

A default `.env` file is included in the repository and is used by Docker Compose.

### 5. Start MySQL

If you are not using Docker Compose, start a MySQL instance locally and create the `flask_articles` database.

The schema is provided in `query/init.sql`.

### 6. Initialize the database

From a Python shell:

```bash
python - <<'PY'
from app import app, db
with app.app_context():
    db.create_all()
print('Database tables created.')
PY
```

### 7. Run the Flask app

```bash
FLASK_DEBUG=1 flask run
```

Then open:

```text
http://localhost:5000
```

## Running with Docker Compose

This is the easiest way to run the full stack locally.

```bash
docker-compose up --build
```

This starts:

- Flask app on port `8000`
- MySQL on port `3306`
- DB initialization from `query/init.sql`

The app is exposed at:

```text
http://localhost:8000
```

## Environment Variables

The app reads the following values from the environment:

| Variable | Default | Purpose |
| --- | --- | --- |
| `MYSQL_USER` | `root` | MySQL username |
| `MYSQL_PASSWORD` | `password` | MySQL password |
| `MYSQL_HOST` | `localhost` | MySQL host |
| `SECRET_KEY` | required | Flask session signing key |

The repository includes a `.env` example for Docker Compose usage.

## Database Schema

The application uses two main tables:

- `users`
  - `id`
  - `name`
  - `username` (unique)
  - `email`
  - `password`
  - `pub_date`

- `articles`
  - `id`
  - `title`
  - `author`
  - `body`
  - `pub_date`

## Heroku Deployment

This project includes a `Procfile` for Heroku deployment:

```procfile
web: gunicorn app:app
```

Typical Heroku setup:

```bash
heroku create
heroku config:set SECRET_KEY=your-secret-key MYSQL_USER=root MYSQL_PASSWORD=your-password MYSQL_HOST=your-db-host
git push heroku main
```

## Kubernetes and Helm

The repository contains both plain Kubernetes manifests under `k8s/` and a Helm chart under `helm/`.

### Helm deployment example

```bash
helm install my-blog ./helm --values ./helm/dev-values.yaml
```

### Kubernetes manifests

```bash
kubectl apply -f k8s/
```

These manifests provision:

- Flask deployment
- MySQL deployment
- Services for Flask and MySQL
- ConfigMaps for environment variables
- Persistent volume claims for database storage

## Default Login Credentials

The seed SQL includes sample users, including:

- Username: `admin`
- Password: `admin123` or the value stored in the SQL seed data if you are using the repository default initialization

Check `query/init.sql` for the exact seeded user data.

## Notes

- The application uses `Flask-SQLAlchemy` and expects a valid MySQL connection before the routes are used.
- The original project includes both Docker and Kubernetes deployment assets intended for experimentation or introductory DevOps demos.
- Some files in the repo are legacy or educational in nature and may need minor adjustments depending on your environment.

## License

This project is licensed under the GNU General Public License v3.0.

## Contributing

Contributions are welcome. To propose changes:

```bash
git checkout -b feature/my-change
git commit -am "Add my change"
git push origin feature/my-change
```

## Project Status

This repository is a working blog application prototype designed for learning, local deployment, and demonstration purposes.

