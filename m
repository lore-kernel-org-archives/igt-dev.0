Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "James Shargo" <jshargo@chromium.org>
Date: Sat, 24 Jun 2023 00:49:11 -0000
Message-ID: <168756775158.28492.3619878751563479536@emeril.freedesktop.org>
References: <20230623230954.115437-1-jshargo@chromium.org>
In-Reply-To: <20230623230954.115437-1-jshargo@chromium.org>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_tests_and_support_for_VKMS=27s_new_ConfigFS_features?=
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

Series: Add tests and support for VKMS's new ConfigFS features
URL   : https://patchwork.freedesktop.org/series/119814/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/917454 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44351956):
    ^~~~~~~~
  /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
    uint32_t lessees[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
    uint32_t count;
    ^~~~~~~~
  /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
    uint32_t objects[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
   extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
                                         ^~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1687567541:step_script
  section_start:1687567541:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687567542:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44351959):
    ^~~~~~~~
  /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
    uint32_t lessees[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
    uint32_t count;
    ^~~~~~~~
  /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
    uint32_t objects[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
   extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
                                         ^~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1687567533:step_script
  section_start:1687567533:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687567533:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44351958):
    ^~~~~~~~
  /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
    uint32_t lessees[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
    uint32_t count;
    ^~~~~~~~
  /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
    uint32_t objects[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
   extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
                                         ^~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1687567521:step_script
  section_start:1687567521:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687567522:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44351960):
    ^~~~~~~~
  /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
    uint32_t lessees[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
    uint32_t count;
    ^~~~~~~~
  /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
    uint32_t objects[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
   extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
                                         ^~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1687567525:step_script
  section_start:1687567525:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687567526:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44351951):
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
    533 |  uint32_t lessees[0];
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
    539 |  uint32_t count;
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
    540 |  uint32_t objects[0];
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
    545 | extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
        |                                       ^~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1687567527:step_script
  section_start:1687567527:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687567528:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44351955):
          uint32_t bpp;
          ^
  /usr/include/xf86drmMode.h:221:2: error: unknown type name 'uint32_t'
          uint32_t depth;
          ^
  /usr/include/xf86drmMode.h:223:2: error: unknown type name 'uint32_t'
          uint32_t handle;
          ^
  /usr/include/xf86drmMode.h:229:2: error: unknown type name 'uint32_t'
          uint32_t id;
          ^
  fatal error: too many errors emitted, stopping now [-ferror-limit=]
  20 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1687567549:step_script
  section_start:1687567549:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687567549:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44351954):
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
    533 |  uint32_t lessees[0];
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
    539 |  uint32_t count;
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
    540 |  uint32_t objects[0];
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
    545 | extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
        |                                       ^~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1687567540:step_script
  section_start:1687567540:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687567542:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44351952):
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
    533 |  uint32_t lessees[0];
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
    539 |  uint32_t count;
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
    540 |  uint32_t objects[0];
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
    545 | extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
        |                                       ^~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1687567541:step_script
  section_start:1687567541:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687567541:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44351953):
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
    533 |  uint32_t lessees[0];
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
    539 |  uint32_t count;
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
    540 |  uint32_t objects[0];
        |  ^~~~~~~~
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
    545 | extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
        |                                       ^~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1687567529:step_script
  section_start:1687567529:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687567529:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/917454
