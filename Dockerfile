FROM python:3.8-slim-buster

RUN mkdir /mlh-blog
COPY requirements.txt /mlh-blog
WORKDIR /mlh-blog
RUN pip3 install -r requirements.txt

COPY . /mlh-blog/

CMD ["gunicorn", "wsgi:app", "-w 4", "-b 0.0.0.0:80"]

#RUN chmod u+x ./entrypoint.sh
#ENTRYPOINT ["sh", "./entrypoint.sh"]