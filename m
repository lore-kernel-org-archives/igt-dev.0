Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667DBCD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 11:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BC110F01F;
	Thu, 11 Apr 2024 11:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7jgZzkm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D175B10F01F
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712834286; x=1744370286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xso2HmfeS9pEt+txBFPO/uRI/1kGM/DBQZybC/gZNGU=;
 b=Q7jgZzkmIwnAgiQlI8pV6xXYpgumYsorBHClzJGEGMtK/I7KWQRvvAnM
 URzn33Fn47PKGfJUFr3Hshw8zHc5bzEceEjfe2Kqvaf6xZ6JF2jnNirPV
 UM6Dn/yFQy8XGnpVwitC36UTjmWJq2ymi93OwL2YbRUDQWE1Jn4HoG1Ls
 lH7SqiI6CebU4ubMz5nImdKtzMtuRUCzkBLKrxpHfoiiS9CPE77/1e4NX
 omRpd86Tf+NjYUI1bmwcamzQjKcc5uj5kcyussgpMRxV+5PLHElFi6Ayq
 EMclM1qaf26K753RaToytvn4xyPl4jM5YERqT09rSmZeO/SUs9DQPZtZX g==;
X-CSE-ConnectionGUID: CCxjUxVRT/+eUrpUHD5TXQ==
X-CSE-MsgGUID: 8mz8Q9BtRbitVjsTSP0F/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8364857"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8364857"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:18:05 -0700
X-CSE-ConnectionGUID: 7+bRMoueRUC7c4+J2i22UA==
X-CSE-MsgGUID: s9oUyefLTjmHHr/7wdQGpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21458646"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:18:04 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 4/5] tests/intel: Remove documentation collisions in
 i915_selftest
Date: Thu, 11 Apr 2024 11:17:16 +0000
Message-Id: <20240411111717.2941810-5-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411111717.2941810-1-katarzyna.piecielska@intel.com>
References: <20240411111717.2941810-1-katarzyna.piecielska@intel.com>
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

