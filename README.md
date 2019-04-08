# Extendable Gitlab CI runner

A Gitlab CI runner docker with ability to install packages at buildtime. Based on the great [`gitlab-runner`](https://gitlab.com/gitlab-org/gitlab-runner/).

## Example `docker-compose` config

```
gitlab-ci-runner:
    build:
        context: https://git.occrp.org/libre/gitlab-runner.git
        args:
            INSTALL_PACKAGES:  "rsync less"
    environment:
        CI_SERVER_URL:        "https://git.example.com/ci"
        RUNNER_EXECUTOR:      "shell"
        RUNNER_DESCRIPTION:   "Gitlab CI Multi Runner"
        RUNNER_TOKEN:         "abcdef0123456789abcdef01234567"
    volumes:
        - "/var/www/:/output/"
        - "/var/lib/gitlab-runner/etc/:/etc/gitlab-runner/"
        - "/var/lib/gitlab-runner/home/:/home/gitlab-runner/"
```