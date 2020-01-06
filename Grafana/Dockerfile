FROM grafana/grafana

ENV GF_SERVER_DOMAIN=kvm1
ENV GF_PATHS_PROVISIONING=conf/provisioning

ENV GF_AUTH_ANONYMOUS_ENABLED=true
ENV GF_AUTH_ANONYMOUS_ORG_ROLE=Admin
ENV GF_AUTH_BASIC_ENABLED=false
ENV GF_AUTH_DISABLE_LOGIN_FORM=true

ENV GF_USERS_VIEWERS_CAN_EDIT=true
ENV GF_USERS_EDITORS_CAN_ADMIN=true

ADD datasource.yml conf/provisioning/datasources/all.yml
ADD dashboard.yml conf/provisioning/dashboards/all.yml
ADD dashboard.default /var/lib/grafana/dashboards/default.json
