Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268FA10E220
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 18:41:25 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Nov 2022 15:40:37 -0300
Message-Id: <20221129184038.72946-7-mcanal@igalia.com>
In-Reply-To: <20221129184038.72946-1-mcanal@igalia.com>
References: <20221129184038.72946-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 6/7] tests/v3d_create_bo: Create test for
 V3D's Create BO IOCTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add three igt_subtests for the DRM_IOCTL_V3D_CREATE_BO, which tests the
creation of a zeroed BO and a 4096 bytes BO, and tests if the BO is
properly cleaned.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/v3d/meson.build     |  1 +
 tests/v3d/v3d_create_bo.c | 71 +++++++++++++++++++++++++++++++++++++++
 tests/v3d_ci/v3d.testlist |  4 +++
 3 files changed, 76 insertions(+)
 create mode 100644 tests/v3d/v3d_create_bo.c

diff --git a/tests/v3d/meson.build b/tests/v3d/meson.build
index 45f73a88..66d5290e 100644
--- a/tests/v3d/meson.build
+++ b/tests/v3d/meson.build
@@ -1,4 +1,5 @@
 v3d_progs = [
+	'v3d_create_bo',
 	'v3d_get_bo_offset',
 	'v3d_get_param',
 	'v3d_mmap',
diff --git a/tests/v3d/v3d_create_bo.c b/tests/v3d/v3d_create_bo.c
new file mode 100644
index 00000000..4142fb5f
--- /dev/null
+++ b/tests/v3d/v3d_create_bo.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Igalia S.L.
+ */
+
+#include "igt.h"
+#include "igt_v3d.h"
+
+IGT_TEST_DESCRIPTION("Tests for the V3D's Create BO IOCTL");
+
+igt_main
+{
+	int fd;
+
+	igt_fixture
+		fd = drm_open_driver(DRIVER_V3D);
+
+	igt_describe("Make sure a BO cannot be created with flags different than zero.");
+	igt_subtest("create-bo-invalid-flags") {
+		struct drm_v3d_create_bo create = {
+			.flags = 0x0a,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_CREATE_BO, &create, EINVAL);
+	}
+
+	igt_describe("Make sure a BO cannot be created with size zero.");
+	igt_subtest("create-bo-0") {
+		struct drm_v3d_create_bo create = {
+			.size = 0,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_CREATE_BO, &create, EINVAL);
+	}
+
+	igt_describe("Sanity check for creating a BO with size 4096.");
+	igt_subtest("create-bo-4096") {
+		struct v3d_bo *bo = igt_v3d_create_bo(fd, PAGE_SIZE);
+		igt_v3d_free_bo(fd, bo);
+	}
+
+	igt_describe("Make sure that BOs can be allocated in different fd without "
+		     "carrying old contents from one another.");
+	igt_subtest("create-bo-zeroed") {
+		int fd2 = drm_open_driver(DRIVER_V3D);
+		struct v3d_bo *bo;
+		/* A size different from any used in our other tests, to try
+		 * to convince it to land as the only one of its size in the
+		 * kernel BO cache
+		 */
+		size_t size = 3 * PAGE_SIZE, i;
+
+		/* Make a BO and free it on our main fd. */
+		bo = igt_v3d_create_bo(fd, size);
+		bo->map = igt_v3d_mmap_bo(fd, bo->handle, size, PROT_READ | PROT_WRITE);
+		memset(bo->map, 0xd0, size);
+		igt_v3d_free_bo(fd, bo);
+
+		/* Now, allocate a BO on the other fd and make sure it doesn't
+		 * have the old contents.
+		 */
+		bo = igt_v3d_create_bo(fd2, size);
+		bo->map = igt_v3d_mmap_bo(fd2, bo->handle, size, PROT_READ | PROT_WRITE);
+		for (i = 0; i < size / 4; i++)
+			igt_assert_eq_u32(((uint32_t *)bo->map)[i], 0x0);
+		igt_v3d_free_bo(fd2, bo);
+
+		close(fd2);
+	}
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/v3d_ci/v3d.testlist b/tests/v3d_ci/v3d.testlist
index 442fd731..53898aa5 100644
--- a/tests/v3d_ci/v3d.testlist
+++ b/tests/v3d_ci/v3d.testlist
@@ -1,3 +1,7 @@
+igt@v3d/v3d_create_bo@create-bo-invalid-flags
+igt@v3d/v3d_create_bo@create-bo-0
+igt@v3d/v3d_create_bo@create-bo-4096
+igt@v3d/v3d_create_bo@create-bo-zeroed
 igt@v3d/v3d_get_bo_offset@create-get-offsets
 igt@v3d/v3d_get_bo_offset@get-bad-handle
 igt@v3d/v3d_get_param@base-params
-- 
2.38.1
