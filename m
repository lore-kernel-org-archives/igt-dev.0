Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 12 Jan 2023 08:51:34 -0000
Message-ID: <167351349426.2072.11904975496748567522@emeril.freedesktop.org>
References: <20230112073537.27890-1-swati2.sharma@intel.com>
In-Reply-To: <20230112073537.27890-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_V?=
 =?utf-8?q?DSC_YCbCr420_+_Fractional_BPP_=28rev3=29?=
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

Series: VDSC YCbCr420 + Fractional BPP (rev3)
URL   : https://patchwork.freedesktop.org/series/111342/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/782234 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34600528):
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
  section_end:1673513396:step_script
  section_start:1673513396:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1673513398:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34600531):
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
  section_end:1673513405:step_script
  section_start:1673513405:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1673513406:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34600530):
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
  section_end:1673513415:step_script
  section_start:1673513415:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1673513416:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34600532):
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
  section_end:1673513418:step_script
  section_start:1673513418:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1673513419:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34600529):
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
  section_end:1673513386:step_script
  section_start:1673513386:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1673513387:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34600523):
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
  section_end:1673513377:step_script
  section_start:1673513377:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1673513378:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34600527):
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
  section_end:1673513392:step_script
  section_start:1673513392:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1673513393:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34600526):
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
  section_end:1673513386:step_script
  section_start:1673513386:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1673513387:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34600524):
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
  section_end:1673513377:step_script
  section_start:1673513377:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1673513377:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/34600525):
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
  section_end:1673513391:step_script
  section_start:1673513391:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1673513392:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/782234
