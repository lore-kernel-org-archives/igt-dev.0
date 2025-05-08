Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76D6C3ABC0
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 05:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2584510E32E;
	Thu,  8 May 2025 05:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1ZKXZnS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9914410E32B
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 05:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746682021; x=1778218021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ibwqgWR1tj1HQbXP8C/hCGwglUEljbe0rhZUi/d325M=;
 b=b1ZKXZnS7I2l+RlMucFzAaKEojJ4+OvAfV101+Is82TMCW1SsqOHYfA9
 Vl3a1dMB6j6hJsCtuiepkXVdO4O9d7NjnUphIK7NOTyNVOzXy8/d9b3Ak
 vXbbaoOrWkrqjCsYUDCjXOfXgtYghH6d8WbN4qz74bDiAaP38dgMkasK5
 7O+8gtijWKi6wf2E2q9ngbTeEkCredYCx6CngEbwUMxsi1ElrgnuleFfw
 xpv4OckSEGWFZGapfotKAxIE0GOCZgL8vrjcI92WmyHbgDLaZxMotbGcw
 f/I9BnaA2eHVyspl7D3TvqfLZN7WBamxXMtmD/8eeLpFFOqFrUVSFQ8KF A==;
X-CSE-ConnectionGUID: m0gSvxopQluKdL60Nnx+LQ==
X-CSE-MsgGUID: 5r/xEDEpS82A8m6+H5kZxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59798133"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="59798133"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 22:27:01 -0700
X-CSE-ConnectionGUID: VpIL/1lGTh2iB/oWyBqF/g==
X-CSE-MsgGUID: dME4V91TTVSxWYgTFwhK4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="167124040"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 22:26:59 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v2 4/5] tests/intel/xe_pmu: Add tests to validate engine
 activity on all engines
Date: Thu,  8 May 2025 11:20:05 +0530
Message-ID: <20250508055006.734259-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508055006.734259-1-riana.tauro@intel.com>
References: <20250508055006.734259-1-riana.tauro@intel.com>
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

Add tests to validate engine activity by running workload on
all engines simultaneously.

Also add trailing idle test.

v2: use allocator

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 67 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index d78b8bea5..2df460b07 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -32,6 +32,14 @@
  * Description: Test to validate engine activity by running workload and trailing idle on one engine
  *		and check if all other engines are idle
  *
+ * SUBTEST: engine-activity-all-load
+ * Description: Test to validate engine activity by running workload on all engines
+ *		simultaneously
+ *
+ * SUBTEST: engine-activity-all-load-idle
+ * Description: Test to validate engine activity by running workload on all engines
+ *		simultaneously and trailing idle
+ *
  * SUBTEST: all-fn-engine-activity-load
  * Description: Test to validate engine activity by running load on all functions simultaneously
  *
@@ -319,6 +327,57 @@ static void engine_activity_load_single(int fd, int num_engines,
 	log_all_engines(num_engines, busy_idx, TEST_IDLE, before, after);
 }
 
+static void engine_activity_load_all(int fd, int num_engines, unsigned int flags)
+{
+	uint64_t ahnd, config, before[2 * num_engines], after[2 * num_engines];
+	struct drm_xe_engine_class_instance *eci;
+	struct xe_cork *cork[num_engines];
+	int idx = 0, engine_idx = 0;
+	int pmu_fd[2 * num_engines];
+	uint32_t vm;
+
+	pmu_fd[0] = -1;
+	vm = xe_vm_create(fd, 0, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
+	xe_for_each_engine(fd, eci) {
+		engine_idx = idx >> 1;
+
+		config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
+
+		config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
+
+		if (flags & TEST_LOAD) {
+			cork[engine_idx] = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
+			xe_cork_sync_start(fd, cork[engine_idx]);
+		}
+	}
+
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, before);
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+	if (flags & TEST_TRAILING_IDLE) {
+		for (idx = 0; idx < num_engines; idx++)
+			xe_cork_sync_end(fd, cork[idx]);
+	}
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
+
+	for (idx = 0; idx < num_engines * 2; idx += 2) {
+		engine_idx = idx >> 1;
+		if (flags & TEST_LOAD)
+			check_and_end_cork(fd, cork[engine_idx]);
+		xe_cork_destroy(fd, cork[engine_idx]);
+		close(pmu_fd[idx]);
+		close(pmu_fd[idx + 1]);
+	}
+
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+
+	log_all_engines(num_engines, -1, TEST_LOAD, before, after);
+}
+
 static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks;
@@ -683,6 +742,14 @@ igt_main
 	test_each_engine("engine-activity-single-load-idle", fd, eci)
 		engine_activity_load_single(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
 
+	igt_describe("Validate engine activity by loading all engines simultaenously");
+	igt_subtest("engine-activity-all-load")
+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
+
+	igt_describe("Validate engine activity by loading all engines simultaenously and trailing idle");
+	igt_subtest("engine-activity-all-load-idle")
+		engine_activity_load_all(fd, num_engines, TEST_LOAD | TEST_TRAILING_IDLE);
+
 	igt_subtest_group {
 		unsigned int num_fns;
 
-- 
2.47.1

