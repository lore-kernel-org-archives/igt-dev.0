Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3240C25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 15:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797E210EC26;
	Thu, 23 May 2024 15:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpxexiC/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF1B10EF07
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716477487; x=1748013487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9TH49WSRxREsDmDwWtseo3Sef4fXMMx5NR9skW97IQk=;
 b=hpxexiC/YPDevoP9rL8VIREAo6fFXJ8LMc13fcUeoHIi+9yX7Qs9Pe83
 /2id1XW3Cwc+lMzH0XMilF7auOthDGlEYHjJCv7LYNjaY3UZpu+p3O812
 oa4klnP1Du5XHO5ug0Z3V5jvSfeBeDeJKLaTeX+6XdpZHCFLOV9aBPLIW
 ZQ/gwK46/5mDP+4hk4lQKBORsLFKtMZDbUroQfEHdq1SA6ylqFNluNF0d
 VrsXx3QhoEzX/Yl9ER9tCwvfQcHT0iLKp5t7Vee8Mjat0xGuVmmpKXpTt
 JzsQnEABE4LkdXwmFD9cIDeg7Fl4Xa6YN+fKWHZlVFV3c0NFqfNrsnmw/ w==;
X-CSE-ConnectionGUID: 8trHwtcwRFumgOwQ6DVoVA==
X-CSE-MsgGUID: 0gs2JWTfQVSpYZ5n4mkE/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="35316800"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="35316800"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:18:06 -0700
X-CSE-ConnectionGUID: 0Cq9b74bS96MiLcI8wOWkg==
X-CSE-MsgGUID: kYdJv50NQtCB9qMJp3p3kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="33712189"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:18:04 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests: Remove Sub-category duplicates after
 introducing Category=Core
Date: Thu, 23 May 2024 15:17:29 +0000
Message-Id: <20240523151729.877971-4-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523151729.877971-1-katarzyna.piecielska@intel.com>
References: <20240523151729.877971-1-katarzyna.piecielska@intel.com>
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

We do not want to have the same name for Category and Sub-category or any
other collision in documented fields. After I unified Category field for Core
tests there are some duplicated names in Category and Sub-category.
Let's remove them.
When doing that change I find few tests that do not have Mega feature defined.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/dmabuf_sync_file.c    | 3 ++-
 tests/drm_read.c            | 3 ++-
 tests/intel/i915_pciid.c    | 2 +-
 tests/intel/i915_selftest.c | 8 ++++----
 tests/prime_vgem.c          | 2 +-
 tests/syncobj_eventfd.c     | 7 ++++---
 tests/vgem_basic.c          | 2 +-
 tests/vgem_slow.c           | 2 +-
 8 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
index ba33f6a9d..ca9d7d579 100644
--- a/tests/dmabuf_sync_file.c
+++ b/tests/dmabuf_sync_file.c
@@ -13,9 +13,10 @@ IGT_TEST_DESCRIPTION("Tests for sync_file support in dma-buf");
 /**
  * TEST: dmabuf_sync_file
  * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: dmabuf
  * Description: Tests for sync_file support in dma-buf
  * Functionality: dmabuf test
- * Sub-category: Core
  *
  * SUBTEST: export-basic
  * SUBTEST: export-before-signal
diff --git a/tests/drm_read.c b/tests/drm_read.c
index a7f0d8702..0a9b61cd0 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -54,8 +54,9 @@ IGT_TEST_DESCRIPTION("Call read(drm) and see if it behaves.");
  * TEST: drm read
  * Description: boundary testing of read(drm_fd)
  * Category: Core
- * Functionality: drm_mm
+ * Mega feature: General Core features
  * Sub-category: uapi
+ * Functionality: drm_mm
  *
  * SUBTEST: invalid-buffer
  * SUBTEST: fault-buffer
diff --git a/tests/intel/i915_pciid.c b/tests/intel/i915_pciid.c
index 42ed7151d..a8c5df9d9 100644
--- a/tests/intel/i915_pciid.c
+++ b/tests/intel/i915_pciid.c
@@ -33,7 +33,7 @@
  * Description: Check that igt/i915 know about this PCI-ID
  * Category: Core
  * Mega feature: General Core features
- * Sub-category: Core
+ * Sub-category: driver
  * Functionality: device management
  * Feature: core
  * Test category: GEM_Legacy
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index f234ca2de..aa29eb36a 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -310,7 +310,7 @@
  * Description: Validation of per-object locking patterns
  * Category: Core
  * Mega feature: General Core features
- * Sub-category: Core
+ * Sub-category: CMD submission
  * Functionality: per-object locking
  * Test category: i915
  *
@@ -318,7 +318,7 @@
  * Description: User object allocation and isolation checks
  * Category: Core
  * Mega feature: General Core features
- * Sub-category: Core
+ * Sub-category: CMD submission
  * Functionality: objects
  * Test category: i915
  *
@@ -357,7 +357,7 @@
  * Description: Checks the selftest infrastructure itself
  * Category: Core
  * Mega feature: General Core features
- * Sub-category: Core
+ * Sub-category: driver
  * Functionality: sanitycheck
  * Test category: i915
  *
@@ -531,7 +531,7 @@
  * Description: Selftest for the selftest
  * Category: Core
  * Mega feature: General Core features
- * Sub-category: Core
+ * Sub-category: driver
  * Functionality: sanitycheck
  * Test category: i915
  *
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 79ea12b5c..932058d2c 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -35,7 +35,7 @@
  * Description: Basic check of polling for prime/vgem fences.
  * Category: Core
  * Mega feature: General Core features
- * Sub-category: Core
+ * Sub-category: DRM
  * Functionality: mock device
  * Feature: prime
  * Test category: GEM_Legacy
diff --git a/tests/syncobj_eventfd.c b/tests/syncobj_eventfd.c
index a4a73f251..f8bf17e1f 100644
--- a/tests/syncobj_eventfd.c
+++ b/tests/syncobj_eventfd.c
@@ -13,11 +13,12 @@
 
 /**
  * TEST: syncobj eventfd
- * Category: Core
  * Description: Tests for the drm sync object eventfd API
- * Feature: synchronization
- * Functionality: semaphore
+ * Category: Core
+ * Mega feature: General Core features
  * Sub-category: DRM
+ * Functionality: semaphore
+ * Feature: synchronization
  * Test category: GEM_Legacy
  */
 
diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index f30722bbe..048ad7460 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -36,7 +36,7 @@
  * Description: Basic sanity check of Virtual GEM module (vGEM).
  * Category: Core
  * Mega feature: General Core features
- * Sub-category: Core
+ * Sub-category: DRM
  * Functionality: mock device
  * Test category: GEM_Legacy
  * Feature: vgem
diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
index 3ce0f811e..6609989c7 100644
--- a/tests/vgem_slow.c
+++ b/tests/vgem_slow.c
@@ -35,7 +35,7 @@
  * Description: Extended sanity check of Virtual GEM module (vGEM).
  * Category: Core
  * Mega feature: General Core features
- * Sub-category: Core
+ * Sub-category: DRM
  * Functionality: mock device
  * Feature: vgem
  * Test category: GEM_Legacy
-- 
2.34.1

