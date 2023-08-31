Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Thu, 31 Aug 2023 20:55:20 -0000
Message-ID: <169351532003.12509.410132020145427629@emeril.freedesktop.org>
References: <20230831153517.35370-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230831153517.35370-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_g?=
 =?utf-8?q?itlab-ci/pull-or-rebuild=3A_added_debugs?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: gitlab-ci/pull-or-rebuild: added debugs
URL   : https://patchwork.freedesktop.org/series/123121/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/974841 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48330053):
  Building!
  Build with: podman build --build-arg=CI_COMMIT_SHA=5d0b498f33aa4d289c2fcde0e656ccf2f60003cd --build-arg=CI_REGISTRY_IMAGE=registry.freedesktop.org/gfx-ci/igt-ci-tags --squash -t registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:dockerfile-6bf4b730e51b28190390693acbc1776ba69f9124 -f Dockerfile.build-debian-minimal .
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Copying config sha256:de08540e8ff0e470ff7956df4bed403725a5f45c186e9bf495da5344ff8fbe84
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-31T20:44:27Z" level=warning msg="signal: killed"
  time="2023-08-31T20:44:27Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1693514667:step_script
  section_start:1693514667:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693514667:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48330055):
  Building!
  Build with: podman build --build-arg=CI_COMMIT_SHA=5d0b498f33aa4d289c2fcde0e656ccf2f60003cd --build-arg=CI_REGISTRY_IMAGE=registry.freedesktop.org/gfx-ci/igt-ci-tags --squash -t registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:dockerfile-f370b1c77e386827453db413b775a4c9bff41794 -f Dockerfile.build-debian-arm64 .
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Copying config sha256:de08540e8ff0e470ff7956df4bed403725a5f45c186e9bf495da5344ff8fbe84
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-31T20:44:44Z" level=warning msg="signal: killed"
  time="2023-08-31T20:44:44Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1693514684:step_script
  section_start:1693514684:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693514685:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48330056):
  $ .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-mips build-debian-mips
  Inspecting base: registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:dockerfile-aae5ff3c8b65e55cbc8e8a0c565007f61db3126d
  time="2023-08-31T20:44:46Z" level=fatal msg="Error determining repository tags: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-mips/tags/list?last=commit-78437a412ac39b5ca77f23643e28cbda346603b3&n=100: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  Build with: podman build --build-arg=CI_COMMIT_SHA=5d0b498f33aa4d289c2fcde0e656ccf2f60003cd --build-arg=CI_REGISTRY_IMAGE=registry.freedesktop.org/gfx-ci/igt-ci-tags --squash -t registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:dockerfile-aae5ff3c8b65e55cbc8e8a0c565007f61db3126d -f Dockerfile.build-debian-mips .
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Error: error creating build container: The following failures happened while trying to pull image specified by "debian:buster" based on search registries in /etc/containers/registries.conf:
  * "localhost/debian:buster": Error initializing source docker://localhost/debian:buster: pinging docker registry returned: Get https://localhost/v2/: dial tcp [::1]:443: connect: connection refused
  * "docker.io/library/debian:buster": Error writing blob: error storing blob to file "/var/tmp/storage270788054/1": read tcp 10.88.111.156:60794->104.16.101.207:443: read: connection timed out
  * "registry.fedoraproject.org/debian:buster": Error initializing source docker://registry.fedoraproject.org/debian:buster: Error reading manifest buster in registry.fedoraproject.org/debian: manifest unknown: manifest unknown
  * "quay.io/debian:buster": Error initializing source docker://quay.io/debian:buster: Error reading manifest buster in quay.io/debian: error parsing HTTP 404 response body: invalid character '<' looking for beginning of value: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2 Final//EN\">\n<title>404 Not Found</title>\n<h1>Not Found</h1>\n<p>The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.</p>\n"
  * "registry.centos.org/debian:buster": Error initializing source docker://registry.centos.org/debian:buster: pinging docker registry returned: Get https://registry.centos.org/v2/: dial tcp: lookup registry.centos.org on 147.75.207.207:53: no such host
  section_end:1693514990:step_script
  section_start:1693514990:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693514991:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48330057):
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 5d0b498f as detached HEAD (ref is intel/IGTPW_9697)...
  
  Skipping Git submodules setup
  section_end:1693514630:get_sources
  section_start:1693514630:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
  Error: error authenticating creds for "registry.freedesktop.org": pinging docker registry returned: Get https://registry.freedesktop.org/v2/: dial tcp 147.75.198.156:443: i/o timeout
  section_end:1693514851:step_script
  section_start:1693514851:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693514852:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/974841
