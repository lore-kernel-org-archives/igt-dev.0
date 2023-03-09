Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8A410E813
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Mar 2023 13:39:50 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Daniel Vetter <daniel@ffwll.ch>,
 Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Thu,  9 Mar 2023 10:39:22 -0300
Message-Id: <20230309133923.124095-2-mcanal@igalia.com>
In-Reply-To: <20230309133923.124095-1-mcanal@igalia.com>
References: <20230309133923.124095-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_vgem: Use UAPI header
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

Currently, VGEM copies the UAPI header contents to source file. So,
delete the copy from the source file and use the UAPI header directly.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_vgem.c | 36 +++++++++---------------------------
 lib/igt_vgem.h |  4 +---
 2 files changed, 10 insertions(+), 30 deletions(-)

diff --git a/lib/igt_vgem.c b/lib/igt_vgem.c
index 468383c7..93c8398e 100644
--- a/lib/igt_vgem.c
+++ b/lib/igt_vgem.c
@@ -94,41 +94,23 @@ void *vgem_mmap(int fd, struct vgem_bo *bo, unsigned prot)
 	return ptr;
 }
 
-#define LOCAL_VGEM_FENCE_ATTACH   0x1
-#define LOCAL_VGEM_FENCE_SIGNAL   0x2
-
-#define LOCAL_IOCTL_VGEM_FENCE_ATTACH     DRM_IOWR( DRM_COMMAND_BASE + LOCAL_VGEM_FENCE_ATTACH, struct local_vgem_fence_attach)
-#define LOCAL_IOCTL_VGEM_FENCE_SIGNAL     DRM_IOW( DRM_COMMAND_BASE + LOCAL_VGEM_FENCE_SIGNAL, struct local_vgem_fence_signal)
-
-struct local_vgem_fence_attach {
-	uint32_t handle;
-	uint32_t flags;
-	uint32_t out_fence;
-	uint32_t pad;
-};
-
-struct local_vgem_fence_signal {
-	uint32_t fence;
-	uint32_t flags;
-};
-
 bool vgem_has_fences(int fd)
 {
-	struct local_vgem_fence_signal arg;
+	struct drm_vgem_fence_signal arg;
 	int err;
 
 	err = 0;
 	memset(&arg, 0, sizeof(arg));
-	if (drmIoctl(fd, LOCAL_IOCTL_VGEM_FENCE_SIGNAL, &arg))
+	if (drmIoctl(fd, DRM_IOCTL_VGEM_FENCE_SIGNAL, &arg))
 		err = -errno;
 	errno = 0;
 	return err == -ENOENT;
 }
 
-static int __vgem_fence_attach(int fd, struct local_vgem_fence_attach *arg)
+static int __vgem_fence_attach(int fd, struct drm_vgem_fence_attach *arg)
 {
 	int err = 0;
-	if (igt_ioctl(fd, LOCAL_IOCTL_VGEM_FENCE_ATTACH, arg))
+	if (igt_ioctl(fd, DRM_IOCTL_VGEM_FENCE_ATTACH, arg))
 		err = -errno;
 	errno = 0;
 	return err;
@@ -136,7 +118,7 @@ static int __vgem_fence_attach(int fd, struct local_vgem_fence_attach *arg)
 
 bool vgem_fence_has_flag(int fd, unsigned flags)
 {
-	struct local_vgem_fence_attach arg;
+	struct drm_vgem_fence_attach arg;
 	struct vgem_bo bo;
 	bool ret = false;
 
@@ -160,7 +142,7 @@ bool vgem_fence_has_flag(int fd, unsigned flags)
 
 uint32_t vgem_fence_attach(int fd, struct vgem_bo *bo, unsigned flags)
 {
-	struct local_vgem_fence_attach arg;
+	struct drm_vgem_fence_attach arg;
 
 	memset(&arg, 0, sizeof(arg));
 	arg.handle = bo->handle;
@@ -169,10 +151,10 @@ uint32_t vgem_fence_attach(int fd, struct vgem_bo *bo, unsigned flags)
 	return arg.out_fence;
 }
 
-static int ioctl_vgem_fence_signal(int fd, struct local_vgem_fence_signal *arg)
+static int ioctl_vgem_fence_signal(int fd, struct drm_vgem_fence_signal *arg)
 {
 	int err = 0;
-	if (igt_ioctl(fd, LOCAL_IOCTL_VGEM_FENCE_SIGNAL, arg))
+	if (igt_ioctl(fd, DRM_IOCTL_VGEM_FENCE_SIGNAL, arg))
 		err = -errno;
 	errno = 0;
 	return err;
@@ -180,7 +162,7 @@ static int ioctl_vgem_fence_signal(int fd, struct local_vgem_fence_signal *arg)
 
 int __vgem_fence_signal(int fd, uint32_t fence)
 {
-	struct local_vgem_fence_signal arg;
+	struct drm_vgem_fence_signal arg;
 
 	memset(&arg, 0, sizeof(arg));
 	arg.fence = fence;
diff --git a/lib/igt_vgem.h b/lib/igt_vgem.h
index 92045f0e..a9220df7 100644
--- a/lib/igt_vgem.h
+++ b/lib/igt_vgem.h
@@ -24,8 +24,7 @@
 #ifndef IGT_VGEM_H
 #define IGT_VGEM_H
 
-#include <stdint.h>
-#include <stdbool.h>
+#include "vgem_drm.h"
 
 struct vgem_bo {
 	uint32_t handle;
@@ -43,7 +42,6 @@ void *vgem_mmap(int fd, struct vgem_bo *bo, unsigned prot);
 bool vgem_has_fences(int fd);
 bool vgem_fence_has_flag(int fd, unsigned flags);
 uint32_t vgem_fence_attach(int fd, struct vgem_bo *bo, unsigned flags);
-#define VGEM_FENCE_WRITE 0x1
 #define WIP_VGEM_FENCE_NOTIMEOUT 0x2
 int __vgem_fence_signal(int fd, uint32_t fence);
 void vgem_fence_signal(int fd, uint32_t fence);
-- 
2.39.2
