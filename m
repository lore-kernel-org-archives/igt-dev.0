Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762E8C02188
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 22:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EF510E0F7;
	Thu, 16 Jan 2025 22:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFQlWFvz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9C810E0F7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 22:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737067925; x=1768603925;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j/0rWAmsmAhTecGLQGCp6q8+XV/rnr/rukZ/ZFKuPx0=;
 b=bFQlWFvz2wYTmCRBSNfN0XxQChqJpFcmkvo7HlMyqwMA5q9P8t/hneyX
 LrurHJDxuTkFkKt1OgmNtNHobwfGY/TQpPJivZpkbAtHX1Rc9Lk4pr3Gb
 xbsnGRoMJ3BFSrJ7fpP+GKzjo+htCrUgBI4NIu9D53ul7rXYqKcoXXTHX
 fVZkEo7PSH9xjMOfGntkjcaMHDmu8iaTEXNHN4/Jb+PLyrQp3Y5Vw2PzP
 UWAmWNUkT22Z2d4MykWpWV5jkdUqFDafp56amJla/adcgXQMxUlo7S5bJ
 2Nu37VLSkLfmnv0CLry3I44ktBkma1qHkxnlzBV+OhrJ8ABoGrCVyDVrw w==;
X-CSE-ConnectionGUID: pChojlcTR7mcCfUeUABYKg==
X-CSE-MsgGUID: ouKShgdITiGvIlNWqUJCDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48874371"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="48874371"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 14:52:04 -0800
X-CSE-ConnectionGUID: rMe94he7RQGDuwlNPqauOQ==
X-CSE-MsgGUID: D5rAkHFFTh+NymV545W/vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="105592101"
Received: from dut4375mtlh.fm.intel.com ([10.105.10.58])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 14:52:04 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: john.c.harrison@intel.com
Subject: [PATCH i-g-t] tests/perf_pmu: Fix busy-double-start for GuC backend
Date: Thu, 16 Jan 2025 14:52:00 -0800
Message-ID: <20250116225200.158728-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
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
Choose a reasonable timeslice for this test so that expected and actual
busyness is within acceptable threshold. A 5ms timeslice works well for
this specific use case.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/perf_pmu.c | 48 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 5d0467c02..1c0bafe82 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -441,6 +441,33 @@ busy_start(int gem_fd, const intel_ctx_t *ctx,
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
@@ -456,6 +483,22 @@ busy_double_start(int gem_fd, const intel_ctx_t *ctx,
 	const intel_ctx_t *tmp_ctx;
 	int fd;
 	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id), ahndN;
+	unsigned int saved, cs;
+
+	/*
+	 * On GuC-based platforms, backend could switch work at a very fast rate
+	 * determined by "timeslice_duration_ms". For a default value of 1 ms,
+	 * the switching latencies could add up really quickly over the test
+	 * duration. Choose a reasonable timeslice for this test so that
+	 * expected and actual busyness is within acceptable threshold. A 5ms
+	 * timeslice works well for this specific use case.
+	 */
+	if (gem_using_guc_submission(gem_fd)) {
+		cs = timeslice_fd(gem_fd, e);
+		igt_assert(igt_sysfs_scanf(cs, "timeslice_duration_ms", "%u", &saved) == 1);
+		igt_debug("initial timeslice %u ms\n", saved);
+		set_timeslice(cs, 5);
+	}
 
 	tmp_ctx = intel_ctx_create(gem_fd, &ctx->cfg);
 	ahndN = get_reloc_ahnd(gem_fd, tmp_ctx->id);
@@ -510,6 +553,11 @@ busy_double_start(int gem_fd, const intel_ctx_t *ctx,
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
2.43.0

