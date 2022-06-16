/* Initial beliefs and rules */

// Please register here for using the Phantom X Robot: https://interactions.ics.unisg.ch/leubot
// Then add you API key below. *Note:* To use the robot, make sure that the dry run flag for ThingArtifacts
// is set to false. ThingArtifacts are instantiated on line 27 of inc/hypermedia.asl
api_key("API-KEY").
env_url("https://yggdrasil.interactions.ics.unisg.ch/environments/61").

//Check the default, lower and upper limits of the PhantomX joint parameters: https://github.com/Interactions-HSG/leubot
sourceAngle(512). // ~180 degrees angle
targetAngle(256). // ~90 degrees angle

/* Initial goals */

!start.

/* Plans */

+!start : env_url(Url) <-
  .print("hello world.");
  makeArtifact("notification-server", "ch.unisg.ics.interactions.jacamo.artifacts.yggdrasil.NotificationServerArtifact", ["localhost", 8081], _);
  start;
  !load_environment("building-61", Url);
  .wait(2000);
  !moveBlock.

+!moveBlock : true <-
  .print("Set API token");
  !setAuthentication;
  !deliver.

+!setAuthentication : api_key(Token) <-
  setAPIKey(Token)[artifact_name("leubot1")].

+!deliver : sourceAngle(Source) & targetAngle(Target) <-
  .print("Set base to " , Source);
  invokeAction("https://ci.mines-stetienne.fr/kg/ontology#SetBase", ["https://www.w3.org/2019/wot/json-schema#IntegerSchema"], [Source])[artifact_name("leubot1")];
  !interval;
  .print("Set gripper to 512");
  invokeAction("https://ci.mines-stetienne.fr/kg/ontology#SetGripper", ["https://www.w3.org/2019/wot/json-schema#IntegerSchema"], [512])[artifact_name("leubot1")];
  !interval;
  .print("Set wrist angle to 390");
  invokeAction("https://ci.mines-stetienne.fr/kg/ontology#SetWristAngle", ["https://www.w3.org/2019/wot/json-schema#IntegerSchema"], [390])[artifact_name("leubot1")];
  !interval;
  .print("Set shoulder to 510");
  invokeAction("https://ci.mines-stetienne.fr/kg/ontology#SetShoulder", ["https://www.w3.org/2019/wot/json-schema#IntegerSchema"], [510])[artifact_name("leubot1")];
  !interval;
  .print("Set gripper to 400");
  invokeAction("https://ci.mines-stetienne.fr/kg/ontology#SetGripper", ["https://www.w3.org/2019/wot/json-schema#IntegerSchema"], [400])[artifact_name("leubot1")];
  !interval;
  .print("Set shoulder to 400");
  invokeAction("https://ci.mines-stetienne.fr/kg/ontology#SetShoulder", ["https://www.w3.org/2019/wot/json-schema#IntegerSchema"], [400])[artifact_name("leubot1")];
  !interval;
  .print("Set base to " , Target);
  invokeAction("https://ci.mines-stetienne.fr/kg/ontology#SetBase", ["https://www.w3.org/2019/wot/json-schema#IntegerSchema"], [Target])[artifact_name("leubot1")];
  !interval;
  .print("Set shoulder to 510");
  invokeAction("https://ci.mines-stetienne.fr/kg/ontology#SetShoulder", ["https://www.w3.org/2019/wot/json-schema#IntegerSchema"], [510])[artifact_name("leubot1")];
  !interval;
  .print("Set gripper to 512");
  invokeAction("https://ci.mines-stetienne.fr/kg/ontology#SetGripper", ["https://www.w3.org/2019/wot/json-schema#IntegerSchema"], [512])[artifact_name("leubot1")];
  !interval;
  .print("Set gripper to 400");
  invokeAction("https://ci.mines-stetienne.fr/kg/ontology#SetShoulder", ["https://www.w3.org/2019/wot/json-schema#IntegerSchema"], [400])[artifact_name("leubot1")];
  !interval;
  invokeAction("https://ci.mines-stetienne.fr/kg/ontology#Reset", [])[artifact_name("leubot1")];

  readProperty("https://ci.mines-stetienne.fr/kg/ontology#Posture", Types , Values)[artifact_name("leubot1")];
  .print(Types);
  .print(Values).

+!interval : true <- .wait(3000).

{ include("inc/hypermedia.asl") }
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
