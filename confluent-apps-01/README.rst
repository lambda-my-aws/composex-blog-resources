====================
Confluent Apps
====================

connect-cluster
===============

The connect cluster that we deploy in our AWS environment to deploy a connect cluster.


control-center
==============

The control center allows to have a GUI which allows developers and administrators to interact with the kafka and connect
clusters.
The control center is deployed behind a load-balancer (ALB) which allows remote access. There is only 1 container running and
we do not need more than that.


Secrets management
==================

The secrets management is handled in the exact same way as for any other applications, however, the schema changes based
on what the applications need. Use the templates accordingly.


Deployment
===========

AWS ECS
--------

All services are deployed in AWS ECS using AWS Fargate for compute provisioning.
In nonprod environments, they are on a 2:1 ratio between FARGATE and FARGATE_SPOT.

Deploying using composex
-------------------------


.. code-block:: bash

   python -m venv venv
   source venv/bin/activate
   pip install pip -U
   pip install ecs_composex>=0.8.9
   # AWS_PROFILE is the name of the profile you have authed in using SSO.
   # When running from codebuild or else, this does not need to be specified.
   # ENV_NAME can be one of dev, stg or prod.
   ENV_NAME=dev ecs-composex up -n kafka--confluent-apps-${ENV_NAME} -f docker-compose.yml -envs/${ENV_NAME}.yml


.. warning::

   There can only be one Control Center running presently per Kafka cluster, or you need to assign random IDs to these.
