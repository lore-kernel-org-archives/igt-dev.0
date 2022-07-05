Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Jul 2022 11:15:42 +0100
Message-Id: <20220705101542.116141-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915_query: tweak the unallocated
 tracking test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Make sure we always print the seed. Also make sure we use the correct
helpers for the igt_assert when comparing values of type uint64.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
---
 tests/i915/i915_query.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 840b4864..4abd3edc 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -784,9 +784,11 @@ static void fill_unallocated(int fd, struct drm_i915_query_item *item, int idx,
 	struct igt_list_head handles;
 	uint32_t num_handles;
 	uint64_t rem, total;
+	unsigned int seed;
 	int id;
 
-	srand(time(NULL));
+	seed = time(NULL);
+	srand(seed);
 
 	IGT_INIT_LIST_HEAD(&handles);
 
@@ -829,28 +831,28 @@ static void fill_unallocated(int fd, struct drm_i915_query_item *item, int idx,
 
 	upload(fd, &handles, num_handles);
 
+	igt_debug("fill completed with seed=%u, cpu_access=%d, idx=%d, total=%"PRIu64"KiB, num_handles=%u\n",
+		  seed, cpu_access, idx, total >> 10, num_handles);
+
 	old_info = new_info;
 	memset(regions, 0, item->length);
 	i915_query_items(fd, item, 1);
 	new_info = regions->regions[idx];
 
-	igt_assert_lte(new_info.unallocated_size,
-		       new_info.probed_size - total);
-	igt_assert_lt(new_info.unallocated_size, old_info.unallocated_size);
+	igt_assert_lte_u64(new_info.unallocated_size,
+			   new_info.probed_size - total);
+	igt_assert_lt_u64(new_info.unallocated_size, old_info.unallocated_size);
 	if (new_info.probed_cpu_visible_size ==
 	    new_info.probed_size) { /* full BAR */
-		igt_assert_eq(new_info.unallocated_cpu_visible_size,
-			      new_info.unallocated_size);
+		igt_assert_eq_u64(new_info.unallocated_cpu_visible_size,
+				  new_info.unallocated_size);
 	} else if (cpu_access) {
-		igt_assert_lt(new_info.unallocated_cpu_visible_size,
-			      old_info.unallocated_cpu_visible_size);
-		igt_assert_lte(new_info.unallocated_cpu_visible_size,
-			       new_info.probed_cpu_visible_size - total);
+		igt_assert_lt_u64(new_info.unallocated_cpu_visible_size,
+				  old_info.unallocated_cpu_visible_size);
+		igt_assert_lte_u64(new_info.unallocated_cpu_visible_size,
+				   new_info.probed_cpu_visible_size - total);
 	}
 
-	igt_debug("fill completed with idx=%d, total=%"PRIu64"KiB, num_handles=%u\n",
-		  idx, total >> 10, num_handles);
-
 	igt_list_for_each_entry_safe(iter, tmp, &handles, link) {
 		gem_close(fd, iter->handle);
 		free(iter);
@@ -863,11 +865,11 @@ static void fill_unallocated(int fd, struct drm_i915_query_item *item, int idx,
 	i915_query_items(fd, item, 1);
 	new_info = regions->regions[idx];
 
-	igt_assert(new_info.unallocated_size >=
-		   old_info.unallocated_size + total);
+	igt_assert_lt_u64(old_info.unallocated_size + total,
+			  new_info.unallocated_size);
 	if (cpu_access)
-		igt_assert(new_info.unallocated_cpu_visible_size >=
-			   old_info.unallocated_cpu_visible_size + total);
+		igt_assert_lt_u64(old_info.unallocated_cpu_visible_size + total,
+				  new_info.unallocated_cpu_visible_size);
 }
 
 static void test_query_regions_unallocated(int fd)
-- 
2.36.1
