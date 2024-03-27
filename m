Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F11C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72A210FCEB;
	Wed, 27 Mar 2024 12:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9dJGi+Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E3710FCEB
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542561; x=1743078561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xJbhDJ5kSeBb5Q3AC09Z/SwZ75u5pn8X8UP2H7qoIZc=;
 b=L9dJGi+QpnEb/1ZBaDBPXWZhfzB/VG4RfSh1cCJQwhgyTJMTvvdF7L8p
 aEOi/O6RLe7CYolh++fhDwy93W0nMQMt+tlyP6zxKJYpWD1X20h2Vlmi8
 vVFtB3bLrUvYCGEAbKB7k9nASQ7/dMeK1JprpnKm8LY5gFxZhr54ysG+a
 /u3rMOUnsL0crfxEjRSGYefJb1KkAuOtw7irAQdNibpx1BfvId0FdqXnl
 CUEYToyX2GFgovTaqxedJMtbt5+GRJ5CmF+KV4uhK0uPEitT6kWEohFKr
 pXexZhRCsvXNFnwggCyyZL4wpQI+8glE+vgRVTNyZoYbVSgT0plKMalen A==;
X-CSE-ConnectionGUID: JyHgndLNRsmBXb/nK3VH7Q==
X-CSE-MsgGUID: YV9/pffmQnavypeuje+yOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="10419136"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="10419136"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:29:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16336927"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:29:18 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t 10/16] tests/intel: Introduce Performance mega feature
Date: Wed, 27 Mar 2024 12:27:25 +0000
Message-Id: <20240327122731.2104614-11-katarzyna.piecielska@intel.com>
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

Add mega feature to Performance tests.
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
 tests/intel/gem_ctx_freq.c  |  5 +++--
 tests/intel/i915_selftest.c | 43 +++++++++++++++++++++----------------
 tests/intel/perf.c          |  7 +++---
 tests/intel/perf_pmu.c      |  7 +++---
 4 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index db67cade5..e862a084a 100644
--- a/tests/intel/gem_ctx_freq.c
+++ b/tests/intel/gem_ctx_freq.c
@@ -40,9 +40,10 @@
 /**
  * TEST: gem ctx freq
  * Category: Server
- * Feature: context feature
+ * Mega feature: Performance
+ * Sub-category: Performance tests
  * Functionality: frequency management
- * Sub-category: Performance
+ * Feature: context
  * Test category: GEM_Legacy
  *
  * SUBTEST: sysfs
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 517151e48..aeb9deb13 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -319,11 +319,12 @@
  * Test category: i915
  *
  * SUBTEST: live@perf
- * Category: Selftest
- * Feature: i915 perf selftests
  * Description: Basic i915 module perf unit selftests
+ * Category: Selftest
+ * Mega feature: Performance
+ * Sub-category: Performance tests
  * Functionality: perf
- * Sub-category: Performance
+ * Feature: i915 perf selftests
  *
  * SUBTEST: live@remote_tiles
  * Description: Tile meta data validation
@@ -586,42 +587,48 @@
  *
  * SUBTEST: perf
  * Category: Selftest
- * Feature: i915 perf selftests
+ * Mega feature: Performance
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
+ * Mega feature: Performance
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
+ * Mega feature: Performance
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
+ * Mega feature: Performance
+ * Sub-category: Performance tests
  * Functionality: perf
- * Sub-category: Performance
+ * Feature: i915 perf selftests
  *
  * SUBTEST: perf@request
- * Category: Selftest
  * Description: Basic i915 module perf unit selftests
+ * Category: Selftest
+ * Mega feature: Performance
+ * Sub-category: Performance tests
  * Functionality: perf
- * Sub-category: Performance
  *
  * SUBTEST: perf@scheduler
- * Category: Selftest
  * Description: Basic i915 module perf unit selftests
+ * Category: Selftest
+ * Mega feature: Performance
+ * Sub-category: Performance tests
  * Functionality: perf
- * Sub-category: Performance
  */
 
 IGT_TEST_DESCRIPTION("Basic unit tests for i915.ko");
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index 651ea9fd8..53ca5f625 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -48,11 +48,12 @@
 /**
  * TEST: perf
  * Description: Test the i915 perf metrics streaming interface
+ * Category: Desktop client
+ * Mega feature: Performance
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
index e3d2f4664..8c444c8b3 100644
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
+ * Mega feature: Performance
+ * Sub-category: Performance tests
  * Functionality: pmu
+ * Feature: i915 pmu perf interface, pmu
+ * Test category: Perf
  *
  * SUBTEST: all-busy-check-all
  * Description: Test the i915 pmu perf interface
-- 
2.34.1

