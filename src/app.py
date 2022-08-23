from pyspark.sql import SparkSession
from pyspark.sql.functions import *

spark = SparkSession \
    .builder \
    .appName("StreamingApp") \
    .config("spark.streaming.stopGracefullyOnShutdown", "true") \
    .config("spark.sql.shuffle.partitions", 3) \
    .getOrCreate()


def main():

    lines_df = spark.readStream \
    .format("socket") \
    .option("host", "localhost") \
    .option("port", "9095") \
    .load()

    words_df = lines_df.select(expr("explode(split(value,' ')) as word"))
    counts_df = words_df.groupBy("word").count()

    word_count_query = counts_df.writeStream \
        .format("console") \
        .outputMode("complete") \
        .option("checkpointLocation", "chk-point-dir") \
        .start()

    word_count_query.awaitTermination()


if __name__ == "__main__":
    main()
