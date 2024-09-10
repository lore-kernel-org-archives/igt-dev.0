Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E9CECE564
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 13:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A71510E7C2;
	Tue, 10 Sep 2024 13:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGGD70RV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704CE10E7C2
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725973988; x=1757509988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ljD3i0gcnew/g8zZQTuuDtvaXnh89MFOojdoecEenKQ=;
 b=FGGD70RVEI5RUoXgfg0ub5Xw1csz9QiXlquIBDil5IwZj5+p/qlVZukV
 MFnYFJON3Mn+TPxEnYSffg8OXeupuKzMtKOggJdpjqlowG7hH+peEtiOM
 iwABzsJIzhTpaBUhgnG68bXzMdcf24DbmAT7HugnPJlvea/M/h4VB76sh
 kXuzWg3ppFPWUyP/woPtw6dp4Upe2Vs05CYddsGnrEkZOrAcmhi3cPDcJ
 3JQy4Mvam1F1KF6YMBr1JOJaeKjj0YeXs+ikLjTvRTQgz9d94VMSn17Fb
 wgSlyM22BtRniEcCiPF7gAV8U+xT3IRzvv2t5GKmYKZ1XPIu6+mi1sSjP w==;
X-CSE-ConnectionGUID: Cy/bonMxRoSHSjgQT6Hy2w==
X-CSE-MsgGUID: DxZH4zEpRmyATHaT6sDaGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24823252"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24823252"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:13:08 -0700
X-CSE-ConnectionGUID: NtIqNlyHQ4iSI37uMIGjUA==
X-CSE-MsgGUID: 68ktGuMJR6eCiSfKmYVY4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="66820828"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.145])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:13:07 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t v2 1/4] tests/intel/xe_drm_fdinfo: Implement
 virtual/parallel exec queues
Date: Tue, 10 Sep 2024 16:12:45 +0300
Message-Id: <20240910131248.334521-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910131248.334521-1-jouni.hogander@intel.com>
References: <20240910131248.334521-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Lucas De Marchi <lucas.demarchi@intel.com>

Implement a similar function to utilization_single(), but also taking
virtual/parallel into account. I chose some different variable names
to make it more obvious what exactly it is testing and integrated
with the xe_gt_fill_engines_by_class() function recently added.
A possible refactor in the future is to make the other tests use
this function and remove utilization_single().

Based on previous patch by Umesh.

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Link: https://lore.kernel.org/r/20240904225746.2857448-3-lucas.demarchi@intel.com
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
2.34.1

