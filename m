Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E7410E20D
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 14:23:14 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Jun 2023 16:23:08 +0200
Message-Id: <20230626142308.148862-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe_create: Remove create-invalid-size
 subtest
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

Xe team decided to return real (not requested) bo size on create
ioctl return path. Subtest which tested returning -EINVAL on
not-aligned size is not valid anymore. Lets remove it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/xe/xe_create.c | 50 --------------------------------------------
 1 file changed, 50 deletions(-)

diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
index b427c51fd5..5c3708b587 100644
--- a/tests/xe/xe_create.c
+++ b/tests/xe/xe_create.c
@@ -42,52 +42,6 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t flags,
 	return ret;
 }
 
-/**
- * SUBTEST: create-invalid-size
- * Description: Verifies xe bo create returns expected error code on invalid
- *              buffer sizes.
- */
-static void create_invalid_size(int fd)
-{
-	struct drm_xe_query_mem_region *memregion;
-	uint64_t memreg = all_memory_regions(fd), region;
-	uint32_t vm;
-	uint32_t handle;
-	int ret;
-
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
-
-	xe_for_each_mem_region(fd, memreg, region) {
-		memregion = xe_mem_region(fd, region);
-
-		/* first try, use half of possible min page size */
-		ret = __create_bo(fd, vm, memregion->min_page_size >> 1,
-				  region, &handle);
-		if (!ret) {
-			gem_close(fd, handle);
-			xe_vm_destroy(fd, vm);
-		}
-		igt_assert_eq(ret, -EINVAL);
-
-		/*
-		 * second try, add page size to min page size if it is
-		 * bigger than page size.
-		 */
-		if (memregion->min_page_size > PAGE_SIZE) {
-			ret = __create_bo(fd, vm,
-					  memregion->min_page_size + PAGE_SIZE,
-					  region, &handle);
-			if (!ret) {
-				gem_close(fd, handle);
-				xe_vm_destroy(fd, vm);
-			}
-			igt_assert_eq(ret, -EINVAL);
-		}
-	}
-
-	xe_vm_destroy(fd, vm);
-}
-
 enum engine_destroy {
 	NOLEAK,
 	LEAK
@@ -214,10 +168,6 @@ igt_main
 		xe_device_get(xe);
 	}
 
-	igt_subtest("create-invalid-size") {
-		create_invalid_size(xe);
-	}
-
 	igt_subtest("create-engines-noleak")
 		create_engines(xe, NOLEAK);
 
-- 
2.34.1
