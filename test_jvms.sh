#!/bin/bash

source "$HOME/.sdkman/bin/sdkman-init.sh"

# Set the path to your Java code snippet
JAVA_CODE_PATH="Compute"

# Set the number of iterations
NUM_ITERATIONS=1000

# List of JVM versions to test
JVM_VERSIONS=("8.0.392-amzn" "11.0.21-amzn" "17.0.9-amzn" "21.0.1-amzn" "17.0.9-graalce" "21.0.1-graalce" "17.0.9-oracle" "21.0.1-oracle" "21.ea.35-open" "22.ea.29-open" "23.ea.3-open")

# Variables to track discrepancies
TOTAL_DISCREPANCIES=0

# Iterate through JVM versions
for JVM_VERSION in "${JVM_VERSIONS[@]}"; do
    echo "Testing with JVM version: $JVM_VERSION"

    # Install and use the specified JVM version
    sdk install java "$JVM_VERSION" -y
    sdk use java "$JVM_VERSION"

    # Compile Java code
    javac "$JAVA_CODE_PATH.java"

    # Variables to track discrepancies for the current JVM version
    JVM_DISCREPANCIES=0

    # Run the code multiple times
    for ((i=1; i<=$NUM_ITERATIONS; i++)); do
        echo "Iteration $i"
        OUTPUT=$(java "${JAVA_CODE_PATH}")
        echo "Output:$OUTPUT"

        if [ "$OUTPUT" != "11102122" ]; then
            ((JVM_DISCREPANCIES++))
        fi
    done

    # Summarize discrepancies for the current JVM version
    echo "Discrepancies for $JVM_VERSION: $JVM_DISCREPANCIES"
    ((TOTAL_DISCREPANCIES += JVM_DISCREPANCIES))

    # Clean up
    rm "$JAVA_CODE_PATH.class"
done

# Summarize total discrepancies
echo "Total Discrepancies Across All JVM Versions: $TOTAL_DISCREPANCIES"
