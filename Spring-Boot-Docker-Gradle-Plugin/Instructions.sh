$ ./gradlew --stop
Stopping Daemon(s)
2 Daemons stopped

$ ./gradlew clean build
Starting a Gradle Daemon, 4 stopped Daemons could not be reused, use --status for details
Java HotSpot(TM) 64-Bit Server VM warning: Sharing is only supported for boot loader classes because bootstrap classpath has been appended

[Incubating] Problems report is available at: file:///home/shrikant/Workspace/Docker/docker/Spring-Boot-Docker-Gradle-Plugin/build/reports/problems/problems-report.html

Deprecated Gradle features were used in this build, making it incompatible with Gradle 9.0.

You can use '--warning-mode all' to show the individual deprecation warnings and determine if they come from your own scripts or plugins.

For more on this, please refer to https://docs.gradle.org/8.14.3/userguide/command_line_interface.html#sec:command_line_warnings in the Gradle documentation.

BUILD SUCCESSFUL in 11s

$  ./gradlew bootJar

[Incubating] Problems report is available at: file:///home/shrikant/Workspace/Docker/docker/Spring-Boot-Docker-Gradle-Plugin/build/reports/problems/problems-report.html

Deprecated Gradle features were used in this build, making it incompatible with Gradle 9.0.

You can use '--warning-mode all' to show the individual deprecation warnings and determine if they come from your own scripts or plugins.

For more on this, please refer to https://docs.gradle.org/8.14.3/userguide/command_line_interface.html#sec:command_line_warnings in the Gradle documentation.

BUILD SUCCESSFUL in 7s
3 actionable tasks: 3 executed


$ ./gradlew bootBuildImage