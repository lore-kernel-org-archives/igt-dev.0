Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9E4C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CED10FBC3;
	Thu, 14 Mar 2024 14:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b2E+/jRj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3554410FBC4
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710427056; x=1741963056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=maRMwduOtwxtMPKVH8Pm8u7itDS56JlZ6+yA+sgnuzQ=;
 b=b2E+/jRjsGHamdabYf9Jk8dTCT2uDP0ZwuSVPwQG3WA1WtxwCMFBYGBJ
 IcX+eA7wM2lwcDsCz3Z5o9/ZYdLK8uQPxhra0G1anaTJ9JOOJdLui9swv
 UXp8RuVdODZyY0gHqSyygiJtj1hHutMEQbFiNzujV2KZsyYmyErBv//K2
 A95Ga7oMcKEQbUU3UBDDEOY0K0FKW16C+4wPSDvA+5PyYzrPTc64G4mYL
 OVgl5QLyeoYaS/cflsajyiSCNMKTKauYotTy2PDt3apgCfQVIGd2TnyM+
 2G/46NomicLjOWYFtgMVXNINmDmHTHEKYzbi4KaUNjffBy+r3CLmcEwfQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15801130"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="15801130"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:37:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12196814"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:37:34 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v4 15/25] tests/intel: Introduce Power management
 subcategory
Date: Thu, 14 Mar 2024 14:34:45 +0000
Message-Id: <20240314143455.1436688-16-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
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
---
 tests/intel/gem_pxp.c               | 3 ++-
 tests/intel/i915_pm_freq_mult.c     | 9 ++++++---
 tests/intel/i915_pm_rc6_residency.c | 1 +
 tests/intel/i915_pm_rpm.c           | 2 ++
 tests/intel/i915_pm_rps.c           | 3 +++
 tests/intel/i915_pm_sseu.c          | 3 +++
 tests/intel/i915_power.c            | 3 +++
 tests/intel/i915_suspend.c          | 3 +++
 8 files changed, 23 insertions(+), 4 deletions(-)

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
index 49f6722b1..de65eaedf 100644
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
+ * Category: Firmware
+ * Functionality: freg multipliers
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
index 820edd45e..3225ca25b 100644
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
index 4ee815031..7c96e25f5 100644
--- a/tests/intel/i915_suspend.c
+++ b/tests/intel/i915_suspend.c
@@ -49,6 +49,9 @@
  * Feature: suspend
  * Functionality: s2idle w/o i915
  * Test category: suspend
+ * Functionality: suspend
+ * Sub-category: Power management
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: basic-s2idle-without-i915
-- 
2.34.1

