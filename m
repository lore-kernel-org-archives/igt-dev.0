Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F419C28B2E
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 09:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F25210E05F;
	Wed, 12 Mar 2025 09:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D83ePSwU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB5810E0A6
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741771299; x=1773307299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ODo3zdg9pXBsGzeFJiRfqcPsOy9ApG68lZdQzfHPLe4=;
 b=D83ePSwURDeqREtPrshLBuRXRJqUkEE5iIVa4gCZ1apONMOD2iN/W0nV
 oAvfIh6t58Jfs2+4BzO/arjyPYol5CyhxQV7zXthdfYG1EPO71/qd/Sry
 uJLwpDRUaNT4h8jAADwhqxoILzNKIFS/RNWoxIsFQB9Mr+upcnvz632/j
 2VWlGODWBbaTOA2TVGikp8/ZLR+cvuAFWqY2RosSksJ0BT/J0KODjK36x
 bniN47pPJE26aDbSP/CxGHookRWmnvTd8pgYiJmRqUd3P6sOniBwS8GF+
 CTSQWlwYNmnW7SPagbLgEwU5ko35Kr0CiZ3UERExAXH3xuYqNIt26hTyB Q==;
X-CSE-ConnectionGUID: o2et19YHQwWkwuBipKm5MQ==
X-CSE-MsgGUID: Pc0MBNJsQsqwy5JTcWFV7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42564862"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="42564862"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 02:21:34 -0700
X-CSE-ConnectionGUID: 5SevskqGQZan0FHklTV++g==
X-CSE-MsgGUID: OUsEa3xeSGOwxZ2lFnAB3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="125643809"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 02:21:32 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms: Align test documentation
Date: Wed, 12 Mar 2025 14:56:53 +0530
Message-Id: <20250312092654.567154-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Formatting of test documentation in few KMS tests differs from
the established pattern.

	/**
	 * TEST:
	 * Category:
	 * Description:
	 * Driver requirement:
	 * Mega feature:
	 *
	 * SUBTEST:
	 * Description:
	 */

Also there is no need to duplicate documentation fields in subtests
if Category/Driver requirement/Mega feature are same for subtest
as for whole binary.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_fb_coherency.c    | 4 ++--
 tests/intel/kms_fbcon_fbt.c       | 3 +--
 tests/intel/kms_fence_pin_leak.c  | 4 ++--
 tests/intel/kms_flip_tiling.c     | 4 ++--
 tests/intel/kms_mmap_write_crc.c  | 4 ++--
 tests/intel/kms_pipe_stress.c     | 3 ++-
 tests/intel/kms_pm_dc.c           | 1 +
 tests/intel/kms_pm_lpsp.c         | 2 +-
 tests/intel/kms_psr_stress_test.c | 3 +++
 tests/intel/kms_pwrite_crc.c      | 4 ++--
 tests/kms_3d.c                    | 4 ++--
 tests/kms_atomic_transition.c     | 3 +++
 tests/kms_concurrent.c            | 4 ++--
 tests/kms_dp_aux_dev.c            | 4 ++--
 tests/kms_flip_event_leak.c       | 4 ++--
 tests/kms_multipipe_modeset.c     | 4 ++--
 tests/kms_sysfs_edid_timing.c     | 4 ++--
 tests/kms_tv_load_detect.c        | 4 ++--
 tests/testdisplay.c               | 4 ++--
 19 files changed, 37 insertions(+), 30 deletions(-)

diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
index c5338568d..573037db1 100644
--- a/tests/intel/kms_fb_coherency.c
+++ b/tests/intel/kms_fb_coherency.c
@@ -7,6 +7,8 @@
  * TEST: kms_fb_coherency
  * Category: Display
  * Description: Exercise coherency of future scanout buffer objects
+ * Mega feature: General Display Features
+ * Driver requirement: i915, xe
  */
 
 #include <errno.h>
@@ -23,8 +25,6 @@
  * Description: Use display controller CRC hardware to validate (non)coherency
  *		of memset operations on future scanout buffer objects
  *		mmapped with different mmap methods and different caching modes.
- * Mega feature: General Display Features
- * Driver requirement: i915, xe
  */
 
 typedef struct {
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 160f475f2..fedacec94 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -30,6 +30,7 @@
  * Description: Test the relationship between fbcon and the frontbuffer tracking
  *              infrastructure.
  * Driver requirement: i915, xe
+ * Mega feature: General Display Features
  */
 
 #include "igt.h"
@@ -44,12 +45,10 @@
  * SUBTEST: fbc
  * Description: Test the relationship between fbcon and the frontbuffer tracking
  *              infrastructure with fbc enabled.
- * Mega feature: General Display Features
  *
  * SUBTEST: fbc-suspend
  * Description: Suspend test to validate  the relationship between fbcon and the
  *              frontbuffer tracking infrastructure with fbc enabled.
- * Mega feature: General Display Features
  *
  * SUBTEST: psr
  * Description: Test the relationship between fbcon and the frontbuffer tracking
diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
index ed064aba0..4c1ac2653 100644
--- a/tests/intel/kms_fence_pin_leak.c
+++ b/tests/intel/kms_fence_pin_leak.c
@@ -26,6 +26,8 @@
  * TEST: kms fence pin leak
  * Category: Display
  * Description: Exercises full ppgtt fence pin_count leak in the kernel.
+ * Driver requirement: i915
+ * Mega feature: General Display Features
  */
 
 #include <errno.h>
@@ -40,8 +42,6 @@
 /**
  * SUBTEST:
  * Description: Along with the modeset, validate fence pin_count leakage.
- * Driver requirement: i915
- * Mega feature: General Display Features
  */
 
 IGT_TEST_DESCRIPTION("Exercises full ppgtt fence pin_count leak in the "
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index 3880534a7..ff9ad1229 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -28,6 +28,8 @@
  * TEST: kms flip tiling
  * Category: Display
  * Description: Test page flips and tiling scenarios
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
  */
 
 #include <errno.h>
@@ -40,8 +42,6 @@
 /**
  * SUBTEST: flip-change-tiling
  * Description: Check pageflip between modifiers
- * Driver requirement: i915, xe
- * Mega feature: General Display Features
  */
 
 IGT_TEST_DESCRIPTION("Test page flips and tiling scenarios");
diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index 24b5c70f2..ddc5ed63e 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -29,6 +29,8 @@
  * Category: Display
  * Description: Use the display CRC support to validate mmap write to an already
  *              uncached future scanout buffer.
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
  */
 
 #include <errno.h>
@@ -48,8 +50,6 @@
 /**
  * SUBTEST: main
  * Description: Tests that caching mode has become UC/WT and flushed using mmap write
- * Driver requirement: i915, xe
- * Mega feature: General Display Features
  */
 
 IGT_TEST_DESCRIPTION(
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 5ac3ea7d2..296c93b58 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -21,10 +21,11 @@
 #include "xe/xe_query.h"
 /**
  * TEST: kms pipe stress
+ * Category: Display
  * Description: Stress test how gpu and cpu behaves if maximum amount of
  *              planes, cpu and gpu utilization is achieved in order to reveal
  *              possible bandwidth/watermark and similar problems.
- * Category: Display
+ * Driver requirement: i915, xe
  * Mega feature: General Display Features
  *
  * SUBTEST: stress-xrgb8888-untiled
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 50473321a..cdac469e4 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -27,6 +27,7 @@
  * Category: Display
  * Description: Tests to validate display power DC states.
  * Driver requirement: i915, xe
+ * Mega feature: Display Power Management
  */
 
 #include <errno.h>
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 7ebff1062..771dc4134 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -28,6 +28,7 @@
  * TEST: kms pm lpsp
  * Category: Display
  * Description: These tests validates display Low Power Single Pipe configurations
+ * Driver requirement: i915, xe
  * Mega feature: Display Power Management
  */
 
@@ -43,7 +44,6 @@
 /**
  * SUBTEST: kms-lpsp
  * Description: This test validates lpsp on all connected outputs on low power pipes
- * Driver requirement: i915, xe
  *
  * SUBTEST: screens-disabled
  * Description: This test validates lpsp while all crtc are disabled
diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index 89dd377da..cc8155a75 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -2,6 +2,9 @@
 /**
  * TEST: kms psr stress test
  * Category: Display
+ * Description: This test mixes page flips and frontbuffer writes in primary and overlay
+ *              planes and expects that PSR stays active after each subtest without
+ *              any warnings or underruns.
  * Driver requirement: i915, xe
  * Mega feature: PSR
  */
diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
index b40a423b1..981d7b38e 100644
--- a/tests/intel/kms_pwrite_crc.c
+++ b/tests/intel/kms_pwrite_crc.c
@@ -26,6 +26,8 @@
  * TEST: kms pwrite crc
  * Category: Display
  * Description: Test to validate pwrite buffer using the display CRC
+ * Driver requirement: i915
+ * Mega feature: General Display Features
  */
 
 #include "igt.h"
@@ -39,8 +41,6 @@
  * SUBTEST:
  * Description: Use the display CRC support to validate pwrite to an already
  *              uncached future scanout buffer.
- * Driver requirement: i915
- * Mega feature: General Display Features
  */
 
 IGT_TEST_DESCRIPTION(
diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index bdbf389b4..31242c5f5 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -26,6 +26,8 @@
  * TEST: kms 3d
  * Category: Display
  * Description: Tests 3D mode setting.
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
  */
 
 #include "igt.h"
@@ -34,8 +36,6 @@
 /**
  * SUBTEST:
  * Description: Tests 3D mode setting.
- * Driver requirement: i915, xe
- * Mega feature: General Display Features
  */
 
 IGT_TEST_DESCRIPTION("Tests 3D mode setting.");
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 0342af206..2b64424ce 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -24,6 +24,9 @@
 /**
  * TEST: kms atomic transition
  * Category: Display
+ * Description: This is a stress test, to ensure that all combinations of
+ * 		atomic transitions work correctly. For i915/xe this will mainly be a
+ * 		stress test on watermark calculations.
  * Driver requirement: i915, xe
  * Mega feature: General Display Features
  */
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 86e9eae67..4f16f8b89 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -27,6 +27,8 @@
  * Category: Display
  * Description: Test atomic mode setting concurrently with multiple planes and
  *              screen resolution
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
  */
 
 #include "igt.h"
@@ -36,8 +38,6 @@
  * SUBTEST: multi-plane-atomic-lowres
  * Description: Test atomic mode setting concurrently with multiple planes and
  *              screen resolution.
- * Driver requirement: i915, xe
- * Mega feature: General Display Features
  */
 
 IGT_TEST_DESCRIPTION("Test atomic mode setting concurrently with multiple planes and screen resolution");
diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index 24cfdcb68..e74902111 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -26,6 +26,8 @@
  * TEST: kms dp aux dev
  * Category: Display
  * Description: Test that /dev/drm_dp_aux reads work
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
  */
 
 #include "config.h"
@@ -41,8 +43,6 @@
 /**
  * SUBTEST:
  * Description: Test that /dev/drm_dp_aux reads work
- * Driver requirement: i915, xe
- * Mega feature: General Display Features
  */
 
 IGT_TEST_DESCRIPTION("Test that /dev/drm_dp_aux reads work");
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index 56d5128b8..71b58b4df 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -26,6 +26,8 @@
  * TEST: kms flip event leak
  * Category: Display
  * Description: Test to validate flip event leak
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
  */
 
 #include "igt.h"
@@ -43,8 +45,6 @@
  *              page flip event when the fd is closed before the flip has
  *              completed. The test itself won't fail even if the kernel leaks
  *              the event, but the resulting dmesg WARN will indicate a failure.
- * Driver requirement: i915, xe
- * Mega feature: General Display Features
  */
 
 typedef struct {
diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index 84c2c58f8..69dc62e38 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -28,6 +28,8 @@
  * TEST: kms multipipe modeset
  * Category: Display
  * Description: Test simultaneous modeset on all the supported pipes
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
  */
 
 #include "igt.h"
@@ -36,8 +38,6 @@
  * SUBTEST: basic-max-pipe-crc-check
  * Description: Verify if simultaneous modesets on all the supported pipes is
  *              successful. Validate using CRC verification
- * Driver requirement: i915, xe
- * Mega feature: General Display Features
  */
 
 IGT_TEST_DESCRIPTION("Test simultaneous modeset on all the supported pipes");
diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index b77ebc3d6..bb900d709 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -25,6 +25,8 @@
  * TEST: kms sysfs edid timing
  * Category: Display
  * Description: Test to check the time it takes to reprobe each connector.
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
  */
 
 #include "igt.h"
@@ -41,8 +43,6 @@
  *              if the mean time it takes to reprobe one connector is too long.
  *              Additionally, make sure that the mean time for all connectors is
  *              not too long.
- * Driver requirement: i915, xe
- * Mega feature: General Display Features
  */
 
 #define THRESHOLD_PER_CONNECTOR		150
diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
index a6dbb8823..03d0729ae 100644
--- a/tests/kms_tv_load_detect.c
+++ b/tests/kms_tv_load_detect.c
@@ -26,6 +26,8 @@
  * TEST: kms tv load detect
  * Category: Display
  * Description: Test to check tv load detection.
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
  */
 
 #include "igt.h"
@@ -33,8 +35,6 @@
 /**
  * SUBTEST: load-detect
  * Description: Check tv load detection works correctly.
- * Driver requirement: i915, xe
- * Mega feature: General Display Features
  */
 
 IGT_TEST_DESCRIPTION("Check tv load detection works correctly.");
diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index d498eb04c..5131750ce 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -50,6 +50,8 @@
  * TEST: testdisplay
  * Category: Display
  * Description: Tests basic display functionality.
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
  */
 
 #include "config.h"
@@ -80,8 +82,6 @@
  * SUBTEST:
  * Description: This test is intended for testing of display functionality like
  *              modeset, clone modes, test patterns & pixel generators etc..
- * Driver requirement: i915, xe
- * Mega feature: General Display Features
  */
 
 IGT_TEST_DESCRIPTION("Tests basic display functionality.");
-- 
2.25.1

