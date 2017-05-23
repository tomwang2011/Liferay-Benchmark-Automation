#!/bin/sh
ANT_OPTS="-server -Xverify:none -XX:NewSize=128m -XX:MaxNewSize=256m -Xms1024m -Xmx3g -XX:+UseParallelOldGC -XX:SurvivorRatio=65536 -XX:TargetSurvivorRatio=0 -XX:MaxTenuringThreshold=0 -XX:+DisableExplicitGC -Xss2m -XX:PermSize=100m -XX:MaxPermSize=256m"
JAVA_HOME=/opt/jvms/default_jdk
ANT_HOME=/opt/ant
MAVEN_HOME=/opt/maven
PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$MAVEN_HOME/bin:/home/zsyxc/localwork/bin:$GIT_CORE:$ASPECTJ_HOME/bin:$PATH

export JAVA_HOME ANT_HOME MAVEN_HOME ANT_OPTS PATH

cd /home/trunks/git/liferay-benchmark-ee

cp -R /home/trunks/git/benchmark-ext-mb.properties ./benchmark-ext.properties

ant all-database -Dskip.build.portal=true
ant stop reload-warmup-database all-portal start-visualvm all-grinder all-sample stop -Dskip.build.portal=true

#ant profile-cpu-tracing
#ant profile-memory-profile

#ant all-sql-log -Dskip.build.portal=true

#ant stop reload-warmup-database all-portal start-visualvm all-grinder all-sample stop -Dskip.build.portal=true -Dsample.heap.enabled=true -Dsample.heap.liveonly=true
#ant stop reload-warmup-database all-portal start-visualvm all-grinder all-sample stop -Dskip.build.portal=true
#ant stop reload-warmup-database all-portal start-visualvm all-grinder all-sample stop -Dskip.build.portal=true -Dwith.cpu.sampling=true
