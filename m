Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6F510E22D
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Dec 2022 20:00:24 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>, Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Dec 2022 17:00:00 -0300
Message-Id: <20221229200001.182755-2-mcanal@igalia.com>
In-Reply-To: <20221229200001.182755-1-mcanal@igalia.com>
References: <20221229200001.182755-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 1/2] tests/v3d_mmap: Improve tests from V3D's
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

The current tests for the V3D's Mmap IOCTL don't cover all the
possible invalid parameters on drm_v3d_mmap_bo. Therefore, add a
subtest to make sure that flags on drm_v3d_mmap_bo is zero and also
add a subtest to test the read/write coherency of a newly mapped bo.
Moreover, also adds a check to assure that the mmap's offset is a
multiple of the page size as returned by sysconf(_SC_PAGE_SIZE).

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_v3d.c             |  2 ++
 tests/v3d/v3d_mmap.c      | 33 +++++++++++++++++++++++++++++++++
 tests/v3d_ci/v3d.testlist |  2 ++
 3 files changed, 37 insertions(+)

diff --git a/lib/igt_v3d.c b/lib/igt_v3d.c
index 5aa583da..68d11d7f 100644
--- a/lib/igt_v3d.c
+++ b/lib/igt_v3d.c
@@ -108,6 +108,8 @@ igt_v3d_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned prot)
 
 	do_ioctl(fd, DRM_IOCTL_V3D_MMAP_BO, &mmap_bo);
 
+	igt_assert_eq(mmap_bo.offset % sysconf(_SC_PAGE_SIZE), 0);
+
 	ptr = mmap(0, size, prot, MAP_SHARED, fd, mmap_bo.offset);
 	if (ptr == MAP_FAILED)
 		return NULL;
diff --git a/tests/v3d/v3d_mmap.c b/tests/v3d/v3d_mmap.c
index 5e2385bd..567940a8 100644
--- a/tests/v3d/v3d_mmap.c
+++ b/tests/v3d/v3d_mmap.c
@@ -33,6 +33,14 @@ igt_main
 	igt_fixture
 		fd = drm_open_driver(DRIVER_V3D);
 
+	igt_describe("Make sure that flags is equal to zero.");
+	igt_subtest("mmap-bad-flags") {
+		struct drm_v3d_mmap_bo get = {
+			.flags = 1,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_MMAP_BO, &get, EINVAL);
+	}
+
 	igt_describe("Make sure an invalid BO cannot be mapped.");
 	igt_subtest("mmap-bad-handle") {
 		struct drm_v3d_mmap_bo get = {
@@ -41,6 +49,31 @@ igt_main
 		do_ioctl_err(fd, DRM_IOCTL_V3D_MMAP_BO, &get, ENOENT);
 	}
 
+	igt_describe("Test basics of newly mapped bo like default content, write and read "
+		     "coherency, mapping existence after gem_close and unmapping.");
+	igt_subtest("mmap-bo") {
+		struct v3d_bo *bo = igt_v3d_create_bo(fd, PAGE_SIZE);
+		uint8_t expected[PAGE_SIZE];
+
+		igt_v3d_bo_mmap(fd, bo);
+
+		/* Testing contents of newly created objects. */
+		memset(expected, 0, sizeof(expected));
+		igt_assert_eq(memcmp(bo->map, expected, sizeof(expected)), 0);
+
+		memset(bo->map, 0xd0, PAGE_SIZE);
+		memset(expected, 0xd0, PAGE_SIZE);
+		igt_assert_eq(memcmp(expected, bo->map, sizeof(expected)), 0);
+
+		/* Testing that mapping stays after close */
+		gem_close(fd, bo->handle);
+		igt_assert_eq(memcmp(expected, bo->map, sizeof(expected)), 0);
+
+		/* Testing unmapping */
+		munmap(bo->map, PAGE_SIZE);
+		free(bo);
+	}
+
 	igt_fixture
 		close(fd);
 }
diff --git a/tests/v3d_ci/v3d.testlist b/tests/v3d_ci/v3d.testlist
index 64359fb7..ce8c4f6c 100644
--- a/tests/v3d_ci/v3d.testlist
+++ b/tests/v3d_ci/v3d.testlist
@@ -7,7 +7,9 @@ igt@v3d/v3d_get_bo_offset@get-bad-handle
 igt@v3d/v3d_get_param@base-params
 igt@v3d/v3d_get_param@get-bad-param
 igt@v3d/v3d_get_param@get-bad-flags
+igt@v3d/v3d_mmap@mmap-bad-flags
 igt@v3d/v3d_mmap@mmap-bad-handle
+igt@v3d/v3d_mmap@mmap-bo
 igt@v3d/v3d_perfmon@create-perfmon-0
 igt@v3d/v3d_perfmon@create-perfmon-exceed
 igt@v3d/v3d_perfmon@create-perfmon-invalid-counters
-- 
2.38.1
