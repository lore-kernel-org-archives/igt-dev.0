Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B17110E924
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Mar 2022 13:36:07 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Mar 2022 19:05:50 +0530
Message-Id: <20220310133551.5096-2-anshuman.gupta@intel.com>
In-Reply-To: <20220310133551.5096-1-anshuman.gupta@intel.com>
References: <20220310133551.5096-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/2] i915/gem_eio: Exercise object
 creation while wedged
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com, Chris Wilson <chris@chris-wilson.co.uk>,
 CQ Tang <cq.tang@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Make sure that we can continue to create buffers, primarily to service as
framebuffers for scanout, even while the device is wedged.

v2:
- Deleted gem_memory_topology.[ch] and moved it's content
  to intel_memory_region.[ch]. [Ashutosh]
- Fixed checkpatch.pl warning.
v3:
- Added igt_describe() for new added tests. [Kamil]

Cc: CQ Tang <cq.tang@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/intel_memory_region.c | 51 ++++++++++++++++++++++++++++++++++
 lib/i915/intel_memory_region.h | 14 ++++++++++
 tests/i915/gem_eio.c           | 42 ++++++++++++++++++++++++++++
 3 files changed, 107 insertions(+)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index a2db74566..593f4bedc 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -914,3 +914,54 @@ out:
 
 	return entry->minalign.alignment;
 }
+
+static const char *
+region_repr(const struct drm_i915_gem_memory_class_instance *ci)
+{
+	switch (ci->memory_class) {
+	case I915_MEMORY_CLASS_SYSTEM:
+		return "smem";
+	case I915_MEMORY_CLASS_DEVICE:
+		return "lmem";
+	default:
+		return "unknown";
+	}
+}
+
+struct gem_memory_region *__gem_get_memory_regions(int i915)
+{
+	struct drm_i915_query_memory_regions *info;
+	struct gem_memory_region *first = NULL;
+
+	info = gem_get_query_memory_regions(i915);
+	for (int i = 0; info && i < info->num_regions; i++) {
+		struct gem_memory_region *r;
+
+		r = malloc(sizeof(*r));
+		igt_assert(r);
+
+		r->ci = info->regions[i].region;
+		r->size = info->regions[i].probed_size;
+		if (r->size == -1ull)
+			r->size = intel_get_avail_ram_mb() << 20;
+
+		asprintf(&r->name, "%s%d",
+			 region_repr(&r->ci), r->ci.memory_instance);
+
+		r->next = first;
+		first = r;
+	}
+	free(info);
+
+	return first;
+}
+
+struct gem_memory_region *__gem_next_memory_region(struct gem_memory_region *r)
+{
+	struct gem_memory_region *next = r->next;
+
+	free(r->name);
+	free(r);
+
+	return next;
+}
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index bd92267b6..f9af9401e 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -111,6 +111,14 @@ __get_memory_region_set(struct drm_i915_query_memory_regions *regions,
 	__get_memory_region_set(regions, arr__, ARRAY_SIZE(arr__)); \
 })
 
+struct gem_memory_region {
+	struct gem_memory_region *next;
+	char *name;
+
+	struct drm_i915_gem_memory_class_instance ci;
+	uint64_t size;
+};
+
 struct igt_collection *
 get_dma_buf_mmap_supported_set(int i915, struct igt_collection *set);
 
@@ -137,4 +145,10 @@ uint64_t gem_detect_safe_start_offset(int i915);
 uint64_t gem_detect_min_alignment_for_regions(int i915, uint32_t region1, uint32_t region2);
 uint64_t gem_detect_safe_alignment(int i915);
 
+struct gem_memory_region *__gem_get_memory_regions(int i915);
+struct gem_memory_region *
+__gem_next_memory_region(struct gem_memory_region *r);
+
+#define for_each_memory_region(r__, fd__) for (struct gem_memory_region *r__ = __gem_get_memory_regions(fd__); r__; r__ = __gem_next_memory_region(r__))
+
 #endif /* INTEL_MEMORY_REGION_H */
diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 3d094433b..db484df7e 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -122,6 +122,39 @@ static void test_throttle(int fd)
 	trigger_reset(fd);
 }
 
+static void test_create(int fd)
+{
+	wedge_gpu(fd);
+
+	gem_close(fd, gem_create(fd, 4096));
+
+	trigger_reset(fd);
+}
+
+static void test_create_ext(int fd)
+{
+	wedge_gpu(fd);
+
+	for_each_memory_region(r, fd) {
+		uint64_t size = 4096;
+		uint32_t handle;
+
+		igt_debug("Creating object in %s\n", r->name);
+		igt_assert_eq(__gem_create_in_memory_region_list(fd,
+								 &handle,
+								 &size,
+								 &r->ci, 1),
+			      0);
+
+		gem_read(fd, handle, size / 2, &size, sizeof(size));
+		igt_assert_eq_u64(size, 0);
+
+		gem_close(fd, handle);
+	}
+
+	trigger_reset(fd);
+}
+
 static void test_context_create(int fd)
 {
 	uint32_t ctx;
@@ -997,6 +1030,15 @@ igt_main
 	igt_subtest("throttle")
 		test_throttle(fd);
 
+	igt_describe("Validate i915_gem_create_ioctl, while gpu is wedged for fb scanout.");
+	igt_subtest("create")
+		test_create(fd);
+
+	igt_describe("Validate i915_gem_create_ext_ioctl and checks if returns clear backing store "
+		     "While gpu is wedged for fb scanout.");
+	igt_subtest("create-ext")
+		test_create_ext(fd);
+
 	igt_subtest("context-create")
 		test_context_create(fd);
 
-- 
2.26.2
