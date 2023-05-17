Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFE210E3B1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:38:44 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:04 +0530
Message-Id: <20230517063323.4146387-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 02/81] tests/dsc: Move dsc helpers to lib
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

The correct place for helpers is lib as the tests directory is
supposed to have test files, also having the helpers in tests
dir will break the compilation of testplan. Hence move all
helpers to library.

Expectation is to have an executable binary for each .c file
the "tests" dir.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_dsc_helper.c => lib/igt_dsc_helper.c | 2 +-
 tests/i915/kms_dsc_helper.h => lib/igt_dsc_helper.h | 0
 lib/meson.build                                     | 1 +
 tests/i915/kms_dsc.c                                | 2 +-
 tests/i915/kms_psr2_sf.c                            | 2 +-
 tests/meson.build                                   | 4 ++--
 6 files changed, 6 insertions(+), 5 deletions(-)
 rename tests/i915/kms_dsc_helper.c => lib/igt_dsc_helper.c (99%)
 rename tests/i915/kms_dsc_helper.h => lib/igt_dsc_helper.h (100%)

diff --git a/tests/i915/kms_dsc_helper.c b/lib/igt_dsc_helper.c
similarity index 99%
rename from tests/i915/kms_dsc_helper.c
rename to lib/igt_dsc_helper.c
index 02d1a4848..600a90746 100644
--- a/tests/i915/kms_dsc_helper.c
+++ b/lib/igt_dsc_helper.c
@@ -3,7 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#include "kms_dsc_helper.h"
+#include "igt_dsc_helper.h"
 
 static bool force_dsc_en_orig;
 static int force_dsc_restore_fd = -1;
diff --git a/tests/i915/kms_dsc_helper.h b/lib/igt_dsc_helper.h
similarity index 100%
rename from tests/i915/kms_dsc_helper.h
rename to lib/igt_dsc_helper.h
diff --git a/lib/meson.build b/lib/meson.build
index 2d3456577..75e52580b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -101,6 +101,7 @@ lib_sources = [
 	'veboxcopy_gen12.c',
 	'igt_msm.c',
 	'igt_dsc.c',
+	'igt_dsc_helper.c',
 	'xe/xe_compute.c',
 	'xe/xe_compute_square_kernels.c',
 	'xe/xe_ioctl.c',
diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 3ce28f848..4af48b196 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -30,7 +30,7 @@
  *
  */
 
-#include "kms_dsc_helper.h"
+#include "igt_dsc_helper.h"
 
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 4cf986440..7c21970a5 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -25,7 +25,7 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "igt_psr.h"
-#include "kms_dsc_helper.h"
+#include "igt_dsc_helper.h"
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
diff --git a/tests/meson.build b/tests/meson.build
index d5f0f54c1..7983bd019 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -477,7 +477,7 @@ test_executables += executable('kms_color',
 test_list += 'kms_color'
 
 test_executables += executable('kms_dsc',
-	   [ join_paths('i915', 'kms_dsc.c'), join_paths ('i915', 'kms_dsc_helper.c')],
+	   join_paths('i915', 'kms_dsc.c'),
 	   dependencies : test_deps,
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
@@ -485,7 +485,7 @@ test_executables += executable('kms_dsc',
 test_list += 'kms_dsc'
 
 test_executables += executable('kms_psr2_sf',
-	   [ join_paths('i915', 'kms_psr2_sf.c'), join_paths ('i915', 'kms_dsc_helper.c')],
+	   join_paths('i915', 'kms_psr2_sf.c'),
 	   dependencies : test_deps,
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
-- 
2.40.0


