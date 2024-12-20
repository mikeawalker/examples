# counter.py 
import time 
print("A")
from scipy import spatial # remove me and all is good ! ??? 
print("B")



def main( ):
    k = 0


    print("started")
    while( True ):
        print( f"Step {k}" )
        time.sleep( 2 )  
        k += 1   


if __name__ == "__main__":
    main() 