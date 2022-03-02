Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EE010F164
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 08:07:00 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Mar 2022 09:06:28 +0100
Message-Id: <20220302080629.11562-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220302080629.11562-1-zbigniew.kempczynski@intel.com>
References: <20220302080629.11562-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/prime_mmap: Iterate over dma-buf
 supported memory regions
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

To avoid code duplication (prime_mmap_coherency uses similar code)
use helper function which returns dma-buf set of supported regions.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/prime_mmap.c | 34 ++++++----------------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
index e0cb9a25b..d53185ff1 100644
--- a/tests/prime_mmap.c
+++ b/tests/prime_mmap.c
@@ -483,31 +483,6 @@ test_aperture_limit(uint32_t region, int size)
 	gem_close(fd, handle2);
 }
 
-static int
-check_for_dma_buf_mmap(struct igt_collection *set)
-{
-	struct igt_collection *region;
-	uint32_t reg;
-	int dma_buf_fd;
-	char *ptr;
-	uint32_t handle;
-	int ret = 1;
-
-	for_each_combination(region, 1, set) {
-		reg = igt_collection_get_value(region, 0);
-		handle = gem_create_in_memory_regions(fd, BO_SIZE, reg);
-
-		dma_buf_fd = prime_handle_to_fd(fd, handle);
-		ptr = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
-		if (ptr != MAP_FAILED)
-			ret = 0;
-		munmap(ptr, BO_SIZE);
-		gem_close(fd, handle);
-		close(dma_buf_fd);
-	}
-	return ret;
-}
-
 #define SKIP_LMEM (1 << 0)
 #define SKIP_USERPTR (1 << 1)
 
@@ -527,7 +502,7 @@ static bool check_skip(uint32_t skip, uint32_t region)
 
 igt_main
 {
-	struct igt_collection *set, *regions;
+	struct igt_collection *set, *regions, *dma_buf_set;
 	struct drm_i915_query_memory_regions *query_info;
 	struct {
 		const char *name;
@@ -560,13 +535,15 @@ igt_main
 
 		set = get_memory_region_set(query_info, I915_SYSTEM_MEMORY,
 					    I915_DEVICE_MEMORY);
-		igt_assert(check_for_dma_buf_mmap(set) == 0);
+
+		dma_buf_set = get_dma_buf_mmap_supported_set(fd, set);
+		igt_require_f(dma_buf_set, "No dma-buf region supported\n");
 		errno = 0;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++)
 		igt_subtest_with_dynamic(tests[i].name) {
-			for_each_combination(regions, 1, set) {
+			for_each_combination(regions, 1, dma_buf_set) {
 				region = igt_collection_get_value(regions, 0);
 				size = gem_get_batch_size(fd, MEMORY_TYPE_FROM_REGION(region));
 				size = max(size, BO_SIZE);
@@ -582,6 +559,7 @@ igt_main
 	igt_fixture {
 		free(query_info);
 		igt_collection_destroy(set);
+		igt_collection_destroy(dma_buf_set);
 		close(fd);
 	}
 }
-- 
2.32.0
