Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B19BD31A13
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04D010E58F;
	Wed, 14 Jan 2026 06:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFoE7F7j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E9F10E5CA
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768373982; x=1799909982;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aKgs2iv2qwubZb8u9oC6TJMW5BBkpt6a0HENiRcFdnU=;
 b=PFoE7F7jPZecoEvQ1OXzXAwG5RQRxgnHJSEuHSfxFWFxKtaRsk1k0sif
 9/EJmYTYusKfKnFiFVmYvJk7CnMwDFwP4yjoZFlCjHBARU3Un4DHjbfsg
 PrB/NhUhtaMATTEF0xbU/zeLm8jJVsSxTnnp0h4fEK0eH017huH/h/IIp
 +6cZUmoPGd/SDFsVYA+FfakxWilaIF8HOV2OhzSNnY/SBH4yIDRL9oqAu
 2uNlM5ridcF0a1uEbX0n/qRJufPzHucOdZLG9ub8WJvuAKAbc/dwReTPx
 OtWAFUX33k8wTouh1Zj+rStvqk+Epy5KrXvZSMhSI7xyLqDnp1YmJ2akR Q==;
X-CSE-ConnectionGUID: 4RnrshwwTUyzbbR8TrTs7A==
X-CSE-MsgGUID: 4hrw/bbDRS+etxNhqxrYLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69647900"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69647900"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:59:42 -0800
X-CSE-ConnectionGUID: ZdLiK+s6RBqGQaLK0fFEgw==
X-CSE-MsgGUID: 6uwjKOkNQcKh2k9k1JWvQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="205159928"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 22:59:40 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH i-g-t 7/9] tests/intel/xe_exec_reset: Add tests for
 engine-reset
Date: Wed, 14 Jan 2026 12:29:23 +0530
Message-ID: <20260114065925.197958-8-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add tests to validate engine-reset both in legacy and compute mode.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/xe/xe_legacy.c          |  9 ++++++---
 tests/intel/xe_exec_reset.c | 24 ++++++++++++++++++++----
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 084445305..33237f01e 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -25,6 +25,7 @@
 /* Batch buffer element count, in number of dwords(u32) */
 #define GT_RESET			(0x1 << 0)
 #define MAX_N_EXECQUEUES		16
+#define ENGINE_RESET                    (0x1 << 21)
 
 /**
  * xe_legacy_test_mode:
@@ -69,7 +70,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		.ctx_ticks = flags & LONG_SPIN ?
 			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
 	};
-	int i, b;
+	int i, b, hang_exec_queue = n_exec_queues / 2;
 	int extra_execs = (flags & LONG_SPIN_REUSE_QUEUE) ? n_exec_queues : 0;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
@@ -133,7 +134,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		u64 exec_addr;
 		int e = i % n_exec_queues;
 
-		if (!i || flags & CANCEL ||
+		if ((flags & ENGINE_RESET && e == hang_exec_queue) ||
+		    !i || flags & CANCEL ||
 		    (flags & LONG_SPIN && i < n_exec_queues)) {
 			spin_opts.addr = base_addr + spin_offset;
 			xe_spin_init(&data[i].spin, &spin_opts);
@@ -224,7 +226,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
+	if (!use_capture_mode &&
+	    !(flags & (GT_RESET | ENGINE_RESET | CANCEL | COMPRESSION))) {
 		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
 		     i < n_execs + extra_execs; i++)
 			igt_assert_eq(data[i].data, 0xc0ffee);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 7aaee31dd..a71988a0b 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -124,6 +124,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
 #define SYSTEM				(0x1 << 12)
 #define COMPRESSION			(0x1 << 13)
+#define ENGINE_RESET                    (0x1 << 21)
 
 /**
  * SUBTEST: %s-cat-error
@@ -330,6 +331,9 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * SUBTEST: gt-reset
  * Description: Test GT reset
  *
+ * SUBTEST: engine-reset
+ * Description: Test engine reset
+ *
  * SUBTEST: close-fd-no-exec
  * Description: Test close fd no-exec
  *
@@ -345,6 +349,9 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * SUBTEST: cm-gt-reset
  * Description: Test compute mode GT reset
  *
+ * SUBTEST: cm-engine-reset
+ * Description: Test compute mode engine reset
+ *
  * SUBTEST: cm-close-fd-no-exec
  * Description: Test compute mode close fd no-exec
  *
@@ -383,7 +390,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		uint32_t data;
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = flags & PREEMPT };
-	int i, b;
+	int i, b, hang_exec_queue = n_exec_queues / 2;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
 
@@ -421,7 +428,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t exec_addr;
 		int e = i % n_exec_queues;
 
-		if (!i || flags & CANCEL) {
+		if ((flags & ENGINE_RESET && e == hang_exec_queue) || !i || flags & CANCEL) {
 			spin_opts.addr = base_addr + spin_offset;
 			xe_spin_init(&data[i].spin, &spin_opts);
 			exec_addr = spin_opts.addr;
@@ -467,7 +474,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 
 		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
 				       exec_queues[i % n_exec_queues], &timeout);
-		if (flags & GT_RESET || flags & CAT_ERROR)
+		if (flags & GT_RESET || flags & CAT_ERROR || flags & ENGINE_RESET)
 			/* exec races with reset: may return -EIO or complete */
 			igt_assert(err == -EIO || !err);
 		else
@@ -478,7 +485,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
 
-	if (!(flags & (GT_RESET | CANCEL))) {
+	if (!(flags & (GT_RESET | CANCEL | ENGINE_RESET))) {
 		for (i = 1; i < n_execs; i++)
 			igt_assert_eq(data[i].data, 0xc0ffee);
 	}
@@ -901,6 +908,11 @@ int igt_main()
 			xe_legacy_test_mode(fd, hwe, 2, 2, GT_RESET,
 					    LEGACY_MODE_ADDR, false);
 
+	igt_subtest("engine-reset")
+		xe_for_each_engine(fd, hwe)
+			xe_legacy_test_mode(fd, hwe, 16, 256, ENGINE_RESET,
+					    LEGACY_MODE_ADDR, false);
+
 	igt_subtest("close-fd-no-exec")
 		xe_for_each_engine(fd, hwe)
 			xe_legacy_test_mode(-1, hwe, 16, 0, CLOSE_FD,
@@ -925,6 +937,10 @@ int igt_main()
 		xe_for_each_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 2, 2, GT_RESET);
 
+	igt_subtest("cm-engine-reset")
+		xe_for_each_engine(fd, hwe)
+			test_compute_mode(fd, hwe, 16, 256, ENGINE_RESET);
+
 	igt_subtest("cm-close-fd-no-exec")
 		xe_for_each_engine(fd, hwe)
 			test_compute_mode(-1, hwe, 16, 0, CLOSE_FD);
-- 
2.43.0

