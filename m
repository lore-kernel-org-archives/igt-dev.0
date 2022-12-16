Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B5810E5FB
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Dec 2022 16:30:10 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 16 Dec 2022 13:28:53 -0300
Message-Id: <20221216162854.294042-4-mcanal@igalia.com>
In-Reply-To: <20221216162854.294042-1-mcanal@igalia.com>
References: <20221216162854.294042-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/5] lib/igt_vc4: Add PAGE_SIZE macro to
 VC4
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Some VC4 tests use the page memory size, so create a macro to define the
page size as 4096 and replace this value for the macro in the VC4 tests.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_vc4.h               |  2 ++
 tests/vc4/vc4_create_bo.c   |  4 ++--
 tests/vc4/vc4_label_bo.c    |  6 +++---
 tests/vc4/vc4_lookup_fail.c |  4 ++--
 tests/vc4/vc4_tiling.c      | 12 ++++++------
 tests/vc4/vc4_wait_bo.c     |  4 ++--
 6 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
index a088d0a3..ddce90da 100644
--- a/lib/igt_vc4.h
+++ b/lib/igt_vc4.h
@@ -26,6 +26,8 @@
 
 #include "vc4_drm.h"
 
+#define PAGE_SIZE 4096
+
 uint32_t igt_vc4_get_cleared_bo(int fd, size_t size, uint32_t clearval);
 int igt_vc4_create_bo(int fd, size_t size);
 void *igt_vc4_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned prot);
diff --git a/tests/vc4/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
index 46d1c954..c4909b49 100644
--- a/tests/vc4/vc4_create_bo.c
+++ b/tests/vc4/vc4_create_bo.c
@@ -33,7 +33,7 @@ igt_main
 	}
 
 	igt_subtest("create-bo-4096") {
-		int handle = igt_vc4_create_bo(fd, 4096);
+		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
 		gem_close(fd, handle);
 	}
 
@@ -52,7 +52,7 @@ igt_main
 		 * to convince it to land as the only one of its size in the
 		 * kernel BO cache
 		 */
-		size_t size = 3 * 4096, i;
+		size_t size = 3 * PAGE_SIZE, i;
 
 		/* Make a BO and free it on our main fd. */
 		handle = igt_vc4_create_bo(fd, size);
diff --git a/tests/vc4/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
index 6fc53ce8..dd8b5f9a 100644
--- a/tests/vc4/vc4_label_bo.c
+++ b/tests/vc4/vc4_label_bo.c
@@ -47,7 +47,7 @@ igt_main
 		fd = drm_open_driver(DRIVER_VC4);
 
 	igt_subtest("set-label") {
-		int handle = igt_vc4_create_bo(fd, 4096);
+		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
 		set_label(fd, handle, "a test label", 0);
 		set_label(fd, handle, "a new test label", 0);
 		gem_close(fd, handle);
@@ -58,7 +58,7 @@ igt_main
 	}
 
 	igt_subtest("set-bad-name") {
-		int handle = igt_vc4_create_bo(fd, 4096);
+		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
 
 		struct drm_vc4_label_bo label = {
 			.handle = handle,
@@ -72,7 +72,7 @@ igt_main
 	}
 
 	igt_subtest("set-kernel-name") {
-		int handle = igt_vc4_create_bo(fd, 4096);
+		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
 		set_label(fd, handle, "BCL", 0);
 		set_label(fd, handle, "a test label", 0);
 		set_label(fd, handle, "BCL", 0);
diff --git a/tests/vc4/vc4_lookup_fail.c b/tests/vc4/vc4_lookup_fail.c
index e5a03540..5e709a7d 100644
--- a/tests/vc4/vc4_lookup_fail.c
+++ b/tests/vc4/vc4_lookup_fail.c
@@ -22,7 +22,7 @@
  */
 
 #include "igt.h"
-#include "vc4_drm.h"
+#include "igt_vc4.h"
 #include "vc4_packet.h"
 
 igt_main
@@ -33,7 +33,7 @@ igt_main
 		fd = drm_open_driver(DRIVER_VC4);
 
 	igt_subtest("bad-color-write") {
-		uint32_t size = 4096;
+		uint32_t size = PAGE_SIZE;
 		/* A single row will be a page. */
 		uint32_t width = 1024;
 		uint32_t height = size / (width * 4);
diff --git a/tests/vc4/vc4_tiling.c b/tests/vc4/vc4_tiling.c
index 0d37c8b1..372b1fed 100644
--- a/tests/vc4/vc4_tiling.c
+++ b/tests/vc4/vc4_tiling.c
@@ -47,7 +47,7 @@ igt_main
 	}
 
 	igt_subtest("get-bad-flags") {
-		int bo = igt_vc4_create_bo(fd, 4096);
+		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
 		struct drm_vc4_get_tiling get = {
 			.handle = bo,
 			.flags = 0xd0d0d0d0,
@@ -57,7 +57,7 @@ igt_main
 	}
 
 	igt_subtest("set-bad-flags") {
-		int bo = igt_vc4_create_bo(fd, 4096);
+		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
 		struct drm_vc4_set_tiling set = {
 			.handle = bo,
 			.flags = 0xd0d0d0d0,
@@ -68,7 +68,7 @@ igt_main
 	}
 
 	igt_subtest("get-bad-modifier") {
-		int bo = igt_vc4_create_bo(fd, 4096);
+		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
 		struct drm_vc4_get_tiling get = {
 			.handle = bo,
 			.modifier = 0xd0d0d0d0,
@@ -78,7 +78,7 @@ igt_main
 	}
 
 	igt_subtest("set-bad-modifier") {
-		int bo = igt_vc4_create_bo(fd, 4096);
+		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
 		struct drm_vc4_set_tiling set = {
 			.handle = bo,
 			.modifier = 0xd0d0d0d0,
@@ -88,7 +88,7 @@ igt_main
 	}
 
 	igt_subtest("set-get") {
-		int bo = igt_vc4_create_bo(fd, 4096);
+		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
 
 		/* Default is untiled. */
 		igt_assert(igt_vc4_get_tiling(fd, bo) == DRM_FORMAT_MOD_LINEAR);
@@ -109,7 +109,7 @@ igt_main
 		/* Some size that probably nobody else is using, to
 		 * encourage getting the same BO back from the cache.
 		 */
-		int size = 91 * 4096;
+		int size = 91 * PAGE_SIZE;
 		int bo;
 
 		bo = igt_vc4_create_bo(fd, size);
diff --git a/tests/vc4/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
index 8c7437f8..386642b9 100644
--- a/tests/vc4/vc4_wait_bo.c
+++ b/tests/vc4/vc4_wait_bo.c
@@ -28,7 +28,7 @@
 static void
 test_used_bo(int fd, uint64_t timeout)
 {
-	size_t size = 4096;
+	size_t size = PAGE_SIZE;
 	uint32_t clearval = 0xaabbccdd + timeout;
 	int handle = igt_vc4_get_cleared_bo(fd, size, clearval);
 	struct drm_vc4_wait_bo wait = {
@@ -64,7 +64,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_VC4);
-		bo_handle = igt_vc4_create_bo(fd, 4096);
+		bo_handle = igt_vc4_create_bo(fd, PAGE_SIZE);
 	}
 
 	igt_subtest("bad-bo") {
-- 
2.38.1
