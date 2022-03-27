/* Initial beliefs and rules */

//Please register here for using the Phantom X Robot: https://app.swaggerhub.com/apis-docs/iomz/leubot/1.2#/user/addUser
api_key("API-KEY").
td_url("http://yggdrasil.interactions.ics.unisg.ch/environments/61/workspaces/102/artifacts/leubot1").

//Check the default, lower and upper limits of the PhantomX joint parameters: https://github.com/Interactions-HSG/leubot
sourceAngle(512). // ~180 degrees angle
targetAngle(256). // ~90 degrees angle

/* Initial goals */

!start.

/* Plans */

+!start : td_url(Url) <-
  .print("hello world.");
  makeArtifact("leubot1", "ch.unisg.ics.interactions.jacamo.artifacts.wot.ThingArtifact", [Url, true], ArtId);
  .print("Robot arm artifact created!");
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
  .print(Values).

+!interval : true <- .wait(3000).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
