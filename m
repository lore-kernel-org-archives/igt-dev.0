Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5511410E067
 for <igt-dev@lists.freedesktop.org>; Sat, 20 May 2023 12:11:02 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
Date: Sat, 20 May 2023 17:40:54 +0530
Message-Id: <20230520121056.3926557-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20230520121056.3926557-1-priyanka.dandamudi@intel.com>
References: <20230520121056.3926557-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] xe/xe_mmap: Negative test for mmap flags
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

Add negative test by adding invalid mmap flags and check
for related errors.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/xe/xe_mmap.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index 6b313a18..011b8893 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -57,6 +57,22 @@ test_mmap(int fd, uint32_t flags)
 	gem_close(fd, bo);
 }
 
+/**
+ * SUBTEST: bad-flags
+ * Description: Test mmap offset with bad flags.
+ *
+ */
+static void test_bad_flags(int fd)
+{
+	struct drm_xe_gem_mmap_offset mmo = {
+		.handle = xe_bo_create(fd, 0, 0, 4096),
+		.flags = -1u,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo, EINVAL);
+	gem_close(fd, mmo.handle);
+}
+
 igt_main
 {
 	int fd;
@@ -75,6 +91,9 @@ igt_main
 	igt_subtest("vram-system")
 		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd));
 
+	igt_subtest("bad-flags")
+		test_bad_flags(fd);
+
 	igt_fixture {
 		xe_device_put(fd);
 		close(fd);
-- 
2.25.1
