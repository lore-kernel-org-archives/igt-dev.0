Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE62B10E390
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 16:41:03 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Oct 2023 18:37:29 +0200
Message-Id: <20231004163729.464980-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20231004163729.464980-1-zbigniew.kempczynski@intel.com>
References: <20231004163729.464980-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/xe_evict: Add flat-ccs eviction
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Exercise is flat-ccs eviction working fine in the kernel driver
when buffers takes more than available vram. Differentiate with
standalone/parallel execution, same or separate drm fd and buffer
freeing time. Tests are divided to two groups - first which won't
exceed vram memory size (thus don't trigger eviction, but it is
good for the reference logic is properly compress/decompress
buffers) and second which exceeds.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel/xe_evict.c | 335 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 334 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 5b64e56b45..e67c0a9d29 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -12,6 +12,10 @@
  */
 
 #include "igt.h"
+#include "igt_kmod.h"
+#include "igt_list.h"
+#include "intel_blt.h"
+#include "intel_mocs.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
@@ -453,6 +457,8 @@ threads(int fd, struct drm_xe_engine_class_instance *eci,
 		pthread_join(threads_data[i].thread, NULL);
 }
 
+#define SZ_1K   0x00000400
+#define SZ_1M   0x00100000
 #define SZ_256M 0x10000000
 #define SZ_1G   0x40000000
 
@@ -464,6 +470,243 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
 		return (ALIGN(vram_size, SZ_256M)  * mul) / div; /* small-bar */
 }
 
+struct object {
+	uint64_t size;
+	uint32_t start_value;
+	struct blt_copy_object *blt_obj;
+	struct igt_list_head link;
+};
+
+#define TEST_PARALLEL	(1 << 0)
+#define TEST_INSTANTFREE	(1 << 2)
+#define TEST_REOPEN	(1 << 3)
+
+#define MAX_NPROC 8
+struct params {
+	uint32_t flags;
+	int nproc;
+	int vram_percent;
+	int free_mb, total_mb;
+	int test_mb, mb_per_proc;
+};
+
+static void copy_obj(struct blt_copy_data *blt,
+		     struct blt_copy_object *src_obj,
+		     struct blt_copy_object *dst_obj,
+		     uint64_t ahnd, uint32_t vm)
+{
+	struct blt_block_copy_data_ext ext = {};
+	int fd = blt->fd;
+	uint64_t bb_size = xe_get_default_alignment(fd);
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+	intel_ctx_t *ctx;
+	uint32_t bb, exec_queue;
+	uint32_t w, h;
+
+	w = src_obj->x2;
+	h = src_obj->y2;
+	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
+	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
+
+	bb = xe_bo_create_flags(fd, 0, bb_size,
+				vram_memory(fd, 0) | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	blt->color_depth = CD_32bit;
+	blt->print_bb = false;
+	blt_set_copy_object(&blt->src, src_obj);
+	blt_set_copy_object(&blt->dst, dst_obj);
+	blt_set_object_ext(&ext.src, 0, w, h, SURFACE_TYPE_2D);
+	blt_set_object_ext(&ext.dst, 0, w, h, SURFACE_TYPE_2D);
+	blt_set_batch(&blt->bb, bb, bb_size, vram_if_possible(fd, 0));
+	blt_block_copy(fd, ctx, NULL, ahnd, blt, &ext);
+	intel_ctx_xe_sync(ctx, true);
+
+	gem_close(fd, bb);
+	put_offset(ahnd, bb);
+	put_offset(ahnd, blt->src.handle);
+	put_offset(ahnd, blt->dst.handle);
+	intel_allocator_bind(ahnd, 0, 0);
+}
+
+static uint32_t rand_and_update(uint32_t *left, uint32_t min, uint32_t max)
+{
+	int left_bit, min_bit, max_bit, rand_id, rand_kb;
+
+	left_bit = igt_fls(*left) - 1;
+	min_bit = igt_fls(min) - 1;
+	max_bit = max_t(int, min_t(int, igt_fls(max) - 1, left_bit), igt_fls(max));
+	rand_id = rand() % (max_bit - min_bit);
+	rand_kb = 1 << (rand_id + min_bit);
+
+	if (*left >= rand_kb)
+		*left -= rand_kb;
+	else
+		*left = 0;
+
+	return rand_kb;
+}
+
+static struct object *create_obj(struct blt_copy_data *blt,
+				 struct blt_copy_object *src_obj,
+				 uint64_t ahnd, uint32_t vm,
+				 uint64_t size, int start_value)
+{
+	int fd = blt->fd;
+	struct object *obj;
+	uint32_t w, h;
+	uint8_t uc_mocs = intel_get_uc_mocs(fd);
+	int i;
+
+	obj = calloc(1, sizeof(*obj));
+	igt_assert(obj);
+	obj->size = size;
+	obj->start_value = start_value;
+
+	w = 1024;
+	h = size / w / 4; /* /4 - 32bpp */
+
+	obj->blt_obj = blt_create_object(blt,
+					 vram_memory(fd, 0) | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+					 w, h, 32, uc_mocs,
+					 T_LINEAR, COMPRESSION_ENABLED,
+					 COMPRESSION_TYPE_3D, true);
+
+	for (i = 0; i < size / sizeof(uint32_t); i++)
+		src_obj->ptr[i] = start_value++;
+
+	copy_obj(blt, src_obj, obj->blt_obj, ahnd, vm);
+
+	return obj;
+}
+
+static void check_obj(const struct blt_copy_object *obj, uint64_t size,
+		      int start_value, int num_obj)
+{
+	int i, idx;
+
+	igt_assert_eq(obj->ptr[0], start_value);
+	igt_assert_eq(obj->ptr[size/4 - 1], start_value + size/4 - 1);
+
+	/* Couple of checks of random indices */
+	for (i = 0; i < 16; i++) {
+		idx = rand() % (size/4);
+		igt_assert_f(obj->ptr[idx] == start_value + idx,
+			     "Object number %d doesn't contain valid data",
+			     num_obj);
+	}
+}
+
+static void evict_single(int fd, int child, const struct params *params)
+{
+	struct blt_copy_data blt = {};
+	struct blt_copy_object *orig_obj;
+	uint32_t kb_left = params->mb_per_proc * SZ_1K;
+	uint32_t min_alloc_kb = 64;
+	uint32_t max_alloc_kb = 4096;
+	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	uint64_t ahnd = intel_allocator_open(fd, vm, INTEL_ALLOCATOR_RELOC);
+	uint8_t uc_mocs = intel_get_uc_mocs(fd);
+	struct object *obj, *tmp;
+	struct igt_list_head list;
+	uint32_t w, h;
+	int num_obj = 0;
+
+	srandom(time(NULL));
+	IGT_INIT_LIST_HEAD(&list);
+	igt_debug("[%2d] child : to allocate: %uMiB\n", child, kb_left/SZ_1K);
+
+	blt_copy_init(fd, &blt);
+	w = SZ_1K;
+	h = max_alloc_kb / 4;
+	orig_obj = blt_create_object(&blt, system_memory(fd),
+				     w, h,  32, uc_mocs,
+				     T_LINEAR, COMPRESSION_DISABLED,
+				     0, true);
+
+	while (kb_left) {
+		uint64_t obj_size = rand_and_update(&kb_left, min_alloc_kb, max_alloc_kb) * SZ_1K;
+		int start_value = rand();
+
+		h = obj_size / w / 4;
+		blt_set_geom(orig_obj, w * 4, 0, 0, w, h, 0, 0);
+		obj = create_obj(&blt, orig_obj, ahnd, vm, obj_size, start_value);
+		igt_list_add(&obj->link, &list);
+	}
+
+	igt_list_for_each_entry_safe(obj, tmp, &list, link) {
+		h = obj->size / w / 4;
+		blt_set_geom(orig_obj, w * 4, 0, 0, w, h, 0, 0);
+		copy_obj(&blt, obj->blt_obj, orig_obj, ahnd, vm);
+		check_obj(orig_obj, obj->blt_obj->size, obj->start_value, num_obj++);
+		if (params->flags & TEST_INSTANTFREE) {
+			igt_list_del(&obj->link);
+			blt_destroy_object_and_alloc_free(fd, ahnd, obj->blt_obj);
+			free(obj);
+		}
+	}
+
+	if (!(params->flags & TEST_INSTANTFREE))
+		igt_list_for_each_entry_safe(obj, tmp, &list, link) {
+			igt_list_del(&obj->link);
+			blt_destroy_object_and_alloc_free(fd, ahnd, obj->blt_obj);
+			free(obj);
+		}
+	blt_destroy_object_and_alloc_free(fd, ahnd, orig_obj);
+}
+
+static void set_params(int fd, uint32_t flags, int vram_percent,
+		       struct params *params)
+{
+	int nproc = 1;
+
+	params->flags = flags;
+	params->vram_percent = vram_percent;
+	params->free_mb = xe_vram_available(fd, 0) / SZ_1M;
+	params->total_mb = xe_visible_vram_size(fd, 0) / SZ_1M;
+	params->test_mb = min_t(int, params->free_mb * vram_percent / 100,
+				params->total_mb * vram_percent / 100);
+
+	igt_debug("VRAM memory size: %dMB/%dMB (use %dMB), overcommit perc: %d\n",
+		  params->free_mb, params->total_mb,
+		  params->test_mb, params->vram_percent);
+
+	if (flags & TEST_PARALLEL)
+		nproc = min_t(int, sysconf(_SC_NPROCESSORS_ONLN), MAX_NPROC);
+	params->nproc = nproc;
+	params->mb_per_proc = params->test_mb / nproc;
+
+	igt_debug("nproc: %d, mem per proc: %dMB\n", nproc, params->mb_per_proc);
+}
+
+static void evict_ccs(int fd, uint32_t flags, int vram_percent)
+{
+	struct params params;
+
+	igt_debug("Test mode <parallel: %d, instant free: %d, reopen: %d>\n",
+		  !!(flags & TEST_PARALLEL),
+		  !!(flags & TEST_INSTANTFREE),
+		  !!(flags & TEST_REOPEN));
+
+	set_params(fd, flags, vram_percent, &params);
+
+	if (flags & TEST_PARALLEL) {
+		igt_fork(n, params.nproc) {
+			if (flags & TEST_REOPEN) {
+				fd = drm_reopen_driver(fd);
+				intel_allocator_init();
+			}
+			evict_single(fd, n, &params);
+		}
+		igt_waitchildren();
+	} else {
+		if (flags & TEST_REOPEN)
+			fd = drm_reopen_driver(fd);
+		evict_single(fd, 0, &params);
+	}
+}
+
 /**
  * SUBTEST: evict-%s
  * Description:  %arg[1] evict test.
@@ -620,7 +863,60 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  * @beng-threads-large:		bind exec_queue threads large
  *
  */
-
+/**
+ *
+ * SBTEST: evict-ccs-%s
+ * Dscription: FlatCCS eviction test.
+ * Fature: flatccs
+ * Tst ctegory: stress test
+ *
+ * asg[1]:
+ * no-overcommit:		evict flat ccs without migration in single
+ *				process
+ * no-overcommit-parallel:	evict flat ccs in multiple children processes
+ *				without migration
+ * no-overcommit-instantfree:	evict flat ccs without migration in single
+ *				process destroying objects immediately after use
+ * no-overcommit-parallel-instantfree:	evict flat ccs in multiple children
+ *				processes without migration destroying objects
+ *				immediately after use
+ * overcommit:			evict flat ccs with migration in single process
+ * overcommit-parallel:	evict flat ccs in multiple children processes
+ *				with migration
+ * overcommit-instantfree:	evict flat ccs with migration in single process
+ *				destroying objects immediately after use
+ * @overcommit-parallel-instantfree: evict flat ccs in multiple children
+ *				processes with migration destroying objects
+ *				immediately after use
+ *
+ *
+ * SUBTEST: evict-ccs-%s-%s-%s-%s
+ * Description: FlatCCS eviction test.
+ * Feature: flatccs
+ * Test category: stress test
+ *
+ * arg[1]:
+ *
+ * @no-overcommit:		use less memory and fit in vram
+ * @overcommit:			use more memory and exceed vram
+ *
+ * arg[2]:
+ *
+ * @standalone:			single process
+ * @parallel:			multiple processes
+ *
+ * arg[3]:
+ *
+ * @nofree:			keep objects till the end of the test
+ * @instantfree:			free object after it was verified and it won't
+ *				be used anymore
+ *
+ * arg[4]:
+ *
+ * @samefd:			operate on same opened drm fd
+ * @reopen:			use separately opened drm fds
+ *
+ */
 /*
  * Table driven test that attempts to cover all possible scenarios of eviction
  * (small / large objects, compute mode vs non-compute VMs, external BO or BOs
@@ -752,6 +1048,29 @@ igt_main
 			MIXED_THREADS | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
 		{ NULL },
 	};
+
+	const struct ccs {
+		const char *name;
+		uint32_t flags;
+	} ccs[] = {
+		{ "standalone-nofree-samefd",
+			0 },
+		{ "standalone-nofree-reopen",
+			TEST_REOPEN },
+		{ "standalone-instantfree-samefd",
+			TEST_INSTANTFREE },
+		{ "standalone-instantfree-reopen",
+			TEST_INSTANTFREE | TEST_REOPEN },
+		{ "parallel-nofree-samefd",
+			TEST_PARALLEL },
+		{ "parallel-nofree-reopen",
+			TEST_PARALLEL | TEST_REOPEN },
+		{ "parallel-instantfree-samefd",
+			TEST_PARALLEL | TEST_INSTANTFREE },
+		{ "parallel-instantfree-reopen",
+			TEST_PARALLEL | TEST_INSTANTFREE | TEST_REOPEN },
+		{ },
+	};
 	uint64_t vram_size;
 	int fd;
 
@@ -789,5 +1108,19 @@ igt_main
 	}
 
 	igt_fixture
+		intel_allocator_multiprocess_start();
+
+#define NO_OVERCOMMIT_VRAM_PERCENT 20
+#define OVERCOMMIT_VRAM_PERCENT 110
+	for (const struct ccs *s = ccs; s->name; s++) {
+		igt_subtest_f("evict-ccs-no-overcommit-%s", s->name)
+			evict_ccs(fd, s->flags, NO_OVERCOMMIT_VRAM_PERCENT);
+		igt_subtest_f("evict-ccs-overcommit-%s", s->name)
+			evict_ccs(fd, s->flags, OVERCOMMIT_VRAM_PERCENT);
+	}
+
+	igt_fixture {
+		intel_allocator_multiprocess_stop();
 		drm_close_driver(fd);
+	}
 }
-- 
2.34.1
