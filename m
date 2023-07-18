Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Date: Tue, 18 Jul 2023 22:16:35 -0000
Message-ID: <168971859505.22203.18093533815656140784@emeril.freedesktop.org>
References: <20230718215950.2557-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230718215950.2557-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fatomic=5Ftransition=3A_Lower_drm_log_level_to_avoid_?=
 =?utf-8?q?exceeding_disk_usage_limit?=
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

Series: tests/kms_atomic_transition: Lower drm log level to avoid exceeding disk usage limit
URL   : https://patchwork.freedesktop.org/series/120942/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/938800 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45743256):
  ../tests/kms_atomic_transition.c:1115:50: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
     igt_require((data.sysfs_fd = open(DEBUG_LEVEL, O_RDONLY)) >= 0);
                                                    ^~~~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro ‘igt_require’
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ../tests/kms_atomic_transition.c:1115:50: note: each undeclared identifier is reported only once for each function it appears in
     igt_require((data.sysfs_fd = open(DEBUG_LEVEL, O_RDONLY)) >= 0);
                                                    ^~~~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro ‘igt_require’
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1689718209:step_script
  section_start:1689718209:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1689718210:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45743255):
  ../tests/kms_atomic_transition.c:1115:50: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
     igt_require((data.sysfs_fd = open(DEBUG_LEVEL, O_RDONLY)) >= 0);
                                                    ^~~~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro ‘igt_require’
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ../tests/kms_atomic_transition.c:1115:50: note: each undeclared identifier is reported only once for each function it appears in
     igt_require((data.sysfs_fd = open(DEBUG_LEVEL, O_RDONLY)) >= 0);
                                                    ^~~~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro ‘igt_require’
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1689718188:step_script
  section_start:1689718188:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1689718191:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45743257):
  ../tests/kms_atomic_transition.c:1115:50: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
     igt_require((data.sysfs_fd = open(DEBUG_LEVEL, O_RDONLY)) >= 0);
                                                    ^~~~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro ‘igt_require’
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ../tests/kms_atomic_transition.c:1115:50: note: each undeclared identifier is reported only once for each function it appears in
     igt_require((data.sysfs_fd = open(DEBUG_LEVEL, O_RDONLY)) >= 0);
                                                    ^~~~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro ‘igt_require’
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1689718229:step_script
  section_start:1689718229:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1689718229:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/938800
