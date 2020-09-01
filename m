Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FFC6E575
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2020 03:56:26 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Tue,  1 Sep 2020 09:26:14 +0530
Message-Id: <20200901035614.24183-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_basic: Added test
 description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, sai.gowtham.ch@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: sai gowtham <sai.gowtham.ch@intel.com>

Added test description for test and to all the available subtests.

Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_basic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
index 9f7412f2..2f76ee26 100644
--- a/tests/i915/gem_basic.c
+++ b/tests/i915/gem_basic.c
@@ -37,14 +37,13 @@
 #include <sys/ioctl.h>
 #include "drm.h"
 
+IGT_TEST_DESCRIPTION("Tests basic gem_create and gem_close IOCTLs");
 static void
 test_bad_close(int fd)
 {
 	struct drm_gem_close close_bo;
 	int ret;
 
-	igt_info("Testing error return on bad close ioctl.\n");
-
 	close_bo.handle = 0x10101010;
 	ret = ioctl(fd, DRM_IOCTL_GEM_CLOSE, &close_bo);
 
@@ -56,8 +55,6 @@ test_create_close(int fd)
 {
 	uint32_t handle;
 
-	igt_info("Testing creating and closing an object.\n");
-
 	handle = gem_create(fd, 16*1024);
 
 	gem_close(fd, handle);
@@ -66,7 +63,6 @@ test_create_close(int fd)
 static void
 test_create_fd_close(int fd)
 {
-	igt_info("Testing closing with an object allocated.\n");
 
 	gem_create(fd, 16*1024);
 	/* leak it */
@@ -81,10 +77,13 @@ igt_main
 	igt_fixture
 		fd = drm_open_driver(DRIVER_INTEL);
 
+	igt_describe("Testing error return on bad close ioctl.\n");
 	igt_subtest("bad-close")
 		test_bad_close(fd);
+	igt_describe("Testing creating and closing an object.\n");
 	igt_subtest("create-close")
 		test_create_close(fd);
+	igt_describe("Testing closing with an object allocated.\n");
 	igt_subtest("create-fd-close")
 		test_create_fd_close(fd);
 }
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
