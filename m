Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82B689C97
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2020 07:29:24 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Wed, 30 Sep 2020 12:59:14 +0530
Message-Id: <20200930072914.22664-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/vgem_basic: Added test description
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description to all the available subtests.

Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/vgem_basic.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index 526636dd..5f62216d 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -406,6 +406,7 @@ igt_main
 {
 	int fd = -1;
 
+	igt_describe("Basic test for handling of module unload.");
 	igt_subtest("unload")
 		test_unload();
 
@@ -413,15 +414,19 @@ igt_main
 		fd = drm_open_driver(DRIVER_VGEM);
 	}
 
+	igt_describe("Tests the working of DRM_IOCTL_SET_VERSION ioctl.");
 	igt_subtest_f("setversion")
 		test_setversion(fd);
 
+	igt_describe("Tests whether it can open multiple clients.");
 	igt_subtest_f("second-client")
 		test_client(fd);
 
+	igt_describe(" Tests the basic working of vgem_create ioctl.");
 	igt_subtest_f("create")
 		test_create(fd);
 
+	igt_describe("Test creates vgem handle and checks if it can mmap the handle.");
 	igt_subtest_f("mmap")
 		test_mmap(fd);
 
@@ -429,10 +434,12 @@ igt_main
 		igt_fixture {
 			igt_require(has_prime_export(fd));
 		}
-
+		igt_describe("Tests whether it could export/import the vgem handle using prime.");
 		igt_subtest("dmabuf-export")
 			test_dmabuf_export(fd);
-
+		igt_describe("Tests whether it could export the vgem handle along with"
+			     " RDWR capabilities using prime and checks if it can mmap"
+			     " the exported handle.");
 		igt_subtest("dmabuf-mmap")
 			test_dmabuf_mmap(fd);
 
@@ -440,16 +447,21 @@ igt_main
 			igt_fixture {
 				igt_require(vgem_has_fences(fd));
 			}
-
+			igt_describe("Test the dma-buf fence interop."
+				      "It attaches a fence for exported vgem handle.");
 			igt_subtest("dmabuf-fence")
 				test_dmabuf_fence(fd);
+			igt_describe("Test attaches a fence before exporting a vgem handle "
+				      "and checks the working of fence.");
 			igt_subtest("dmabuf-fence-before")
 				test_dmabuf_fence_before(fd);
 		}
 	}
 
+	igt_describe("Tests the basic access to sysfs and tries to read entries in the directory.");
 	igt_subtest("sysfs")
 		test_sysfs_read(fd);
+	igt_describe("Tests the basic access to debugfs and tries to read entries in the directory.");
 	igt_subtest("debugfs")
 		test_debugfs_read(fd);
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
