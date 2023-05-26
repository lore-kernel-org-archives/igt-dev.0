Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F1710E1AE
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 05:09:03 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, ramadevi.gandi@intel.com,
 zbigniew.kempczynski@intel.com, janga.rahul.kumar@intel.com,
 kamil.konieczny@intel.com, igt-dev@lists.freedesktop.org
Date: Fri, 26 May 2023 10:38:53 +0530
Message-Id: <20230526050855.4115107-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20230526050855.4115107-1-priyanka.dandamudi@intel.com>
References: <20230526050855.4115107-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2: Add default alignment for the object size.(Zbigniew)

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/xe/xe_mmap.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index 6b313a18..3e3f165b 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -57,6 +57,23 @@ test_mmap(int fd, uint32_t flags)
 	gem_close(fd, bo);
 }
 
+/**
+ * SUBTEST: bad-flags
+ * Description: Test mmap offset with bad flags.
+ *
+ */
+static void test_bad_flags(int fd)
+{
+	uint64_t size = xe_get_default_alignment(fd);
+	struct drm_xe_gem_mmap_offset mmo = {
+		.handle = xe_bo_create(fd, 0, 0, size),
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
@@ -75,6 +92,9 @@ igt_main
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
