Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D12CD1299
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FD210F0C0;
	Thu, 11 Apr 2024 13:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZaWS//RQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6903710F0BA
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712841402; x=1744377402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xso2HmfeS9pEt+txBFPO/uRI/1kGM/DBQZybC/gZNGU=;
 b=ZaWS//RQeEixL3tN/gNFbrzgnL+98IF+i1NkJCwDKLk4Sodmwx/KQMA+
 HSrm7BoCWMg5Zu5jg70/ymaCb3zOPp0cm4f/H8Y6Hkav8RWg7zEMmz9B1
 i3LOxrgxFJjpMPHvtNLIUkt6J9CiBoes7/1lpiFdDboEtuXnNud1jjBqE
 cc32dwzBM+tQS9LT9X2JEsqdkXn5KjTmi/OemPirRcq0IxLAjYCGV5Gjm
 7mJFRGFXxCgj2OVhhYLMcmujuRAfMtTDp1OEuQb7JAwT3uQecgUmcX+SE
 AGLVJ7QEGfjbLJwff0c1CPaKf6LFBTb64ML+kHpZHM0IjfSGCgTviOEki Q==;
X-CSE-ConnectionGUID: DW2AFSDhS0mQCPFr5PD2DA==
X-CSE-MsgGUID: MzXKA9GoR3SiqKChOQ8xeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19670273"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="19670273"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:16:41 -0700
X-CSE-ConnectionGUID: w+wkdXSTQQiXE3eH3rrNKQ==
X-CSE-MsgGUID: Vy9aTs8MTbGlJnPS1zYDCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="51863054"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:16:40 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 4/5] tests/intel: Remove documentation collisions in
 i915_selftest
Date: Thu, 11 Apr 2024 13:15:53 +0000
Message-Id: <20240411131554.2999053-5-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411131554.2999053-1-katarzyna.piecielska@intel.com>
References: <20240411131554.2999053-1-katarzyna.piecielska@intel.com>
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
 tests/intel/i915_selftest.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index edacb6250..a466a9009 100644
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
@@ -70,7 +70,7 @@
  * Category: Selftest
  * Functionality: display sanity
  * Test category: i915
- * Sub-category: Display
+ * Sub-category: Display tests
  *
  * SUBTEST: live@dmabuf
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

