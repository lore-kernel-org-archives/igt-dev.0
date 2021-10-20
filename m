Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 20 Oct 2021 09:38:20 -0000
Message-ID: <163472270018.27361.14860288660306531518@emeril.freedesktop.org>
References: <20211020090944.29201-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20211020090944.29201-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/2=5D_lib/crc=3A_s/INTEL=5FPIPE?=
 =?utf-8?q?=5FCRC=5FSOURCE=5FAUTO/IGT=5FPIPE=5FCRC=5FSOURCE=5FAUTO/?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/crc: s/INTEL_PIPE_CRC_SOURCE_AUTO/IGT_PIPE_CRC_SOURCE_AUTO/
URL   : https://patchwork.freedesktop.org/series/96047/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/427842 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/14941197):
  ../lib/igt_chamelium.c: In function ‘chamelium_frame_match_or_dump’:
  ../lib/igt_chamelium.c:1908:33: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
     reference_crc = malloc(sizeof(igt_crc_t));
                                   ^~~~~~~~~
  ../lib/igt_chamelium.c: In function ‘chamelium_calculate_fb_crc’:
  ../lib/igt_chamelium.c:2119:36: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
    igt_crc_t *ret = calloc(1, sizeof(igt_crc_t));
                                      ^~~~~~~~~
  ../lib/igt_chamelium.c: In function ‘chamelium_calculate_fb_crc_async_start’:
  ../lib/igt_chamelium.c:2163:33: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
    fb_crc->ret = calloc(1, sizeof(igt_crc_t));
                                   ^~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1634722541:step_script
  section_start:1634722541:cleanup_file_variables
  Cleaning up file based variables
  section_end:1634722548:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/14941192):
  ../lib/igt_chamelium.c: In function ‘chamelium_frame_match_or_dump’:
  ../lib/igt_chamelium.c:1908:33: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
   1908 |   reference_crc = malloc(sizeof(igt_crc_t));
        |                                 ^~~~~~~~~
  ../lib/igt_chamelium.c: In function ‘chamelium_calculate_fb_crc’:
  ../lib/igt_chamelium.c:2119:36: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
   2119 |  igt_crc_t *ret = calloc(1, sizeof(igt_crc_t));
        |                                    ^~~~~~~~~
  ../lib/igt_chamelium.c: In function ‘chamelium_calculate_fb_crc_async_start’:
  ../lib/igt_chamelium.c:2163:33: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
   2163 |  fb_crc->ret = calloc(1, sizeof(igt_crc_t));
        |                                 ^~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1634722546:step_script
  section_start:1634722546:cleanup_file_variables
  Cleaning up file based variables
  section_end:1634722549:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/14941196):
                 ^
  ../lib/igt_chamelium.c:2119:29: error: invalid application of 'sizeof' to an incomplete type 'igt_crc_t' (aka 'struct _igt_crc')
          igt_crc_t *ret = calloc(1, sizeof(igt_crc_t));
                                     ^     ~~~~~~~~~~~
  ../lib/igt_fb.h:44:16: note: forward declaration of 'struct _igt_crc'
  typedef struct _igt_crc igt_crc_t;
                 ^
  ../lib/igt_chamelium.c:2163:26: error: invalid application of 'sizeof' to an incomplete type 'igt_crc_t' (aka 'struct _igt_crc')
          fb_crc->ret = calloc(1, sizeof(igt_crc_t));
                                  ^     ~~~~~~~~~~~
  ../lib/igt_fb.h:44:16: note: forward declaration of 'struct _igt_crc'
  typedef struct _igt_crc igt_crc_t;
                 ^
  4 warnings and 17 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1634722503:step_script
  section_start:1634722503:cleanup_file_variables
  Cleaning up file based variables
  section_end:1634722505:cleanup_file_variables
  ERROR: Job failed: exit code 1

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/14941195):
  ../lib/igt_chamelium.c:1822:7: warning: nested extern declaration of ‘igt_check_crc_equal’ [-Wnested-externs]
  ../lib/igt_chamelium.c: In function ‘chamelium_frame_match_or_dump’:
  ../lib/igt_chamelium.c:1908:33: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
   1908 |   reference_crc = malloc(sizeof(igt_crc_t));
        |                                 ^~~~~~~~~
  ../lib/igt_chamelium.c: In function ‘chamelium_calculate_fb_crc’:
  ../lib/igt_chamelium.c:2119:36: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
   2119 |  igt_crc_t *ret = calloc(1, sizeof(igt_crc_t));
        |                                    ^~~~~~~~~
  ../lib/igt_chamelium.c: In function ‘chamelium_calculate_fb_crc_async_start’:
  ../lib/igt_chamelium.c:2163:33: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
   2163 |  fb_crc->ret = calloc(1, sizeof(igt_crc_t));
        |                                 ^~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1634722493:step_script
  section_start:1634722493:cleanup_file_variables
  Cleaning up file based variables
  section_end:1634722495:cleanup_file_variables
  ERROR: Job failed: exit code 1

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/14941193):
  ../lib/igt_chamelium.c: In function ‘chamelium_frame_match_or_dump’:
  ../lib/igt_chamelium.c:1908:33: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
   1908 |   reference_crc = malloc(sizeof(igt_crc_t));
        |                                 ^~~~~~~~~
  ../lib/igt_chamelium.c: In function ‘chamelium_calculate_fb_crc’:
  ../lib/igt_chamelium.c:2119:36: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
   2119 |  igt_crc_t *ret = calloc(1, sizeof(igt_crc_t));
        |                                    ^~~~~~~~~
  ../lib/igt_chamelium.c: In function ‘chamelium_calculate_fb_crc_async_start’:
  ../lib/igt_chamelium.c:2163:33: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
   2163 |  fb_crc->ret = calloc(1, sizeof(igt_crc_t));
        |                                 ^~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1634722546:step_script
  section_start:1634722546:cleanup_file_variables
  Cleaning up file based variables
  section_end:1634722549:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/14941194):
  ../lib/igt_chamelium.c: In function ‘chamelium_frame_match_or_dump’:
  ../lib/igt_chamelium.c:1908:33: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
   1908 |   reference_crc = malloc(sizeof(igt_crc_t));
        |                                 ^~~~~~~~~
  ../lib/igt_chamelium.c: In function ‘chamelium_calculate_fb_crc’:
  ../lib/igt_chamelium.c:2119:36: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
   2119 |  igt_crc_t *ret = calloc(1, sizeof(igt_crc_t));
        |                                    ^~~~~~~~~
  ../lib/igt_chamelium.c: In function ‘chamelium_calculate_fb_crc_async_start’:
  ../lib/igt_chamelium.c:2163:33: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
   2163 |  fb_crc->ret = calloc(1, sizeof(igt_crc_t));
        |                                 ^~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1634722546:step_script
  section_start:1634722546:cleanup_file_variables
  Cleaning up file based variables
  section_end:1634722549:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/427842
