

import ch.qos.logback.classic.encoder.PatternLayoutEncoder
import ch.qos.logback.core.ConsoleAppender
import ch.qos.logback.core.FileAppender

import static ch.qos.logback.classic.Level.INFO

appender("STDOUT", ConsoleAppender) {
    encoder(PatternLayoutEncoder) {
        pattern = "%d{HH:mm:ss.SSS} [%thread] %-5level %logger{5} Groovy - %msg%n"
    }
}

appender("FILE", FileAppender) {
    file = 'logs/general.log'
    encoder(PatternLayoutEncoder) {
        pattern = "%d{HH:mm:ss.SSS} [%thread] %-5level %logger{5} Groovy - %msg%n"
    }
}

root(INFO, ["FILE", "STDOUT"])