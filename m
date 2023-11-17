Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Fri, 17 Nov 2023 16:59:40 -0000
Message-ID: <170024038052.7874.4298400404189000001@emeril.freedesktop.org>
References: <20231117155802.100269-1-swati2.sharma@intel.com>
In-Reply-To: <20231117155802.100269-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Ffeature=5Fdiscovery=3A_update_display-1x?=
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

Series: tests/kms_feature_discovery: update display-1x
URL   : https://patchwork.freedesktop.org/series/126591/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1036811 for the overview.

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51724778):
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 8c12f015 as detached HEAD (ref is intel/IGTPW_10211)...
  Removing build/
  
  Skipping Git submodules setup
  section_end:1700240172:get_sources
  section_start:1700240172:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  section_end:1700240177:step_script
  section_start:1700240177:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1700240179:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176: image not known (docker.go:570:0s)

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51724779):
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 8c12f015 as detached HEAD (ref is intel/IGTPW_10211)...
  Removing build/
  Removing installdir/
  
  Skipping Git submodules setup
  section_end:1700240172:get_sources
  section_start:1700240172:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  section_end:1700240177:step_script
  section_start:1700240177:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1700240179:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176: image not known (docker.go:570:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1036811
