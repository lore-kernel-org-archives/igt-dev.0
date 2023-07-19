Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 19 Jul 2023 17:09:35 -0000
Message-ID: <168978657534.20709.15500195551472998507@emeril.freedesktop.org>
References: <20230719153619.841459-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230719153619.841459-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/gem=5F*=3A_Migrate_allocator_start/stop_to_fixtures_=28rev?=
 =?utf-8?q?3=29?=
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

Series: tests/gem_*: Migrate allocator start/stop to fixtures (rev3)
URL   : https://patchwork.freedesktop.org/series/120968/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/939754 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45803319):
  Downloading artifacts from coordinator... ok        host=gitlab.freedesktop.org id=45803304 responseStatus=200 OK token=64_tfNbB
  section_end:1689786521:download_artifacts
  section_start:1689786521:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  $ /host/bin/curl --cacert /host/ca-certificates.crt -s -L --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
  Login Succeeded!
  $ .gitlab-ci/pull-or-rebuild.sh igt Dockerfile igt
  STEP 1: FROM registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-9c59a804dbe159b40324b72ea37888f4922b8742
  Error: error creating build container: Error initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-9c59a804dbe159b40324b72ea37888f4922b8742: Error reading manifest commit-9c59a804dbe159b40324b72ea37888f4922b8742 in registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora: received unexpected HTTP status: 500 Internal Server Error
  section_end:1689786524:step_script
  section_start:1689786524:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1689786525:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/939754
