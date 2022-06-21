Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jun 2022 11:29:57 +0100
Message-Id: <20220621103001.184373-6-matthew.auld@intel.com>
In-Reply-To: <20220621103001.184373-1-matthew.auld@intel.com>
References: <20220621103001.184373-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 5/9] tests/i915/query: sanity check the
 probed_cpu_visible_size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add some basic sanity checks for this, like checking if this falls
within the probed_size.  On older kernels the value reported here should
be zero.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/i915_query.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index b545fb4a..ea99dc8d 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -514,6 +514,11 @@ static bool query_regions_supported(int fd)
 	return __i915_query_items(fd, &item, 1) == 0 && item.length > 0;
 }
 
+/**
+ * XXX: Remove these once we can safely sync the uapi header with the kernel.
+ * Should be source compatible either way though.
+ */
+#define probed_cpu_visible_size rsvd1[0]
 static void test_query_regions_garbage_items(int fd)
 {
 	struct drm_i915_query_memory_regions *regions;
@@ -552,7 +557,10 @@ static void test_query_regions_garbage_items(int fd)
 
 		igt_assert_eq_u32(info.rsvd0, 0);
 
-		for (j = 0; j < ARRAY_SIZE(info.rsvd1); j++)
+		/*
+		 * rsvd1[0] : probed_cpu_visible_size
+		 */
+		for (j = 1; j < ARRAY_SIZE(info.rsvd1); j++)
 			igt_assert_eq_u32(info.rsvd1[j], 0);
 	}
 
@@ -587,13 +595,18 @@ static void test_query_regions_sanity_check(int fd)
 
 	found_system = false;
 	for (i = 0; i < regions->num_regions; i++) {
-		struct drm_i915_gem_memory_class_instance r1 =
-			regions->regions[i].region;
+		struct drm_i915_memory_region_info info = regions->regions[i];
+		struct drm_i915_gem_memory_class_instance r1 = info.region;
 		int j;
 
 		if (r1.memory_class == I915_MEMORY_CLASS_SYSTEM) {
 			igt_assert_eq(r1.memory_instance, 0);
 			found_system = true;
+
+			igt_assert(info.probed_cpu_visible_size == 0 ||
+				   info.probed_cpu_visible_size == info.probed_size);
+		} else {
+			igt_assert(info.probed_cpu_visible_size <= info.probed_size);
 		}
 
 		igt_assert(r1.memory_class == I915_MEMORY_CLASS_SYSTEM ||
-- 
2.36.1
