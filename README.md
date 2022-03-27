# Hello JaCaMo-hypermedia!

This is a sample "hello world" project using the [jacamo-hypermedia](https://github.com/Interactions-HSG/jacamo-hypermedia/tree/feature/jitpack) library.

Some notes:
- the sample project contains an [operator_agent](src/agt/operator_agent.asl) that uses a robotic arm provided by the [Interactions-HSG](https://interactions.ics.unisg.ch/); **note**: using the actual device would require an API key, by default the HTTP requests are mocked (see L4 and L19 in [operator_agent.asl](src/agt/operator_agent.asl); the second parameter used in the artifact initialization on L19 is a "dry run" flag)
- the device used in the sample project is a [PhantomX Reactor Robot](https://www.trossenrobotics.com/p/phantomx-ax-12-reactor-robot-arm.aspx)
- the agent operates the robot based on a [W3C Web of Things (WoT) Thing Description (TD)](https://www.w3.org/TR/wot-thing-description/); the WoT TD is retrieved from an [Yggdrasil](https://github.com/interactions-hsg/yggdrasil) node hosted by Interactions-HSG: http://yggdrasil.interactions.ics.unisg.ch/environments/61/workspaces/102/artifacts/leubot1
- to operate the robotic arm based on the above WoT TD, the operator agent uses a `ThingArtifact` provided by the [jacamo-hypermedia](https://github.com/Interactions-HSG/jacamo-hypermedia/tree/feature/jitpack) library;
- the project uses [JitPack](https://jitpack.io/) to manage the dependency to [jacamo-hypermedia](https://github.com/Interactions-HSG/jacamo-hypermedia/tree/feature/jitpack) (see [build.gradle](build.gradle) for details).

To run the project, use the Gradle wrapper appropriate to your OS and run the default task. On MacOS and Linux:

```
./gradlew
```