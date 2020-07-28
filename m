Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE8B6E17A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2020 05:05:04 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Tue, 28 Jul 2020 10:33:35 +0530
Message-Id: <20200728050335.32757-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_readwrite: Added test description
 for test case
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
To: arjun.melkaveri@intel.com, sai.gowtham.ch@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: sai gowtham <sai.gowtham.ch@intel.com>

Added test description for test and to all the available subtests.

Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_readwrite.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_readwrite.c b/tests/i915/gem_readwrite.c
index 6b2977c1..7fce6abe 100644
--- a/tests/i915/gem_readwrite.c
+++ b/tests/i915/gem_readwrite.c
@@ -37,6 +37,9 @@
 #include <sys/ioctl.h>
 #include "drm.h"
 
+IGT_TEST_DESCRIPTION("Tests PREAD and PWRITE IOCTL. They contain normal usage scenarios,"
+		" and few negative usecases to test these ioctls.");
+
 #define OBJECT_SIZE 16384
 
 static int
@@ -87,20 +90,21 @@ igt_main
 		handle = gem_create(fd, OBJECT_SIZE);
 	}
 
+	igt_describe("Testing contents of newly created object.\n");
 	igt_subtest("new-obj") {
-		igt_info("Testing contents of newly created object.\n");
 		ret = do_read(fd, handle, buf, 0, OBJECT_SIZE);
 		igt_assert(ret == 0);
 		memset(&expected, 0, sizeof(expected));
 		igt_assert(memcmp(expected, buf, sizeof(expected)) == 0);
 	}
 
+	igt_describe("Testing read beyond end of buffer.\n");
 	igt_subtest("beyond-EOB") {
-		igt_info("Testing read beyond end of buffer.\n");
 		ret = do_read(fd, handle, buf, OBJECT_SIZE / 2, OBJECT_SIZE);
 		igt_assert(ret == -1 && errno == EINVAL);
 	}
 
+	igt_describe("Testing read & write operations of a buffer");
 	igt_subtest("read-write") {
 		igt_info("Testing full write of buffer\n");
 		memset(buf, 0, sizeof(buf));
@@ -127,14 +131,14 @@ igt_main
 		igt_assert(memcmp(buf, expected + 512, 1024) == 0);
 	}
 
+	igt_describe("Testing read of bad buffer handle\n");
 	igt_subtest("read-bad-handle") {
-		igt_info("Testing read of bad buffer handle\n");
 		ret = do_read(fd, 1234, buf, 0, 1024);
 		igt_assert(ret == -1 && errno == ENOENT);
 	}
 
+	igt_describe("Testing write of bad buffer handle\n");
 	igt_subtest("write-bad-handle") {
-		igt_info("Testing write of bad buffer handle\n");
 		ret = do_write(fd, 1234, buf, 0, 1024);
 		igt_assert(ret == -1 && errno == ENOENT);
 	}
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
