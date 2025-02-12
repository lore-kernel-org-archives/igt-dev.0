Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA1EC0219E
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 09:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633F410E82D;
	Wed, 12 Feb 2025 09:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQeAbY+b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2577D10E82D
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 09:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739353076; x=1770889076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pt3MkXT6MCXomnDj8//nGnNMx39PZX0yzg5V41yV/GA=;
 b=YQeAbY+bQKJkhbus/rItOgpvBKrcUeDmBE6hkZcQqYU8KW6XzSuhVOS5
 N2+Bm2ND0eBuF2E224T1yLTAy53JdCTxOIpbNHEogGSNxSTadkxI1lafy
 Oyy+qz1kgsDRMhg6flcFbn8FZHEuKIPqB0dHeww0wESi6FNIVNV+Xeiwb
 TZkMiuX5HBRC10gxq4DePo50vLzVvdmcrrZ+ycvvbxMM6pRCIxsipL0td
 9t0eIquC67ocT4GZ1zIh9G9lAHMt3RbHJHbXX+BK94TKQ65+fuUN5AVq2
 tqe5Hjkl2lkYaoHp+cQRqNQme2iqFHlkJBcX/vFlpi2DzyKy8+xgYVAQK Q==;
X-CSE-ConnectionGUID: QbCy8vI+Qx+1b8zylQ8koA==
X-CSE-MsgGUID: SnGuSfNcR6iIi7TJwoXWQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="42842257"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="42842257"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 01:37:56 -0800
X-CSE-ConnectionGUID: r0LP7nLmS8aEzNIQyAgfZA==
X-CSE-MsgGUID: rApql4QxRNC8GkglARH1Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117951792"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 01:37:53 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe_pmu: Add idle engine activity test
Date: Wed, 12 Feb 2025 15:28:29 +0530
Message-ID: <20250212095834.384508-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212095834.384508-1-riana.tauro@intel.com>
References: <20250212095834.384508-1-riana.tauro@intel.com>
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

Add a test to validate engine is idle by reading PMU counters
(engine-active-ticks, engine-total-ticks) when idle

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index cbb825755..b47be23ac 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -21,6 +21,9 @@
 #define SLEEP_DURATION 2 /* in seconds */
 const double tolerance = 0.1;
 
+/* flag masks */
+#define TEST_BUSY	BIT(0)
+
 #define assert_within_epsilon(x, ref, tolerance) \
 	igt_assert_f((double)(x) <= (1.0 + (tolerance)) * (double)(ref) && \
 		     (double)(x) >= (1.0 - (tolerance)) * (double)(ref), \
@@ -79,11 +82,13 @@ static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_c
 }
 
 /**
+ * SUBTEST: engine-activity-idle
+ * Description: Test to validate engine activity shows no load when idle
+ *
  * SUBTEST: engine-activity
- * Description: Test to validate engine activity stats by running a workload and
- *              reading the active ticks and total ticks PMU counters
+ * Description: Test to validate engine activity stats by running full load
  */
-static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
+static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 {
 	uint64_t config, busy_ticks, total_ticks, before[2], after[2];
 	struct xe_cork *cork = NULL;
@@ -97,14 +102,18 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
 	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
 
 	vm = xe_vm_create(fd, 0, 0);
-	cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
-	xe_cork_sync_start(fd, cork);
+
+	if (flags & TEST_BUSY) {
+		cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
+		xe_cork_sync_start(fd, cork);
+	}
 
 	pmu_read_multi(pmu_fd[0], 2, before);
 	usleep(SLEEP_DURATION * USEC_PER_SEC);
 	pmu_read_multi(pmu_fd[0], 2, after);
 
-	xe_cork_sync_end(fd, cork);
+	if (flags & TEST_BUSY)
+		xe_cork_sync_end(fd, cork);
 
 	busy_ticks = after[0] - before[0];
 	total_ticks = after[1] - before[1];
@@ -122,7 +131,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
 	close(pmu_fd[0]);
 	close(pmu_fd[1]);
 
-	assert_within_epsilon(busy_ticks, total_ticks, tolerance);
+	if (flags & TEST_BUSY)
+		assert_within_epsilon(busy_ticks, total_ticks, tolerance);
+	else
+		igt_assert(!busy_ticks);
 }
 
 igt_main
@@ -134,12 +146,19 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 	}
 
+	igt_describe("Validate there is no engine activity when idle");
+	igt_subtest_with_dynamic("engine-activity-idle")
+		xe_for_each_engine(fd, hwe)
+			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class),
+				      hwe->engine_instance)
+				engine_activity(fd, hwe, 0);
+
 	igt_describe("Validate engine activity with workload running by reading pmu counters");
 	igt_subtest_with_dynamic("engine-activity")
 		xe_for_each_engine(fd, hwe)
 			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class),
 				      hwe->engine_instance)
-				engine_activity(fd, hwe);
+				engine_activity(fd, hwe, TEST_BUSY);
 
 	igt_fixture {
 		close(fd);
-- 
2.47.1

