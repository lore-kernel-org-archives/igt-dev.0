Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A64C25B75
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 10:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EEC10E636;
	Mon, 13 May 2024 10:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BuqmDKyf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E3510E650
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 10:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715597436; x=1747133436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iEMo1gxJMCLRe9xpZ6To/MUZW0C00TvvgBDjpxrlfrk=;
 b=BuqmDKyfHG0uMqOfRMC/AFp27swgL7XVaCAVWfMUiOe31RWRix3NaO+h
 UqIOPNQ7bogwU2MiGnEYFiWbawmJliry/IZ0UyWzJFDdbFcS5wF55cKTD
 gtHs10VYVu0ApFY4mnCUJd4v1t+G3liqMNcM3JwnC686Qz4YVTXpEUVWo
 7AO7LAKidGpuzxiFrSilRxauAGAxrMh7yRfcXxyGpDAhYATSfYSs5A3bd
 p8ifqIKCC+vkQwMsuj98sy1e6YNewmzf7Ey9ixnX21ON2WdGq/xvD/eTk
 HViScGl3+cSRVbkNdFznwLRkovghWuYxyj3zoZI4nXrU+v6R8djFnkT33 Q==;
X-CSE-ConnectionGUID: vTmiKtejR/WXgIdrW2KkfQ==
X-CSE-MsgGUID: xW7wErF+TfmjPA0T2TRlLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22925159"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22925159"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:50:35 -0700
X-CSE-ConnectionGUID: 8ein32NWTZ6RrGrPr+W9Cw==
X-CSE-MsgGUID: HgDUJC5JSfKM5NMUxtmAKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="53519031"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:50:34 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v3 10/16] tests/intel: Introduce Performance Mega feature
Date: Mon, 13 May 2024 10:48:40 +0000
Message-Id: <20240513104846.362332-11-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
References: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
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
index 7d6b4d4fd..e4354df5f 100644
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

