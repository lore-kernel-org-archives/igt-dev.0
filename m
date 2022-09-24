Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEC810E44A
 for <igt-dev@lists.freedesktop.org>; Sat, 24 Sep 2022 16:52:24 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 24 Sep 2022 13:51:42 -0300
Message-Id: <20220924165142.51035-3-mcanal@igalia.com>
In-Reply-To: <20220924165142.51035-1-mcanal@igalia.com>
References: <20220924165142.51035-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/v3d_create_bo: Create test for
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

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/meson.build         |  1 +
 tests/v3d_ci/v3d.testlist |  3 ++
 tests/v3d_create_bo.c     | 88 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 tests/v3d_create_bo.c

diff --git a/tests/meson.build b/tests/meson.build
index eb38c17f..a1c358b9 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -80,6 +80,7 @@ test_progs = [
 	'syncobj_timeline',
 	'template',
 	'tools_test',
+	'v3d_create_bo',
 	'v3d_get_bo_offset',
 	'v3d_get_param',
 	'v3d_mmap',
diff --git a/tests/v3d_ci/v3d.testlist b/tests/v3d_ci/v3d.testlist
index b55e8e57..f4355285 100644
--- a/tests/v3d_ci/v3d.testlist
+++ b/tests/v3d_ci/v3d.testlist
@@ -1,3 +1,6 @@
+igt@v3d_create_bo@create-bo-0
+igt@v3d_create_bo@create-bo-4096
+igt@v3d_create_bo@create-bo-zeroed
 igt@v3d_get_bo_offset@create-get-offsets
 igt@v3d_get_bo_offset@get-bad-handle
 igt@v3d_get_param@base-params
diff --git a/tests/v3d_create_bo.c b/tests/v3d_create_bo.c
new file mode 100644
index 00000000..bb8b91d0
--- /dev/null
+++ b/tests/v3d_create_bo.c
@@ -0,0 +1,88 @@
+/*
+ * Copyright © 2022 Igalia S.L.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ * 	Maíra Canal <mcanal@igalia.com>
+ */
+
+#include "igt.h"
+#include "igt_v3d.h"
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <errno.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_V3D);
+	}
+
+	igt_subtest("create-bo-0") {
+		struct drm_v3d_create_bo create = {
+			.size = 0,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_CREATE_BO, &create, EINVAL);
+	}
+
+	igt_subtest("create-bo-4096") {
+		struct v3d_bo *bo = igt_v3d_create_bo(fd, PAGE_SIZE);
+		igt_v3d_free_bo(fd, bo);
+	}
+
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
-- 
2.37.3
