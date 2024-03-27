Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09283C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CFE10F8AE;
	Wed, 27 Mar 2024 12:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nHs5ZLVk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E3510F8AE
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542498; x=1743078498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k4nkRS1Ea9OTKoM1Q0ItuaUI5ZS3o/NOARRpUpbpAn8=;
 b=nHs5ZLVkdV93WMgH839Oo3SeLTCzA85T/LUKfir6+PtgIhva16mfks79
 NkGJtFW7T0WzYpamA/YwVfzIkrZgtMAp7ykJIi71ouFn8LLsyuWukTXPl
 Pds9TTW3vlyY/1gUowZ5zx9bBDeO+9+TbuVD/mTyOyqJz8xBp3ZBC0gBS
 61XOFXJ8y8bvln2fNTHipnIqSfLrt+AnfHdJB6/IL5OTzmmw2Z35MnJmh
 VGr+l062xWzai2lUIVVa27yv51F4CUYB1FZWvke2mNa6gjaCpNnjClfZQ
 n3CQ6r6rnWa0lQt32gVegG5js8xYY/boWeYtct1bMY8XZSUp1d5+bCqbK w==;
X-CSE-ConnectionGUID: SQs5qKTkRX2INY/RO1bf1Q==
X-CSE-MsgGUID: wtm5jzGLSPmH121OEmtptg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6530859"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6530859"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16932903"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:28:17 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t 04/16] tests/intel: Introduce Power management
 megafeature
Date: Wed, 27 Mar 2024 12:27:19 +0000
Message-Id: <20240327122731.2104614-5-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
References: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
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

 Add mega feature to Blitter tests.
 Group:
	SUBTEST
 	Description
 	Category
 	Mega feature
 	Sub-category
 	Functionality

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
---
 tests/intel/gem_pxp.c               |  7 +++---
 tests/intel/i915_pm_freq_mult.c     |  7 +++---
 tests/intel/i915_pm_rc6_residency.c |  7 +++---
 tests/intel/i915_pm_rpm.c           |  7 +++---
 tests/intel/i915_pm_rps.c           |  7 +++---
 tests/intel/i915_pm_sseu.c          |  5 ++--
 tests/intel/i915_power.c            |  7 +++---
 tests/intel/i915_selftest.c         | 38 +++++++++++++++--------------
 tests/intel/i915_suspend.c          |  8 +++---
 tests/intel/xe_gt_freq.c            |  3 ++-
 tests/intel/xe_pm.c                 |  3 ++-
 tests/intel/xe_pm_residency.c       |  3 ++-
 12 files changed, 57 insertions(+), 45 deletions(-)

diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index f90e92abd..b2789ccc6 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -10,10 +10,11 @@
 /**
  * TEST: gem pxp
  * Description: Test PXP that manages protected content through arbitrated HW-PXP-session
- * Feature: Protected Xe Path
- * Functionality: pxp
- * Sub-category: Power management
  * Category: Desktop client
+ * Mega feature: Power management
+ * Sub-category: Power management tests
+ * Functionality: pxp
+ * Feature: PXP
  *
  * SUBTEST: create-protected-buffer
  *
diff --git a/tests/intel/i915_pm_freq_mult.c b/tests/intel/i915_pm_freq_mult.c
index 3c390d427..6d375c5aa 100644
--- a/tests/intel/i915_pm_freq_mult.c
+++ b/tests/intel/i915_pm_freq_mult.c
@@ -14,10 +14,11 @@
  * TEST: i915 pm freq mult
  * Description: Tests for sysfs controls (or multipliers) for IP blocks which
  *		run at frequencies different from the main GT frequency.
- * Category: Firmware building block
- * Functionality: freq multipliers
+ * Category: Firmware
+ * Mega feature: Power management
+ * Sub-category: Power management tests
+ * Functionality: freg multipliers
  * Test category: i915
- * Sub-category: Power management
  *
  * SUBTEST: media-freq
  * Description: Tests for media frequency factor sysfs
diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index be9f9117a..92dae43b3 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -43,10 +43,11 @@
 #include "sw_sync.h"
 /**
  * TEST: i915 pm rc6 residency
- * Feature: GuCRC, pm_rc6
- * Functionality: rc6
- * Sub-category: Power management
  * Category: Desktop client
+ * Mega feature: Power management
+ * Sub-category: Power management tests
+ * Functionality: rc6
+ * Feature: GuCRC, pm_rc6
  *
  * SUBTEST: media-rc6-accuracy
  * Feature: pm_rc6
diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index 8ea3fd315..52e00489d 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -42,11 +42,12 @@
 #include <sys/stat.h>
 /**
  * TEST: i915 pm rpm
- * Feature: pm_rpm
- * Functionality: D3 state entry-exit
- * Sub-category: Power management
  * Category: Desktop client
+ * Mega feature: Power management
+ * Sub-category: Power management tests
+ * Functionality: D3 state entry-exit
  * Test category: pm_rpm
+ * Feature: pm_rpm
  *
  * SUBTEST: debugfs-forcewake-user
  * SUBTEST: debugfs-read
diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index 5aa5c6dbb..b6f55bb48 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -47,11 +47,12 @@
 /**
  * TEST: i915 pm rps
  * Description: Render P-States tests - verify GPU frequency changes
+ * Category: Desktop client
+ * Mega feature: Power management
+ * Sub-category: Power management tests
+ * Functionality: pm_rps
  * Feature: pm_rps
  * Test category: pm_rps
- * Functionality: rps
- * Sub-category: Power management
- * Category: Desktop client
  *
  * SUBTEST: basic-api
  *
diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
index 11df4f06c..1fb938893 100644
--- a/tests/intel/i915_pm_sseu.c
+++ b/tests/intel/i915_pm_sseu.c
@@ -38,10 +38,11 @@
 /**
  * TEST: i915 pm sseu
  * Description: Tests slice/subslice/EU power gating functionality.
- * Feature: pm_sseu
- * Sub-category: Power management
  * Category: Desktop client
+ * Mega feature: Power management
+ * Sub-category: Power management tests
  * Functionality: sseu
+ * Feature: pm_sseu
  *
  * SUBTEST: full-enable
  */
diff --git a/tests/intel/i915_power.c b/tests/intel/i915_power.c
index fe8437a0f..ef92efb6f 100644
--- a/tests/intel/i915_power.c
+++ b/tests/intel/i915_power.c
@@ -10,11 +10,12 @@
 /**
  * TEST: i915 power
  * Description: i915 power measurement tests
- * Feature: hwmon
- * Test category: GEM_Legacy
- * Sub-category: Power management
  * Category: Desktop client
+ * Mega feature: Power management
+ * Sub-category: Power management tests
  * Functionality: hwmon
+ * Feature: hwmon
+ * Test category: GEM_Legacy
  *
  * SUBTEST: sanity
  * Description: Sanity check gpu power measurement
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 580cfd127..675dad574 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -174,10 +174,11 @@
  * Sub-category: Mocs
  *
  * SUBTEST: live@gt_pm
- * Category: Selftest
  * Description: Basic i915 driver module selftests
+ * Category: Selftest
+ * Mega feature: Power management
+ * Sub-category: Power management tests
  * Functionality: rps, rc6
- * Sub-category: Power management
  *
  * SUBTEST: live@gt_timelines
  * Category: Selftest
@@ -252,11 +253,12 @@
  * Test category: i915
  *
  * SUBTEST: live@late_gt_pm
+ * Description: Basic i915 driver module selftests
  * Category: Selftest
- * Feature: rc6 feature
- * Functionality: Basic i915 driver module selftests
- * Test category: rc6
- * Sub-category: Power management
+ * Mega feature: Power management
+ * Sub-category: Power management tests
+ * Feature: rc6
+ * Functionality: rc6
  *
  * SUBTEST: live@lmem
  * Description: Basic i915 driver module selftests
@@ -351,20 +353,20 @@
  * Sub-category: Synchronization
  *
  * SUBTEST: live@slpc
- * Category: Selftest
- * Feature: slpc feature/ pm_rps
- * Test category: slpc / pm_rps
  * Description: Basic i915 driver module selftests
+ * Category: Selftest
+ * Mega feature: Power management
+ * Sub-category: Power management tests
  * Functionality: slpc
- * Sub-category: Power management
+ * Feature: slpc / pm_rps
  *
  * SUBTEST: live@uncore
- * Category: Selftest
  * Description: Basic i915 driver module selftests
- * Feature: forcewake feature
- * Test category: forcewake
+ * Category: Selftest
+ * Mega feature: Power management
+ * Sub-category: Power management tests
  * Functionality: forcewake
- * Sub-category: Power management
+ * Feature: forcewake
  *
  * SUBTEST: live@vma
  * Description: Per-object virtual address management
@@ -530,12 +532,12 @@
  * Test category: Memory Management
  *
  * SUBTEST: mock@uncore
- * Category: Selftest
  * Description: Basic i915 driver module selftests
- * Feature: forcewake feature
- * Test category: forcewake
+ * Category: Selftest
+ * Mega feature: Power management
+ * Sub-category: Power management tests
  * Functionality: forcewake
- * Sub-category: Power management
+ * Feature: forcewake
  *
  * SUBTEST: mock@vma
  * Category: Selftest
diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
index ae4404101..1f99c2ddc 100644
--- a/tests/intel/i915_suspend.c
+++ b/tests/intel/i915_suspend.c
@@ -46,12 +46,12 @@
 #include "igt_device_scan.h"
 /**
  * TEST: i915 suspend
- * Feature: suspend feature
+ * Category: Desktop client
+ * Mega feature: Power management
+ * Sub-category: Power management tests
  * Functionality: s2idle w/o i915
  * Test category: suspend
- * Functionality: suspend
- * Sub-category: Power management
- * Category: Desktop client
+ * Feature: suspend
  *
  * SUBTEST: basic-s2idle-without-i915
  * Description: Validate suspend-to-idle without i915 module
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index c12f6c52c..0c1acc688 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -6,7 +6,8 @@
 /**
  * TEST: Test Xe GT frequency request functionality
  * Category: Infrastructure
- * Sub-category: Power management
+ * Mega feature: Power management
+ * Sub-category: Power management tests
  * Functionality: frequency request
  * Test category: functionality test
  */
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index c8a5cc6de..6f4ca2472 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -6,7 +6,8 @@
 /**
  * TEST: Check Power Management functionality
  * Category: Software building block
- * Sub-category: Power management
+ * Mega feature: Power management
+ * Sub-category: Power management tests
  * Test category: functionality test
  */
 
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index ad70e2430..d58ebe804 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -6,7 +6,8 @@
 /**
  * TEST: Test gtidle properties
  * Category: Software building block
- * Sub-category: Power management
+ * Mega feature: Power management
+ * Sub-category: Power management tests
  * Functionality: GT C States
  * Test category: functionality test
  */
-- 
2.34.1

