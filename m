Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aurabindo Pillai" <aurabindo.pillai@amd.com>
Date: Fri, 18 Aug 2023 18:27:07 -0000
Message-ID: <169238322764.12738.5352422526656152211@emeril.freedesktop.org>
References: <20230818175637.419349-1-aurabindo.pillai@amd.com>
In-Reply-To: <20230818175637.419349-1-aurabindo.pillai@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bv2=2C1/2=5D_lib/amdgpu=3A_Add_check_for_?=
 =?utf-8?q?ODM_combine_segments_debugfs_endpoint?=
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

Series: series starting with [v2,1/2] lib/amdgpu: Add check for ODM combine segments debugfs endpoint
URL   : https://patchwork.freedesktop.org/series/122645/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/964986 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47681649):
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
  section_end:1692382994:step_script
  section_start:1692382994:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692382994:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47681652):
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
  section_end:1692382978:step_script
  section_start:1692382978:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692382979:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47681651):
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
  section_end:1692382980:step_script
  section_start:1692382980:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692382980:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47681653):
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
  section_end:1692383001:step_script
  section_start:1692383001:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692383002:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47681644):
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
  section_end:1692382975:step_script
  section_start:1692382975:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692382976:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47681648):
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
  section_end:1692382993:step_script
  section_start:1692382993:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692382993:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47681645):
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
  section_end:1692382977:step_script
  section_start:1692382977:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692382977:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47681646):
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
  section_end:1692382974:step_script
  section_start:1692382974:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692382975:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/964986
