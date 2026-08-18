Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65ECC5DF74
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 04:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3BB10E9D4;
	Tue, 18 Aug 2026 04:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2+kwnEB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B5810E4F6
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 04:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787026136; x=1818562136;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PSP89kufXhf5fAPsvtVgWaWKAZlg5Jwnd+bCLccgwrI=;
 b=R2+kwnEBojWbYf6DovoSmtPVbw/6X1S3+rWk3lDKPl1hR/835xUGIPBp
 w56w/E2pmT+kcsopxxgUYCWdjPt8PeLYPbEaQStdQdAAgFaGgadTaESuk
 6rQf7O1tjMgxePWh6fnOSP0nujbCqrXG0l9IJNxty/r0FRKV3aBzWdxEb
 C21ekaVodv7mNfwcpCYR/ZKxboM36EYBl3r/TBp2+Ss+Qwg2JuXKycC+X
 meLT8MQ0GAhM4ejNczbVOOLP4JCws6o3t8BjqHoUgbwqVsbDS8ewCEKwH
 k489tzido/akR0fppffcvUqsDpLpeGGnJ4P593tcDNGg8231nPN5BMtEE A==;
X-CSE-ConnectionGUID: wcBN3z1MS1aCY+AQsFPxeA==
X-CSE-MsgGUID: KSfrNqzdQmqIXU4oT3Hbsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98870381"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98870381"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 21:08:56 -0700
X-CSE-ConnectionGUID: KrELX0QqTP+Ej2mwur2PKg==
X-CSE-MsgGUID: 06YhNX7mRHiPyPGO31hgmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262477288"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa008.fm.intel.com with ESMTP; 17 Aug 2026 21:08:55 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH v2 7/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-mixed-engine-usage subtest
Date: Tue, 18 Aug 2026 04:08:43 +0000
Message-ID: <20260818040845.548727-8-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818040845.548727-1-nishit.sharma@intel.com>
References: <20260818040845.548727-1-nishit.sharma@intel.com>
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
index 8fac53180..d818173c2 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -138,6 +138,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define INVALIDATE_BO_STRESS		(0x1 << 18)
 #define RAPID_RESET_STRESS		(0x1 << 19)
 #define DESTROY_VM_CTX_STRESS		(0x1 << 20)
+#define MIXED_ENGINE_STRESS		(0x1 << 21)
 
 /**
  * SUBTEST: %s-cat-error
@@ -653,6 +654,7 @@ struct gt_thread_data {
 	pthread_cond_t *cond;
 	int fd;
 	int gt;
+	int id;
 	int *go;
 	int *exit;
 	int *num_reset;
@@ -693,6 +695,22 @@ static void bo_ctx_create(int fd, int gt, uint64_t addr, size_t bo_size,
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
@@ -765,6 +783,9 @@ static void submit_jobs(struct gt_thread_data *t)
 		};
 		int ret;
 
+		if (t->flags & MIXED_ENGINE_STRESS)
+			fill_mixed_engine(t, i, &instance);
+
 		/* GuC IDs can get exhausted */
 		ret = __xe_exec_queue_create(fd, vm, 1, 1, &instance, 0, &exec.exec_queue_id);
 		if (ret) {
@@ -853,6 +874,10 @@ static void *gt_reset_thread(void *data)
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
@@ -874,6 +899,7 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
 		threads[i].cond = &cond;
 		threads[i].fd = fd;
 		threads[i].gt = gt;
+		threads[i].id = i;
 		threads[i].flags = flags;
 		threads[i].go = &go;
 		threads[i].exit = &exit;
@@ -1076,6 +1102,7 @@ int igt_main()
 		{ "reset-bo-invalidation", INVALIDATE_BO_STRESS },
 		{ "reset-rapid-cycle", RAPID_RESET_STRESS },
 		{ "reset-destroy-vm-context", DESTROY_VM_CTX_STRESS },
+		{ "reset-mixed-engine-usage", MIXED_ENGINE_STRESS | RAPID_RESET_STRESS },
 		{ NULL },
 	};
 	int gt;
-- 
2.43.0

