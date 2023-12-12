Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09B410E615
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 15:30:10 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 1/2] tests/intel/xe_create: sanity check all MBZ
 fields
Date: Tue, 12 Dec 2023 15:29:39 +0000
Message-ID: <20231212152940.293533-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Explicitly check that all MBZ (must-be-zero) fields are currently
rejected, including the currently unused extensions.

v2: (Kamil)
  - Various improvements
v3: Rebase on uapi changes

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_create.c | 61 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 1ed48a5d3..09355cc5c 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -26,6 +26,18 @@ static struct param {
 	.vram_percent = 100,
 };
 
+static int __ioctl_create(int fd, struct drm_xe_gem_create *create)
+{
+	int ret = 0;
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, create)) {
+		ret = -errno;
+		errno = 0;
+	}
+
+	return ret;
+}
+
 static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 		       uint32_t *handlep)
 {
@@ -35,14 +47,11 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 		.cpu_caching = __xe_default_cpu_caching(fd, placement, 0),
 		.placement = placement,
 	};
-	int ret = 0;
+	int ret;
 
 	igt_assert(handlep);
 
-	if (igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create)) {
-		ret = -errno;
-		errno = 0;
-	}
+	ret = __ioctl_create(fd, &create);
 	*handlep = create.handle;
 
 	return ret;
@@ -96,6 +105,45 @@ static void create_invalid_size(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: create-invalid-mbz
+ * Functionality: ioctl
+ * Test category: negative test
+ * Description: Verifies xe bo create returns expected error code on all MBZ fields.
+ */
+static void create_invalid_mbz(int fd)
+{
+	struct drm_xe_gem_create create = {
+		.size = PAGE_SIZE,
+		.placement = system_memory(fd),
+		.cpu_caching = DRM_XE_GEM_CPU_CACHING_WB,
+	};
+	int i;
+
+	/* Make sure the baseline passes */
+	igt_assert_eq(__ioctl_create(fd, &create), 0);
+	gem_close(fd, create.handle);
+	create.handle = 0;
+
+	/* No supported extensions yet */
+	create.extensions = -1;
+	igt_assert_eq(__ioctl_create(fd, &create), -EINVAL);
+	create.extensions = 0;
+
+	/* Make sure KMD rejects non-zero padding/reserved fields */
+	for (i = 0; i < ARRAY_SIZE(create.pad); i++) {
+		create.pad[i] = -1;
+		igt_assert_eq(__ioctl_create(fd, &create), -EINVAL);
+		create.pad[i] = 0;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(create.reserved); i++) {
+		create.reserved[i] = -1;
+		igt_assert_eq(__ioctl_create(fd, &create), -EINVAL);
+		create.reserved[i] = 0;
+	}
+}
+
 enum exec_queue_destroy {
 	NOLEAK,
 	LEAK
@@ -272,6 +320,9 @@ igt_main_args("S:p:", NULL, help_str, opt_handler, NULL)
 	igt_fixture
 		xe = drm_open_driver(DRIVER_XE);
 
+	igt_subtest("create-invalid-mbz")
+		create_invalid_mbz(xe);
+
 	igt_subtest("create-invalid-size") {
 		create_invalid_size(xe);
 	}
-- 
2.43.0
