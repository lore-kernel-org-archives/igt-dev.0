Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD3710E1B3
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 05:09:07 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, ramadevi.gandi@intel.com,
 zbigniew.kempczynski@intel.com, janga.rahul.kumar@intel.com,
 kamil.konieczny@intel.com, igt-dev@lists.freedesktop.org
Date: Fri, 26 May 2023 10:38:55 +0530
Message-Id: <20230526050855.4115107-4-priyanka.dandamudi@intel.com>
In-Reply-To: <20230526050855.4115107-1-priyanka.dandamudi@intel.com>
References: <20230526050855.4115107-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2: Add default alignment for the object size
 and remove positive case.(Zbigniew)

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/xe/xe_mmap.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index a5da6fa9..be1f9791 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -94,6 +94,22 @@ static void test_bad_extensions(int fd)
 	gem_close(fd, mmo.handle);
 }
 
+/**
+ * SUBTEST: bad-object
+ * Description: Test mmap offset with bad object.
+ *
+ */
+static void test_bad_object(int fd)
+{
+	uint64_t size = xe_get_default_alignment(fd);
+	struct drm_xe_gem_mmap_offset mmo = {
+		.handle = xe_bo_create(fd, 0, 0, size),
+	};
+
+	mmo.handle = 0xdeadbeef;
+	do_ioctl_err(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo, ENOENT);
+}
+
 igt_main
 {
 	int fd;
@@ -118,6 +134,9 @@ igt_main
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
