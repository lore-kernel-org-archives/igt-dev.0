Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 24 Apr 2023 17:44:41 -0000
Message-ID: <168235828174.1231.8251792984368365125@emeril.freedesktop.org>
References: <20230424172407.451109-1-mcanal@igalia.com>
In-Reply-To: <20230424172407.451109-1-mcanal@igalia.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fplane=3A_require_GAMMA=5FLUT_property_for_legacy=5Fl?=
 =?utf-8?q?ut_tests?=
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

Series: tests/kms_plane: require GAMMA_LUT property for legacy_lut tests
URL   : https://patchwork.freedesktop.org/series/116902/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/865193 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/40564275):
  Downloading artifacts from coordinator... ok        host=gitlab.freedesktop.org id=40564260 responseStatus=200 OK token=64_7yXeC
  section_end:1682358265:download_artifacts
  section_start:1682358265:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh  | sh
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
  Login Succeeded!
  $ .gitlab-ci/pull-or-rebuild.sh igt Dockerfile igt
  STEP 1: FROM registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-a678140b5f8f6f55f440713dcd356767639f5160
  Error: error creating build container: Error initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-a678140b5f8f6f55f440713dcd356767639f5160: Error reading manifest commit-a678140b5f8f6f55f440713dcd356767639f5160 in registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora: received unexpected HTTP status: 500 Internal Server Error
  section_end:1682358267:step_script
  section_start:1682358267:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1682358268:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/865193
