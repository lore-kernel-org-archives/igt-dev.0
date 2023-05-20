Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E48E10E163
 for <igt-dev@lists.freedesktop.org>; Sat, 20 May 2023 12:11:06 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
Date: Sat, 20 May 2023 17:40:56 +0530
Message-Id: <20230520121056.3926557-4-priyanka.dandamudi@intel.com>
In-Reply-To: <20230520121056.3926557-1-priyanka.dandamudi@intel.com>
References: <20230520121056.3926557-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] xe/xe_mmap: Negative test to object
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add negative test to check bad object.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/xe/xe_mmap.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index f6f6b2af..95672e5d 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -92,6 +92,24 @@ static void test_bad_extensions(int fd)
 	gem_close(fd, mmo.handle);
 }
 
+/**
+ * SUBTEST: bad-object
+ * Description: Test mmap offset with bad object.
+ *
+ */
+static void test_bad_object(int fd)
+{	
+	struct drm_xe_gem_mmap_offset mmo = {
+		.handle = xe_bo_create(fd, 0, 0, 4096),
+        };
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
+	gem_close(fd, mmo.handle);
+	
+	mmo.handle = 0xdeadbeef;
+	do_ioctl_err(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo, ENOENT);
+}
+
 igt_main
 {
 	int fd;
@@ -116,6 +134,9 @@ igt_main
 	igt_subtest("bad-extensions")
 		test_bad_extensions(fd);
 
+	igt_subtest("bad-object")
+		test_bad_object(fd);
+
 	igt_fixture {
 		xe_device_put(fd);
 		close(fd);
-- 
2.25.1
