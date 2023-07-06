Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5844110E412
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 06:07:02 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Jul 2023 08:05:55 +0200
Message-Id: <20230706060555.282757-17-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230706060555.282757-1-zbigniew.kempczynski@intel.com>
References: <20230706060555.282757-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 16/16] tests/api-intel-allocator: Adopt
 to exercise allocator to Xe
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

Xe vm binding requires some cooperation from allocator side (tracking
alloc()/free()) operations. This diverges the path internally inside
the allocator so it is necessary to check if allocator supports
properly both drivers.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/api_intel_allocator.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index 238e76c9fd..e70de0e1d0 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -9,6 +9,9 @@
 #include "igt.h"
 #include "igt_aux.h"
 #include "intel_allocator.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
 /**
  * TEST: api intel allocator
  * Category: Infrastructure
@@ -454,6 +457,7 @@ static void __simple_allocs(int fd)
 	uint32_t handles[SIMPLE_GROUP_ALLOCS];
 	uint64_t ahnd;
 	uint32_t ctx;
+	bool is_xe = is_xe_device(fd);
 	int i;
 
 	ctx = rand() % 2;
@@ -463,7 +467,12 @@ static void __simple_allocs(int fd)
 		uint32_t size;
 
 		size = (rand() % 4 + 1) * 0x1000;
-		handles[i] = gem_create(fd, size);
+		if (is_xe)
+			handles[i] = xe_bo_create_flags(fd, 0, size,
+							system_memory(fd));
+		else
+			handles[i] = gem_create(fd, size);
+
 		intel_allocator_alloc(ahnd, handles[i], size, 0x1000);
 	}
 
@@ -573,8 +582,6 @@ static void reopen(int fd)
 {
 	int fd2;
 
-	igt_require_gem(fd);
-
 	fd2 = drm_reopen_driver(fd);
 
 	__reopen_allocs(fd, fd2, true);
@@ -587,8 +594,6 @@ static void reopen_fork(int fd)
 {
 	int fd2;
 
-	igt_require_gem(fd);
-
 	intel_allocator_multiprocess_start();
 
 	fd2 = drm_reopen_driver(fd);
@@ -838,7 +843,7 @@ igt_main
 	struct allocators *a;
 
 	igt_fixture {
-		fd = drm_open_driver(DRIVER_INTEL);
+		fd = drm_open_driver(DRIVER_INTEL | DRIVER_XE);
 		atomic_init(&next_handle, 1);
 		srandom(0xdeadbeef);
 	}
@@ -911,12 +916,16 @@ igt_main
 	igt_subtest_f("open-vm")
 		open_vm(fd);
 
-	igt_subtest_f("execbuf-with-allocator")
+	igt_subtest_f("execbuf-with-allocator") {
+		igt_require(is_i915_device(fd));
 		execbuf_with_allocator(fd);
+	}
 
 	igt_describe("Verifies creating and executing bb from gem pool");
-	igt_subtest_f("gem-pool")
+	igt_subtest_f("gem-pool") {
+		igt_require(is_i915_device(fd));
 		gem_pool(fd);
+	}
 
 	igt_fixture
 		drm_close_driver(fd);
-- 
2.34.1
