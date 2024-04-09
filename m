Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB209C67861
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 11:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E6C112CC9;
	Tue,  9 Apr 2024 11:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCKSHzHv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48546112CD1
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2024 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712661607; x=1744197607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WymTC7g5PaKfb3bymPLZvsxVpY5R2IoBnFQZMMSHQ7o=;
 b=gCKSHzHvgFzf1NSEgNhfbf941gdvk6B38g6VRAO07ST5mVsFJND7Ouio
 c1+Ksaecb0/c0epCzaeTrqqm4rpNax0J/TnTTAoNtBLWCFiNEXWmbszCK
 Ut38ZxUQ8+wOPjRZXsZOSo9nCMQeJE+TFTOqiz1GNz3zzq2qLPg2s/iqT
 ymJvaZX20bZYPWa/0Cfjmy6aTd9+LORw/81M0OFmSYCHSZmJ5Tb7zxD77
 nc0Jz9Gtg7rIHT0XJp0+ag/i+tYjraGeYzByvBMJu0IAu5AIXmzkdK7/P
 DeQwcRacv9/Lw0LcRnic7Nn04IZnoDO4XpPv7Bg1GyjxkWPBJsmGFYels A==;
X-CSE-ConnectionGUID: rkn/aaqXTNGybBCS6eFxfw==
X-CSE-MsgGUID: et0V59d+SbSDbskXbFdqzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7839747"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7839747"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:20:06 -0700
X-CSE-ConnectionGUID: UGzPBrdAQgOhj/tEugBq6A==
X-CSE-MsgGUID: NCNy0TxQQIqD1/k+u5jJhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20640548"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:20:05 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel: Remove documentation collisions in
 i915_selftest
Date: Tue,  9 Apr 2024 11:19:14 +0000
Message-Id: <20240409111915.2842477-5-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
References: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
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

Let's remove Category/Sub-category/Functionality name collisions.
Also reorder documentation in those cases to follow pattern as in other
tests:
	SUBTEST
	Description
	Category
	Sub-category
	Functionality
	Feature

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/i915_selftest.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index edacb6250..1d03fb388 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -28,10 +28,10 @@
  * Description: Basic unit tests for i915.ko
  *
  * SUBTEST: live
- * Feature: gem_core
- * Sub-category: Selftest
  * Category: Selftest
+ * Sub-category: Selftest subcategory
  * Functionality: live selftest
+ * Feature: gem_core
  *
  * SUBTEST: live@active
  * Category: Selftest
@@ -312,11 +312,11 @@
  * Sub-category: Reset
  *
  * SUBTEST: live@sanitycheck
- * Category: Selftest
  * Description: Checks the selftest infrastructure itself
- * Functionality: selftest
- * Test category: i915
+ * Category: Selftest
  * Sub-category: Core
+ * Functionality: sanitycheck
+ * Test category: i915
  *
  * SUBTEST: live@scheduler
  * Category: Selftest
@@ -369,9 +369,9 @@
  *
  * SUBTEST: mock
  * Category: Selftest
- * Feature: gem_core
- * Sub-category: Selftest
+ * Sub-category: Selftest subcategory
  * Functionality: mock selftest
+ * Feature: gem_core
  *
  * SUBTEST: mock@buddy
  * Category: Selftest
@@ -465,11 +465,11 @@
  * Sub-category: uapi
  *
  * SUBTEST: mock@sanitycheck
- * Category: Selftest
  * Description: Selftest for the selftest
- * Functionality: selftest
- * Test category: i915
+ * Category: Selftest
  * Sub-category: Core
+ * Functionality: sanitycheck
+ * Test category: i915
  *
  * SUBTEST: mock@scatterlist
  * Category: Selftest
-- 
2.34.1

