Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF96ACD11DC
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8532710ED45;
	Thu, 21 Mar 2024 15:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j95BReUO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29D910ED55
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035709; x=1742571709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0RJKd7+ePdptM8IECl/FtDxjl6p0Co46NmRiArzs0IQ=;
 b=j95BReUOEt6y4aFNmgpKpp1F0JJolqIc5gO0blRHDIG2mvxS5nZjCrJJ
 LCspnUPlR39DwuazVGS5OJPCiOrc2m7KDrpYqW0OQyKTK/bm2Uc5iJSCJ
 3Iz1EPZyAGpYnPmZg7QHmQ3wJKcTq8nvLT9fMYkiiS48FtDA8d0gVTAK6
 JQT8+Wow/8WRfvvsmkaEpfs2ajtFfP33/2lRwmHpGy/A42bFQ6gxOoS5u
 OdOyV+fxHup/8UeL3oE8bZWVEPf9xlwpnQeutxNN0cRBM82ZVSoPcwtx/
 CtyopJHWu1dnd4scLOknGnNvIwwMxacnP5yPDT5zpOsSCpJkEAhv62xl2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17174468"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="17174468"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14581935"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:41:47 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v5 17/24] tests: Introduce Synchronization subcategory
Date: Thu, 21 Mar 2024 15:38:40 +0000
Message-Id: <20240321153847.1787625-18-katarzyna.piecielska@intel.com>
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

DRM and i915 subcategories seems to be too wide and general. Let's use
Synchronization subcategory.

v2: Make Sub-category/Functionality/Feature unique values. (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Reviewed-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_sync.c | 28 ++++++++++++++--------------
 tests/sw_sync.c        |  1 +
 tests/syncobj_basic.c  |  6 +++---
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index d3de2e77e..eee13789e 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -36,9 +36,9 @@
  * TEST: gem sync
  * Category: Infrastructure
  * Description: Basic check of ring<->ring write synchronisation.
- * Feature: synchronization
+ * Feature: synchronization feature
  * Functionality: semaphore
- * Sub-category: i915
+ * Sub-category: Synchronization
  * Test category: GEM_Legacy
  * Run type: FULL
  *
@@ -47,14 +47,14 @@
  *
  * SUBTEST: active-each
  * Description: Exercise waiting while keeping the GPU busy.
- * Feature: multitile, synchronization
+ * Feature: multitile, synchronization feature
  *
  * SUBTEST: active-wakeup
  * Description: Measure wakeup latency while also scheduling the next batch on each engine.
  *
  * SUBTEST: active-wakeup-each
  * Description: Measure wakeup latency while also scheduling the next batch.
- * Feature: multitile, synchronization
+ * Feature: multitile, synchronization feature
  *
  * SUBTEST: basic-all
  * Description: Basic test to wait upon a batch on all rings.
@@ -64,7 +64,7 @@
  * Description:
  *   Check synchronisation of ring.
  *   Exercise all physical engine selection and legacy rings
- * Feature: multitile, synchronization
+ * Feature: multitile, synchronization feature
  * Run type: BAT
  * Test category: MultiTile
  *
@@ -72,7 +72,7 @@
  * Description:
  *   Create race condition and see if we can catch interrupts.
  *   Basic check of ring to ring write synchronisation
- * Feature: multitile, synchronization
+ * Feature: multitile, synchronization feature
  * Test category: MultiTile
  *
  * SUBTEST: basic-store-all
@@ -82,7 +82,7 @@
  * Description:
  *   Check that store synchronisation works.
  *   Basic check of ring to ring write, store synchronisation
- * Feature: multitile, synchronization
+ * Feature: multitile, synchronization feature
  * Test category: MultiTile
  *
  * SUBTEST: default
@@ -93,7 +93,7 @@
  *
  * SUBTEST: double-wakeup-each
  * Description: Double stress test for nop + sync.
- * Feature: multitile, synchronization
+ * Feature: multitile, synchronization feature
  *
  * SUBTEST: forked
  * Description: Check synchronisation of ring with parallel executions on each engine.
@@ -105,7 +105,7 @@
  * Description:
  *   Forked variant of sync_ring, which checks synchronisation of ring with parallel
  *   executions.
- * Feature: multitile, synchronization
+ * Feature: multitile, synchronization feature
  *
  * SUBTEST: forked-store
  * Description: Check store synchronisation works with parallel multiple executions on each engine.
@@ -115,14 +115,14 @@
  *
  * SUBTEST: forked-store-each
  * Description: Forked variant of store_ring, check if parallel store synchronisation works.
- * Feature: multitile, synchronization
+ * Feature: multitile, synchronization feature
  *
  * SUBTEST: forked-switch
  * Description: Check sync after context switch parallelly on each engine.
  *
  * SUBTEST: forked-switch-each
  * Description: Check sync after context switch parallelly.
- * Feature: multitile, synchronization
+ * Feature: multitile, synchronization feature
  *
  * SUBTEST: idle
  * Description: Exercise and measure idle requests on each engine.
@@ -161,7 +161,7 @@
  *
  * SUBTEST: legacy-switch
  * Description: Check sync after context switch for each legacy engine.
- * Feature: synchronization
+ * Feature: synchronization feature
  * Run type: FULL
  *
  * SUBTEST: legacy-wakeup
@@ -189,7 +189,7 @@
  *
  * SUBTEST: switch-each
  * Description: Check sync after context switch.
- * Feature: multitile, synchronization
+ * Feature: multitile, synchronization feature
  *
  * SUBTEST: wait-all
  * Description: Extended version of existing basic-all test.
@@ -199,7 +199,7 @@
  *
  * SUBTEST: wakeup-each
  * Description: Stress test for nop + sync.
- * Feature: multitile, synchronization
+ * Feature: multitile, synchronization feature
  */
 
 #define MAX_PRIO I915_CONTEXT_MAX_USER_PRIORITY
diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index a276c4a22..8ea3dbe6c 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -44,6 +44,7 @@
  * Description: Test SW Sync Framework
  * Feature: semaphore
  * Functionality: sw sync framework
+ * Run type: FULL
  * Sub-category: uapi
  * Test category: GEM_Legacy
  *
diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
index f079baf09..18bef7c5c 100644
--- a/tests/syncobj_basic.c
+++ b/tests/syncobj_basic.c
@@ -30,10 +30,10 @@
  * TEST: syncobj basic
  * Category: Infrastructure
  * Description: Basic check for drm sync objects.
- * Feature: synchronization
- * Functionality: semaphore
+ * Feature: semaphore
+ * Functionality: drm sync object
  * Run type: FULL
- * Sub-category: DRM
+ * Sub-category: Synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: bad-create-flags
-- 
2.34.1

