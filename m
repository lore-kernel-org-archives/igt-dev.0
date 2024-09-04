Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A0ECD4F4B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 22:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D852B10E3DD;
	Wed,  4 Sep 2024 22:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5Tg6IbD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B3610E128
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 22:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725490675; x=1757026675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cjEdLqde3GmEtoJfJPWoAVrvpLpCZNnUGvOMkzvaEHM=;
 b=I5Tg6IbDWRxeT7kSUAOjiZB2pGS30MOhY7RIkbMV1GnEDECMQ5KxlCwl
 oTphV/FcPPaevtl7M9/fLMA0ISQ598jyWfPHOAMK/TbhvEQnKstLca8uY
 9AxV2KpsWOykyRVdqDFaz31MLp+Ix9JZeWEPPJRUqiEoQb01CVMO2ypO8
 WkpVmk1W5dzD5W51rHCiIFbRPInoFNG09aAaQCt+uLcfzGdBs9F+CKhmT
 tA/JGHPQ9Ra8DrdAPaTBrACAO6UV7WDyYIrr0Y/gtYHySvLa3bGtDaKmk
 zYTz40Zor047Ai+lIlKiZ7RKQl5MiX9vuaY+APVowaLMql5nrMurydCYR Q==;
X-CSE-ConnectionGUID: K+Ruy71rRIOACjjewSu/fg==
X-CSE-MsgGUID: PlW0pHE6TwiINlT3nEtwfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="23980965"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="23980965"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 15:57:54 -0700
X-CSE-ConnectionGUID: jJmPJYqVR4adYaVxv/PUlQ==
X-CSE-MsgGUID: nJipVoOsTfWoOJrNw12Eqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="69565876"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 15:57:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_drm_fdinfo: Implement
 virtual/parallel exec queues
Date: Wed,  4 Sep 2024 15:57:46 -0700
Message-ID: <20240904225746.2857448-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904225746.2857448-1-lucas.demarchi@intel.com>
References: <20240904225746.2857448-1-lucas.demarchi@intel.com>
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

Implement a similar function to utilization_single(), but also taking
virtual/parallel into account. I chose some different variable names
to make it more obvious what exactly it is testing and integrated
with the xe_gt_fill_engines_by_class() function recently added.
A possible refactor in the future is to make the other tests use
this function and remove utilization_single().

Based on previous patch by Umesh.

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 124 +++++++++++++++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 8acb95040..747b6155c 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -12,6 +12,8 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_util.h"
+
 /**
  * TEST: xe drm fdinfo
  * Description: Read and verify drm client memory consumption and engine utilization using fdinfo
@@ -67,6 +69,8 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
 #define TEST_BUSY		(1 << 0)
 #define TEST_TRAILING_IDLE	(1 << 1)
 #define TEST_ISOLATION		(1 << 2)
+#define TEST_VIRTUAL		(1 << 3)
+#define TEST_PARALLEL		(1 << 4)
 
 enum expected_load {
 	EXPECTED_LOAD_IDLE,
@@ -715,10 +719,102 @@ utilization_all_full_load(int fd)
 
 	xe_vm_destroy(fd, vm);
 }
+
+/**
+ * SUBTEST: %s-utilization-single-idle
+ * Description: Check that each engine shows no load
+ *
+ * SUBTEST: %s-utilization-single-full-load
+ * Description: Check that each engine shows full load
+ *
+ * SUBTEST: %s-utilization-single-full-load-isolation
+ * Description: Check that each engine load does not spill over to other drm clients
+ *
+ * arg[1]:
+ *
+ * @virtual:			virtual
+ * @parallel:			parallel
+ */
+static void
+utilization_multi(int fd, int gt, int class, unsigned int flags)
+{
+	struct pceu_cycles pceu[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu_spill[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
+	struct spin_ctx *ctx = NULL;
+	enum expected_load expected_load;
+	int fd_spill, num_placements;
+	uint32_t vm;
+	bool virtual = flags & TEST_VIRTUAL;
+	bool parallel = flags & TEST_PARALLEL;
+	uint16_t width;
+
+	igt_assert(virtual ^ parallel);
+
+	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
+	if (num_placements < 2)
+		return;
+
+	if (parallel) {
+		width = num_placements;
+		num_placements = 1;
+	} else {
+		width = 1;
+	}
+
+	if (flags & TEST_ISOLATION)
+		fd_spill = drm_reopen_driver(fd);
+
+	vm = xe_vm_create(fd, 0, 0);
+	if (flags & TEST_BUSY) {
+		ctx = spin_ctx_init(fd, eci, vm, width, num_placements);
+		spin_sync_start(fd, ctx);
+	}
+
+	read_engine_cycles(fd, pceu[0]);
+	if (flags & TEST_ISOLATION)
+		read_engine_cycles(fd_spill, pceu_spill[0]);
+
+	usleep(batch_duration_usec);
+	if (flags & TEST_TRAILING_IDLE)
+		spin_sync_end(fd, ctx);
+
+	read_engine_cycles(fd, pceu[1]);
+	if (flags & TEST_ISOLATION)
+		read_engine_cycles(fd_spill, pceu_spill[1]);
+
+	expected_load = flags & TEST_BUSY ?
+	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
+	check_results(pceu[0], pceu[1], class, width, expected_load);
+
+	if (flags & TEST_ISOLATION) {
+		/*
+		 * Load from one client shouldn't spill on another,
+		 * so check for idle
+		 */
+		check_results(pceu_spill[0], pceu_spill[1], class, width,
+			      EXPECTED_LOAD_IDLE);
+		close(fd_spill);
+	}
+
+	spin_sync_end(fd, ctx);
+	spin_ctx_destroy(fd, ctx);
+
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
+	const struct section {
+		const char *name;
+		unsigned int flags;
+	} sections[] = {
+		{ .name = "virtual", .flags = TEST_VIRTUAL },
+		{ .name = "parallel", .flags = TEST_PARALLEL },
+		{ }
+	};
 	struct drm_xe_engine_class_instance *hwe;
-	int xe;
+	int xe, gt, class;
 
 	igt_fixture {
 		struct drm_client_fdinfo info = { };
@@ -775,6 +871,32 @@ igt_main
 	igt_subtest("utilization-all-full-load")
 		utilization_all_full_load(xe);
 
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("%s-utilization-single-idle", s->name)
+			xe_for_each_gt(xe, gt)
+				xe_for_each_engine_class(class)
+					utilization_multi(xe, gt, class, s->flags);
+
+		igt_subtest_f("%s-utilization-single-full-load", s->name)
+			xe_for_each_gt(xe, gt)
+				xe_for_each_engine_class(class)
+					utilization_multi(xe, gt, class,
+							  s->flags |
+							  TEST_BUSY |
+							  TEST_TRAILING_IDLE);
+
+		igt_subtest_f("%s-utilization-single-full-load-isolation",
+			      s->name)
+			xe_for_each_gt(xe, gt)
+				xe_for_each_engine_class(class)
+					utilization_multi(xe, gt, class,
+							  s->flags |
+							  TEST_BUSY |
+							  TEST_TRAILING_IDLE |
+							  TEST_ISOLATION);
+	}
+
 	igt_fixture {
 		drm_close_driver(xe);
 	}
-- 
2.43.0

