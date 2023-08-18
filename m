Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aurabindo Pillai" <aurabindo.pillai@amd.com>
Date: Fri, 18 Aug 2023 16:41:41 -0000
Message-ID: <169237690192.12739.4301184695154757887@emeril.freedesktop.org>
References: <20230818161528.189560-1-aurabindo.pillai@amd.com>
In-Reply-To: <20230818161528.189560-1-aurabindo.pillai@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/amdgpu=3A_Add_test_for_ODM_combine?=
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

Series: tests/amdgpu: Add test for ODM combine
URL   : https://patchwork.freedesktop.org/series/122639/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/964905 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47673080):
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
  section_end:1692376725:step_script
  section_start:1692376725:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692376725:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47673083):
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
  section_end:1692376729:step_script
  section_start:1692376729:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692376730:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47673082):
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
  section_end:1692376748:step_script
  section_start:1692376748:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692376749:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47673084):
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
  section_end:1692376733:step_script
  section_start:1692376733:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692376734:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47673075):
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
  section_end:1692376726:step_script
  section_start:1692376726:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692376727:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47673079):
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
  section_end:1692376763:step_script
  section_start:1692376763:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692376763:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47673076):
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
  section_end:1692376745:step_script
  section_start:1692376745:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692376746:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47673077):
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
  section_end:1692376726:step_script
  section_start:1692376726:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692376726:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/964905
