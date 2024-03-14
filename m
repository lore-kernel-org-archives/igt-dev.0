Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5273C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544FD10FBCB;
	Thu, 14 Mar 2024 14:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQNFkL29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E031110FBD1
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710427121; x=1741963121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8hcrbsbhwb+KttvOYKohwgoEoCPDOKN92QeMPGPPLi4=;
 b=ZQNFkL29AdW1JHZuOff/J8C4ruE2qdvbE5YW2fJ+l+cH/gpLJ7KcSqB8
 WMC+08AH3cQYw0uTwphn0T42fabA2hw6L4i26QSUoHSQsNu37Cmx+5UOL
 UWsRSm/w02l7Rm1CzkvMqMlitcsmD8vwWVpQQQUEhGCxEQgP8pC+eHm+7
 8nQ7HoET4J7/uYeNxj1aZVmwIOXfsuwHEPNLTRiTbhRuH3x8xdgSQfFH+
 5X51RpJDXold7jhZ+L73dFpa7aSreiUa/PncDkUe0XVg38EeTNljujNU7
 9jeKRboBrGt+VhJwOUYKWrNKcdf8Ybe6UDxZ4URww2nAKLnhUkgZ5Cy6Z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="22706695"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="22706695"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="17036535"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:38:39 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Subject: [PATCH i-g-t v4 22/25] tests/intel: Add more tests to Performance
 subcategory
Date: Thu, 14 Mar 2024 14:34:52 +0000
Message-Id: <20240314143455.1436688-23-katarzyna.piecielska@intel.com>
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

Tag tests/intel/perf.c & tests/intel/perf_pmu.c as performance.

v2: Make Sub-category/Functionality/Feature unique values. (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
---
 tests/intel/perf.c     | 33 +++++++++++++++++----------------
 tests/intel/perf_pmu.c |  1 +
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index e5d3fbd0e..44a0acf8d 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -52,6 +52,7 @@
  * Test category: Perf
  * Functionality: oa
  * Sub-category: Performance
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: blocking
@@ -70,44 +71,44 @@
  * Description: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: enable-disable
- * Feature: oa
+ * Feature: oa perf
  *
  * SUBTEST: gen12-group-concurrent-oa-buffer-read
  * Description: Verify concurrent reads from OA buffers in different groups
- * Feature: oa
+ * Feature: oa perf
  *
  * SUBTEST: gen12-group-exclusive-stream-ctx-handle
  * Description: Verify exclusivity of perf streams with ctx handle
- * Feature: oa
+ * Feature: oa perf
  *
  * SUBTEST: gen12-group-exclusive-stream-sample-oa
  * Description: Verify exclusivity of perf streams with sample oa option
- * Feature: oa
+ * Feature: oa perf
  *
  * SUBTEST: gen12-invalid-class-instance
  * Description: Verify invalid class instance
  *
  * SUBTEST: gen12-mi-rpc
  * Description: Test MI REPORT PERF COUNT for Gen 12
- * Feature: oa
+ * Feature: oa perf
  *
  * SUBTEST: gen12-oa-tlb-invalidate
  * Description: Test OA TLB invalidate
  *
  * SUBTEST: gen12-unprivileged-single-ctx-counters
  * Description: Measure performance for a specific context using OAR in Gen 12
- * Feature: oa
+ * Feature: oa perf
  *
  * SUBTEST: gen8-unprivileged-single-ctx-counters
- * Feature: oa, obsolete
+ * Feature: oa perf, obsolete
  *
  * SUBTEST: global-sseu-config
  * Description: Verify specifying SSEU opening parameters
- * Feature: oa
+ * Feature: oa perf
  *
  * SUBTEST: global-sseu-config-invalid
  * Description: Verify invalid SSEU opening parameters
- * Feature: oa
+ * Feature: oa perf
  *
  * SUBTEST: i915-ref-count
  * Description: Test the i915 perf metrics streaming interface
@@ -134,7 +135,7 @@
  * Description: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: mi-rpc
- * Feature: oa
+ * Feature: oa perf
  *
  * SUBTEST: missing-sample-flags
  * Description: Test the i915 perf metrics streaming interface
@@ -143,19 +144,19 @@
  * Description: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: non-system-wide-paranoid
- * Feature: oa
+ * Feature: oa perf
  *
  * SUBTEST: non-zero-reason
  * Description: Test that reason field in OA reports is never 0 on Gen8+
  *
  * SUBTEST: oa-exponents
- * Feature: oa
+ * Feature: oa perf
  *
  * SUBTEST: oa-formats
  * Description: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: per-context-mode-unprivileged
- * Feature: oa, obsolete
+ * Feature: oa perf, obsolete
  *
  * SUBTEST: polling
  * Description: Test polled read with default hrtimer frequency
@@ -167,20 +168,20 @@
  * Description: Test polled read with buffer size smaller than available data
  *
  * SUBTEST: rc6-disable
- * Feature: oa
+ * Feature: oa perf
  *
  * SUBTEST: short-reads
  * Description: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: stress-open-close
  * Description: Stress tests opening & closing the i915-perf stream in a busy loop
- * Feature: oa
+ * Feature: oa perf
  *
  * SUBTEST: sysctl-defaults
  * Description: Test the i915 perf metrics streaming interface
  *
  * SUBTEST: unprivileged-single-ctx-counters
- * Feature: oa, obsolete
+ * Feature: oa perf, obsolete
  *
  * SUBTEST: whitelisted-registers-userspace-config
  * Description: Test the i915 perf metrics streaming interface
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 718a3ed37..b80273a56 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -55,6 +55,7 @@
  * Feature: i915 pmu perf interface, pmu
  * Test category: Perf
  * Sub-category: Performance
+ * Category: Desktop client
  * Functionality: pmu
  * Run type: FULL
  *
-- 
2.34.1

