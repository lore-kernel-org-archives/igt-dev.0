Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F68810ED03
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Oct 2022 09:01:32 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 17 Oct 2022 10:01:10 +0100
Message-Id: <20221017090111.18429-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [CI 1/2] tests/i915/query: sanity check reported GTT
 alignment
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Ensure the kernel is reporting "normal" values here, based on our
current expectations.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/i915_query.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 4e43c7cd..bff073d2 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -638,6 +638,8 @@ static void upload(int fd, struct igt_list_head *handles, uint32_t num_handles)
 	free(exec);
 }
 
+/** XXX: remove once we sync the uapi header */
+#define gtt_alignment rsvd0
 static void test_query_regions_sanity_check(int fd)
 {
 	struct drm_i915_query_memory_regions *regions;
@@ -664,6 +666,11 @@ static void test_query_regions_sanity_check(int fd)
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
@@ -674,6 +681,9 @@ static void test_query_regions_sanity_check(int fd)
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
