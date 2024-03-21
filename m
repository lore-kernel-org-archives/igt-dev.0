Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E1FC54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4148A10E97A;
	Thu, 21 Mar 2024 15:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+XzYEZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0611110E97A
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035747; x=1742571747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hkzC3RVJvJdlmGq4Pq2FpIt59e4TK+uADXPm8i/QhaM=;
 b=j+XzYEZXrf9RnIXg9MXCPuLCOsKTYeoxcS+fbdayuCdOzMziq0Qs1WJs
 r2s46gbCkErHREmPyyi6sHhnAw+xPZBGihNGEeghfUpAJ4M5vtO1AUyam
 ZPcOHYxfu7Iu+RwQA22ws/TqbqNqmfWRRDQ91T6Ahz6QztFm7GHMMf+wV
 m0ukKh2JD2IRF7EgJ4hQLi7dGrzaP92lRuPFFDIKZUMySvxUuFHr4q8ZD
 u6ZtynVEKnt4rx3tkTCFfe0D6QMcWnVEYzzv93GP4vnFjLx/JZC3YFSpk
 ponBIthiOtdl4dRx2rSYt9rTeltixbpttK4T+JyxDCD8SiyEdO5NHa4zL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5867184"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5867184"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14952534"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:42:25 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Subject: [PATCH i-g-t v5 21/24] tests/intel: Add more tests to Performance
 subcategory
Date: Thu, 21 Mar 2024 15:38:44 +0000
Message-Id: <20240321153847.1787625-22-katarzyna.piecielska@intel.com>
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

Tag tests/intel/perf.c & tests/intel/perf_pmu.c as performance.

v2: Make Sub-category/Functionality/Feature unique values. (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_ctx_freq.c |  2 +-
 tests/intel/perf.c         | 33 +++++++++++++++++----------------
 tests/intel/perf_pmu.c     | 19 ++++++++++---------
 3 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index 8c0d7db3c..6caaf4a1a 100644
--- a/tests/intel/gem_ctx_freq.c
+++ b/tests/intel/gem_ctx_freq.c
@@ -40,7 +40,7 @@
 /**
  * TEST: gem ctx freq
  * Category: Server
- * Feature: context
+ * Feature: context feature
  * Functionality: frequency management
  * Run type: FULL
  * Sub-category: Performance
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
index 718a3ed37..220d41748 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -52,9 +52,10 @@
 /**
  * TEST: perf pmu
  * Description: Test the i915 pmu perf interface
- * Feature: i915 pmu perf interface, pmu
+ * Feature: i915 pmu perf interface, pmu feature
  * Test category: Perf
  * Sub-category: Performance
+ * Category: Desktop client
  * Functionality: pmu
  * Run type: FULL
  *
@@ -107,10 +108,10 @@
  * Description: Test the i915 pmu perf interface
  *
  * SUBTEST: event-wait
- * Feature: obsolete, pmu
+ * Feature: obsolete, pmu feature
  *
  * SUBTEST: faulting-read
- * Feature: pmu
+ * Feature: pmu feature
  *
  * SUBTEST: frequency
  * Description: Read requested freq and actual frequency via PMU within specified time interval for any given workload changes
@@ -159,22 +160,22 @@
  *
  * SUBTEST: pmu-read
  * Description: Verify i915 pmu dir exists and read all events
- * Feature: pmu
+ * Feature: pmu feature
  *
  * SUBTEST: rc6
- * Feature: pmu
+ * Feature: pmu feature
  *
  * SUBTEST: rc6-all-gts
- * Feature: pmu
+ * Feature: pmu feature
  *
  * SUBTEST: rc6-suspend
- * Feature: pmu
+ * Feature: pmu feature
  *
  * SUBTEST: render-node-busy
- * Feature: pmu
+ * Feature: pmu feature
  *
  * SUBTEST: render-node-busy-idle
- * Feature: pmu
+ * Feature: pmu feature
  *
  * SUBTEST: semaphore-busy
  * Description: Test the i915 pmu perf interface
-- 
2.34.1

