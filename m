Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 29 Sep 2022 11:32:20 -0000
Message-ID: <166445114044.11951.6954262907223516529@emeril.freedesktop.org>
References: <20220929092845.6684-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220929092845.6684-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/i915=5Fpm=5Fbacklight=3A_Add_new_subtest_to_validate_?=
 =?utf-8?q?dual_panel_backlight_=28rev4=29?=
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

Series: tests/i915/i915_pm_backlight: Add new subtest to validate dual panel backlight (rev4)
URL   : https://patchwork.freedesktop.org/series/108246/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/700897 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/29197971):
                   from ../lib/drmtest.h:39,
                   from ../lib/igt.h:27,
                   from ../tests/i915/i915_pm_backlight.c:28:
  In function ‘memcpy’,
      inlined from ‘__igt_unique____real_main185’ at ../tests/i915/i915_pm_backlight.c:268:5:
  /usr/arm-linux-gnueabihf/include/bits/string_fortified.h:34:10: error: ‘__builtin___memcpy_chk’ forming offset [9, 12] is out of the bounds [0, 8] of object ‘context’ with type ‘struct context’ [-Werror=array-bounds]
     return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/i915/i915_pm_backlight.c: In function ‘__igt_unique____real_main185’:
  ../tests/i915/i915_pm_backlight.c:187:17: note: ‘context’ declared here
    struct context context = {0};
                   ^~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1664450886:step_script
  section_start:1664450886:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1664450888:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/29197973):
                   from ../lib/drmtest.h:39,
                   from ../lib/igt.h:27,
                   from ../tests/i915/i915_pm_backlight.c:28:
  In function ‘memcpy’,
      inlined from ‘__igt_unique____real_main185’ at ../tests/i915/i915_pm_backlight.c:268:5:
  /usr/mips-linux-gnu/include/bits/string_fortified.h:34:10: error: ‘__builtin___memcpy_chk’ forming offset [9, 12] is out of the bounds [0, 8] of object ‘context’ with type ‘struct context’ [-Werror=array-bounds]
     return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/i915/i915_pm_backlight.c: In function ‘__igt_unique____real_main185’:
  ../tests/i915/i915_pm_backlight.c:187:17: note: ‘context’ declared here
    struct context context = {0};
                   ^~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1664450896:step_script
  section_start:1664450896:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1664450897:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/700897
