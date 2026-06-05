Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD70CD6E79
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 14:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2049611A911;
	Fri,  5 Jun 2026 14:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdGeigel";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB5311A910
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 14:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780670420; x=1812206420;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yK0B6wkvwXhU4JF6BC/YtoK0h/jlQuk796YslAKD+D8=;
 b=gdGeigelNS7TiaMo/jPGBmCluGg+7CfJGXMnYAFB1LiQ4+4DvKc73++X
 8aRh3ok2oM7MXRE34kZCWhfY97jJAfMlod59fXh7ftBc11AiMsmFrmaHx
 +KDckkuE9eJzRIkfnu7LW+BnKBJVFkfTTgn2HteF2AIaU0INXwHeIPzhh
 LxTpuhfi4nNVG6PA3df0PX2pxTRjqo+6sU/cooZ7rwYOI8XKBh8z4piQP
 8NPIZxd6+N0Sigcb98ROb8xJpoGOlh/DnB/tL7zdDq8w8AzORPZIdJ4S0
 e6gXT3AVToVNlNx5jIfsEBeSvJkPkoDkD83WhcfGFoGgzl2wRDjDUGGOs Q==;
X-CSE-ConnectionGUID: 0iY//oGxTFOHEteaKTKSrg==
X-CSE-MsgGUID: auDKX4+ARfK7A1PGEzVKVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81483822"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81483822"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 07:40:00 -0700
X-CSE-ConnectionGUID: MECkR4rSQomcNiCFcK0J9A==
X-CSE-MsgGUID: bpGXm4drSKCYLgPLbH15uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="242384388"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 07:39:59 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	stuart.summers@intel.com
Subject: [PATCH i-g-t v1 4/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-bo-invalidation subtest
Date: Fri,  5 Jun 2026 14:39:48 +0000
Message-ID: <20260605143953.1122688-5-nishit.sharma@intel.com>
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

Add BO invalidation coverage to the GT reset stress path. This extends
reset stress coverage to BO mapping invalidation scenarios while keeping
the existing stress harness and default behavior intact.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_reset.c | 57 +++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 7507d65e0..e57d4ecf2 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -129,6 +129,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define SECONDARY_QUEUE			(0x1 << 15)
 #define RESET_SYNC_MODE			(0x1 << 16)
 #define MEM_PRESSURE_STRESS		(0x1 << 17)
+#define INVALIDATE_BO_STRESS		(0x1 << 18)
 
 /**
  * SUBTEST: %s-cat-error
@@ -609,10 +610,41 @@ struct gt_thread_data {
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
@@ -700,6 +732,19 @@ static void submit_jobs(struct gt_thread_data *t)
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
 
@@ -745,6 +790,10 @@ static void *gt_reset_thread(void *data)
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
@@ -753,7 +802,7 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
 	pthread_mutex_t mutex;
 	pthread_cond_t cond;
 	int go = 0, exit = 0, num_reset = 0, i;
-	int num_submit = 0, num_submit_fail = 0;
+	int num_submit = 0, num_submit_fail = 0, num_vm_recreate = 0;
 
 	threads = calloc(n_threads, sizeof(struct gt_thread_data));
 	igt_assert(threads);
@@ -772,6 +821,7 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
 		threads[i].num_reset = &num_reset;
 		threads[i].num_submit = &num_submit;
 		threads[i].num_submit_fail = &num_submit_fail;
+		threads[i].num_vm_recreate = &num_vm_recreate;
 		threads[i].do_reset = (i == 0);
 
 		pthread_create(&threads[i].thread, 0, gt_reset_thread,
@@ -789,8 +839,8 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
 	for (i = 0; i < n_threads; i++)
 		pthread_join(threads[i].thread, NULL);
 
-	igt_info("number of resets %d, submissions %d, submit fails %d\n",
-		 num_reset, num_submit, num_submit_fail);
+	igt_info("number of resets %d, submissions %d, submit fails %d vm_recreate %d\n",
+		 num_reset, num_submit, num_submit_fail, num_vm_recreate);
 
 	igt_assert_neq(num_reset, 0);
 	igt_assert_neq(num_submit, 0);
@@ -961,6 +1011,7 @@ int igt_main()
 		{ "reset-concurrent-submit", 0 },
 		{ "reset-concurrent-submit-sync", RESET_SYNC_MODE },
 		{ "reset-memory-pressure", MEM_PRESSURE_STRESS },
+		{ "reset-bo-invalidation", INVALIDATE_BO_STRESS },
 		{ NULL },
 	};
 	int gt;
-- 
2.43.0

