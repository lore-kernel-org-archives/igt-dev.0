Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5795FC2D0D0
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 23:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A5E10EBD4;
	Fri, 21 Jun 2024 23:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmLNsLVx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D39B10E098
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719010914; x=1750546914;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=P465tbb1FJzuPnLyuUFeIHwckm8+dbipXSTeu4/gq4A=;
 b=dmLNsLVx7vfbrF4AC17hpNrC6dG2KO+AD8CdorL6qCyxYCKg/wsvn4Z1
 DNWCaip6NDDLN5vi/SGl55oDCDpY/Mv3IwsIKr4pxspTHAe2fHpUCvjVU
 LSSR5bDenTI1pTXezExyweF5xRDsMaxNHHUx8w+6UC4oduWRDScyjiuBO
 KxaM2cxy4GAH8RV663X6qG0M0deOAqLeZR6xOgAKb92A/NUZXOX/9lyJv
 U6COg/kk6Vq1Odf5rWAgITdNTo5fKvszfKB0nzxvKJ2QFVrm8u6QHNp50
 7kJeejvfBSTWjEOHM3Vtzqok/HU8ISL6xHPc5QacoZ+GHloyWArrk+P4H g==;
X-CSE-ConnectionGUID: MMg5L7/yQxqKZETFX9GeRg==
X-CSE-MsgGUID: nG+9fcZ/RMaL3NZ5kaAqMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16204932"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="16204932"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:07 -0700
X-CSE-ConnectionGUID: YVWH6wcwR7+tiYwL1qUNxw==
X-CSE-MsgGUID: O7/bIYCESRCJBu/Du9XP9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="42597328"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 5/8] tests/intel/xe_drm_fdinfo: Add tests to verify all
 class utilization
Date: Sat, 22 Jun 2024 07:00:59 +0800
Message-Id: <20240621230102.238397-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
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

Verify utilization for all classes with varying loads.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 149 ++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 852931d71..8f8b4d599 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -34,6 +34,15 @@
  * SUBTEST: drm-busy-idle-isolation
  * Description: Check that engine load does not spill over to other drm clients
  *
+ * SUBTEST: drm-busy-idle-check-all
+ * Description: Check that only the target engine shows load when idle after busy
+ *
+ * SUBTEST: drm-most-busy-idle-check-all
+ * Description: Check that only the target engine shows idle and all others are busy
+ *
+ * SUBTEST: drm-all-busy-idle-check-all
+ * Description: Check that all engines show busy when all are loaded
+ *
  * SUBTEST: drm-total-resident
  * Description: Create and compare total and resident memory consumption by client
  *
@@ -548,6 +557,135 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
 		close(local_fd);
 }
 
+static void
+busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
+	       unsigned int flags)
+{
+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct xe_spin_ctx *ctx = NULL;
+	int local_fd = fd, class;
+	uint32_t vm;
+
+	if (flags & TEST_ISOLATION)
+		local_fd = drm_reopen_driver(fd);
+
+	vm = xe_vm_create(local_fd, 0, 0);
+	if (flags & TEST_BUSY) {
+		ctx = xe_spin_ctx_init(local_fd, hwe, vm, width, count);
+		xe_spin_sync_start(local_fd, ctx);
+	}
+
+	read_engine_cycles(local_fd, pceu1);
+	measured_usleep(batch_duration_ns / 1000);
+	if (flags & TEST_TRAILING_IDLE)
+		xe_spin_sync_end(local_fd, ctx);
+	read_engine_cycles(local_fd, pceu2);
+
+	xe_for_each_engine_class(class)
+		check_results(pceu1, pceu2, class, width,
+			      hwe->engine_class == class ? flags : 0);
+
+	xe_spin_sync_end(local_fd, ctx);
+	xe_spin_ctx_destroy(local_fd, ctx);
+	xe_vm_destroy(local_fd, vm);
+
+	if (flags & TEST_ISOLATION)
+		close(local_fd);
+}
+
+static void
+most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
+		    unsigned int flags)
+{
+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct xe_spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
+	struct drm_xe_engine_class_instance *_hwe;
+	int local_fd = fd, class;
+	uint32_t vm;
+
+	if (flags & TEST_ISOLATION)
+		local_fd = drm_reopen_driver(fd);
+
+	vm = xe_vm_create(local_fd, 0, 0);
+	if (flags & TEST_BUSY) {
+		/* spin on one hwe per class except the target class hwes */
+		xe_for_each_engine(local_fd, _hwe) {
+			int _class = _hwe->engine_class;
+
+			if (_class == hwe->engine_class || ctx[_class])
+				continue;
+
+			ctx[_class] = xe_spin_ctx_init(local_fd, _hwe, vm, width, count);
+			xe_spin_sync_start(local_fd, ctx[_class]);
+		}
+	}
+
+	read_engine_cycles(local_fd, pceu1);
+	measured_usleep(batch_duration_ns / 1000);
+	if (flags & TEST_TRAILING_IDLE)
+		xe_for_each_engine_class(class)
+			xe_spin_sync_end(local_fd, ctx[class]);
+	read_engine_cycles(local_fd, pceu2);
+
+	xe_for_each_engine_class(class) {
+		check_results(pceu1, pceu2, class, width,
+			      hwe->engine_class == class ? 0 : flags);
+		xe_spin_sync_end(local_fd, ctx[class]);
+		xe_spin_ctx_destroy(local_fd, ctx[class]);
+	}
+	xe_vm_destroy(local_fd, vm);
+
+	if (flags & TEST_ISOLATION)
+		close(local_fd);
+}
+
+static void
+all_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
+		   unsigned int flags)
+{
+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct xe_spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
+	struct drm_xe_engine_class_instance *_hwe;
+	int local_fd = fd, class;
+	uint32_t vm;
+
+	if (flags & TEST_ISOLATION)
+		local_fd = drm_reopen_driver(fd);
+
+	vm = xe_vm_create(local_fd, 0, 0);
+	if (flags & TEST_BUSY) {
+		/* spin on one hwe per class */
+		xe_for_each_engine(local_fd, _hwe) {
+			int _class = _hwe->engine_class;
+
+			if (ctx[_class])
+				continue;
+
+			ctx[_class] = xe_spin_ctx_init(local_fd, _hwe, vm, width, count);
+			xe_spin_sync_start(local_fd, ctx[_class]);
+		}
+	}
+
+	read_engine_cycles(local_fd, pceu1);
+	measured_usleep(batch_duration_ns / 1000);
+	if (flags & TEST_TRAILING_IDLE)
+		xe_for_each_engine_class(class)
+			xe_spin_sync_end(local_fd, ctx[class]);
+	read_engine_cycles(local_fd, pceu2);
+
+	xe_for_each_engine_class(class) {
+		check_results(pceu1, pceu2, class, width, flags);
+		xe_spin_sync_end(local_fd, ctx[class]);
+		xe_spin_ctx_destroy(local_fd, ctx[class]);
+	}
+	xe_vm_destroy(local_fd, vm);
+
+	if (flags & TEST_ISOLATION)
+		close(local_fd);
+}
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -594,6 +732,17 @@ igt_main
 		xe_for_each_engine(xe, hwe)
 			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
 
+	igt_subtest("drm-busy-idle-check-all")
+		xe_for_each_engine(xe, hwe)
+			busy_check_all(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE);
+
+	igt_subtest("drm-most-busy-idle-check-all")
+		xe_for_each_engine(xe, hwe)
+			most_busy_check_all(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE);
+
+	igt_subtest("drm-all-busy-idle-check-all")
+		all_busy_check_all(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE);
+
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("drm-total-resident")
 		test_total_resident(xe);
-- 
2.34.1

