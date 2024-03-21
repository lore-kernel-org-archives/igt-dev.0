Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA98C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FFE10ECD4;
	Thu, 21 Mar 2024 15:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxvJj7xW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DE710ECD4
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035681; x=1742571681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OikUxzB/mqVNpsr7LiVSpLIDvSWtgcBaeO50e7Wh5Hs=;
 b=cxvJj7xWKaMSmaRLtf0K/P9L1Bxvqo6AXhyUOG+n5XncPgwkusX7JfAl
 qbe+EC6CrWc32DSSzN1oVG5crzHGTHXOd4oN0oTMCulkPkQYWDerNhG5a
 30SSjabuu4aZ5Y5pB8Y1ibk/LyuYhVBJfdcgewHuCsTIvF0W+7d/JjItC
 Ys9iwXj540ShJkYWjA5pxXNjLz/dV0TKBD9ntAdnO7nuScmcm1s4C0dpc
 Gnlzkj4WZ3quumknIlXy/IepDKcz4f88MYZwotxp+MwCt9BG60Se7Iu7t
 IH4ngZSsjke2vddULLdtg8l9UtWZxxlZ/74UgZ8yidnfgZXkGqZiHKLxg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5885192"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5885192"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19197852"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:41:20 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v5 14/24] tests/intel: Introduce Power management
 subcategory
Date: Thu, 21 Mar 2024 15:38:37 +0000
Message-Id: <20240321153847.1787625-15-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
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

Let's put e.g. pm_rps, pm_rpm, sseu, hwmon, suspend, freg multipliers
and others under Power management subcategory.

v2: Make Sub-category/Functionality/Feature unique values. (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Acked-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_pxp.c               |  3 ++-
 tests/intel/i915_pm_freq_mult.c     |  9 ++++++---
 tests/intel/i915_pm_rc6_residency.c |  1 +
 tests/intel/i915_pm_rpm.c           |  2 ++
 tests/intel/i915_pm_rps.c           |  5 ++++-
 tests/intel/i915_pm_sseu.c          |  3 +++
 tests/intel/i915_power.c            |  3 +++
 tests/intel/i915_suspend.c          | 13 ++++++++-----
 8 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index 6a7f8e487..bef6056ba 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -10,9 +10,10 @@
 /**
  * TEST: gem pxp
  * Description: Test PXP that manages protected content through arbitrated HW-PXP-session
- * Feature: PXP
+ * Feature: Protected Xe Path
  * Functionality: pxp
  * Sub-category: Power management
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: create-protected-buffer
diff --git a/tests/intel/i915_pm_freq_mult.c b/tests/intel/i915_pm_freq_mult.c
index 49f6722b1..8f59be1bd 100644
--- a/tests/intel/i915_pm_freq_mult.c
+++ b/tests/intel/i915_pm_freq_mult.c
@@ -12,9 +12,12 @@
 #include "igt_sysfs.h"
 /**
  * TEST: i915 pm freq mult
- * Description:
- *   Tests for sysfs controls (or multipliers) for IP blocks which run at frequencies different
- *   from the main GT frequency.
+ * Description: Tests for sysfs controls (or multipliers) for IP blocks which
+ *		run at frequencies different from the main GT frequency.
+ * Category: Firmware building block
+ * Functionality: freq multipliers
+ * Test category: i915
+ * Sub-category: Power management
  * Run type: FULL
  *
  * SUBTEST: media-freq
diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index 30f57858d..67ae1f1f9 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -46,6 +46,7 @@
  * Feature: GuCRC, pm_rc6
  * Functionality: rc6
  * Sub-category: Power management
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: media-rc6-accuracy
diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index 9fbfac744..be8d5fd77 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -44,6 +44,8 @@
  * TEST: i915 pm rpm
  * Feature: pm_rpm
  * Functionality: D3 state entry-exit
+ * Sub-category: Power management
+ * Category: Desktop client
  * Test category: pm_rpm
  * Run type: FULL
  *
diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index 820edd45e..3d8fbcb8f 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -49,6 +49,9 @@
  * Description: Render P-States tests - verify GPU frequency changes
  * Feature: pm_rps
  * Test category: pm_rps
+ * Functionality: rps
+ * Sub-category: Power management
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: basic-api
@@ -63,7 +66,7 @@
  * Description:
  *   Check if the order of fences does not affect waitboosting.
  *   Render P-States tests - verify GPU frequency changes
- * Feature: pm_rps, synchronization
+ * Feature: pm_rps, synchronization feature
  *
  * SUBTEST: min-max-config-idle
  * SUBTEST: min-max-config-loaded
diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
index cee29a7c5..354403ef2 100644
--- a/tests/intel/i915_pm_sseu.c
+++ b/tests/intel/i915_pm_sseu.c
@@ -39,6 +39,9 @@
  * TEST: i915 pm sseu
  * Description: Tests slice/subslice/EU power gating functionality.
  * Feature: pm_sseu
+ * Sub-category: Power management
+ * Category: Desktop client
+ * Functionality: sseu
  * Run type: FULL
  *
  * SUBTEST: full-enable
diff --git a/tests/intel/i915_power.c b/tests/intel/i915_power.c
index ee00cbcd8..0f083b375 100644
--- a/tests/intel/i915_power.c
+++ b/tests/intel/i915_power.c
@@ -13,6 +13,9 @@
  * Feature: hwmon
  * Run type: FULL
  * Test category: GEM_Legacy
+ * Sub-category: Power management
+ * Category: Desktop client
+ * Functionality: hwmon
  *
  * SUBTEST: sanity
  * Description: Sanity check gpu power measurement
diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
index 4ee815031..ba758c42b 100644
--- a/tests/intel/i915_suspend.c
+++ b/tests/intel/i915_suspend.c
@@ -46,9 +46,12 @@
 #include "igt_device_scan.h"
 /**
  * TEST: i915 suspend
- * Feature: suspend
+ * Feature: suspend feature
  * Functionality: s2idle w/o i915
  * Test category: suspend
+ * Functionality: suspend
+ * Sub-category: Power management
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: basic-s2idle-without-i915
@@ -66,16 +69,16 @@
  * SUBTEST: debugfs-reader-hibernate
  *
  * SUBTEST: fence-restore-tiled2untiled
- * Feature: gtt, suspend, synchronization
+ * Feature: gtt, suspend feature, synchronization
  *
  * SUBTEST: fence-restore-tiled2untiled-hibernate
- * Feature: gtt, suspend, synchronization
+ * Feature: gtt, suspend feature, synchronization
  *
  * SUBTEST: fence-restore-untiled
- * Feature: gtt, suspend, synchronization
+ * Feature: gtt, suspend feature, synchronization
  *
  * SUBTEST: fence-restore-untiled-hibernate
- * Feature: gtt, suspend, synchronization
+ * Feature: gtt, suspend feature, synchronization
  *
  * SUBTEST: forcewake
  * Description: Test to prevent GT from suspend by opening forcewake handle
-- 
2.34.1

