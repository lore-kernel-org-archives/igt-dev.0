Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E92910E27A
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 17:55:46 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>, Maxime Ripard <maxime@cerno.tech>
Date: Tue,  3 Jan 2023 14:52:43 -0300
Message-Id: <20230103175244.958771-2-mcanal@igalia.com>
In-Reply-To: <20230103175244.958771-1-mcanal@igalia.com>
References: <20230103175244.958771-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/3] lib/igt_vc4: Rework
 igt_vc4_get_param()
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

Instead of returning the error code of the DRM_IOCTL_VC4_GET_PARAM ioctl,
make igt_vc4_get_param() return the value of the parameter, considering
that the current return is not being used and the value of the parameter
is being used.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_vc4.c                | 19 ++++++++++++-------
 lib/igt_vc4.h                |  2 +-
 tests/vc4/vc4_purgeable_bo.c |  5 +----
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/lib/igt_vc4.c b/lib/igt_vc4.c
index 6b6ad16c..a9084f01 100644
--- a/lib/igt_vc4.c
+++ b/lib/igt_vc4.c
@@ -168,19 +168,24 @@ uint64_t igt_vc4_get_tiling(int fd, uint32_t handle)
 	return get.modifier;
 }
 
-int igt_vc4_get_param(int fd, uint32_t param, uint64_t *val)
+/**
+ * igt_vc4_get_param:
+ * @fd: device file descriptor
+ * @param: vc4 parameter
+ *
+ * This wraps the GET_PARAM ioctl.
+ *
+ * Returns the current value of the parameter.
+ */
+uint64_t igt_vc4_get_param(int fd, uint32_t param)
 {
 	struct drm_vc4_get_param arg = {
 		.param = param,
 	};
-	int ret;
 
-	ret = igt_ioctl(fd, DRM_IOCTL_VC4_GET_PARAM, &arg);
-	if (ret)
-		return ret;
+	do_ioctl(fd, DRM_IOCTL_VC4_GET_PARAM, &arg);
 
-	*val = arg.value;
-	return 0;
+	return arg.value;
 }
 
 bool igt_vc4_purgeable_bo(int fd, int handle, bool purgeable)
diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
index 384d7d6e..4c08f175 100644
--- a/lib/igt_vc4.h
+++ b/lib/igt_vc4.h
@@ -31,7 +31,7 @@
 uint32_t igt_vc4_get_cleared_bo(int fd, size_t size, uint32_t clearval);
 int igt_vc4_create_bo(int fd, size_t size);
 void *igt_vc4_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned prot);
-int igt_vc4_get_param(int fd, uint32_t param, uint64_t *val);
+uint64_t igt_vc4_get_param(int fd, uint32_t param);
 bool igt_vc4_purgeable_bo(int fd, int handle, bool purgeable);
 bool igt_vc4_is_tiled(uint64_t modifier);
 bool igt_vc4_is_v3d(int fd);
diff --git a/tests/vc4/vc4_purgeable_bo.c b/tests/vc4/vc4_purgeable_bo.c
index 676bc1f3..27771012 100644
--- a/tests/vc4/vc4_purgeable_bo.c
+++ b/tests/vc4/vc4_purgeable_bo.c
@@ -102,11 +102,8 @@ igt_main
 	int fd, ret;
 
 	igt_fixture {
-		uint64_t val = 0;
-
 		fd = drm_open_driver(DRIVER_VC4);
-		igt_vc4_get_param(fd, DRM_VC4_PARAM_SUPPORTS_MADVISE, &val);
-		igt_require(val);
+		igt_require(igt_vc4_get_param(fd, DRM_VC4_PARAM_SUPPORTS_MADVISE));
 		IGT_INIT_LIST_HEAD(&list);
 	}
 
-- 
2.38.1
