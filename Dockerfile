FROM postgres
COPY ./data/database.sql /docker-entrypoint-initdb.d/
EXPOSE 5432
CMD ["postgres"]
