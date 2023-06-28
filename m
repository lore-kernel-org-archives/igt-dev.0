Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Wed, 28 Jun 2023 18:38:30 -0000
Message-ID: <168797751031.32035.6045112264814079056@emeril.freedesktop.org>
References: <20230628175830.12504-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230628175830.12504-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?nclude_intel=5Fblt_funtions_to_blitter_path_for_igt=5Ffb=2Ec_?=
 =?utf-8?b?KHJldjMp?=
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

Series: Include intel_blt funtions to blitter path for igt_fb.c (rev3)
URL   : https://patchwork.freedesktop.org/series/119886/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/921456 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44616489):
  Downloading artifacts from coordinator... ok        host=gitlab.freedesktop.org id=44616474 responseStatus=200 OK token=64_UjLWE
  section_end:1687977291:download_artifacts
  section_start:1687977291:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  $ /host/bin/curl --cacert /host/ca-certificates.crt -s -L --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
  Login Succeeded!
  $ .gitlab-ci/pull-or-rebuild.sh igt Dockerfile igt
  STEP 1: FROM registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-34061e026e05594375f85f1ee3222e4d4a45af38
  Error: error creating build container: Error initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-34061e026e05594375f85f1ee3222e4d4a45af38: Error reading manifest commit-34061e026e05594375f85f1ee3222e4d4a45af38 in registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora: received unexpected HTTP status: 500 Internal Server Error
  section_end:1687977300:step_script
  section_start:1687977300:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687977306:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/921456
