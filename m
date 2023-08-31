Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Thu, 31 Aug 2023 03:47:08 -0000
Message-ID: <169345362843.12506.10767472706027625678@emeril.freedesktop.org>
References: <20230831033128.454032-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230831033128.454032-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/amdgpu=3A_add_sync_object_tests_=28rev7=29?=
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

Series: tests/amdgpu: add sync object tests (rev7)
URL   : https://patchwork.freedesktop.org/series/119304/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/974095 for the overview.

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48278330):
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
  Login Succeeded!
  $ .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-arm64 build-debian-arm64
  time="2023-08-31T03:45:51Z" level=fatal msg="Error determining repository tags: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-arm64/tags/list?last=commit-a63ceb48e6c3e733d04156b32fba3b4f4d5ad794&n=100: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  STEP 1: FROM debian:buster
  Error: error creating build container: The following failures happened while trying to pull image specified by "debian:buster" based on search registries in /etc/containers/registries.conf:
  * "localhost/debian:buster": Error initializing source docker://localhost/debian:buster: pinging docker registry returned: Get https://localhost/v2/: dial tcp [::1]:443: connect: connection refused
  * "docker.io/library/debian:buster": Error initializing source docker://debian:buster: pinging docker registry returned: Get https://registry-1.docker.io/v2/: dial tcp: lookup registry-1.docker.io on 147.75.207.208:53: read udp 10.88.68.188:34298->147.75.207.208:53: i/o timeout
  * "registry.fedoraproject.org/debian:buster": Error initializing source docker://registry.fedoraproject.org/debian:buster: Error reading manifest buster in registry.fedoraproject.org/debian: manifest unknown: manifest unknown
  * "quay.io/debian:buster": Error initializing source docker://quay.io/debian:buster: Error reading manifest buster in quay.io/debian: error parsing HTTP 404 response body: invalid character '<' looking for beginning of value: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2 Final//EN\">\n<title>404 Not Found</title>\n<h1>Not Found</h1>\n<p>The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.</p>\n"
  * "registry.centos.org/debian:buster": Error initializing source docker://registry.centos.org/debian:buster: pinging docker registry returned: Get https://registry.centos.org/v2/: dial tcp: lookup registry.centos.org on 147.75.207.207:53: no such host
  section_end:1693453581:step_script
  section_start:1693453581:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693453581:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48278331):
  time="2023-08-31T03:45:48Z" level=fatal msg="Error determining repository tags: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-mips/tags/list?last=commit-43e509f408d4a5bcc5070f6b84da42a7c3801e8d&n=100: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Copying config sha256:de08540e8ff0e470ff7956df4bed403725a5f45c186e9bf495da5344ff8fbe84
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-31T03:46:09Z" level=warning msg="signal: killed"
  time="2023-08-31T03:46:09Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1693453570:step_script
  section_start:1693453570:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693453570:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/974095
