#!/bin/bash
sudo apt -y update
sudo apt  install -y docker.io
sudo chmod 660 /var/run/docker.sock
sudo usermod -a -G docker ubuntu
sudo newgrp docker
mkdir -p /home/ubuntu/jcasc
ssh-keyscan ${JNODE_IP} > /home/ubuntu/jcasc/known_hosts
ssh-keyscan ${PROD_IP} > /home/ubuntu/jcasc/known_hosts
my_public_ip=$(curl https://checkip.amazonaws.com)



cat <<EOF> /home/ubuntu/jcasc/plugins.txt
ant:475.vf34069fef73c
branch-api:2.1046.v0ca_37783ecc5
build-timeout:1.21
command-launcher:84.v4a_97f2027398
credentials-binding:523.vd859a_4b_122e6
display-url-api:2.3.6
git:4.11.4
git-client:3.11.2
github:1.34.5
github-api:1.303-400.v35c2d8258028
github-branch-source:1677.v731f745ea_0cf
gradle:1.39.4
instance-identity:116.vf8f487400980
workflow-aggregator:590.v6a_d052e5a_a_b_5
pipeline-graph-analysis:195.v5812d95a_a_2f9
pipeline-model-definition:2.2114.v2654ca_721309
pipeline-github-lib:38.v445716ea_edda_
pipeline-input-step:449.v77f0e8b_845c4
pipeline-stage-view:2.24
sshd:3.249.v2dc2ea_416e33
ssh-agent:295.v9ca_a_1c7cc3a_a_
configuration-as-code:1512.vb_79d418d5fc8
font-awesome-api:6.1.1-1
authorize-project:1.4.0
ssh-slaves:1.834.v622da_57f702c
timestamper:1.18
javax-mail-api:1.6.2-7
jdk-tool:55.v1b_32b_6ca_f9ca
build-timeout:1.21
cloudbees-folder:6.758.vfd75d09eea_a_1
pipeline-github-lib:38.v445716ea_edda_
matrix-auth:3.1.5
pam-auth:1.8
job-dsl:1.81
matrix-project:785.v06b_7f47b_c631
antisamy-markup-formatter:2.7
locale:180.v207501dff9b_a_
EOF

cat <<EOF> /home/ubuntu/jcasc/casc.yaml
credentials:
  system:
    domainCredentials:
    - credentials:
      - usernamePassword:
            scope: "GLOBAL"
            id: "dockerHub-user"
            description: "Docker Hub User Credentials"
            username: ${DH_LOGIN}
            password: ${DH_TOKEN}
      - basicSSHUserPrivateKey:
          description: "deploy_dev"
          id: "deploy_dev"
          privateKeySource:
            directEntry:
              privateKey:
                -----BEGIN RSA PRIVATE KEY-----
                MIIJJwIBAAKCAgEAi9xcnHynZdpCLpZh5GunkC06tzUN4E7IZfF7YbJGebXvjv1f
                EsQtQRyqyXgm0Rw4vRRYjK99yElMO1REvSlmpdAjIUadjAG39+BdOMCfZSC9eUaP
                3SD3518+qLf1Bz18GDwoNYe3yohocF6846V4y1pJhuFWkaQ/lNef1ILQp3001Q97
                Z5SPontRX8JaGlBsLS4UbjtM5ukZhzG7zOEU1y7A7fKhvbj68PFDg0B0ycFLtkVD
                OaY3AdEN5s6JTrNLrXQ2vQhgY+ANr3IE72pr5vKTJoRQt5Uhw/or7Ob6XbUCYUrF
                pzd883LYfYgv04Fu1HXmgpNeRex/VnQmqLMurfGVrJzAWopLIeOl7cXAeoxK/eUS
                Ysh4c/hPpyevcvmi8tZHvXEQc5+hhS7hEnh6BXQR2Y3CMsA66TaroeMPLguGIiCu
                Ic5FKkPRbkiVktiQvbBdcmKauFsHbXmVDZa38PEUAaSH31sMUkKA50yVpdxh6IvV
                kvHhm/ZIkxCWnH4USf/cAorIa5fPcyOdI0ar6pQMMbeHXoCdZ8poVrzr9HxVW7Zh
                kAW0bzzk36qKYEEM3mxtthr0B/bf6joUZ/kOcHTTi46HdcbCj/sMhADBCfVA2RBq
                GU1ZFXcmmDp9axmMjAMSnM9QQx3s4o8vG3CmCewtCwiZveOwLWh/6JQIqmECAwEA
                AQKCAgAFyEMF7ztmgRsKXQpIDNFdKxmJ2IYt12P+nvi4Zcv3HTf9w+jp2DV8wygm
                czK7o3yPCKfOjTTYkns12rqKzYriYRQKvKYn0yxdcae5AHG2lx9uQ6YQANxu8uee
                xxg4x+h5Agexit5k37Xdq3UIvl8bnSx8CJXxKIa+axm/CfeBbTJBesXh1ukHUSzg
                liLugpOuXIDYu9fmlg2Jots+UbHwYYz1aXoZY2vwiTD+3KvXaYftTbjFSeNtTkzS
                VYikudHvpmXa8900U9+M+NxOX6p9XlsKFR9XL7G5Lf8h6LzCIgkqp5I7YxZl5EIi
                En7Tsj64RvWUQW582pW7J8svX1UXKUe2ofrpFyDRn8mcb4cHvJUP2mnuxJC+v/6s
                l2mOLPvncyAttURcxI+tTm2WGYLDb5IBgbsVcIztL1W140buoYRAH09juSa3FvMu
                euzG+80A2X/QxOmcnDAkSdaSUmMTqlpd9ZZxFb+iFKq1rsC0Cf8X3q1OB3cN9zmz
                r+PQHAEqWnH/C9Iwjq3ofgGLK+lPznZVmRYRWTNMqH7dguNdeJF6biTpIJYFE3Wa
                bPtRCLfLuNcspHTYYeTPHVu/n50+ynV08Halq4bkq83jUpu7YtSn+MFCQc3e+oGC
                6lfVv1xJnzbZxMElxo1+k8pxDNsQ10iGCK1dgpeDimwV8isHVwKCAQEAu6IyJXKL
                lAIYjsLSw9rKHWGVMzjo29mIyc6KfKN8QV0vxf8CD+CTzp9WJtYSdQ0hkKp2sayp
                z0F1ySvn7rad1By4IpJVtKGn6bRn4Xm1GL4xaGD5nRjrnxKQ6Q2d6or52uWWj2VC
                waRDDvdc5x8OsWUxxtm0qWbaayJkXMr797V5zsOEuxAz5gmmfDucip3rqs5WsK0S
                fOQ5WJkJhwTatbOnKj7D9bXRj3HKx7M8JFxkszt/ISzapQxA8COxMgcrELwXya78
                pFlubrh+e+9+npaScG96t/DojI3COQgL6nm6oC8JBcjItzN2PE1TfFtLrkgC1pk/
                IzkgPQq4h35oFwKCAQEAvtIWS+KcjVLu6ekts6tGLVwp9fG9tzCUqQ4eaGw7pBfN
                dC/mFz916K58Hn4fzCqFeAe3KbFeFLOPFhzUXQyny237udgM3S0BakqejnvSW1d4
                cI0BIqFy/q869FDPbzJkmS2V70HSY5QCgyiRlJ7oKu1roWUOENJM7QRdstnAklf6
                CXl6eXtt/Kc32ilvKl1LCbrxzfVrZ5PHnq/KhHn8omcIJxogV1Ccf5vQeQtjaXjs
                7oqOsLJ0EHlh8FYwlAUzj9BE9d+wP5mI2JHlQOFq+O9ERXFuD5uYKl+iYoP19ZPh
                66ehPbQGExT22u9OnF16s32jaTBtXwET4lEDbegURwKCAQBT4LkMFn2hB6LUxvET
                Ts5FficFg+5MwZ0toeA0wZy9V5wQpePVFy7cEkygBdiwbNNRaXKwEKDEnt25tZ/0
                DbzWYpRKGCKqIg3/In/Bwvea/QL3R0qu2MIUFWekV0r922zAVxwMNFc4W2cC3L+y
                LicSVEuBOjdR90Gy3OgCt1cWMBEoxiyityaMMkozhS6ApQICFEWaq3P1Uszz903U
                Bu6ChbI352EQiVwKBPOCfHRpSMhXe0RknzmKyMSK1VnUJHIzA/KaXVhhW/1LD7yz
                SKfQ2zzReHRioBZFJuXpOtig1BQCoaQl6tEXXLEBWgv1LpbRbS2fo1gfNd1cjFtb
                br23AoIBACqvTBWFh4eFebQRWQvL0FLtPuWpQcrsrxRx+BNbwqueN3M6E7o3k+SM
                w27+v5YoHNsQvsQwzN7Mm8FSiZ6W6iHzZE/aKGaBXsOsFXPB9vg/xM1IfWyFuPeH
                syRbv0scdqxdKiDvFGT6AuXb+VTJhx2zJlRgCplwsYyDYYJUe2NBEslzxxXNqnjN
                3wyKIDfVzqdKjjSIJZJx2EGDCUZBE2Ywrf4xNfLSMW/KJwQsq/w39KgXjnuwL45P
                2LyuSweRcktFR2fIteBEM/xeBm5Q/mDZBOiTyw7qu0sfQW/QHQDmJ69TPBpVXtZ9
                5gprZaZMstnbzOYG0zBhSVVi0eWP+JkCggEAeSoDoljFz45nfNKdRnmIfwvtawPj
                qziA5/HRa0Q1y4M/WKYLpdk/eAVbCqvzUBVT5RCqOh9Jx+cOEfws00d009Aw6F4n
                i/oN8968sZO2+3r3cdWsnXPq08X/aFkmDAz5fqBEJ8nUKzbzaJNRGClqAClKiniY
                od5jQzFXPKbUNinBK4s6XFwOWQl0l9cWcynA3I7ShjJ0j1H19N3NV++trKnD7Tl5
                CQlxvd9YDjBbZ/36AhdTftOAMId+Jaz9sd+Rd5oU4N+HXiN/DBsPs5+LGS8D/QVf
                +Kk8mB7n7QapQrrN20wXqa+zBSZ/GcHUYz6BmOc8ikOf1PGUO4pcbr80vw==
                -----END RSA PRIVATE KEY-----
          scope: GLOBAL
          username: "ubuntu"
      - string:
           description: "GitHub-token"
           id: "GitHub-token"
           scope: GLOBAL
           secret: ${GH_TOKEN}
      - basicSSHUserPrivateKey:
          description: "jenkins_worker_node"
          id: "j_worker"
          privateKeySource:
            directEntry:
              privateKey:
                -----BEGIN RSA PRIVATE KEY-----
                MIIJJwIBAAKCAgEAi9xcnHynZdpCLpZh5GunkC06tzUN4E7IZfF7YbJGebXvjv1f
                EsQtQRyqyXgm0Rw4vRRYjK99yElMO1REvSlmpdAjIUadjAG39+BdOMCfZSC9eUaP
                3SD3518+qLf1Bz18GDwoNYe3yohocF6846V4y1pJhuFWkaQ/lNef1ILQp3001Q97
                Z5SPontRX8JaGlBsLS4UbjtM5ukZhzG7zOEU1y7A7fKhvbj68PFDg0B0ycFLtkVD
                OaY3AdEN5s6JTrNLrXQ2vQhgY+ANr3IE72pr5vKTJoRQt5Uhw/or7Ob6XbUCYUrF
                pzd883LYfYgv04Fu1HXmgpNeRex/VnQmqLMurfGVrJzAWopLIeOl7cXAeoxK/eUS
                Ysh4c/hPpyevcvmi8tZHvXEQc5+hhS7hEnh6BXQR2Y3CMsA66TaroeMPLguGIiCu
                Ic5FKkPRbkiVktiQvbBdcmKauFsHbXmVDZa38PEUAaSH31sMUkKA50yVpdxh6IvV
                kvHhm/ZIkxCWnH4USf/cAorIa5fPcyOdI0ar6pQMMbeHXoCdZ8poVrzr9HxVW7Zh
                kAW0bzzk36qKYEEM3mxtthr0B/bf6joUZ/kOcHTTi46HdcbCj/sMhADBCfVA2RBq
                GU1ZFXcmmDp9axmMjAMSnM9QQx3s4o8vG3CmCewtCwiZveOwLWh/6JQIqmECAwEA
                AQKCAgAFyEMF7ztmgRsKXQpIDNFdKxmJ2IYt12P+nvi4Zcv3HTf9w+jp2DV8wygm
                czK7o3yPCKfOjTTYkns12rqKzYriYRQKvKYn0yxdcae5AHG2lx9uQ6YQANxu8uee
                xxg4x+h5Agexit5k37Xdq3UIvl8bnSx8CJXxKIa+axm/CfeBbTJBesXh1ukHUSzg
                liLugpOuXIDYu9fmlg2Jots+UbHwYYz1aXoZY2vwiTD+3KvXaYftTbjFSeNtTkzS
                VYikudHvpmXa8900U9+M+NxOX6p9XlsKFR9XL7G5Lf8h6LzCIgkqp5I7YxZl5EIi
                En7Tsj64RvWUQW582pW7J8svX1UXKUe2ofrpFyDRn8mcb4cHvJUP2mnuxJC+v/6s
                l2mOLPvncyAttURcxI+tTm2WGYLDb5IBgbsVcIztL1W140buoYRAH09juSa3FvMu
                euzG+80A2X/QxOmcnDAkSdaSUmMTqlpd9ZZxFb+iFKq1rsC0Cf8X3q1OB3cN9zmz
                r+PQHAEqWnH/C9Iwjq3ofgGLK+lPznZVmRYRWTNMqH7dguNdeJF6biTpIJYFE3Wa
                bPtRCLfLuNcspHTYYeTPHVu/n50+ynV08Halq4bkq83jUpu7YtSn+MFCQc3e+oGC
                6lfVv1xJnzbZxMElxo1+k8pxDNsQ10iGCK1dgpeDimwV8isHVwKCAQEAu6IyJXKL
                lAIYjsLSw9rKHWGVMzjo29mIyc6KfKN8QV0vxf8CD+CTzp9WJtYSdQ0hkKp2sayp
                z0F1ySvn7rad1By4IpJVtKGn6bRn4Xm1GL4xaGD5nRjrnxKQ6Q2d6or52uWWj2VC
                waRDDvdc5x8OsWUxxtm0qWbaayJkXMr797V5zsOEuxAz5gmmfDucip3rqs5WsK0S
                fOQ5WJkJhwTatbOnKj7D9bXRj3HKx7M8JFxkszt/ISzapQxA8COxMgcrELwXya78
                pFlubrh+e+9+npaScG96t/DojI3COQgL6nm6oC8JBcjItzN2PE1TfFtLrkgC1pk/
                IzkgPQq4h35oFwKCAQEAvtIWS+KcjVLu6ekts6tGLVwp9fG9tzCUqQ4eaGw7pBfN
                dC/mFz916K58Hn4fzCqFeAe3KbFeFLOPFhzUXQyny237udgM3S0BakqejnvSW1d4
                cI0BIqFy/q869FDPbzJkmS2V70HSY5QCgyiRlJ7oKu1roWUOENJM7QRdstnAklf6
                CXl6eXtt/Kc32ilvKl1LCbrxzfVrZ5PHnq/KhHn8omcIJxogV1Ccf5vQeQtjaXjs
                7oqOsLJ0EHlh8FYwlAUzj9BE9d+wP5mI2JHlQOFq+O9ERXFuD5uYKl+iYoP19ZPh
                66ehPbQGExT22u9OnF16s32jaTBtXwET4lEDbegURwKCAQBT4LkMFn2hB6LUxvET
                Ts5FficFg+5MwZ0toeA0wZy9V5wQpePVFy7cEkygBdiwbNNRaXKwEKDEnt25tZ/0
                DbzWYpRKGCKqIg3/In/Bwvea/QL3R0qu2MIUFWekV0r922zAVxwMNFc4W2cC3L+y
                LicSVEuBOjdR90Gy3OgCt1cWMBEoxiyityaMMkozhS6ApQICFEWaq3P1Uszz903U
                Bu6ChbI352EQiVwKBPOCfHRpSMhXe0RknzmKyMSK1VnUJHIzA/KaXVhhW/1LD7yz
                SKfQ2zzReHRioBZFJuXpOtig1BQCoaQl6tEXXLEBWgv1LpbRbS2fo1gfNd1cjFtb
                br23AoIBACqvTBWFh4eFebQRWQvL0FLtPuWpQcrsrxRx+BNbwqueN3M6E7o3k+SM
                w27+v5YoHNsQvsQwzN7Mm8FSiZ6W6iHzZE/aKGaBXsOsFXPB9vg/xM1IfWyFuPeH
                syRbv0scdqxdKiDvFGT6AuXb+VTJhx2zJlRgCplwsYyDYYJUe2NBEslzxxXNqnjN
                3wyKIDfVzqdKjjSIJZJx2EGDCUZBE2Ywrf4xNfLSMW/KJwQsq/w39KgXjnuwL45P
                2LyuSweRcktFR2fIteBEM/xeBm5Q/mDZBOiTyw7qu0sfQW/QHQDmJ69TPBpVXtZ9
                5gprZaZMstnbzOYG0zBhSVVi0eWP+JkCggEAeSoDoljFz45nfNKdRnmIfwvtawPj
                qziA5/HRa0Q1y4M/WKYLpdk/eAVbCqvzUBVT5RCqOh9Jx+cOEfws00d009Aw6F4n
                i/oN8968sZO2+3r3cdWsnXPq08X/aFkmDAz5fqBEJ8nUKzbzaJNRGClqAClKiniY
                od5jQzFXPKbUNinBK4s6XFwOWQl0l9cWcynA3I7ShjJ0j1H19N3NV++trKnD7Tl5
                CQlxvd9YDjBbZ/36AhdTftOAMId+Jaz9sd+Rd5oU4N+HXiN/DBsPs5+LGS8D/QVf
                +Kk8mB7n7QapQrrN20wXqa+zBSZ/GcHUYz6BmOc8ikOf1PGUO4pcbr80vw==
                -----END RSA PRIVATE KEY-----
          scope: GLOBAL
          username: "ubuntu"
jenkins:
  agentProtocols:
  - "JNLP4-connect"
  - "Ping"
  authorizationStrategy:
    globalMatrix:
      permissions:
      - "USER:Agent/Build:anykey"
      - "USER:Agent/Configure:anykey"
      - "USER:Agent/Connect:anykey"
      - "USER:Agent/Create:anykey"
      - "USER:Agent/Delete:anykey"
      - "USER:Agent/Disconnect:anykey"
      - "USER:Credentials/Create:anykey"
      - "USER:Credentials/Delete:anykey"
      - "USER:Credentials/ManageDomains:anykey"
      - "USER:Credentials/Update:anykey"
      - "USER:Credentials/View:anykey"
      - "USER:Job/Build:anykey"
      - "USER:Job/Cancel:anykey"
      - "USER:Job/Configure:anykey"
      - "USER:Job/Create:anykey"
      - "USER:Job/Delete:anykey"
      - "USER:Job/Discover:anykey"
      - "USER:Job/Move:anykey"
      - "USER:Job/Read:anykey"
      - "USER:Job/Workspace:anykey"
      - "USER:Overall/Administer:anykey"
      - "USER:Overall/Read:anykey"
      - "USER:Run/Delete:anykey"
      - "USER:Run/Replay:anykey"
      - "USER:Run/Update:anykey"
      - "USER:SCM/Tag:anykey"
      - "USER:View/Configure:anykey"
      - "USER:View/Create:anykey"
      - "USER:View/Delete:anykey"
      - "USER:View/Read:anykey"
  globalNodeProperties:
  - envVars:
      env:
      - key: "PROD_IP"
        value: "${PROD_IP}"
      - key: "PROD_USER"
        value: "${JW_USER}"
      - key: "IMAGE"
        value: "${DH_REPO}"
      - key: "GIT_APP_REPO"
        value: "${GH_REPO_APP}"
  crumbIssuer:
    standard:
      excludeClientIPFromCrumb: false
  disableRememberMe: false
  labelAtoms:
  - name: "built-in"
  - name: "jenkins_node"
  - name: "ubuntu"
  markupFormatter: "plainText"
  mode: NORMAL
  myViewsTabBar: "standard"
  nodes:
    - permanent:
        labelString: "ubuntu"
        launcher:
          ssh:
            host: ${JNODE_IP}
            port: 22
            sshHostKeyVerificationStrategy:
              manuallyTrustedKeyVerificationStrategy:
                requireInitialManualTrust: false
        name: "jenkins_node"
        nodeDescription: "Jenkins_node"
        numExecutors: 2
        remoteFS: "/home/ubuntu/jenkins"
        retentionStrategy: "always"
  numExecutors: 2
  primaryView:
    all:
      name: "all"
  projectNamingStrategy: "standard"
  quietPeriod: 5
  remotingSecurity:
    enabled: true
  scmCheckoutRetryCount: 0
  securityRealm:
    local:
      allowsSignup: false
      enableCaptcha: false
      users:
      - id: ${J_LOGIN}
        password: ${J_PASS}
        name: "Ihor Anikeiev"
        properties:
        - "apiToken"
        - "myView"
        - preferredProvider:
            providerId: "default"
        - "timezone"
        - mailer:
            emailAddress: "anikeev.ihor@gmail.com"
  slaveAgentPort: 50000
  updateCenter:
    sites:
    - id: "default"
      url: "https://updates.jenkins.io/update-center.json"
  views:
  - all:
      name: "all"
  viewsTabBar: "standard"
globalCredentialsConfiguration:
  configuration:
    providerFilter: "none"
    typeFilter: "none"
security:
  apiToken:
    creationOfLegacyTokenEnabled: false
    tokenGenerationOnCreationEnabled: false
    usageStatisticsEnabled: true
  gitHostKeyVerificationConfiguration:
    sshHostKeyVerificationStrategy: "knownHostsFileVerificationStrategy"
  globalJobDslSecurityConfiguration:
    useScriptSecurity: true
  sSHD:
    port: -1
unclassified:
  buildDiscarders:
    configuredBuildDiscarders:
    - "jobBuildDiscarder"
  buildStepOperation:
    enabled: false
  fingerprints:
    fingerprintCleanupDisabled: false
    storage: "file"
  gitHubConfiguration:
    apiRateLimitChecker: ThrottleForNormalize
  gitHubPluginConfig:
    configs:
    - credentialsId: "GitHub-token"
    hookUrl: "http://$my_public_ip:8080/github-webhook/"
  gitSCM:
    addGitTagAction: false
    allowSecondFetch: false
    createAccountBasedOnEmail: false
    disableGitToolChooser: false
    hideCredentials: false
    showEntireCommitSummaryInChanges: false
    useExistingAccountWithSameEmail: false
  globalTimeOutConfiguration:
    operations:
    - "abortOperation"
  junitTestResultStorage:
    storage: "file"
  locale:
    ignoreAcceptLanguage: false
  location:
    adminAddress: "address not configured yet <nobody@nowhere>"
  mailer:
    charset: "UTF-8"
    useSsl: false
    useTls: false
  pollSCM:
    pollingThreadCount: 10
  timestamper:
    allPipelines: false
    elapsedTimeFormat: "'<b>'HH:mm:ss.S'</b> '"
    systemTimeFormat: "'<b>'HH:mm:ss'</b> '"
tool:
  git:
    installations:
    - home: "git"
      name: "Default"
  mavenGlobalConfig:
    globalSettingsProvider: "standard"
    settingsProvider: "standard"
jobs:
  - script: >
      multibranchPipelineJob('myAPPmultibranch') {
          branchSources {
              git {
                  id = 'configuration-as-code'
                  remote('${GH_REPO_PIPE}')
              }
          }
      }
EOF

cat <<EOF> /home/ubuntu/jcasc/Dockerfile
FROM jenkins/jenkins:latest
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
COPY casc.yaml /var/jenkins_home/casc.yaml
EOF

cd /home/ubuntu/jcasc
sudo docker build -t jenkins:jcasc .
sudo docker run -d -p 80:8080 -p 50000:50000 jenkins:jcasc