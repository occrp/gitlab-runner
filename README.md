# Gitlab CI Jekyll runner

A Gitlab CI runner docker image for generating Jekyll-managed static sites. Based on the great [`gitlab-ci-multi-runner`](https://hub.docker.com/r/sameersbn/gitlab-ci-multi-runner/).

## Example `docker-compose` config

```
jekyll-ci:
    build: ./gitlab-ci-jekyll-runner
    environment:
        CI_SERVER_URL:        "https://git.example.com/ci"
        RUNNER_EXECUTOR:      "shell"
        RUNNER_DESCRIPTION:   "Gitlab CI Jekyllrunner"
        RUNNER_TOKEN:         "abcdef0123456789abcdef01234567"
    volumes:
        - "/var/www/:/output/"
        - "/var/lib/gitlab-ci-jekyll-runner/:/home/gitlab_ci_multi_runner/data/"
```