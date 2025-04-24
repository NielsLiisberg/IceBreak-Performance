import time
from locust import HttpUser, task
## command to run in terminal:
## locust --host=http://dev.mdcms.ch:2588 --locustfile Linux-eu-MDFASTCGi.py

class mdrest4iuser(HttpUser):

    @task
    def environment1(self):
        self.client.get("/"
            )