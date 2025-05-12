Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535E8C3ABBC
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 06:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083D510E2E9;
	Mon, 12 May 2025 06:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6TWiPep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F062510E2E9
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 06:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747032163; x=1778568163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b3/0giGpXZwdEo7vpYmWKp/7tnH6N7o+13Gu8Q5UMws=;
 b=g6TWiPepusFBa82Xap6Qw3SDAAq+XDffeP3fd+NQNHhW4hR0/N6gb70+
 p55H0poBaOVXo+5mf1vNs75PjRxepsFRJYADKAOWcHUX9U+RuflT2zYq0
 4qkAbAFGC9pZHQVSRFBzMZqJxaG1bvTD5QGxrEdmzFfRgSO0zUrIpsEmV
 Mn/fZzoPZCW3ADIR4HGqGQAtHVcva4DKqBLBrJqvX0xSsqHSYt0OXBt0e
 7RpNvjsD+hKHdHVTG4/7nz7YhvsXfCXtjIBJr2eAmHjOIOX6WFFWqHKgR
 k8V8YWhGXlHSkrv70QT7FJaSlcOC4d6ASzXzAKV0LtTm6NCLO5x51XHxd w==;
X-CSE-ConnectionGUID: DFNJTwigRaSxQlkn3NZjxA==
X-CSE-MsgGUID: FHyZ956sRuCnk8CsA6ydIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48888461"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="48888461"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 23:42:43 -0700
X-CSE-ConnectionGUID: Gxb7OaG4RQ621bEVZLGCVg==
X-CSE-MsgGUID: Dvbg6eUHRgC2LprbTw5QLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="137292711"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 23:42:40 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v3 5/5] test/intel/xe_pmu: Add tests to validate engine
 activity by loading most engines
Date: Mon, 12 May 2025 12:35:51 +0530
Message-ID: <20250512070551.774270-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250512070551.774270-1-riana.tauro@intel.com>
References: <20250512070551.774270-1-riana.tauro@intel.com>
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

Add a test to validate engine activity by running load on all
engines except one.

Also add a trailing idle test.

v2: use allocator
v3: use per-engine flags (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 74 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 1a9b015d9..de0a74a56 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -40,6 +40,13 @@
  * Description: Test to validate engine activity by running workload on all engines
  *		simultaneously and trailing idle
  *
+ * SUBTEST: engine-activity-most-load
+ * Description: Test to validate engine activity by running workload on all engines except one
+ *
+ * SUBTEST: engine-activity-most-load-idle
+ * Description: Test to validate engine activity by running workload and trailing idle on all engines
+ * 		except one
+ *
  * SUBTEST: all-fn-engine-activity-load
  * Description: Test to validate engine activity by running load on all functions simultaneously
  *
@@ -315,6 +322,65 @@ static void engine_activity_load_single(int fd, int num_engines,
 	check_all_engines(num_engines, flag, before, after);
 }
 
+static void engine_activity_load_most(int fd, int num_engines, struct drm_xe_engine_class_instance *eci,
+				      unsigned int flags)
+{
+	uint64_t ahnd, config, before[2 * num_engines], after[2 * num_engines];
+	struct drm_xe_engine_class_instance *eci_;
+	struct xe_cork *cork[num_engines];
+	int pmu_fd[num_engines * 2], flag[num_engines];
+	int idx = 0, engine_idx = 0;
+	uint32_t vm;
+
+	pmu_fd[0] = -1;
+	vm = xe_vm_create(fd, 0, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
+	xe_for_each_engine(fd, eci_) {
+		engine_idx = idx >> 1;
+		flag[engine_idx] = TEST_LOAD;
+
+		if (eci_->engine_class == eci->engine_class &&
+		    eci_->engine_instance == eci->engine_instance) {
+			flag[engine_idx] = TEST_IDLE;
+			cork[engine_idx] = NULL;
+		} else {
+			cork[engine_idx] = xe_cork_create_opts(fd, eci_, vm, 1, 1, .ahnd = ahnd);
+			xe_cork_sync_start(fd, cork[engine_idx]);
+		}
+
+		config = get_event_config(eci_->gt_id, eci_, "engine-active-ticks");
+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
+
+		config = get_event_config(eci_->gt_id, eci_, "engine-total-ticks");
+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
+	}
+
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, before);
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+	if (flags & TEST_TRAILING_IDLE) {
+		for (idx = 0; idx < num_engines; idx++)
+			end_cork(fd, cork[engine_idx]);
+	}
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
+
+	for (idx = 0; idx < num_engines * 2; idx += 2) {
+		engine_idx = idx >> 1;
+
+		if (flags & TEST_LOAD)
+			end_cork(fd, cork[engine_idx]);
+		if (cork[engine_idx])
+			xe_cork_destroy(fd, cork[engine_idx]);
+		close(pmu_fd[idx]);
+		close(pmu_fd[idx + 1]);
+	}
+
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+
+	check_all_engines(num_engines, flag, before, after);
+}
+
 static void engine_activity_load_all(int fd, int num_engines, unsigned int flags)
 {
 	uint64_t ahnd, config, before[2 * num_engines], after[2 * num_engines];
@@ -734,6 +800,14 @@ igt_main
 	test_each_engine("engine-activity-single-load-idle", fd, eci)
 		engine_activity_load_single(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
 
+	igt_describe("Validate engine activity when all except one engine is loaded");
+	test_each_engine("engine-activity-most-load", fd, eci)
+		engine_activity_load_most(fd, num_engines, eci, TEST_LOAD);
+
+	igt_describe("Validate engine activity when all except one engine is loaded and trailing idle");
+	test_each_engine("engine-activity-most-load-idle", fd, eci)
+		engine_activity_load_most(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
+
 	igt_describe("Validate engine activity by loading all engines simultaenously");
 	igt_subtest("engine-activity-all-load")
 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
-- 
2.47.1

