kafka-pkg-setup:
  pkgrepo.managed:
    - name: deb [arch=amd64] https://packages.confluent.io/deb/6.0 stable main
    - file: /etc/apt/sources.list.d/kafka.list
    - key_url: http://packages.confluent.io/deb/6.0/archive.key
    - require_in:
      - pkg: confluent-kafka

  pkg.installed:
    - name: confluent-kafka
    - refresh: True

kafka-user:
  user.present:
    - name: kafka
    - shell: /bin/false
    - gid_from_name: True
    - createhome: False
    - system: True

/var/log/kafka:
  file.directory:
    - user: kafka
    - group: kafka
