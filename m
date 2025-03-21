Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1A9C36002
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 10:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F2510E121;
	Fri, 21 Mar 2025 10:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNaOfefs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC4B10E0BC
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 10:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742554114; x=1774090114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ra4oWoykgrQ5Ws/VcJR/mR2wMDg7pnVf2kmkvcLkGJo=;
 b=WNaOfefsXAoc5miizRKqFmAAxuYpH/Eu3p+MsaQ9isI4HyixAdVk887n
 +RQ/uUagQmlsISdgW0VFJnClQA74ALGT3Uv2u+bVGfSE1igS/P1SM8QMj
 jP62wpKMBznOuX4+JBLuhVHU1sQVK0n2plV6jlqqpxPtfhV2suI52Otfp
 arl6MnvrfjPOgrCTWv3fuO/XTcWqRKxDW9IhA+ggwPijNH2LyyCH7ZVCT
 GmhAKO/gI7QSLHDsHjlnUiduGYKBlGYmnFGYaz0hPZD8FF/4cm34XsOr0
 /ocdBKQXVvZOK6/apkzQoaRgu6jtwVxAjaOzVTV++kQqisqrwUIpDOW7U A==;
X-CSE-ConnectionGUID: CsLtaa4fReG3+XYMgJBYbQ==
X-CSE-MsgGUID: iiQF4XmdQimiGfU3iSYPig==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43980311"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="43980311"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 03:48:34 -0700
X-CSE-ConnectionGUID: gvndxeSWRgafmUcAEieUxw==
X-CSE-MsgGUID: U3Qtu7EdR+O7MK4g+BFkMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="123542909"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 03:48:32 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 michal.wajdeczko@intel.com, satyanarayana.k.v.p@intel.com
Subject: [PATCH i-g-t v3 1/3] tests/intel/xe_pmu: move xe perf device to
 fixture
Date: Fri, 21 Mar 2025 16:39:56 +0530
Message-ID: <20250321110958.3557106-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321110958.3557106-1-riana.tauro@intel.com>
References: <20250321110958.3557106-1-riana.tauro@intel.com>
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

move xe perf device to fixture and re-use instead of
initializing multiple times

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 66edf24ad..f0959abe2 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -26,6 +26,7 @@
 #define TEST_TRAILING_IDLE	BIT(1)
 
 const double tolerance = 0.1;
+static char xe_device[NAME_MAX];
 
 #define test_each_engine(test, fd, hwe) \
 	igt_subtest_with_dynamic(test) \
@@ -92,7 +93,7 @@ static unsigned long read_idle_residency(int fd, int gt)
 	return residency;
 }
 
-static uint64_t add_format_config(const char *xe_device, const char *format, uint64_t val)
+static uint64_t add_format_config(const char *format, uint64_t val)
 {
 	int ret;
 	uint32_t shift;
@@ -105,21 +106,19 @@ static uint64_t add_format_config(const char *xe_device, const char *format, uin
 	return config;
 }
 
-static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_class_instance *eci,
+static uint64_t get_event_config(unsigned int gt, struct drm_xe_engine_class_instance *eci,
 				 const char *event)
 {
-	char xe_device[100];
 	uint64_t pmu_config = 0;
 	int ret;
 
-	xe_perf_device(xe, xe_device, sizeof(xe_device));
 	ret = perf_event_config(xe_device, event, &pmu_config);
 	igt_assert(ret >= 0);
-	pmu_config |= add_format_config(xe_device, "gt", gt);
+	pmu_config |= add_format_config("gt", gt);
 
 	if (eci) {
-		pmu_config |= add_format_config(xe_device, "engine_class", eci->engine_class);
-		pmu_config |= add_format_config(xe_device, "engine_instance", eci->engine_instance);
+		pmu_config |= add_format_config("engine_class", eci->engine_class);
+		pmu_config |= add_format_config("engine_instance", eci->engine_instance);
 	}
 
 	return pmu_config;
@@ -144,10 +143,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 	uint32_t vm;
 	int pmu_fd[2];
 
-	config = get_event_config(fd, eci->gt_id, eci, "engine-active-ticks");
+	config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
 	pmu_fd[0] = open_group(fd, config, -1);
 
-	config = get_event_config(fd, eci->gt_id, eci, "engine-total-ticks");
+	config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
 	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
 
 	vm = xe_vm_create(fd, 0, 0);
@@ -202,7 +201,7 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
 	uint64_t val;
 
 	/* Get the PMU config for the gt-c6 event */
-	pmu_config = get_event_config(xe, gt, NULL, "gt-c6-residency");
+	pmu_config = get_event_config(gt, NULL, "gt-c6-residency");
 
 	pmu_fd = open_pmu(xe, pmu_config);
 
@@ -233,6 +232,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_perf_device(fd, xe_device, sizeof(xe_device));
 	}
 
 	igt_describe("Validate PMU gt-c6 residency counters when idle");
-- 
2.47.1

