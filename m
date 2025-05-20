Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C0EC3ABDA
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 05:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7C710E12E;
	Tue, 20 May 2025 05:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGjJ+GML";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7D610E12E
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 05:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747720201; x=1779256201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uPh+TISSwKr0Ti4szabdqp5YA4+yXOXpJFlEAd2tzU4=;
 b=WGjJ+GMLshIlD3O2H7SGsBRMdLRDiHuWoQum8vo+xeymZd0m3zeaL6Wn
 hLdV2DZ1WrFowHT01jdf02J9b+Eh0i1SS1P0oGcbL8P75k+S/HaMtFg7E
 5Ohg+ZiHzCjgRfATDeIcJim3jTiLpEjzpJ7vkYVvtzL294wS8ivfpEE9L
 W5I1R/4Mlmi0bMFlJzjJBhNY9yS9nGSXKlIcIXDdDWxn9Db3ui4tD1IHh
 AWgiYes/2ihnQj0cNza08onwTP+8Fpul8tTAC1ve9/UISHVesL8Ddozvr
 tCFuKT5avIapYDzLHLtN3+MXlicKVKNiuU3KxQLHdqmNb4PTvacCq7orW w==;
X-CSE-ConnectionGUID: vT/jVduPRQq6f5bL5p3xVA==
X-CSE-MsgGUID: 22fgBlweThGAy04gFuGtXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60293561"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="60293561"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 22:50:01 -0700
X-CSE-ConnectionGUID: LWzDHs7gRN+0v9BDRNOt2w==
X-CSE-MsgGUID: 0B9E1k8pQTyojQl0vB3jDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139621492"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 22:49:59 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 4/5] tests/intel/xe_pmu: Add tests to validate engine
 activity on all engines
Date: Tue, 20 May 2025 11:43:35 +0530
Message-ID: <20250520061336.656057-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250520061336.656057-1-riana.tauro@intel.com>
References: <20250520061336.656057-1-riana.tauro@intel.com>
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
v3: use flag per engine (Umesh)
v4: do not use flag to end cork (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_pmu.c | 65 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 6d4e27178..545017542 100644
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
@@ -303,6 +311,55 @@ static void engine_activity_load_single(int fd, int num_engines,
 	check_all_engines(num_engines, flag, before, after);
 }
 
+static void engine_activity_load_all(int fd, int num_engines, unsigned int flags)
+{
+	uint64_t ahnd, config, before[2 * num_engines], after[2 * num_engines];
+	struct drm_xe_engine_class_instance *eci;
+	struct xe_cork *cork[num_engines];
+	int idx = 0, engine_idx = 0;
+	int pmu_fd[2 * num_engines], flag[num_engines];
+	uint32_t vm;
+
+	pmu_fd[0] = -1;
+	vm = xe_vm_create(fd, 0, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
+	xe_for_each_engine(fd, eci) {
+		engine_idx = idx >> 1;
+		flag[engine_idx] = TEST_LOAD;
+
+		config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
+
+		config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
+
+		cork[engine_idx] = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
+		xe_cork_sync_start(fd, cork[engine_idx]);
+	}
+
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, before);
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+	if (flags & TEST_TRAILING_IDLE) {
+		for (idx = 0; idx < num_engines; idx++)
+			end_cork(fd, cork[idx]);
+	}
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
+
+	for (idx = 0; idx < num_engines * 2; idx += 2) {
+		engine_idx = idx >> 1;
+		end_cork(fd, cork[engine_idx]);
+		xe_cork_destroy(fd, cork[engine_idx]);
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
 static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks;
@@ -674,6 +731,14 @@ igt_main
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

