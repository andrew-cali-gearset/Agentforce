@isTest
public class MetersToFeetConverterTest {
    @isTest
    static void testConvertMetersToFeet() {
        // Test with a known value
        Decimal meters = 1;
        Decimal expectedFeet = 3.28084;
        Decimal actualFeet = MetersToFeetConverter.convertMetersToFeet(meters);
        System.assertEquals(expectedFeet, actualFeet, 'Conversion from meters to feet is incorrect.');

        // Test with zero meters
        meters = 0;
        expectedFeet = 0;
        actualFeet = MetersToFeetConverter.convertMetersToFeet(meters);
        System.assertEquals(expectedFeet, actualFeet, 'Conversion from meters to feet is incorrect for zero meters.');

        // Test with a negative value
        meters = -5;
        expectedFeet = -16.4042;
        actualFeet = MetersToFeetConverter.convertMetersToFeet(meters);
        System.assertEquals(expectedFeet, actualFeet, 'Conversion from meters to feet is incorrect for negative meters.');

        // Test with a fractional value
        meters = 2.5;
        expectedFeet = 8.2021;
        actualFeet = MetersToFeetConverter.convertMetersToFeet(meters);
        System.assertEquals(expectedFeet, actualFeet, 'Conversion from meters to feet is incorrect for fractional meters.');
    }

    @isTest
    static void testConvertMetersToFeetWithNull() {
        // Test with null value
        try {
            MetersToFeetConverter.convertMetersToFeet(null);
            System.assert(false, 'Exception should have been thrown for null value.');
        } catch (IllegalArgumentException e) {
            System.assertEquals('The meters value cannot be null.', e.getMessage(), 'Incorrect exception message for null value.');
        }
    }
}