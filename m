Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFF5C3271E
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 00:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B837210E70A;
	Wed,  3 Jul 2024 00:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/oJ1VVS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A18410E6F8
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 00:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719966338; x=1751502338;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NkDGCDyjwAptjJuTRof1vuTlRjuq6/+8e+LS1xJCeiQ=;
 b=E/oJ1VVSAWvH9Pf+yqze9gxZE59z5rdZVqKtxaMOumft88m0Mylwg72k
 4GV3jPAV3imyD9onWm2o1M6+7FAWpkyqWYS2s3eh4i+TmRYl9VgHTSf30
 d/ExEfTDy8NqpB1EOS/SsnlI9h8XHkTtiqomGSLG4seP+CeJVJF0YsPN3
 gBnTr/XREQVRLg8TREvP56ho9Ktp2SSMZKy6dk5fq1DNwy0++19yIjNvw
 MgVctNw52OuO6/9JxVd81wIxiTdFhuElz4Eo/R9R374anETvP/0jLcjah
 rMcOOsQRj9kVlhU5QmG3D1Y3JL7v7/Gw7F2SevKqg7O/PI6pddMGSHU+7 g==;
X-CSE-ConnectionGUID: XeVJeAeySia3zwKg2IMSOQ==
X-CSE-MsgGUID: vkOxRlTyRya9dWSAP0rvDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20074285"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="20074285"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:38 -0700
X-CSE-ConnectionGUID: DF4mwv7eTMKW5oGS2evCqw==
X-CSE-MsgGUID: Nu+CrzskR2ScslGsu7L1bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46072878"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH i-g-t v2 06/10] tests/intel/xe_drm_fdinfo: Add tests to verify
 all class utilization
Date: Tue,  2 Jul 2024 17:25:28 -0700
Message-Id: <20240703002532.3156277-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
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

v2:
- Drop unused ISOLATION flag in some tests.
- s/measured_usleep/usleep
- remove xe_ prefix from helpers/structures
- Drop unused parameters to all_busy_check_all
- s/_class/class

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 130 ++++++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 410c885e7..f2051c422 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -37,6 +37,15 @@
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
@@ -548,6 +557,116 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
 	xe_vm_destroy(fd, vm);
 }
 
+static void
+busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
+	       unsigned int flags)
+{
+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct spin_ctx *ctx = NULL;
+	uint32_t vm;
+	int class;
+
+	vm = xe_vm_create(fd, 0, 0);
+	if (flags & TEST_BUSY) {
+		ctx = spin_ctx_init(fd, hwe, vm, width, count);
+		spin_sync_start(fd, ctx);
+	}
+
+	read_engine_cycles(fd, pceu1);
+	usleep(batch_duration_ns / 1000);
+	if (flags & TEST_TRAILING_IDLE)
+		spin_sync_end(fd, ctx);
+	read_engine_cycles(fd, pceu2);
+
+	xe_for_each_engine_class(class)
+		check_results(pceu1, pceu2, class, width,
+			      hwe->engine_class == class ? flags : 0);
+
+	spin_sync_end(fd, ctx);
+	spin_ctx_destroy(fd, ctx);
+	xe_vm_destroy(fd, vm);
+}
+
+static void
+most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
+		    unsigned int flags)
+{
+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
+	struct drm_xe_engine_class_instance *_hwe;
+	uint32_t vm;
+	int class;
+
+	vm = xe_vm_create(fd, 0, 0);
+	if (flags & TEST_BUSY) {
+		/* spin on one hwe per class except the target class hwes */
+		xe_for_each_engine(fd, _hwe) {
+			int _class = _hwe->engine_class;
+
+			if (_class == hwe->engine_class || ctx[_class])
+				continue;
+
+			ctx[_class] = spin_ctx_init(fd, _hwe, vm, width, count);
+			spin_sync_start(fd, ctx[_class]);
+		}
+	}
+
+	read_engine_cycles(fd, pceu1);
+	usleep(batch_duration_ns / 1000);
+	if (flags & TEST_TRAILING_IDLE)
+		xe_for_each_engine_class(class)
+			spin_sync_end(fd, ctx[class]);
+	read_engine_cycles(fd, pceu2);
+
+	xe_for_each_engine_class(class) {
+		check_results(pceu1, pceu2, class, width,
+			      hwe->engine_class == class ? 0 : flags);
+		spin_sync_end(fd, ctx[class]);
+		spin_ctx_destroy(fd, ctx[class]);
+	}
+	xe_vm_destroy(fd, vm);
+}
+
+static void
+all_busy_check_all(int fd, unsigned int flags)
+{
+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
+	struct drm_xe_engine_class_instance *hwe;
+	uint32_t vm;
+	int class;
+
+	vm = xe_vm_create(fd, 0, 0);
+	if (flags & TEST_BUSY) {
+		/* spin on one hwe per class */
+		xe_for_each_engine(fd, hwe) {
+			class = hwe->engine_class;
+
+			if (ctx[class])
+				continue;
+
+			ctx[class] = spin_ctx_init(fd, hwe, vm, 1, 1);
+			spin_sync_start(fd, ctx[class]);
+		}
+	}
+
+	read_engine_cycles(fd, pceu1);
+	usleep(batch_duration_ns / 1000);
+	if (flags & TEST_TRAILING_IDLE)
+		xe_for_each_engine_class(class)
+			spin_sync_end(fd, ctx[class]);
+	read_engine_cycles(fd, pceu2);
+
+	xe_for_each_engine_class(class) {
+		check_results(pceu1, pceu2, class, 1, flags);
+		spin_sync_end(fd, ctx[class]);
+		spin_ctx_destroy(fd, ctx[class]);
+	}
+	xe_vm_destroy(fd, vm);
+}
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -581,6 +700,17 @@ igt_main
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
+		all_busy_check_all(xe, TEST_BUSY | TEST_TRAILING_IDLE);
+
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("drm-total-resident")
 		test_total_resident(xe);
-- 
2.38.1

