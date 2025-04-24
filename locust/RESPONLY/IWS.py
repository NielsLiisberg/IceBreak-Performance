import time
from locust import HttpUser, task
## command to run in terminal:
## locust --host=http://dev.mdcms.ch:2598 --locustfile IWS.py

class mdrest4iuser(HttpUser):

    @task
    def environment1(self):
        self.client.post(
              url="http://dev.mdcms.ch:2598/web/services/workloadSleep/workloadSleep"
            )