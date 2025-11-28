import dagger
from dagger import dag, function, object_type
import time 
import random 
@object_type
class Mathops:
    @function
    def risky_add(self, a: float , b: float ) -> float:
        # This function is designed to fail 50% of the time
        # This function is designed to take significant time to execute (10s)
        # THis function is used to show how we can cache success's of 'expensive' operations 
        x = random.random() 
        time.sleep(10)
        if x < 0.5:
            raise ValueError( f"FAIL {x}")
        return a+b