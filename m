Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB63C54732
	for <igt-dev@archiver.kernel.org>; Sat, 24 Aug 2024 06:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DB010E275;
	Sat, 24 Aug 2024 06:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGbYQs2H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F0B10E1A7
 for <igt-dev@lists.freedesktop.org>; Sat, 24 Aug 2024 06:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724480719; x=1756016719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P8o4NnolrbRY2vp2F2m3TgPCJ1P3W1rH+OBVDgHzCJ0=;
 b=hGbYQs2HxY5g/3eBc4SFZDvrpqNfxPQuZmzLsfiC8vTklnTmQgZ5FmPw
 OD5/XTg0+WDOWKEPZLkuyLzNZJpTQQ0xwpJzWYy1huymnmhwC9HEtuTxY
 ZCFVKCakvbqA6ogyVe0MU6CH+VqE6QXEZs6rvzj8+STCUgssFQxh7aJzP
 qKodmHAN+lHvX/fCb59wtjm6dANxmH2owc3kx0WjFkYdqILQaZYQElKlv
 GmjVE18ftbbGPPV7zM8PZflOg+xLmqquWAjKYN4p+p1BxK2ZKNLSlvqGB
 SWz16DGvuxkIngZrAiX/+o9AdWHS5xw5sD8LAkQqEbIQ8M9snpA//mkAA w==;
X-CSE-ConnectionGUID: kmQdJWamSkuuOE127IT7zg==
X-CSE-MsgGUID: 0t1rCgD8QfKIT2+9w3z2Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="23099889"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; d="scan'208";a="23099889"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 23:25:18 -0700
X-CSE-ConnectionGUID: 6RHmzBVVRAG9UUKcZkRNQw==
X-CSE-MsgGUID: klY9c5L0QvWFIbroeaT/ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; d="scan'208";a="62003952"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 23:25:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 5/5] tests/intel/xe_drm_fdinfo: Rename and reorder tests
Date: Fri, 23 Aug 2024 23:25:04 -0700
Message-ID: <20240824062504.1122536-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240824062504.1122536-1-lucas.demarchi@intel.com>
References: <20240824062504.1122536-1-lucas.demarchi@intel.com>
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

There are 2 main categories of tests in xe_drm_fdinfo:
mem and utilization. Group and name tests accordingly.

For utilization, create subgroups: "single", "others" and "all",
with variants on each of them.

No change in behavior on each tests, it's just rename and reorder.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 148 ++++++++++++++++++------------------
 1 file changed, 74 insertions(+), 74 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index d6d28393c..eb4c0987c 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -22,41 +22,41 @@
  * Feature: SMI, core
  * Test category: SysMan
  *
- * SUBTEST: basic-memory
+ * SUBTEST: basic-mem
  * Description: Check if basic fdinfo content is present for memory
  *
- * SUBTEST: basic-engine-utilization
+ * SUBTEST: basic-utilization
  * Description: Check if basic fdinfo content is present for engine utilization
  *
- * SUBTEST: drm-idle
- * Description: Check that engines show no load when idle
+ * SUBTEST: mem-total-resident
+ * Description: Create and compare total and resident memory consumption by client
  *
- * SUBTEST: drm-busy-idle
- * Description: Check that engines show load when idle after busy
+ * SUBTEST: mem-shared
+ * Description: Create and compare shared memory consumption by client
  *
- * SUBTEST: drm-busy-idle-isolation
- * Description: Check that engine load does not spill over to other drm clients
+ * SUBTEST: mem-active
+ * Description: Create and compare active memory consumption by client
  *
- * SUBTEST: drm-busy-idle-check-all
- * Description: Check that only the target engine shows load when idle after busy
+ * SUBTEST: utilization-single-idle
+ * Description: Check that each engine shows no load
  *
- * SUBTEST: drm-most-busy-idle-check-all
- * Description: Check that only the target engine shows idle and all others are busy
+ * SUBTEST: utilization-single-full-load
+ * Description: Check that each engine shows full load
  *
- * SUBTEST: drm-all-busy-idle-check-all
- * Description: Check that all engines show busy when all are loaded
+ * SUBTEST: utilization-single-full-load-isolation
+ * Description: Check that each engine load does not spill over to other drm clients
  *
- * SUBTEST: drm-busy-exec-queue-destroy-idle
+ * SUBTEST: utilization-single-full-load-destroy-queue
  * Description: Destroy exec queue before idle and ensure load is accurate
  *
- * SUBTEST: drm-total-resident
- * Description: Create and compare total and resident memory consumption by client
+ * SUBTEST: utilization-others-idle
+ * Description: Check that only the target engine shows load
  *
- * SUBTEST: drm-shared
- * Description: Create and compare shared memory consumption by client
+ * SUBTEST: utilization-others-full-load
+ * Description: Check that only the target engine shows idle and all others are busy
  *
- * SUBTEST: drm-active
- * Description: Create and compare active memory consumption by client
+ * SUBTEST: utilization-all-full-load
+ * Description: Check that all engines show busy when all are loaded
  */
 
 IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine utilization using fdinfo");
@@ -104,7 +104,7 @@ static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
 }
 
 /* Subtests */
-static void test_active(int fd, struct drm_xe_engine *engine)
+static void mem_active(int fd, struct drm_xe_engine *engine)
 {
 	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(fd), region;
@@ -230,7 +230,7 @@ static void test_active(int fd, struct drm_xe_engine *engine)
 	xe_vm_destroy(fd, vm);
 }
 
-static void test_shared(int xe)
+static void mem_shared(int xe)
 {
 	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(xe), region;
@@ -275,7 +275,7 @@ static void test_shared(int xe)
 	}
 }
 
-static void test_total_resident(int xe)
+static void mem_total_resident(int xe)
 {
 	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(xe), region;
@@ -503,7 +503,7 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 }
 
 static void
-single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
+utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
 {
 	struct pceu_cycles pceu1[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
@@ -552,64 +552,64 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
 }
 
 static void
-busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe)
+utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct spin_ctx *ctx = NULL;
 	uint32_t vm;
-	int class;
 
 	vm = xe_vm_create(fd, 0, 0);
-
 	ctx = spin_ctx_init(fd, hwe, vm);
 	spin_sync_start(fd, ctx);
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
-	spin_sync_end(fd, ctx);
-	read_engine_cycles(fd, pceu2);
-
-	xe_for_each_engine_class(class) {
-		enum expected_load expected_load = hwe->engine_class != class ?
-			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
-
-		check_results(pceu1, pceu2, class, expected_load);
-	}
 
+	/* destroy queue before sampling again */
 	spin_sync_end(fd, ctx);
 	spin_ctx_destroy(fd, ctx);
+
+	read_engine_cycles(fd, pceu2);
+
 	xe_vm_destroy(fd, vm);
+
+	check_results(pceu1, pceu2, hwe->engine_class, EXPECTED_LOAD_FULL);
 }
 
 static void
-single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
+utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct spin_ctx *ctx = NULL;
 	uint32_t vm;
+	int class;
 
 	vm = xe_vm_create(fd, 0, 0);
+
 	ctx = spin_ctx_init(fd, hwe, vm);
 	spin_sync_start(fd, ctx);
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
-
-	/* destroy queue before sampling again */
 	spin_sync_end(fd, ctx);
-	spin_ctx_destroy(fd, ctx);
-
 	read_engine_cycles(fd, pceu2);
 
-	xe_vm_destroy(fd, vm);
+	xe_for_each_engine_class(class) {
+		enum expected_load expected_load = hwe->engine_class != class ?
+			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
 
-	check_results(pceu1, pceu2, hwe->engine_class, EXPECTED_LOAD_FULL);
+		check_results(pceu1, pceu2, class, expected_load);
+	}
+
+	spin_sync_end(fd, ctx);
+	spin_ctx_destroy(fd, ctx);
+	xe_vm_destroy(fd, vm);
 }
 
 static void
-most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe)
+utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
@@ -653,7 +653,7 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe)
 }
 
 static void
-all_busy_check_all(int fd)
+utilization_all_full_load(int fd)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
@@ -705,51 +705,51 @@ igt_main
 	}
 
 	igt_describe("Check if basic fdinfo content is present for memory");
-	igt_subtest("basic-memory")
+	igt_subtest("basic-mem")
 		basic_memory(xe);
 
 	igt_describe("Check if basic fdinfo content is present for engine utilization");
-	igt_subtest("basic-engine-utilization")
+	igt_subtest("basic-utilization")
 		basic_engine_utilization(xe);
 
-	igt_subtest("drm-idle")
-		xe_for_each_engine(xe, hwe)
-			single(xe, hwe, 0);
+	igt_describe("Create and compare total and resident memory consumption by client");
+	igt_subtest("mem-total-resident")
+		mem_total_resident(xe);
 
-	igt_subtest("drm-busy-idle")
-		xe_for_each_engine(xe, hwe)
-			single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
+	igt_describe("Create and compare shared memory consumption by client");
+	igt_subtest("mem-shared")
+		mem_shared(xe);
 
-	igt_subtest("drm-busy-idle-isolation")
-		xe_for_each_engine(xe, hwe)
-			single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
+	igt_describe("Create and compare active memory consumption by client");
+	igt_subtest("mem-active")
+		mem_active(xe, xe_engine(xe, 0));
 
-	igt_subtest("drm-busy-idle-check-all")
+	igt_subtest("utilization-single-idle")
 		xe_for_each_engine(xe, hwe)
-			busy_check_all(xe, hwe);
+			utilization_single(xe, hwe, 0);
 
-	igt_subtest("drm-most-busy-idle-check-all")
+	igt_subtest("utilization-single-full-load")
 		xe_for_each_engine(xe, hwe)
-			most_busy_check_all(xe, hwe);
+			utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
 
-	igt_subtest("drm-all-busy-idle-check-all")
-		all_busy_check_all(xe);
+	igt_subtest("utilization-single-full-load-isolation")
+		xe_for_each_engine(xe, hwe)
+			utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
 
-	igt_subtest("drm-busy-exec-queue-destroy-idle")
+	igt_subtest("utilization-single-full-load-destroy-queue")
 		xe_for_each_engine(xe, hwe)
-			single_destroy_queue(xe, hwe);
+			utilization_single_destroy_queue(xe, hwe);
 
-	igt_describe("Create and compare total and resident memory consumption by client");
-	igt_subtest("drm-total-resident")
-		test_total_resident(xe);
+	igt_subtest("utilization-others-idle")
+		xe_for_each_engine(xe, hwe)
+			utilization_others_idle(xe, hwe);
 
-	igt_describe("Create and compare shared memory consumption by client");
-	igt_subtest("drm-shared")
-		test_shared(xe);
+	igt_subtest("utilization-others-full-load")
+		xe_for_each_engine(xe, hwe)
+			utilization_others_full_load(xe, hwe);
 
-	igt_describe("Create and compare active memory consumption by client");
-	igt_subtest("drm-active")
-		test_active(xe, xe_engine(xe, 0));
+	igt_subtest("utilization-all-full-load")
+		utilization_all_full_load(xe);
 
 	igt_fixture {
 		drm_close_driver(xe);
-- 
2.43.0

