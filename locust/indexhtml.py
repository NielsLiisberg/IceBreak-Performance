# url  http://my_ibm_i:60800

from locust import HttpUser, task

class indexhtml (HttpUser):
    @task
    def index_html(self):
        self.client.get("/index.html") 
