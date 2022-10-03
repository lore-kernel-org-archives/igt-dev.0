Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  3 Oct 2022 18:24:55 +0100
Message-Id: <20221003172456.97522-3-matthew.auld@intel.com>
In-Reply-To: <20221003172456.97522-1-matthew.auld@intel.com>
References: <20221003172456.97522-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/i915/query: sanity check reported
 GTT alignment
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Ensure the kernel is reporting "normal" values here, based on our
current expectations.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/i915_query.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index b92d7593..bff073d2 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -581,8 +581,6 @@ static void test_query_regions_garbage_items(int fd)
 		struct drm_i915_memory_region_info info = regions->regions[i];
 		int j;
 
-		igt_assert_eq_u32(info.rsvd0, 0);
-
 		/*
 		 * rsvd1[0] : probed_cpu_visible_size
 		 * rsvd1[1] : unallocated_cpu_visible_size
@@ -640,6 +638,8 @@ static void upload(int fd, struct igt_list_head *handles, uint32_t num_handles)
 	free(exec);
 }
 
+/** XXX: remove once we sync the uapi header */
+#define gtt_alignment rsvd0
 static void test_query_regions_sanity_check(int fd)
 {
 	struct drm_i915_query_memory_regions *regions;
@@ -666,6 +666,11 @@ static void test_query_regions_sanity_check(int fd)
 		struct drm_i915_gem_memory_class_instance r1 = info.region;
 		int j;
 
+		if (info.gtt_alignment) {
+			igt_assert_lte_u64(4096, info.gtt_alignment);
+			igt_assert(is_power_of_two(info.gtt_alignment));
+		}
+
 		if (r1.memory_class == I915_MEMORY_CLASS_SYSTEM) {
 			igt_assert_eq(r1.memory_instance, 0);
 			found_system = true;
@@ -676,6 +681,9 @@ static void test_query_regions_sanity_check(int fd)
 			igt_assert(info.unallocated_cpu_visible_size == 0 ||
 				   info.unallocated_cpu_visible_size ==
 				   info.unallocated_size);
+
+			igt_assert(info.gtt_alignment == 0 ||
+				   info.gtt_alignment == 4096);
 		} else {
 			igt_assert(info.probed_cpu_visible_size <= info.probed_size);
 			igt_assert(info.unallocated_size <= info.probed_size);
-- 
2.37.3
