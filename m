Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Thu,  8 Jul 2021 13:25:53 +0100
Message-Id: <20210708122554.1874987-2-matthew.auld@intel.com>
In-Reply-To: <20210708122554.1874987-1-matthew.auld@intel.com>
References: <20210708122554.1874987-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 2/3] tests/i915_query: extract
 query_garbage_items
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

We should be able to re-use this for other queries.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
---
 tests/i915/i915_query.c | 46 ++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 29b938e9..34965841 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -92,7 +92,8 @@ static void test_query_garbage(int fd)
 	i915_query_items_err(fd, &item, 1, EINVAL);
 }
 
-static void test_query_garbage_items(int fd)
+static void test_query_garbage_items(int fd, int query_id, int min_item_size,
+				     int sizeof_query_item)
 {
 	struct drm_i915_query_item items[2];
 	struct drm_i915_query_item *items_ptr;
@@ -103,7 +104,7 @@ static void test_query_garbage_items(int fd)
 	 * Subject to change in the future.
 	 */
 	memset(items, 0, sizeof(items));
-	items[0].query_id = DRM_I915_QUERY_TOPOLOGY_INFO;
+	items[0].query_id = query_id;
 	items[0].flags = 42;
 	i915_query_items(fd, items, 1);
 	igt_assert_eq(items[0].length, -EINVAL);
@@ -113,10 +114,10 @@ static void test_query_garbage_items(int fd)
 	 * one is properly processed.
 	 */
 	memset(items, 0, sizeof(items));
-	items[0].query_id = DRM_I915_QUERY_TOPOLOGY_INFO;
+	items[0].query_id = query_id;
 	items[1].query_id = ULONG_MAX;
 	i915_query_items(fd, items, 2);
-	igt_assert_lte(MIN_TOPOLOGY_ITEM_SIZE, items[0].length);
+	igt_assert_lte(min_item_size, items[0].length);
 	igt_assert_eq(items[1].length, -EINVAL);
 
 	/*
@@ -126,16 +127,16 @@ static void test_query_garbage_items(int fd)
 	 */
 	memset(items, 0, sizeof(items));
 	items[0].query_id = ULONG_MAX;
-	items[1].query_id = DRM_I915_QUERY_TOPOLOGY_INFO;
+	items[1].query_id = query_id;
 	i915_query_items(fd, items, 2);
 	igt_assert_eq(items[0].length, -EINVAL);
-	igt_assert_lte(MIN_TOPOLOGY_ITEM_SIZE, items[1].length);
+	igt_assert_lte(min_item_size, items[1].length);
 
 	/* Test a couple of invalid data pointer in query item. */
 	memset(items, 0, sizeof(items));
-	items[0].query_id = DRM_I915_QUERY_TOPOLOGY_INFO;
+	items[0].query_id = query_id;
 	i915_query_items(fd, items, 1);
-	igt_assert_lte(MIN_TOPOLOGY_ITEM_SIZE, items[0].length);
+	igt_assert_lte(min_item_size, items[0].length);
 
 	items[0].data_ptr = 0;
 	i915_query_items(fd, items, 1);
@@ -145,14 +146,13 @@ static void test_query_garbage_items(int fd)
 	i915_query_items(fd, items, 1);
 	igt_assert_eq(items[0].length, -EFAULT);
 
-
 	/* Test an invalid query item length. */
 	memset(items, 0, sizeof(items));
-	items[0].query_id = DRM_I915_QUERY_TOPOLOGY_INFO;
-	items[1].query_id = DRM_I915_QUERY_TOPOLOGY_INFO;
-	items[1].length = sizeof(struct drm_i915_query_topology_info) - 1;
+	items[0].query_id = query_id;
+	items[1].query_id = query_id;
+	items[1].length = sizeof_query_item - 1;
 	i915_query_items(fd, items, 2);
-	igt_assert_lte(MIN_TOPOLOGY_ITEM_SIZE, items[0].length);
+	igt_assert_lte(min_item_size, items[0].length);
 	igt_assert_eq(items[1].length, -EINVAL);
 
 	/*
@@ -162,9 +162,9 @@ static void test_query_garbage_items(int fd)
 	 * has been removed from our address space.
 	 */
 	items_ptr = mmap(0, 4096, PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
-	items_ptr[0].query_id = DRM_I915_QUERY_TOPOLOGY_INFO;
+	items_ptr[0].query_id = query_id;
 	i915_query_items(fd, items_ptr, 1);
-	igt_assert_lte(MIN_TOPOLOGY_ITEM_SIZE, items_ptr[0].length);
+	igt_assert_lte(min_item_size, items_ptr[0].length);
 	munmap(items_ptr, 4096);
 	i915_query_items_err(fd, items_ptr, 1, EFAULT);
 
@@ -173,7 +173,7 @@ static void test_query_garbage_items(int fd)
 	 * the kernel errors out with EFAULT.
 	 */
 	items_ptr = mmap(0, 4096, PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
-	items_ptr[0].query_id = DRM_I915_QUERY_TOPOLOGY_INFO;
+	items_ptr[0].query_id = query_id;
 	igt_assert_eq(0, mprotect(items_ptr, 4096, PROT_READ));
 	i915_query_items_err(fd, items_ptr, 1, EFAULT);
 	munmap(items_ptr, 4096);
@@ -186,12 +186,20 @@ static void test_query_garbage_items(int fd)
 	memset(items_ptr, 0, 8192);
 	n_items = 8192 / sizeof(struct drm_i915_query_item);
 	for (i = 0; i < n_items; i++)
-		items_ptr[i].query_id = DRM_I915_QUERY_TOPOLOGY_INFO;
+		items_ptr[i].query_id = query_id;
 	mprotect(((uint8_t *)items_ptr) + 4096, 4096, PROT_READ);
 	i915_query_items_err(fd, items_ptr, n_items, EFAULT);
 	munmap(items_ptr, 8192);
 }
 
+static void test_query_topology_garbage_items(int fd)
+{
+	test_query_garbage_items(fd,
+				 DRM_I915_QUERY_TOPOLOGY_INFO,
+				 MIN_TOPOLOGY_ITEM_SIZE,
+				 sizeof(struct drm_i915_query_topology_info));
+}
+
 /*
  * Allocate more on both sides of where the kernel is going to write and verify
  * that it writes only where it's supposed to.
@@ -738,9 +746,9 @@ igt_main
 	igt_subtest("query-garbage")
 		test_query_garbage(fd);
 
-	igt_subtest("query-garbage-items") {
+	igt_subtest("query-topology-garbage-items") {
 		igt_require(query_topology_supported(fd));
-		test_query_garbage_items(fd);
+		test_query_topology_garbage_items(fd);
 	}
 
 	igt_subtest("query-topology-kernel-writes") {
-- 
2.26.3

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
