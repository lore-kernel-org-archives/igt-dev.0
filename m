Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Wed, 30 Aug 2023 17:10:27 -0000
Message-ID: <169341542773.15234.3650342604812036042@emeril.freedesktop.org>
References: <20230830153937.1215474-1-swati2.sharma@intel.com>
In-Reply-To: <20230830153937.1215474-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/intel-ci=3A_add_basic_audio_test_to_ffb?=
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

Series: tests/intel-ci: add basic audio test to ffb
URL   : https://patchwork.freedesktop.org/series/123072/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/973677 for the overview.

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48247875):
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
  Login Succeeded!
  $ .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-mips build-debian-mips
  time="2023-08-30T17:07:01Z" level=fatal msg="Error determining repository tags: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-mips/tags/list?last=commit-786356764febf63169296f57373f80adfa1abf26&n=100: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  STEP 1: FROM debian:buster
  Error: error creating build container: The following failures happened while trying to pull image specified by "debian:buster" based on search registries in /etc/containers/registries.conf:
  * "localhost/debian:buster": Error initializing source docker://localhost/debian:buster: pinging docker registry returned: Get https://localhost/v2/: dial tcp [::1]:443: connect: connection refused
  * "docker.io/library/debian:buster": Error initializing source docker://debian:buster: pinging docker registry returned: Get https://registry-1.docker.io/v2/: dial tcp: lookup registry-1.docker.io on 147.75.207.208:53: read udp 10.88.53.173:50508->147.75.207.208:53: i/o timeout
  * "registry.fedoraproject.org/debian:buster": Error initializing source docker://registry.fedoraproject.org/debian:buster: Error reading manifest buster in registry.fedoraproject.org/debian: manifest unknown: manifest unknown
  * "quay.io/debian:buster": Error initializing source docker://quay.io/debian:buster: Error reading manifest buster in quay.io/debian: error parsing HTTP 404 response body: invalid character '<' looking for beginning of value: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2 Final//EN\">\n<title>404 Not Found</title>\n<h1>Not Found</h1>\n<p>The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.</p>\n"
  * "registry.centos.org/debian:buster": Error initializing source docker://registry.centos.org/debian:buster: pinging docker registry returned: Get https://registry.centos.org/v2/: dial tcp: lookup registry.centos.org on 147.75.207.207:53: no such host
  section_end:1693415247:step_script
  section_start:1693415247:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693415247:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/973677
