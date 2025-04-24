# url  http://my_ibm_i:60800

from locust import HttpUser, task

class echoPlusOne (HttpUser):
    @task
    def echo_plus_one(self):
        self.client.get("/index.html") 
