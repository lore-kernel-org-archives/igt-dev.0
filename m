Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE454C5DF67
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 04:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DEC10E9D4;
	Tue, 18 Aug 2026 04:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7LJ6PYL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D69010E4F6
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 04:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787026132; x=1818562132;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=skFJKX2Cgq6PkOA0IeJ63qWhtq5m7pS6mfysn9iHyqM=;
 b=c7LJ6PYLb40mmnnphef2Uwy7abrLjfiP8wj0IaEztMXDznr6pQYmgeWL
 s5er7oUkNIIl602ztqMAy0IXmrVhL/pA3+Nv0Q95sbyS6CNxwlitsdXOR
 IO7F6i/tPiynLixiRwBFyeisdBOByvyb9e3DPH2m/7iGZgIcd1otEyHqj
 QCU111g4lr/bqbjYjnjO7VMAms37FYuG9oxbpbD/J8UtoLRt327UJKhV5
 OIcmv6/N2sRUNvGZ6aGCmUnCw8GuWWYWFtpvUMMmudxnJWQ82EuwvvDqS
 kRm1R+qAR6OrqZaQy+fe1i8nShQHpRqzFhbh+vP42HzAEz+VuSdAEomLg w==;
X-CSE-ConnectionGUID: fGxBKzjaSUGeNBBvTCk6ZA==
X-CSE-MsgGUID: 42h6zGpBRlKMtmd/zsdHXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98870378"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98870378"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 21:08:52 -0700
X-CSE-ConnectionGUID: /VJd+VYoSnez2uUzLC2Ghw==
X-CSE-MsgGUID: dqCPzb6AS/egza2cFqcZiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262477276"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa008.fm.intel.com with ESMTP; 17 Aug 2026 21:08:51 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH v2 4/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-bo-invalidation subtest
Date: Tue, 18 Aug 2026 04:08:40 +0000
Message-ID: <20260818040845.548727-5-nishit.sharma@intel.com>
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

Add BO invalidation coverage to the GT reset stress path. This extends
reset stress coverage to BO mapping invalidation scenarios while keeping
the existing stress harness and default behavior intact.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_reset.c | 57 +++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 825fc6aa1..2a822b29b 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -135,6 +135,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define SECONDARY_QUEUE			(0x1 << 15)
 #define RESET_SYNC_MODE			(0x1 << 16)
 #define MEM_PRESSURE_STRESS		(0x1 << 17)
+#define INVALIDATE_BO_STRESS		(0x1 << 18)
 
 /**
  * SUBTEST: %s-cat-error
@@ -655,10 +656,41 @@ struct gt_thread_data {
 	int *num_reset;
 	int *num_submit;
 	int *num_submit_fail;
+	int *num_vm_recreate;
 	unsigned int flags;
 	bool do_reset;
 };
 
+static void bo_ctx_destroy(int fd, uint32_t *vm, uint32_t *bo,
+			   uint32_t **data, size_t bo_size)
+{
+	if (*data) {
+		munmap(*data, bo_size);
+		*data = NULL;
+	}
+
+	if (*bo) {
+		gem_close(fd, *bo);
+		*bo = 0;
+	}
+
+	if (*vm) {
+		xe_vm_destroy(fd, *vm);
+		*vm = 0;
+	}
+}
+
+static void bo_ctx_create(int fd, int gt, uint64_t addr, size_t bo_size,
+			  uint32_t *vm, uint32_t *bo, uint32_t **data)
+{
+	*vm = xe_vm_create(fd, 0, 0);
+	*bo = xe_bo_create(fd, *vm, bo_size, vram_if_possible(fd, gt),
+			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	*data = xe_bo_map(fd, *bo, bo_size);
+	(*data)[0] = MI_BATCH_BUFFER_END;
+	xe_vm_bind_sync(fd, *vm, *bo, 0, addr, bo_size);
+}
+
 static void pressure_bo_create(int fd, uint32_t vm, int gt,
 			       uint32_t *bos, int *count)
 {
@@ -746,6 +778,19 @@ static void submit_jobs(struct gt_thread_data *t)
 			pressure_bo_create(fd, vm, t->gt, pressure_bos, &pressure_count);
 		}
 
+		if (((t->flags & INVALIDATE_BO_STRESS) && !(i % 96))) {
+			if (t->flags & MEM_PRESSURE_STRESS) {
+				pressure_bo_destroy(fd, pressure_bos, pressure_count);
+				pressure_count = 0;
+			}
+
+			bo_ctx_destroy(fd, &vm, &bo, &data, bo_size);
+			bo_ctx_create(fd, t->gt, addr, bo_size, &vm, &bo, &data);
+			if (t->flags & MEM_PRESSURE_STRESS)
+				pressure_bo_create(fd, vm, t->gt, pressure_bos, &pressure_count);
+			(*t->num_vm_recreate)++;
+		}
+
 		i++;
 	}
 
@@ -791,6 +836,10 @@ static void *gt_reset_thread(void *data)
  * Description: Stress concurrent GT resets and job submissions under memory pressure
  * Test category: stress test
  *
+ * SUBTEST: gt-stress-reset-bo-invalidation
+ * Description: Stress concurrent GT resets and job submissions while invalidating BO CPU mappings
+ * Test category: stress test
+ *
  */
 static void
 gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
@@ -799,7 +848,7 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
 	pthread_mutex_t mutex;
 	pthread_cond_t cond;
 	int go = 0, exit = 0, num_reset = 0, i;
-	int num_submit = 0, num_submit_fail = 0;
+	int num_submit = 0, num_submit_fail = 0, num_vm_recreate = 0;
 
 	threads = calloc(n_threads, sizeof(struct gt_thread_data));
 	igt_assert(threads);
@@ -818,6 +867,7 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
 		threads[i].num_reset = &num_reset;
 		threads[i].num_submit = &num_submit;
 		threads[i].num_submit_fail = &num_submit_fail;
+		threads[i].num_vm_recreate = &num_vm_recreate;
 		threads[i].do_reset = (i == 0);
 
 		pthread_create(&threads[i].thread, 0, gt_reset_thread,
@@ -835,8 +885,8 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
 	for (i = 0; i < n_threads; i++)
 		pthread_join(threads[i].thread, NULL);
 
-	igt_info("number of resets %d, submissions %d, submit fails %d\n",
-		 num_reset, num_submit, num_submit_fail);
+	igt_info("number of resets %d, submissions %d, submit fails %d vm_recreate %d\n",
+		 num_reset, num_submit, num_submit_fail, num_vm_recreate);
 
 	igt_assert_neq(num_reset, 0);
 	igt_assert_neq(num_submit, 0);
@@ -1010,6 +1060,7 @@ int igt_main()
 		{ "reset-concurrent-submit", 0 },
 		{ "reset-concurrent-submit-sync", RESET_SYNC_MODE },
 		{ "reset-memory-pressure", MEM_PRESSURE_STRESS },
+		{ "reset-bo-invalidation", INVALIDATE_BO_STRESS },
 		{ NULL },
 	};
 	int gt;
-- 
2.43.0

