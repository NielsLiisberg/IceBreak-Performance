# url  http://MY_IBM_I:10019/web/services/CNVRTTMP/temperature/100

from locust import HttpUser, task

class indexhtml (HttpUser):
    @task
    def index_html(self):
        self.client.get("/web/services/CNVRTTMP/temperature/100") 
