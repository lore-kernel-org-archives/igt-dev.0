Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6958010E094
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 21:03:03 +0000 (UTC)
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jun 2023 18:01:32 -0300
Message-ID: <20230613210132.1059029-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915_query: Add igt_debug() calls for
 geometry-subslices
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

Besides providing extra debug information, this also allows one to
simply use the test binary to quickly check values.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 tests/i915/i915_query.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 62f7de428ec8..194f2e91b0ad 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -1249,6 +1249,10 @@ static void test_query_geometry_subslices(int fd)
 		item.flags =  e->class | (e->instance << 16);
 		i915_query_items(fd, &item, 1);
 
+		igt_debug("%s is render engine: %s\n",
+			  e->name,
+			  e->class == I915_ENGINE_CLASS_RENDER ? "yes" : "no");
+
 		/* Non-render engines should return -EINVAL */
 		if (e->class != I915_ENGINE_CLASS_RENDER) {
 			igt_assert_eq(item.length, -EINVAL);
@@ -1262,6 +1266,14 @@ static void test_query_geometry_subslices(int fd)
 		item.data_ptr = to_user_pointer(topo_info);
 		i915_query_items(fd, &item, 1);
 
+		igt_debug("  max_slices=%hu max_subslices=%hu max_eus_per_subslice=%hu\n",
+			  topo_info->max_slices, topo_info->max_subslices,
+			  topo_info->max_eus_per_subslice);
+		igt_debug("  subslice_offset=%hu subslice_stride=%hu\n",
+			  topo_info->subslice_offset, topo_info->subslice_stride);
+		igt_debug("  eu_offset=%hu eu_stride=%hu\n",
+			  topo_info->eu_offset, topo_info->eu_stride);
+
 		igt_assert(topo_info->max_subslices > 0);
 		igt_assert(topo_info->max_eus_per_subslice > 0);
 
-- 
2.41.0
