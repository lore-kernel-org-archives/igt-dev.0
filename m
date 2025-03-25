Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABA7C3600D
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 17:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD1510E5C0;
	Tue, 25 Mar 2025 17:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kw2FKSoP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF3010E5C0
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742923492; x=1774459492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BV147x1qTFpVbd7lYIrfRpRCHRUvquOW+UFgSlwbICQ=;
 b=kw2FKSoPbcMFVYS81NQgmiu8Ber53gJcjkvuGtC/2FyuTshbCdvwobTX
 pnAdaJSAw15e4sFOcYYZHU3/fQcSmGkI55Fv9+2fUSPH41VLXyLLfipIc
 +oZrXZKMNuFAsfzkNZyZrv6QNVVJGSsOp5rorc774EaC9bu4E7Jp02b7U
 Shl0kmUyK3QEVswPwNeriMdYDTJGi0pmFr75Ryyo076GLnYkpfyhKF26p
 WToSOrSGZvRiUguBy2lrmB25Zxpm0Og2uGELk7Qtcfxz/kToMrA0H3UPy
 hX5LnM/NUcpsVtteGR2ibxooZsXj9Afgi9wbsairXsd7M4NTcGS4yHRpt Q==;
X-CSE-ConnectionGUID: E149hp09SFmBpSb4tOBEuw==
X-CSE-MsgGUID: e9arhea4SN+2riTwd9OL/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44197751"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="44197751"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 10:24:52 -0700
X-CSE-ConnectionGUID: G8Hob8gSR0e//6xKIA4VCA==
X-CSE-MsgGUID: A3w5lDyNRX+ck/15LmNrDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129288052"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 10:24:50 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 1/3] tests/intel/xe_pmu: move xe perf device to
 fixture
Date: Tue, 25 Mar 2025 23:16:20 +0530
Message-ID: <20250325174622.155975-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250325174622.155975-1-riana.tauro@intel.com>
References: <20250325174622.155975-1-riana.tauro@intel.com>
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
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
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

