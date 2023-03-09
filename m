Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECB210E814
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Mar 2023 13:39:53 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Daniel Vetter <daniel@ffwll.ch>,
 Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Thu,  9 Mar 2023 10:39:23 -0300
Message-Id: <20230309133923.124095-3-mcanal@igalia.com>
In-Reply-To: <20230309133923.124095-1-mcanal@igalia.com>
References: <20230309133923.124095-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/vgem_basic: Add negative tests
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

Currently, the vgem_basic tests don't cover any negative tests. So, add
tests covering possible error paths of the driver by inputting invalid
arguments and checking if the driver is returning the correct values.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/vgem_basic.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index 2a2900f8..4f371b3d 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -152,6 +152,27 @@ static void test_dmabuf_export(int fd)
 	close(other);
 }
 
+static void test_busy_fence(int fd)
+{
+	struct drm_vgem_fence_attach arg = {};
+	struct vgem_bo bo;
+
+	bo.width = 1024;
+	bo.height = 1;
+	bo.bpp = 32;
+	vgem_create(fd, &bo);
+
+	/* Attach a fence for reading */
+	vgem_fence_attach(fd, &bo, 0);
+
+	/* Attach a fence for writing, so it should be an exclusive fence */
+	arg.handle = bo.handle;
+	arg.flags = VGEM_FENCE_WRITE;
+
+	/* As the fence is not exclusive, return -EBUSY, indicating a conflicting fence */
+	do_ioctl_err(fd, DRM_IOCTL_VGEM_FENCE_ATTACH, &arg, EBUSY);
+}
+
 static void test_dmabuf_mmap(int fd)
 {
 	struct vgem_bo bo;
@@ -434,6 +455,48 @@ igt_main
 	igt_subtest_f("mmap")
 		test_mmap(fd);
 
+	igt_describe("Make sure a fence cannot be attached and signaled with invalid flags.");
+	igt_subtest("bad-flag") {
+		struct drm_vgem_fence_attach attach = {
+			.flags = 0xff,
+		};
+
+		struct drm_vgem_fence_signal signal = {
+			.flags = 0xff,
+		};
+
+		do_ioctl_err(fd, DRM_IOCTL_VGEM_FENCE_ATTACH, &attach, EINVAL);
+		do_ioctl_err(fd, DRM_IOCTL_VGEM_FENCE_SIGNAL, &signal, EINVAL);
+	}
+
+	igt_describe("Make sure the pad is zero.");
+	igt_subtest("bad-pad") {
+		struct drm_vgem_fence_attach arg = {
+			.pad = 0x01,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_VGEM_FENCE_ATTACH, &arg, EINVAL);
+	}
+
+	igt_describe("Make sure a fence cannot be attached to a invalid handle.");
+	igt_subtest("bad-handle") {
+		struct drm_vgem_fence_attach arg = {
+			.handle = 0xff,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_VGEM_FENCE_ATTACH, &arg, ENOENT);
+	}
+
+	igt_describe("Make sure a non-existent fence cannot be signaled.");
+	igt_subtest("bad-fence") {
+		struct drm_vgem_fence_signal arg = {
+			.fence = 0xff,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_VGEM_FENCE_SIGNAL, &arg, ENOENT);
+	}
+
+	igt_describe("Make sure a conflicting fence cannot be attached.");
+	igt_subtest("busy-fence")
+		test_busy_fence(fd);
+
 	igt_subtest_group {
 		igt_fixture {
 			igt_require(has_prime_export(fd));
-- 
2.39.2
