Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B87710E25D
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Dec 2022 21:46:38 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>, Maxime Ripard <maxime@cerno.tech>
Date: Fri, 23 Dec 2022 18:44:37 -0300
Message-Id: <20221223214433.31547-3-mcanal@igalia.com>
In-Reply-To: <20221223214433.31547-1-mcanal@igalia.com>
References: <20221223214433.31547-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/vc4_mmap: Create test for VC4's
 Mmap BO IOCTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add two igt_subtests for DRM_IOCTL_VC4_MMAP_BO, which tests the possible
invalid parameters for the IOCTL and also the read/write coherency of a
newly mapped bo. Moreover, also adds a check to assure that the mmap's
offset is a multiple of the page size as returned by sysconf(_SC_PAGE_SIZE).

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_vc4.c             |  2 ++
 tests/vc4/meson.build     |  1 +
 tests/vc4/vc4_mmap.c      | 55 +++++++++++++++++++++++++++++++++++++++
 tests/vc4_ci/vc4.testlist |  2 ++
 4 files changed, 60 insertions(+)
 create mode 100644 tests/vc4/vc4_mmap.c

diff --git a/lib/igt_vc4.c b/lib/igt_vc4.c
index 91f7f4b5..6b6ad16c 100644
--- a/lib/igt_vc4.c
+++ b/lib/igt_vc4.c
@@ -138,6 +138,8 @@ igt_vc4_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned prot)
 
 	do_ioctl(fd, DRM_IOCTL_VC4_MMAP_BO, &mmap_bo);
 
+	igt_assert_eq(mmap_bo.offset % sysconf(_SC_PAGE_SIZE), 0);
+
 	ptr = mmap(0, size, prot, MAP_SHARED, fd, mmap_bo.offset);
 	if (ptr == MAP_FAILED)
 		return NULL;
diff --git a/tests/vc4/meson.build b/tests/vc4/meson.build
index 76e6f16c..518f6043 100644
--- a/tests/vc4/meson.build
+++ b/tests/vc4/meson.build
@@ -3,6 +3,7 @@ vc4_progs = [
 	'vc4_dmabuf_poll',
 	'vc4_label_bo',
 	'vc4_lookup_fail',
+	'vc4_mmap',
 	'vc4_perfmon',
 	'vc4_purgeable_bo',
 	'vc4_tiling',
diff --git a/tests/vc4/vc4_mmap.c b/tests/vc4/vc4_mmap.c
new file mode 100644
index 00000000..8666edf2
--- /dev/null
+++ b/tests/vc4/vc4_mmap.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Igalia S.L.
+ */
+
+#include "igt.h"
+#include "igt_vc4.h"
+
+IGT_TEST_DESCRIPTION("Tests for the VC4's mmap IOCTL");
+
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_VC4);
+		igt_require(igt_vc4_is_v3d(fd));
+	}
+
+	igt_describe("Make sure an invalid BO cannot be mapped.");
+	igt_subtest("mmap-bad-handle") {
+		struct drm_vc4_mmap_bo get = {
+			.handle = 0xd0d0d0d0,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_VC4_MMAP_BO, &get, EINVAL);
+	}
+
+	igt_describe("Test basics of newly mapped bo like default content, write and read "
+		     "coherency, mapping existence after gem_close and unmapping.");
+	igt_subtest("mmap-bo") {
+		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
+		uint32_t *map = igt_vc4_mmap_bo(fd, handle, PAGE_SIZE, PROT_READ | PROT_WRITE);
+		uint8_t expected[PAGE_SIZE];
+
+
+		/* Testing contents of newly created objects. */
+		memset(expected, 0, sizeof(expected));
+		igt_assert_eq(memcmp(map, expected, sizeof(expected)), 0);
+
+		/* Testing coherency of writes and mmap reads. */
+		memset(map, 0xd0, PAGE_SIZE);
+		memset(expected, 0xd0, PAGE_SIZE);
+		igt_assert_eq(memcmp(expected, map, sizeof(expected)), 0);
+
+		/* Testing that mapping stays after close */
+		gem_close(fd, handle);
+		igt_assert_eq(memcmp(expected, map, sizeof(expected)), 0);
+
+		/* Testing unmapping */
+		munmap(map, PAGE_SIZE);
+	}
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/vc4_ci/vc4.testlist b/tests/vc4_ci/vc4.testlist
index 1b41538e..889d0035 100644
--- a/tests/vc4_ci/vc4.testlist
+++ b/tests/vc4_ci/vc4.testlist
@@ -8,6 +8,8 @@ igt@vc4/vc4_label_bo@set-bad-handle
 igt@vc4/vc4_label_bo@set-bad-name
 igt@vc4/vc4_label_bo@set-kernel-name
 igt@vc4/vc4_lookup_fail@bad-color-write
+igt@vc4/vc4_mmap@mmap-bad-handle
+igt@vc4/vc4_mmap@mmap-bo
 igt@vc4/vc4_perfmon@create-perfmon-0
 igt@vc4/vc4_perfmon@create-perfmon-exceed
 igt@vc4/vc4_perfmon@create-perfmon-invalid-events
-- 
2.38.1
