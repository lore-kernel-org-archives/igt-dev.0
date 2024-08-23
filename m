Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B92FC5321E
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 23:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA85D10E149;
	Fri, 23 Aug 2024 23:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ftn7CMg7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2D310E14E
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 23:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724454178; x=1755990178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qoDbTMiEDwV1F5AQzGp2GHsUlPMuL/k56fGxRmqgy4c=;
 b=Ftn7CMg7qXuQhDDODzABtb3e4Cho+rpoScNuVddkNIjAzlRHIBzzjiyF
 ww4zetJFSvJvjTNeA2KNNSQLI+qYDFVB/OcPjB9CkPgro52rp664FD1eD
 st2ULZK5uQ6aSK/A/H1BgEktx6aF8Wx5cFx5brXZmqM2sdqC40EgewbU9
 usQd9D2NiZkDN4gm05rCai6Fv/oYtCHE63ryKxl+H8GJq3rKY54DcpT1i
 +pAY4dVGnKV1j7bPT8WeIqQ36pjmbGwa1pPjrlT5G6rH5buAuJcvkQ1uu
 C6vv8C8hGxysPR7nA4gkEyLKZj9+zyy69Ju/qwTqfLk0bKU77jXcP35OB Q==;
X-CSE-ConnectionGUID: wqolH8xhQF6BvEv7KFo1Og==
X-CSE-MsgGUID: u8es4fJ3T7WaMdhgVkA5Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="25844097"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="25844097"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 16:02:57 -0700
X-CSE-ConnectionGUID: n5Uj+rU1QK+UFzG7rv3hsg==
X-CSE-MsgGUID: mxfIKb4JT5urUjYsb+95Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="61799823"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 16:02:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_drm_fdinfo: Add tests to verify all
 class utilization
Date: Fri, 23 Aug 2024 16:02:49 -0700
Message-ID: <20240823230250.1090900-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240823230250.1090900-1-lucas.demarchi@intel.com>
References: <20240823230250.1090900-1-lucas.demarchi@intel.com>
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Verify utilization for all classes with varying loads.
Since now multiple spinners are going to be started, one per class,
change the address according to the class in spin_ctx_init()

v2:
- Drop unused ISOLATION flag in some tests.
- s/measured_usleep/usleep
- remove xe_ prefix from helpers/structures
- Drop unused parameters to all_busy_check_all
- s/_class/class
v3 (Lucas):
- Rebase and remove traces of parallel/virtual
- Fix result check when there's not engine of a certain class

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 139 +++++++++++++++++++++++++++++++++++-
 1 file changed, 138 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 735fbe5e6..230deae8d 100644
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
@@ -367,7 +376,7 @@ spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm)
 
 	ctx->class = hwe->engine_class;
 	ctx->vm = vm;
-	ctx->addr = 0x100000;
+	ctx->addr = 0x100000 + 0x100000 * hwe->engine_class;
 
 	ctx->exec.num_batch_buffer = 1;
 	ctx->exec.num_syncs = 2;
@@ -519,6 +528,123 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
 	xe_vm_destroy(fd, vm);
 }
 
+static void
+busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
+{
+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct spin_ctx *ctx = NULL;
+	uint32_t vm;
+	int class;
+
+	vm = xe_vm_create(fd, 0, 0);
+	if (flags & TEST_BUSY) {
+		ctx = spin_ctx_init(fd, hwe, vm);
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
+		check_results(pceu1, pceu2, class,
+			      hwe->engine_class == class ? flags : 0);
+
+	spin_sync_end(fd, ctx);
+	spin_ctx_destroy(fd, ctx);
+	xe_vm_destroy(fd, vm);
+}
+
+static void
+most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
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
+			ctx[_class] = spin_ctx_init(fd, _hwe, vm);
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
+		if (!ctx[class])
+			continue;
+
+		check_results(pceu1, pceu2, class,
+			      hwe->engine_class == class ? 0 : flags);
+		spin_sync_end(fd, ctx[class]);
+		spin_ctx_destroy(fd, ctx[class]);
+	}
+
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
+			ctx[class] = spin_ctx_init(fd, hwe, vm);
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
+		if (!ctx[class])
+			continue;
+
+		check_results(pceu1, pceu2, class, flags);
+		spin_sync_end(fd, ctx[class]);
+		spin_ctx_destroy(fd, ctx[class]);
+	}
+
+	xe_vm_destroy(fd, vm);
+}
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -552,6 +678,17 @@ igt_main
 		xe_for_each_engine(xe, hwe)
 			single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
 
+	igt_subtest("drm-busy-idle-check-all")
+		xe_for_each_engine(xe, hwe)
+			busy_check_all(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
+
+	igt_subtest("drm-most-busy-idle-check-all")
+		xe_for_each_engine(xe, hwe)
+			most_busy_check_all(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
+
+	igt_subtest("drm-all-busy-idle-check-all")
+		all_busy_check_all(xe, TEST_BUSY | TEST_TRAILING_IDLE);
+
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("drm-total-resident")
 		test_total_resident(xe);
-- 
2.43.0

