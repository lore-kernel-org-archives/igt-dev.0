Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 22 Apr 2022 14:50:06 -0000
Message-ID: <165063900642.14005.9480442570671596662@emeril.freedesktop.org>
References: <20220422060240.3193599-1-jouni.hogander@intel.com>
In-Reply-To: <20220422060240.3193599-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_k?=
 =?utf-8?q?ms=5Fpsr2=5Fsu=3A_Skip_page-flip_tests_if_FB=5FDAMAGE=5FCLIPS_n?=
 =?utf-8?q?ot_supported_=28rev2=29?=
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

Series: kms_psr2_su: Skip page-flip tests if FB_DAMAGE_CLIPS not supported (rev2)
URL   : https://patchwork.freedesktop.org/series/102972/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/566924 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/21632753):
  Downloading artifacts
  Downloading artifacts for build:tests-fedora (21632735)...
  Downloading artifacts from coordinator... ok        id=21632735 responseStatus=200 OK token=knb5FKkY
  section_end:1650638770:download_artifacts
  section_start:1650638770:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  $ podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
  Login Succeeded!
  $ .gitlab-ci/pull-or-rebuild.sh igt Dockerfile igt
  STEP 1: FROM registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-8d43a5cfe7b7afa2a04bdddea9018146eeb720e6
  Getting image source signatures
  Copying blob sha256:b39735705e69a2516323755ff4698ea5cd86b08b31d8c8287bc83d76d34c3bfc
  Error: error creating build container: Error writing blob: error storing blob to file "/var/tmp/storage346971694/1": read tcp 172.17.0.2:47554->142.250.31.128:443: read: connection reset by peer
  section_end:1650638783:step_script
  section_start:1650638783:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1650638784:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/566924
