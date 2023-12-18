Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/xe=5Fcreate=3A_Us?=
 =?utf-8?q?e_separate_VMs_per_process?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Date: Mon, 18 Dec 2023 21:02:06 -0000
Message-ID: <170293332641.12103.4085085335918013231@emeril.freedesktop.org>
References: <20231218145051.1869466-1-jonathan.cavitt@intel.com>
In-Reply-To: <20231218145051.1869466-1-jonathan.cavitt@intel.com>
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

Series: tests/xe_create: Use separate VMs per process
URL   : https://patchwork.freedesktop.org/series/127938/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1060074 for the overview.

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52908028):
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out e83732b7 as detached HEAD (ref is intel/IGTPW_10439)...
  Removing build/
  
  Skipping Git submodules setup
  section_end:1702932983:get_sources
  section_start:1702932983:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-e83732b794678ae9d8267c71b27309e7e6929fbc with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1702932986:step_script
  section_start:1702932986:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702932987:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: image not known (docker.go:570:0s)

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52908026):
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out e83732b7 as detached HEAD (ref is intel/IGTPW_10439)...
  Removing build/
  Removing installdir/
  
  Skipping Git submodules setup
  section_end:1702932983:get_sources
  section_start:1702932983:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-e83732b794678ae9d8267c71b27309e7e6929fbc with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1702932986:step_script
  section_start:1702932986:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702932987:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: image not known (docker.go:570:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1060074
