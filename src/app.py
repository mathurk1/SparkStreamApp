from pyspark.sql import SparkSession
import pandas as pd

spark = SparkSession.builder.appName("SimpleApp").getOrCreate()


def main():
    columns = ["language","users_count"]
    data = [("Java", "20000"), ("Python", "100000"), ("Scala", "3000")]

    df = spark.createDataFrame(data).toDF(*columns)

    print(df.take(5))


if __name__ == "__main__":
    main()
