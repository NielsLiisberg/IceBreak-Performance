# url  http://my_ibm_i:60800
from locust import HttpUser, task

class mdrest4iuser(HttpUser):

    @task
    def environment1(self):
        self.client.post(
              url="/api/patient/readPatient?AEAFCD=PAT2"
            )