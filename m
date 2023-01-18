Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Wed, 18 Jan 2023 20:02:48 -0000
Message-ID: <167407216845.3605.16498663996117255542@emeril.freedesktop.org>
References: <20230118165017.32078-1-swati2.sharma@intel.com>
In-Reply-To: <20230118165017.32078-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/kms=5Fdsc=3A_Reorg?=
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

Series: tests/i915/kms_dsc: Reorg
URL   : https://patchwork.freedesktop.org/series/113045/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/787232 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34974416):
  /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
    uint32_t lessees[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
    uint32_t count;
    ^~~~~~~~
  /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
    uint32_t objects[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’; did you mean ‘intptr_t’?
   extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
                                         ^~~~~~~~
                                         intptr_t
  ninja: build stopped: subcommand failed.
  section_end:1674072018:step_script
  section_start:1674072018:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1674072018:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34974419):
  /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
    uint32_t lessees[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
    uint32_t count;
    ^~~~~~~~
  /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
    uint32_t objects[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’; did you mean ‘intptr_t’?
   extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
                                         ^~~~~~~~
                                         intptr_t
  ninja: build stopped: subcommand failed.
  section_end:1674072034:step_script
  section_start:1674072034:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1674072035:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34974418):
  /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
    uint32_t lessees[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
    uint32_t count;
    ^~~~~~~~
  /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
    uint32_t objects[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’; did you mean ‘intptr_t’?
   extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
                                         ^~~~~~~~
                                         intptr_t
  ninja: build stopped: subcommand failed.
  section_end:1674072031:step_script
  section_start:1674072031:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1674072031:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34974420):
  /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
    uint32_t lessees[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
    uint32_t count;
    ^~~~~~~~
  /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
    uint32_t objects[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’; did you mean ‘intptr_t’?
   extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
                                         ^~~~~~~~
                                         intptr_t
  ninja: build stopped: subcommand failed.
  section_end:1674072032:step_script
  section_start:1674072032:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1674072033:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34974417):
  /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
    uint32_t lessees[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
    uint32_t count;
    ^~~~~~~~
  /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
    uint32_t objects[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’; did you mean ‘intptr_t’?
   extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
                                         ^~~~~~~~
                                         intptr_t
  ninja: build stopped: subcommand failed.
  section_end:1674072017:step_script
  section_start:1674072017:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1674072017:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34974411):
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
  section_end:1674072018:step_script
  section_start:1674072018:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1674072020:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34974415):
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
  section_end:1674072021:step_script
  section_start:1674072021:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1674072021:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34974414):
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
  section_end:1674072019:step_script
  section_start:1674072019:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1674072020:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34974412):
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
  section_end:1674072020:step_script
  section_start:1674072020:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1674072021:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34974413):
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
  section_end:1674072018:step_script
  section_start:1674072018:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1674072018:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/787232
