Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D350CD6E79
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 14:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA9C11A915;
	Fri,  5 Jun 2026 14:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJD9MWgy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682B111A911
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 14:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780670421; x=1812206421;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iVo29HD3Z3Lg0mvcZo0w/8c7EyFeQJPYHpLer4Fz3FE=;
 b=jJD9MWgyYFnGvS9Kh3/3QzymmRJH/1NKiF/NBYev+C0xB+FOCCdA1NvR
 opr6l5g/lU69zWT6MADMNV5nhXR3FrsWtxRCpoCamlEuib0SPUIcSJuGb
 y78vj3yH2QJsOoVe9qsmuYNTmUgy76/aBnWhDco+pCVCafGTno/g6C1CS
 MmPO9trrzR3Oqy66H2uxL5jcBSGhD0qkyV3dYmFVGI0NAHIAwXcL50hyT
 2T9nk6x2qTw+K2LdYXOy6i6ddTqKtKT2h8wixs25kLnPDygnjD+Lq/kn+
 Tn+DpYJJ7ESkl22ZCE1ein2AfFvRzPRLxRaHhKgRLiZIGgtLKxbcNsIwt A==;
X-CSE-ConnectionGUID: Tbz5kjqWRemUq58Z911C/A==
X-CSE-MsgGUID: c4bWb95ARliK4eBUtUJbcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81483832"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81483832"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 07:40:04 -0700
X-CSE-ConnectionGUID: ExQaZHgqRLK215/lC0HvIA==
X-CSE-MsgGUID: gyNQaDx2TeOydTFZAYJeRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="242384425"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 07:40:02 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	stuart.summers@intel.com
Subject: [PATCH i-g-t v1 7/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-mixed-engine-usage subtest
Date: Fri,  5 Jun 2026 14:39:51 +0000
Message-ID: <20260605143953.1122688-8-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605143953.1122688-1-nishit.sharma@intel.com>
References: <20260605143953.1122688-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

This extends concurrent reset/submission stress to mixed engine class
traffic while preserving default single-engine behavior for existing
subtests. It is combined with rapid reset mode as requested to increase
reset/submit overlap pressure.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_reset.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 862caae27..4b0a6435f 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -132,6 +132,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define INVALIDATE_BO_STRESS		(0x1 << 18)
 #define RAPID_RESET_STRESS		(0x1 << 19)
 #define DESTROY_VM_CTX_STRESS		(0x1 << 20)
+#define MIXED_ENGINE_STRESS		(0x1 << 21)
 
 /**
  * SUBTEST: %s-cat-error
@@ -607,6 +608,7 @@ struct gt_thread_data {
 	pthread_cond_t *cond;
 	int fd;
 	int gt;
+	int id;
 	int *go;
 	int *exit;
 	int *num_reset;
@@ -647,6 +649,22 @@ static void bo_ctx_create(int fd, int gt, uint64_t addr, size_t bo_size,
 	xe_vm_bind_sync(fd, *vm, *bo, 0, addr, bo_size);
 }
 
+static void fill_mixed_engine(struct gt_thread_data *t, int iter,
+			      struct drm_xe_engine_class_instance *instance)
+{
+	const uint16_t classes[] = {
+		DRM_XE_ENGINE_CLASS_COPY,
+		DRM_XE_ENGINE_CLASS_RENDER,
+		DRM_XE_ENGINE_CLASS_COMPUTE,
+		DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
+		DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
+	};
+
+	instance->gt_id = t->gt;
+	instance->engine_instance = 0;
+	instance->engine_class = classes[(iter + t->id) % ARRAY_SIZE(classes)];
+}
+
 static void pressure_bo_create(int fd, uint32_t vm, int gt,
 			       uint32_t *bos, int *count)
 {
@@ -719,6 +737,9 @@ static void submit_jobs(struct gt_thread_data *t)
 		};
 		int ret;
 
+		if (t->flags & MIXED_ENGINE_STRESS)
+			fill_mixed_engine(t, i, &instance);
+
 		/* GuC IDs can get exhausted */
 		ret = __xe_exec_queue_create(fd, vm, 1, 1, &instance, 0, &exec.exec_queue_id);
 		if (ret) {
@@ -807,6 +828,10 @@ static void *gt_reset_thread(void *data)
  * Description: Stress concurrent GT resets and job submissions while destroying and recreating VM context
  * Test category: stress test
  *
+ * SUBTEST: gt-stress-reset-mixed-engine-usage
+ * Description: Stress concurrent GT resets and mixed-engine job submissions
+ * Test category: stress test
+ *
  */
 static void
 gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
@@ -828,6 +853,7 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
 		threads[i].cond = &cond;
 		threads[i].fd = fd;
 		threads[i].gt = gt;
+		threads[i].id = i;
 		threads[i].flags = flags;
 		threads[i].go = &go;
 		threads[i].exit = &exit;
@@ -1027,6 +1053,7 @@ int igt_main()
 		{ "reset-bo-invalidation", INVALIDATE_BO_STRESS },
 		{ "reset-rapid-fire", RAPID_RESET_STRESS },
 		{ "reset-destroy-vm-context", DESTROY_VM_CTX_STRESS },
+		{ "reset-mixed-engine-usage", MIXED_ENGINE_STRESS | RAPID_RESET_STRESS },
 		{ NULL },
 	};
 	int gt;
-- 
2.43.0

