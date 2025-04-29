public class MetersToFeetConverter {
    // Constant for conversion factor from meters to feet
    private static final Decimal METERS_TO_FEET_CONVERSION_FACTOR = 3.28084;

    // Method to convert meters to feet
    public static Decimal convertMetersToFeet(Decimal meters) {
        if (meters == null) {
            throw new IllegalArgumentException('The meters value cannot be null.');
        }
        return meters * METERS_TO_FEET_CONVERSION_FACTOR;
    }
}