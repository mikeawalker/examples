import my_package.example as E 



def test_vector_add( ):
    a = [ 1, 2,  3 ]
    b = [4,5,6]
    c = E.vector_sum( a,b )
    assert c == [5,7,9]

