Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E0CCA5FF5
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 23:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A1F10E27E;
	Mon,  5 Oct 2026 23:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HavrZiUq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D766210E27E
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 23:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791243241; x=1822779241;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1xUFiHkHf4wHjf0Mk3KQX7l4rQPp0rAQXsNSVQfRG7g=;
 b=HavrZiUqic4iua8Ikv9pJotjbDMWNvKj1THNnlj1QlU+CpUQkpE3mNWX
 8YfwybGtqSDnLPl5tF5wO1fKYmBGnOfuY91xafIEQfARTAmfknj+QTqkW
 EOtHIkUl7aPzNOPMrzuS5mZseTXdEsqyU3Irujq2l8tgMLXRyMeN2ueq+
 xVVkr6pPirl7bmdYVyEmkOLYoOo1UUZlE6oJascBSkAESzcD1fpWHGL7/
 WT+4gS18j1Cw050qBwKQMMdmqw46h8MArc3gYncjECfQOgNap6FcPIYbq
 npvD0riAmXJNPoW/iTTRo9i1RVYV3AmeKquBVMAt2kiPrN+1gw2IK/Ac/ g==;
X-CSE-ConnectionGUID: ex8nHtvcTfaF6TiChshF0g==
X-CSE-MsgGUID: AnjeTKMkSlO2cLfg+w+bwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90960814"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="90960814"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 16:34:01 -0700
X-CSE-ConnectionGUID: ZFzFRrlpR5Sr2NdK+CZeoA==
X-CSE-MsgGUID: 5FKgzjENRyeNOmAPmbpO1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="306452251"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 16:34:01 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/perf_pmu: Fix busy-double-start for GuC backend
Date: Mon,  5 Oct 2026 16:33:56 -0700
Message-ID: <20261005233355.3452017-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
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

On GuC-based platforms, backend could switch work at a very fast rate
determined by "timeslice_duration_ms". For a default value of 1 ms, the
switching latencies could add up really quickly over the test duration.

While this works fine, workaround and other factors that may kick in for
some platforms at context switches add to the context switch latencies.

Choose a reasonable timeslice for this test so that expected and actual
busyness is within acceptable threshold. A 10ms timeslice works well for
this specific use case.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/4349
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/perf_pmu.c | 44 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 3a7f3410961f..b20f9bba1f9a 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -405,6 +405,33 @@ busy_start(int gem_fd, const intel_ctx_t *ctx,
 	gem_quiescent_gpu(gem_fd);
 }
 
+static void set_timeslice(int cs, unsigned int value)
+{
+	unsigned int delay;
+
+	igt_debug("setting timeslice to %u ms\n", value);
+	igt_assert_lte(0, igt_sysfs_printf(cs, "timeslice_duration_ms", "%u", value));
+	igt_sysfs_scanf(cs, "timeslice_duration_ms", "%u", &delay);
+	igt_assert_eq(delay, value);
+}
+
+static int timeslice_fd(int fd, const struct intel_execution_engine2 *e)
+{
+	int sys, cs = -1;
+	char buf[32];
+
+	sys = igt_sysfs_open(fd);
+	igt_require(sys != -1);
+
+	snprintf(buf, sizeof(buf), "engine/%s", e->name);
+	cs = openat(sys, buf, O_RDONLY);
+	igt_require(cs != -1);
+
+	close(sys);
+
+	return cs;
+}
+
 /*
  * This test has a potentially low rate of catching the issue it is trying to
  * catch. Or in other words, quite high rate of false negative successes. We
@@ -420,6 +447,18 @@ busy_double_start(int gem_fd, const intel_ctx_t *ctx,
 	const intel_ctx_t *tmp_ctx;
 	int fd;
 	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id), ahndN;
+	unsigned int saved, cs;
+
+	/*
+	 * Set a larger timeslice to minimize the engine busyness differences
+	 * due to context switch times
+	 */
+	if (gem_using_guc_submission(gem_fd)) {
+		cs = timeslice_fd(gem_fd, e);
+		igt_assert(igt_sysfs_scanf(cs, "timeslice_duration_ms", "%u", &saved) == 1);
+		igt_debug("initial timeslice %u ms\n", saved);
+		set_timeslice(cs, 10);
+	}
 
 	tmp_ctx = intel_ctx_create(gem_fd, &ctx->cfg);
 	ahndN = get_reloc_ahnd(gem_fd, tmp_ctx->id);
@@ -474,6 +513,11 @@ busy_double_start(int gem_fd, const intel_ctx_t *ctx,
 	put_ahnd(ahnd);
 	put_ahnd(ahndN);
 
+	if (gem_using_guc_submission(gem_fd)) {
+		set_timeslice(cs, saved);
+		close(cs);
+	}
+
 	assert_within_epsilon(val, ts[1] - ts[0], tolerance);
 	igt_assert_eq(val2, 0);
 
-- 
2.55.0

