Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED58AE77188
	for <igt-dev@archiver.kernel.org>; Sat,  4 Jan 2025 07:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA40110E102;
	Sat,  4 Jan 2025 07:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xizxm6i8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3973010E0C8
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Jan 2025 07:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735974963; x=1767510963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5PPMWq/WKHZYql+8HRQiHxatCT6uDGyBU+R5lmdCUxw=;
 b=Xizxm6i8rA+IP68OJk6fK8lxRQfLMk4tGyDqYoR7aFfyAv4pNXS4GC3t
 bzowNmqMwM/+L8xk1E3SemSQEmojHhAOX4B02tBXDg8RXwVt6xImBSItx
 F80KGUeymlNKHrgEtOwhW3O67kF/XXWZHrn1UZp7e3X9MjryN98ECMetB
 rDBYhn79nioPF9uq3Myg4AP3VKpCrAVG/cVHa2YFPIbwkiPddF0ax6ma8
 fpZj+7xhz25flXDqdf3oU+kGH0bcXs/BHvCLnjhk6/RpQkMfC8nFpBxpf
 7VSiTwirJ76uP+FO+X29kUC/Q1h07lXtCpgPpJRJgXQrVK2aiHXVdo+Fn A==;
X-CSE-ConnectionGUID: PKHqlnQ5S3q/Tv42zXf4bw==
X-CSE-MsgGUID: HoFsUOzZQMuAde1G3GKZag==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46878993"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="46878993"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:16:02 -0800
X-CSE-ConnectionGUID: gJ+XLPtWSoi9o0HHuw9Kqg==
X-CSE-MsgGUID: Tj5xhr0IRhqe5oR9IHDi7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="101761996"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:16:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 5/8] lib/xe: Split nsec to ticks abstraction
Date: Fri,  3 Jan 2025 23:15:45 -0800
Message-ID: <20250104071548.737612-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250104071548.737612-1-lucas.demarchi@intel.com>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
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

There are 2 things happening here: one is converting time in nanoseconds
to ticks by using the refclock, and another asserting a spin duration is
not so close to the maximum duration since there needs to be room for
context switch.

Move the time conversion to xe_util.c and adjust it to maintain
namespace and have better names.  Places that do the time conversion to
pass to xe_spin then use the xe_spin_nsec_to_ticks() wrapper to
calculate the ticks.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 benchmarks/gem_wsim.c           |  8 +++---
 lib/xe/xe_spin.c                | 47 +++++++++------------------------
 lib/xe/xe_spin.h                |  9 +++----
 lib/xe/xe_util.c                | 40 ++++++++++++++++++++++++++++
 lib/xe/xe_util.h                |  2 ++
 tests/intel/xe_exec_mix_modes.c |  3 ++-
 tests/intel/xe_spin_batch.c     |  2 +-
 7 files changed, 66 insertions(+), 45 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index c4fd00a6a..454b6f017 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1797,8 +1797,8 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 	xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->xe.exec.address, w->bb_size);
 	xe_spin_init_opts(&w->xe.data->spin, .addr = w->xe.exec.address,
 				   .preempt = (w->preempt_us > 0),
-				   .ctx_ticks = duration_to_ctx_ticks(fd, eq->hwe_list[0].gt_id,
-								1000LL * get_duration(wrk, w)));
+				   .ctx_ticks = xe_spin_nsec_to_ticks(fd, eq->hwe_list[0].gt_id,
+								      1000LL * get_duration(wrk, w)));
 	w->xe.exec.exec_queue_id = eq->id;
 	w->xe.exec.num_batch_buffer = 1;
 	/* always at least one out fence */
@@ -2655,8 +2655,8 @@ static void do_xe_exec(struct workload *wrk, struct w_step *w)
 		xe_spin_init_opts(&w->xe.data->spin,
 				  .addr = w->xe.exec.address,
 				  .preempt = (w->preempt_us > 0),
-				  .ctx_ticks = duration_to_ctx_ticks(fd, eq->hwe_list[0].gt_id,
-								1000LL * get_duration(wrk, w)));
+				  .ctx_ticks = xe_spin_nsec_to_ticks(fd, eq->hwe_list[0].gt_id,
+								     1000LL * get_duration(wrk, w)));
 	xe_exec(fd, &w->xe.exec);
 }
 
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 2bde55856..333f8d7d8 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -13,43 +13,12 @@
 #include "igt_core.h"
 #include "igt_syncobj.h"
 #include "intel_reg.h"
+
 #include "xe_ioctl.h"
 #include "xe_spin.h"
+#include "xe_util.h"
 
-static uint32_t read_timestamp_frequency(int fd, int gt_id)
-{
-	struct xe_device *dev = xe_device_get(fd);
-
-	igt_assert(dev && dev->gt_list && dev->gt_list->num_gt);
-	igt_assert(gt_id >= 0 && gt_id <= dev->gt_list->num_gt);
-
-	return dev->gt_list->gt_list[gt_id].reference_clock;
-}
-
-static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
-{
-	igt_assert(y > 0);
-	igt_assert_lte_u64(x, UINT64_MAX - (y - 1));
-
-	return (x + y - 1) / y;
-}
-
-/**
- * duration_to_ctx_ticks:
- * @fd: opened device
- * @gt_id: tile id
- * @duration_ns: duration in nanoseconds to be converted to context timestamp ticks
- * @return: duration converted to context timestamp ticks.
- */
-uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t duration_ns)
-{
-	uint32_t f = read_timestamp_frequency(fd, gt_id);
-	uint64_t ctx_ticks = div64_u64_round_up(duration_ns * f, NSEC_PER_SEC);
-
-	igt_assert_lt_u64(ctx_ticks, XE_SPIN_MAX_CTX_TICKS);
-
-	return ctx_ticks;
-}
+#define XE_SPIN_MAX_CTX_TICKS (UINT32_MAX - 1000)
 
 #define MI_SRM_CS_MMIO				(1 << 19)
 #define MI_LRI_CS_MMIO				(1 << 19)
@@ -60,6 +29,16 @@ uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t duration_ns)
 
 enum { START_TS, NOW_TS };
 
+
+uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
+{
+	uint32_t ticks = xe_nsec_to_ticks(fd, gt_id, nsec);
+
+	igt_assert_lt_u64(ticks, XE_SPIN_MAX_CTX_TICKS);
+
+	return ticks;
+}
+
 /**
  * xe_spin_init:
  * @spin: pointer to mapped bo in which spinner code will be written
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index 593065bc0..01f45eaeb 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -15,10 +15,8 @@
 #include "xe_query.h"
 #include "lib/igt_dummyload.h"
 
-#define XE_SPIN_MAX_CTX_TICKS (UINT32_MAX - 1000)
-
-/** struct xe_spin_opts
- *
+/**
+ * struct xe_spin_opts
  * @addr: offset of spinner within vm
  * @preempt: allow spinner to be preempted or not
  * @ctx_ticks: number of ticks after which spinner is stopped, applied if > 0
@@ -68,7 +66,6 @@ struct xe_cork {
 };
 
 igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
-uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t ns);
 void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
 struct xe_cork *
 xe_cork_create(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
@@ -82,6 +79,8 @@ void xe_cork_destroy(int fd, struct xe_cork *ctx);
 #define xe_spin_init_opts(fd, ...) \
 	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
 
+uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec);
+
 bool xe_spin_started(struct xe_spin *spin);
 void xe_spin_sync_wait(int fd, struct igt_spin *spin);
 void xe_spin_wait_started(struct xe_spin *spin);
diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index f0b6bbb2d..06b378ce0 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -4,9 +4,11 @@
  */
 
 #include "igt.h"
+#include "igt_core.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
 #include "intel_pat.h"
+
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
@@ -235,3 +237,41 @@ void xe_bind_unbind_async(int xe, uint32_t vm, uint32_t bind_engine,
 
 	free(bind_ops);
 }
+
+static uint32_t reference_clock(int fd, int gt_id)
+{
+	struct xe_device *dev = xe_device_get(fd);
+	uint32_t refclock;
+
+	igt_assert(dev && dev->gt_list && dev->gt_list->num_gt);
+	igt_assert(gt_id >= 0 && gt_id <= dev->gt_list->num_gt);
+
+	refclock = dev->gt_list->gt_list[gt_id].reference_clock;
+
+	igt_assert_lt(0, refclock);
+
+	return refclock;
+}
+
+static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
+{
+	igt_assert(y > 0);
+	igt_assert_lte_u64(x, UINT64_MAX - (y - 1));
+
+	return (x + y - 1) / y;
+}
+
+/**
+ * xe_nsec_to_ticks: convert time in nanoseconds to timestamp ticks
+ * @fd: opened device
+ * @gt_id: tile id
+ * @nsec: time in nanoseconds
+ *
+ * Return: Time converted to context timestamp ticks.
+ */
+uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
+{
+	uint32_t refclock = reference_clock(fd, gt_id);
+
+	return div64_u64_round_up(nsec * refclock, NSEC_PER_SEC);
+}
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index c544d912f..06ebd3c2a 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -47,4 +47,6 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
 			  struct igt_list_head *obj_list,
 			  uint32_t sync_in, uint32_t sync_out);
 
+uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t ns);
+
 #endif /* XE_UTIL_H */
diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
index eeae9d122..0bcd49cc0 100644
--- a/tests/intel/xe_exec_mix_modes.c
+++ b/tests/intel/xe_exec_mix_modes.c
@@ -22,6 +22,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_util.h"
 #include <string.h>
 
 #define FLAG_EXEC_MODE_LR	(0x1 << 0)
@@ -132,7 +133,7 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
 
 	if (job_type == SPINNER_INTERRUPTED) {
 		spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;
-		spin_opts.ctx_ticks = duration_to_ctx_ticks(fd, 0, duration_ns);
+		spin_opts.ctx_ticks = xe_spin_nsec_to_ticks(fd, 0, duration_ns);
 		xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
 		if (engine_execution_mode == EXEC_MODE_LR)
 			sync[0].addr = addr + (char *)&data[SPIN_DATA].exec_sync - (char *)data;
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 0ad2490a0..5d9afaf3d 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -277,7 +277,7 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
 	xe_vm_bind_sync(fd, vm, bo, 0, spin_addr, bo_size);
 	xe_spin_init_opts(spin, .addr = spin_addr,
 				.preempt = true,
-				.ctx_ticks = duration_to_ctx_ticks(fd, 0, duration_ns));
+				.ctx_ticks = xe_spin_nsec_to_ticks(fd, 0, duration_ns));
 	exec.address = spin_addr;
 	exec.exec_queue_id = exec_queue;
 
-- 
2.47.0

