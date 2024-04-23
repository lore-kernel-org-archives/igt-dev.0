Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78131C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 10:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B51F10FBC3;
	Tue, 23 Apr 2024 10:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="To1MX9z4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5621210FBC3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713869462; x=1745405462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p1qY8LDgAIIv3xMqY71n7lNjy5uC4i0ejeOGjv/mVIs=;
 b=To1MX9z4E4QatXOSoa16gqMVuXOYXzD4bbGFJFL6vVys8OlSeC17QfAY
 NxC2vqJpy6qYV2buN+vsRZUntkuPCQY3AEv9Xc3zLibsNarFkP+BFPLOv
 IGRZTocYWFkN5crP6hOODOFVQ00WL5FI0IToqxxLW41XVz2DRXLiMuNOL
 jwz6TCu3K+YpOcCYyR0GX3y3Gp99TkXdcNWjfUkABKyy7VSLXhPYj8OaU
 OSw3oWE3uXlv7LKf4c1AO7frylAg5cdibckUjCA6VhadZmqyRyMpH9RmD
 iRVNm78ePb4G89lt93rYmgSgTYg1lDmnZfyF3rk4vZNlbk5tPNqKcgwDw Q==;
X-CSE-ConnectionGUID: n4rJAf7nQEeSd39kgIs9ow==
X-CSE-MsgGUID: U9mrQ0/vQMq5CnPJdIMtZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20594677"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20594677"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:51:02 -0700
X-CSE-ConnectionGUID: 7fe4yADiSIOCEKps2T4W5Q==
X-CSE-MsgGUID: 8p4I5jfpToe+rLqOn3rSqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="28980084"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:50:59 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v2 10/16] tests/intel: Introduce Performance Mega feature
Date: Tue, 23 Apr 2024 10:49:07 +0000
Message-Id: <20240423104913.3559587-11-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
References: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
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

Add mega feature to Performance tests.
Group:
	SUBTEST
	Description
	Category
	Mega feature
	Sub-category
	Functionality

v2: Move gem_ctx_freq to Power management (Sandeep)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
---
 tests/intel/i915_selftest.c | 43 +++++++++++++++++++++----------------
 tests/intel/perf.c          |  7 +++---
 tests/intel/perf_pmu.c      |  7 +++---
 3 files changed, 33 insertions(+), 24 deletions(-)

diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 30864a981..a5e5059bf 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -322,11 +322,12 @@
  * Test category: i915
  *
  * SUBTEST: live@perf
- * Category: Selftest
- * Feature: i915 perf selftests
  * Description: Basic i915 module perf unit selftests
+ * Category: Selftest
+ * Mega feature: Performance interface
+ * Sub-category: Performance tests
  * Functionality: perf
- * Sub-category: Performance
+ * Feature: i915 perf selftests
  *
  * SUBTEST: live@remote_tiles
  * Description: Tile meta data validation
@@ -590,42 +591,48 @@
  *
  * SUBTEST: perf
  * Category: Selftest
- * Feature: i915 perf selftests
+ * Mega feature: Performance interface
+ * Sub-category: Performance tests
  * Functionality: oa
- * Sub-category: Performance
+ * Feature: oa
  *
  * SUBTEST: perf@blt
- * Category: Selftest
- * Feature: i915 perf selftests
  * Description: Basic i915 module perf unit selftests
+ * Category: Selftest
+ * Mega feature: Performance interface
+ * Sub-category: Performance tests
  * Functionality: perf
- * Sub-category: Performance
+ * Feature: i915 perf selftests
  *
  * SUBTEST: perf@engine_cs
- * Category: Selftest
- * Feature: i915 perf selftests
  * Description: Basic i915 module perf unit selftests
+ * Category: Selftest
+ * Mega feature: Performance interface
+ * Sub-category: Performance tests
  * Functionality: perf
- * Sub-category: Performance
+ * Feature: i915 perf selftests
  *
  * SUBTEST: perf@region
- * Category: Selftest
- * Feature: i915 perf selftests
  * Description: Basic i915 module perf unit selftests
+ * Category: Selftest
+ * Mega feature: Performance interface
+ * Sub-category: Performance tests
  * Functionality: perf
- * Sub-category: Performance
+ * Feature: i915 perf selftests
  *
  * SUBTEST: perf@request
- * Category: Selftest
  * Description: Basic i915 module perf unit selftests
+ * Category: Selftest
+ * Mega feature: Performance interface
+ * Sub-category: Performance tests
  * Functionality: perf
- * Sub-category: Performance
  *
  * SUBTEST: perf@scheduler
- * Category: Selftest
  * Description: Basic i915 module perf unit selftests
+ * Category: Selftest
+ * Mega feature: Performance interface
+ * Sub-category: Performance tests
  * Functionality: perf
- * Sub-category: Performance
  */
 
 IGT_TEST_DESCRIPTION("Basic unit tests for i915.ko");
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index 7a63a3bdd..e1776812e 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -48,11 +48,12 @@
 /**
  * TEST: perf
  * Description: Test the i915 perf metrics streaming interface
+ * Category: Desktop client
+ * Mega feature: Performance interface
+ * Sub-category: Performance tests
+ * Functionality: oa
  * Feature: i915 streaming interface, oa
  * Test category: Perf
- * Functionality: oa
- * Sub-category: Performance
- * Category: Desktop client
  *
  * SUBTEST: blocking
  * Description: Test blocking read with default hrtimer frequency
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index e3d2f4664..7a92d5c1d 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -52,11 +52,12 @@
 /**
  * TEST: perf pmu
  * Description: Test the i915 pmu perf interface
- * Feature: i915 pmu perf interface, pmu feature
- * Test category: Perf
- * Sub-category: Performance
  * Category: Desktop client
+ * Mega feature: Performance interface
+ * Sub-category: Performance tests
  * Functionality: pmu
+ * Feature: i915 pmu perf interface, pmu
+ * Test category: Perf
  *
  * SUBTEST: all-busy-check-all
  * Description: Test the i915 pmu perf interface
-- 
2.34.1

