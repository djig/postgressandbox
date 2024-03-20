FROM gitpod/workspace-full

USER gitpod

# Install PostgreSQL
RUN sudo apt-get update && \
    sudo apt-get install -y postgresql postgresql-contrib && \
    sudo service postgresql start && \
    sudo -u postgres psql -c "CREATE USER gitpod WITH SUPERUSER PASSWORD 'gitpod';" && \
    sudo -u postgres createdb gitpod

# Set up the initial database schema, roles, etc. (Optional)
RUN ./init-db.sh

# Make sure the PostgreSQL service starts automatically
RUN echo 'sudo service postgresql start' >> ~/.bashrc
