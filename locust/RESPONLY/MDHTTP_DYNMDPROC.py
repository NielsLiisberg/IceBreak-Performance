import time
from locust import HttpUser, task
## command to run in terminal:
## locust --host=http://dev.mdcms.ch:2578 --locustfile MDHTTP_MDPROC.py

class mdrest4iuser(HttpUser):

    @task
    def environment1(self):
        self.client.post(
              url="http://dev.mdcms.ch:2578/noxprcapi/CVSPOC/dbpatient/workloadSleep"
            )