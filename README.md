# Gitlab CI Hugo runner

A Gitlab CI runner docker image for generating Hugo-managed static sites. Based on the great [`gitlab-ci-multi-runner`](https://hub.docker.com/r/sameersbn/gitlab-ci-multi-runner/), and inspired by [`docker-hugo`](https://github.com/jojomi/docker-hugo/blob/master/Dockerfile).

## Example `docker-compose` config

```
hugo-ci:
    build: ./gitlab-ci-hugo-runner
    environment:
        CI_SERVER_URL:        "https://git.example.com/ci"
        RUNNER_EXECUTOR:      "shell"
        RUNNER_DESCRIPTION:   "Gitlab CI Hugo runner"
        RUNNER_TOKEN:         "abcdef0123456789abcdef01234567"
    volumes:
        - "/var/www/:/output/"
        - "/var/lib/gitlab-ci-hugo-runner/:/home/gitlab_ci_multi_runner/data/"
```