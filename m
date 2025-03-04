Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2069FC021B8
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 09:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5AA10E54B;
	Tue,  4 Mar 2025 09:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWos3mRL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACE910E54B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741081762; x=1772617762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fYs3qEY68mGPVLyObmxaWxcur6rROe1FzdAfvmvm6KQ=;
 b=bWos3mRLGTyqAiV253DJ3LvgHXqGunwqwoxCnG3g2mQDgxVyFMKpejPo
 0mrxFgdb0NVVIF1osRY3teNQmiATFgFSOpDOILXsvJ/RTMN2z2ZY4dtOO
 kTawYzVuauSxJ5+/Cs4GaeUxhCr3Aaohz1SGamT8TUeGurrAhEyO+Jqry
 6e6/TmiVfsDSKn8XIcY3JELspzEa+nWqSCdGcu0QgtAC99kw1IQe5lW1o
 GhlzMmu/Xh78owFcPwM06MFUKtUwHhR5H9QwXX930aEG8QwKQjYcoIsB5
 Fh7BSRTVH14Fg0fyMLMey0hxe8vUNfDyLlNb7XFDy3Pp8HTYWaPfKaGHc A==;
X-CSE-ConnectionGUID: DeS6MZxoTSOz3gD4xGgpBw==
X-CSE-MsgGUID: V1p1pcU+QEC5pRqqEQC2Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="53385800"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="53385800"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 01:49:19 -0800
X-CSE-ConnectionGUID: EsqV2svYQsK1IW+N/lGp6A==
X-CSE-MsgGUID: WnLZ/KATRie/8rBP5smXlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122449668"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 01:49:15 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_pmu: Add function engine activity test
Date: Tue,  4 Mar 2025 15:40:19 +0530
Message-ID: <20250304101019.3274493-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add a test to validate per-function engine activity by
running cork on all functions simulatenously

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 89 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 4584fc7d3..5a93d581a 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -14,6 +14,7 @@
 
 #include "igt.h"
 #include "igt_perf.h"
+#include "igt_sriov_device.h"
 #include "igt_sysfs.h"
 
 #include "xe/xe_gt.h"
@@ -106,7 +107,7 @@ static uint64_t add_format_config(const char *xe_device, const char *format, uin
 }
 
 static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_class_instance *eci,
-				 const char *event)
+				 int function, const char *event)
 {
 	char xe_device[100];
 	uint64_t pmu_config = 0;
@@ -122,6 +123,9 @@ static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_c
 		pmu_config |= add_format_config(xe_device, "engine_instance", eci->engine_instance);
 	}
 
+	if (function != -1)
+		pmu_config |= add_format_config(xe_device, "function", function);
+
 	return pmu_config;
 }
 
@@ -143,10 +147,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 	uint32_t vm;
 	int pmu_fd[2];
 
-	config = get_event_config(fd, eci->gt_id, eci, "engine-active-ticks");
+	config = get_event_config(fd, eci->gt_id, eci, -1, "engine-active-ticks");
 	pmu_fd[0] = open_group(fd, config, -1);
 
-	config = get_event_config(fd, eci->gt_id, eci, "engine-total-ticks");
+	config = get_event_config(fd, eci->gt_id, eci, -1, "engine-total-ticks");
 	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
 
 	vm = xe_vm_create(fd, 0, 0);
@@ -187,6 +191,75 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 		igt_assert(!engine_active_ticks);
 }
 
+/**
+ * SUBTEST: fn-engine-activity-load
+ * Description: Test to validate engine activity by running load on all functions simultaneously
+ */
+static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
+{
+	uint64_t config, engine_active_ticks, engine_total_ticks;
+	int num = num_fns + 1;
+	uint64_t after[2 * num], before[2 * num], pmu_fd[2 * num];
+	struct pmu_function {
+		struct xe_cork *cork;
+		uint32_t vm;
+		int fd;
+	} fn[num];
+	int i, idx = 0;
+
+	pmu_fd[0] = -1;
+	for (i = 0; i < num; i++) {
+		config = get_event_config(fd, eci->gt_id, eci, i, "engine-active-ticks");
+		pmu_fd[idx] = open_group(fd, config, pmu_fd[0]);
+
+		config = get_event_config(fd, eci->gt_id, eci, i, "engine-total-ticks");
+		pmu_fd[idx + 1] = open_group(fd, config, pmu_fd[0]);
+
+		if (i > 0)
+			fn[i].fd = igt_sriov_open_vf_drm_device(fd, i);
+		else
+			fn[i].fd = fd;
+
+		fn[i].vm = xe_vm_create(fn[i].fd, 0, 0);
+		fn[i].cork = xe_cork_create_opts(fn[i].fd, eci, fn[i].vm, 1, 1);
+		xe_cork_sync_start(fn[i].fd, fn[i].cork);
+
+		idx += 2;
+	}
+
+	pmu_read_multi(pmu_fd[0], 2 * num, before);
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+	pmu_read_multi(pmu_fd[0], 2 * num, after);
+
+	idx = 0;
+	for (i = 0; i < num; i++) {
+		xe_cork_sync_end(fn[i].fd, fn[i].cork);
+
+		engine_active_ticks = after[idx] - before[idx];
+		engine_total_ticks = after[idx + 1] - before[idx + 1];
+
+		igt_debug("Engine active ticks:  after %ld, before %ld delta %ld\n", after[idx],
+			  before[idx], engine_active_ticks);
+		igt_debug("Engine total ticks: after %ld, before %ld delta %ld\n", after[idx + 1],
+			  before[idx + 1], engine_total_ticks);
+
+		if (fn[i].cork)
+			xe_cork_destroy(fn[i].fd, fn[i].cork);
+
+		xe_vm_destroy(fn[i].fd, fn[i].vm);
+
+		close(pmu_fd[idx]);
+		close(pmu_fd[idx + 1]);
+
+		if (i > 0)
+			close(fn[i].fd);
+
+		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
+
+		idx += 2;
+	}
+}
+
 /**
  * SUBTEST: gt-c6-idle
  * Description: Basic residency test to validate idle residency
@@ -201,7 +274,7 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
 	uint64_t val;
 
 	/* Get the PMU config for the gt-c6 event */
-	pmu_config = get_event_config(xe, gt, NULL, "gt-c6-residency");
+	pmu_config = get_event_config(xe, gt, NULL, -1, "gt-c6-residency");
 
 	pmu_fd = open_pmu(xe, pmu_config);
 
@@ -253,6 +326,14 @@ igt_main
 	test_each_engine("engine-activity-load", fd, eci)
 		engine_activity(fd, eci, TEST_LOAD);
 
+	igt_describe("Validate per-function engine activity");
+	test_each_engine("fn-engine-activity-load", fd, eci) {
+		int num_fns = igt_sriov_get_enabled_vfs(fd);
+
+		igt_require(igt_sriov_is_pf(fd) && num_fns);
+		engine_activity_fn(fd, eci, num_fns);
+	}
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.47.1

