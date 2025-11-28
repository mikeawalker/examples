from dagger import dag, function, object_type
import random 
import time 
import asyncio 
@object_type
class Batches:
   
    @function
    async def lots_of_math_good ( self, n: int ) -> list[float]:
        # This function will properly cache individual calls to mymath.risky_add 
        # calling risky_add via 'dag' enforces that the call gets added to the dagger graph
        tasks = [ dag.mathops().risky_add( 2+.2, k+.1) for k in range(n) ]
        results = await asyncio.gather( *tasks, return_exceptions=True )
        return results  


    @function
    def risky_add(self, a: float , b: float ) -> float:

        x = random.random() 
        time.sleep(10)
        if x < 0.5:
            raise ValueError( f"FAIL {x}")
        return a+b
    @function
    async def lots_of_math_bad ( self, n: int ) -> list[float]:
        x=[]
        for k in range(n ): 
            # These calls **will not be cached* 
            # Since we just call this as a normal function it **does not** get added to the dagger call graph 
            o =await self.risky_add( 2.2 , k+.1 )
            x.append( o )
        return x 
