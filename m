Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D6A10E26D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 09:35:43 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 May 2022 11:35:33 +0200
Message-Id: <20220509093533.30369-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/intel_memory_region: Use separate
 context for probing offset and alignment
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

Probing alignment/offset (A/O) in default context works properly only
when there're no processes which competes on same vm space. To avoid
risk that single probe will be called on already used offset in another
process lets use dedicated context for this purpose.

In other words when forking occur without A/O cache filled (subject of
COW) children will exercise A/O individually. Using same default context
leads to risk of probing offset which is in flight in another child
thus we can get different A/O. Such behavior is not allowed as allocator
infrastructure requires same type, strategy and alignment on single vm.
We expect coherent A/O in different children so use separate context
to fill this requirement.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/5729
---
 lib/i915/intel_memory_region.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 593f4bedc8..ea9717691c 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -630,7 +630,7 @@ uint64_t gem_detect_min_start_offset_for_region(int i915, uint32_t region)
 	struct drm_i915_gem_execbuffer2 eb;
 	uint64_t start_offset = 0;
 	uint64_t bb_size = PAGE_SIZE;
-	uint32_t *batch;
+	uint32_t *batch, ctx;
 	uint16_t devid = intel_get_drm_devid(i915);
 	struct cache_entry *entry, *newentry;
 
@@ -640,12 +640,16 @@ uint64_t gem_detect_min_start_offset_for_region(int i915, uint32_t region)
 		goto out;
 	pthread_mutex_unlock(&cache_mutex);
 
+	/* Use separate context to avoid offset overlapping */
+	ctx = gem_context_create(i915);
+
 	memset(&obj, 0, sizeof(obj));
 	memset(&eb, 0, sizeof(eb));
 
 	eb.buffers_ptr = to_user_pointer(&obj);
 	eb.buffer_count = 1;
 	eb.flags = I915_EXEC_DEFAULT;
+	eb.rsvd1 = ctx;
 	igt_assert(__gem_create_in_memory_regions(i915, &obj.handle, &bb_size, region) == 0);
 	obj.flags = EXEC_OBJECT_PINNED;
 
@@ -670,6 +674,7 @@ uint64_t gem_detect_min_start_offset_for_region(int i915, uint32_t region)
 		igt_assert(start_offset <= 1ull << 48);
 	}
 	gem_close(i915, obj.handle);
+	gem_context_destroy(i915, ctx);
 
 	newentry = malloc(sizeof(*newentry));
 	if (!newentry)
@@ -770,7 +775,7 @@ uint64_t gem_detect_min_alignment_for_regions(int i915,
 	struct drm_i915_gem_execbuffer2 eb;
 	uint64_t min_alignment = PAGE_SIZE;
 	uint64_t bb_size = PAGE_SIZE, obj_size = PAGE_SIZE;
-	uint32_t *batch;
+	uint32_t *batch, ctx;
 	uint16_t devid = intel_get_drm_devid(i915);
 	struct cache_entry *entry, *newentry;
 
@@ -780,6 +785,9 @@ uint64_t gem_detect_min_alignment_for_regions(int i915,
 		goto out;
 	pthread_mutex_unlock(&cache_mutex);
 
+	/* Use separate context to avoid offset overlapping */
+	ctx = gem_context_create(i915);
+
 	memset(obj, 0, sizeof(obj));
 	memset(&eb, 0, sizeof(eb));
 
@@ -787,6 +795,7 @@ uint64_t gem_detect_min_alignment_for_regions(int i915,
 	eb.buffers_ptr = to_user_pointer(obj);
 	eb.buffer_count = ARRAY_SIZE(obj);
 	eb.flags = I915_EXEC_BATCH_FIRST | I915_EXEC_DEFAULT;
+	eb.rsvd1 = ctx;
 	igt_assert(__gem_create_in_memory_regions(i915, &obj[0].handle,
 						  &bb_size, region1) == 0);
 
@@ -815,6 +824,7 @@ uint64_t gem_detect_min_alignment_for_regions(int i915,
 
 	gem_close(i915, obj[0].handle);
 	gem_close(i915, obj[1].handle);
+	gem_context_destroy(i915, ctx);
 
 	newentry = malloc(sizeof(*newentry));
 	if (!newentry)
-- 
2.32.0
