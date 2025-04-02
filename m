Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4042CC28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 11:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE4010E75E;
	Wed,  2 Apr 2025 11:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WK1ds85W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590FA10E75D
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 11:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743594692; x=1775130692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zNSAFwC0SlUZC+gMzswMeMdTE+J0a/QDw0MVjWTra7Y=;
 b=WK1ds85WOE6R2AhfRmjTOx3/X5duLcbNQYqmyKML1Tm9gQ7jUJLQ89Xr
 Cv51PNPv25WGtzbPpLu8aID9/vGy9fRP21ToKcppWf4xL7uV7fKjpgipX
 pZGKcsFcdx0fUaoem3kBFHVl3HhtXDcAZ3cBzLvGedpQg0JDQt18hJQtX
 +CWnKl2LVd37reBMJljnNDGTkpUo9X2bqx65dBvNazVOIwcUb1xtsG/xT
 EpgvVSh7HXDUgsH3JMc4Wmh79XD6T8QDGhFM6oYxUjo3XR6Oxx+R11Kgd
 Q1n4gN2veKy77aD6pY6O0lgenQmiSOdkyhmMe9Lb5Hpn2RkjnQo0Qy9Qr w==;
X-CSE-ConnectionGUID: 3Nf0JE1fQ1qhO49hS+XNFQ==
X-CSE-MsgGUID: VuNgeEshR5Kfww0xgzWeHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="48743563"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="48743563"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 04:51:32 -0700
X-CSE-ConnectionGUID: 3HQkoFLGT+CJjZwo1Px6zA==
X-CSE-MsgGUID: 3eUOuNalQf2PmzcrN51BNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="127184672"
Received: from carterle-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.81])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 04:51:30 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v5 5/5] tests/intel/xe_render_copy: Add new test for render under
 copy stress
Date: Wed,  2 Apr 2025 13:50:03 +0200
Message-ID: <20250402115055.156765-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402115055.156765-1-francois.dugast@intel.com>
References: <20250402115055.156765-1-francois.dugast@intel.com>
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

Add a new series of tests which use the spinner with mem copy to keep
the copy functions busy and perform memory accesses, while a regular
render job is running. The objective of the test is to ensure that
both the copies and the rendering are correct. Some information about
rendering duration is provided in the logs, which can help monitor if
copies have an impact on render.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_render_copy.c | 221 +++++++++++++++++++++++++++++++++++
 1 file changed, 221 insertions(+)

diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index e2fbbc0f8..d9e785a40 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -12,8 +12,12 @@
 #include "igt.h"
 #include "intel_blt.h"
 #include "intel_bufops.h"
+#include "intel_mocs.h"
+#include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+#include "xe/xe_util.h"
 
 /**
  * TEST: Copy memory using 3d engine
@@ -437,6 +441,207 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	return fails;
 }
 
+static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
+			  uint64_t ahnd, uint32_t region, struct xe_spin **spin,
+			  pthread_mutex_t *lock_init_spin)
+{
+	uint32_t copy_size = SZ_4M;
+	uint64_t duration_ns = NSEC_PER_SEC * 4.5; // Keep below 5 s timeout
+	intel_ctx_t *ctx;
+	uint32_t exec_queue;
+	uint32_t width = copy_size;
+	uint32_t height = 1;
+	uint32_t bo_size = ALIGN(SZ_4K, xe_get_default_alignment(fd));
+	uint32_t bo;
+	uint64_t spin_addr;
+	int32_t src_handle, dst_handle;
+	struct blt_mem_object src, dst;
+	struct xe_spin_mem_copy mem_copy = {
+		.src = &src,
+		.dst = &dst,
+	};
+
+	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
+
+	/* Create source and destination objects used for the copy */
+	src_handle = xe_bo_create(fd, 0, copy_size, region, 0);
+	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
+	blt_set_mem_object(mem_copy.src, src_handle, copy_size, 0, width, height, region,
+			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
+			   M_LINEAR, COMPRESSION_DISABLED);
+	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, 0, width, height, region,
+			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
+			   M_LINEAR, COMPRESSION_DISABLED);
+	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
+	mem_copy.dst->ptr = xe_bo_map(fd, dst_handle, copy_size);
+	mem_copy.src_offset = get_offset_pat_index(ahnd, mem_copy.src->handle,
+						   mem_copy.src->size, 0, mem_copy.src->pat_index);
+	mem_copy.dst_offset = get_offset_pat_index(ahnd, mem_copy.dst->handle,
+						   mem_copy.dst->size, 0, mem_copy.dst->pat_index);
+
+	/* Create spinner */
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
+	*spin = xe_bo_map(fd, bo, bo_size);
+	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
+							ALLOC_STRATEGY_LOW_TO_HIGH);
+	xe_vm_bind_sync(fd, vm, bo, 0, spin_addr, bo_size);
+	xe_spin_init_opts(*spin, .addr = spin_addr, .preempt = true,
+			  .ctx_ticks = xe_spin_nsec_to_ticks(fd, 0, duration_ns),
+			  .mem_copy = &mem_copy);
+	igt_assert_eq(pthread_mutex_unlock(lock_init_spin), 0);
+
+	while (true) {
+		src.ptr[0] = 0xdeadbeaf;
+		intel_ctx_xe_exec(ctx, ahnd, spin_addr);
+		/* Abort if the spinner was stopped, otherwise continue looping */
+		if ((*spin)->end == 0)
+			break;
+		igt_assert_f(!memcmp(mem_copy.src->ptr, mem_copy.dst->ptr, mem_copy.src->size),
+			     "source and destination differ\n");
+		dst.ptr[0] = 0;
+	}
+
+	/* Cleanup */
+	xe_vm_unbind_sync(fd, vm, 0, spin_addr, bo_size);
+	gem_munmap(*spin, bo_size);
+	gem_close(fd, bo);
+	gem_munmap(mem_copy.dst->ptr, copy_size);
+	gem_munmap(mem_copy.src->ptr, copy_size);
+	gem_close(fd, dst_handle);
+	gem_close(fd, src_handle);
+	intel_ctx_destroy(fd, ctx);
+	xe_exec_queue_destroy(fd, exec_queue);
+}
+
+typedef struct {
+	int fd;
+	struct drm_xe_engine_class_instance *hwe;
+	uint32_t vm;
+	uint64_t ahnd;
+	uint32_t region;
+	struct xe_spin *spin;
+	pthread_mutex_t lock_init_spin;
+} data_thread_mem_copy;
+
+static void *run_thread_mem_copy(void *arg)
+{
+	data_thread_mem_copy *data = (data_thread_mem_copy *)arg;
+
+	mem_copy_busy(data->fd, data->hwe, data->vm, data->ahnd, data->region,
+		      &data->spin, &data->lock_init_spin);
+	pthread_exit(NULL);
+}
+
+static bool has_copy_function(struct drm_xe_engine_class_instance *hwe)
+{
+	return hwe->engine_class == DRM_XE_ENGINE_CLASS_COPY;
+}
+
+/**
+ * TEST: Render while stressing copy functions
+ * Category: Core
+ * Mega feature: Render
+ * Sub-category: 3d
+ * Functionality: copy
+ * Test category: stress test
+ *
+ * SUBTEST: render-stress-%s-copies
+ * Description: Render while running %arg[1] parallel copies per supported engine.
+ *		Even under stress from concurrent memory accesses, the render buffer
+ *		and the copies must all be correct.
+ *
+ * arg[1]:
+ * @0: 0 parallel copies
+ * @1: 1 parallel copies
+ * @2: 2 parallel copies
+ * @4: 4 parallel copies
+ */
+#define MAX_COPY_THREADS 64
+static void render_stress_copy(int fd, struct igt_collection *set,
+			       uint32_t nparallel_copies_per_engine)
+{
+	struct igt_collection *regions;
+	struct drm_xe_engine_class_instance *hwe;
+	uint32_t vm;
+	uint64_t ahnd;
+	data_thread_mem_copy data_mem_copy[MAX_COPY_THREADS];
+	pthread_t thread_mem_copy[MAX_COPY_THREADS];
+	int thread_copy_count = 0;
+	struct buf_ops *bops;
+	int render_timeout = 3;
+	int render_count = 0;
+	uint64_t render_duration_total = 0, render_duration_min = -1, render_duration_max = 0;
+
+	vm = xe_vm_create(fd, 0, 0);
+	ahnd = intel_allocator_open_full(fd, vm, 0, 0,
+					 INTEL_ALLOCATOR_SIMPLE,
+					 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+
+	for_each_variation_r(regions, 1, set) {
+		xe_for_each_engine(fd, hwe) {
+			if (!has_copy_function(hwe))
+				continue;
+			for (int i = 0; i < nparallel_copies_per_engine; i++) {
+				data_thread_mem_copy *data = &data_mem_copy[thread_copy_count];
+
+				data->fd = fd;
+				data->hwe = hwe;
+				data->vm = vm;
+				data->ahnd = ahnd;
+				data->region = igt_collection_get_value(regions, 0);
+				/*
+				 * lock_init_spin is held by the newly created thread until the
+				 * spinner is initialized and ready to be waited on with
+				 * xe_spin_wait_started().
+				 */
+				igt_assert_eq(pthread_mutex_init(&data->lock_init_spin, NULL), 0);
+				igt_assert_eq(pthread_mutex_lock(&data->lock_init_spin), 0);
+				igt_assert_eq(pthread_create(
+						   &thread_mem_copy[thread_copy_count],
+						   NULL,
+						   run_thread_mem_copy,
+						   data),
+					      0);
+				thread_copy_count++;
+			}
+		}
+	}
+
+	/* Wait for all mem copy spinners to be initialized and started */
+	for (int i = 0; i < thread_copy_count; i++) {
+		igt_assert_eq(pthread_mutex_lock(&data_mem_copy[i].lock_init_spin), 0);
+		xe_spin_wait_started(data_mem_copy[i].spin);
+		igt_assert_eq(pthread_mutex_unlock(&data_mem_copy[i].lock_init_spin), 0);
+	}
+
+	bops = buf_ops_create(fd);
+	igt_until_timeout(render_timeout) {
+		uint64_t duration;
+
+		render(bops, T_LINEAR, WIDTH, HEIGHT, COPY_FULL, &duration);
+		render_count++;
+		render_duration_total += duration;
+		if (duration < render_duration_min)
+			render_duration_min = duration;
+		if (duration > render_duration_max)
+			render_duration_max = duration;
+	}
+	igt_info("%d render() loops in %d seconds\n", render_count, render_timeout);
+	igt_info("Render duration: avg = %ld ns, min = %ld ns, max = %ld ns\n",
+		 render_duration_total / render_count,
+		 render_duration_min, render_duration_max);
+
+	/* End all mem copy threads */
+	for (int i = 0; i < thread_copy_count; i++)
+		xe_spin_end(data_mem_copy[i].spin);
+	for (int i = 0; i < thread_copy_count; i++)
+		pthread_join(thread_mem_copy[i], NULL);
+
+	put_ahnd(ahnd);
+	xe_vm_destroy(fd, vm);
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -477,11 +682,23 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 	struct buf_ops *bops;
 	const char *tiling_name;
 	int tiling;
+	struct igt_collection *set;
+	const struct section {
+		const char *name;
+		unsigned int nparallel_copies_per_engine;
+	} sections[] = {
+		{ "0", 0 },
+		{ "1", 1 },
+		{ "2", 2 },
+		{ "4", 4 },
+		{ NULL },
+	};
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
 		bops = buf_ops_create(xe);
 		srand(time(NULL));
+		set = xe_get_memory_region_set(xe, DRM_XE_MEM_REGION_CLASS_SYSMEM);
 	}
 
 	for (int id = 0; id <= COPY_FULL_COMPRESSED; id++) {
@@ -501,6 +718,10 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	for (const struct section *s = sections; s->name; s++)
+		igt_subtest_f("render-stress-%s-copies", s->name)
+			render_stress_copy(xe, set, s->nparallel_copies_per_engine);
+
 	igt_fixture {
 		buf_ops_destroy(bops);
 		drm_close_driver(xe);
-- 
2.43.0

