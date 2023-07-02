from faker import Faker
import json
import random

fake=Faker()

def create_stream():

    first_name=fake.first_name()
    last_name=fake.last_name()
    address=fake.address()
    email=fake.email()
    credit_no=fake.credit_card_number()
    company=fake.company()
    quantity=fake.random_digit_not_null_or_empty()
    price=random.randint(50000,1000000)
    producer_data={'first_name':first_name,'last_name':last_name,'address':address,'email':email,
                'credit_no':credit_no,'company':company,'quantity':quantity,'price':price}
                    
    return json.dumps(producer_data)

