package practice.utility;

import com.github.javafaker.Faker;

import java.util.LinkedHashMap;
import java.util.Map;

public class PeopleUtility {

    public static Map<String,Object> getRandomPeopleMapBody(){
        /**
         * Having utility method, so we can just call a method as below
         * 1. create a class under utility package with name PeopleUtility
         * 2. create a public static method with return type of Map<String, Object>
         * 3. add above code you already wrote for method body and return the bodyMap from the method
         * 4. call the method here to get the random body
         */
        Map<String,Object> bodyMap=new LinkedHashMap<>();
        Faker faker =new Faker();

        bodyMap.put("name",faker.name().firstName());
        bodyMap.put("gender",faker.demographic().sex());//Male or Female
        bodyMap.put("age",faker.number().numberBetween(0, 120));

        return bodyMap;
    }


}
