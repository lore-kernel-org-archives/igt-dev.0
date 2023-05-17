Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90C410E3BF
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:39:06 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:18 +0530
Message-Id: <20230517063323.4146387-17-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 16/81] tests/i915/kms_draw_crc: Document each
 subtest for testplan
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

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_draw_crc.c | 71 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index db6d71f2e..d6694faee 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -22,11 +22,78 @@
  *
  */
 
-/* This program tests whether the igt_draw library actually works. */
-
+/**
+ * TEST: kms draw crc
+ * Category: Display
+ * Description: Tests whether the igt_draw library actually works.
+ */
 #include "i915/gem.h"
 #include "igt.h"
 
+/**
+ * SUBTEST: draw-method-blt
+ * Description: Verify that igt draw library works for the BLIT method with
+ *              different modifiers & DRM formats.
+ * Driver requirement: any
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: draw-method-mmap-cpu
+ * Description: Verify that igt draw library works for the MMAP-CPU method with
+ *              different modifiers & DRM formats.
+ * Driver requirement: i915
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: draw-method-mmap-gtt
+ * Description: Verify that igt draw library works for the MMAP-GTT method with
+ *              different modifiers & DRM formats.
+ * Driver requirement: i915
+ * Functionality: gtt, kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: draw-method-mmap-wc
+ * Description: Verify that igt draw library works for the MMAP-WC method with
+ *              different modifiers & DRM formats.
+ * Driver requirement: any
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: draw-method-pwrite
+ * Description: Verify that igt draw library works for the PWRITE method with
+ *              different modifiers & DRM formats.
+ * Driver requirement: i915
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: draw-method-render
+ * Description: Verify that igt draw library works for the RENDER method with
+ *              different modifiers & DRM formats.
+ * Driver requirement: any
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: fill-fb
+ * Description: This subtest verifies CRC after filling fb with x-tiling or none.
+ * Driver requirement: i915
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
+
 #define MAX_CONNECTORS 32
 
 int drm_fd;
-- 
2.40.0


