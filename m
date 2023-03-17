Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C6D10E3E2
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Mar 2023 16:54:28 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Mar 2023 22:20:44 +0530
Message-Id: <20230317165044.2616573-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH] lib/kms: Get pipe enum from debugfs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The pipe may not be the same as crtc index if pipes are fused off.
For testing purposes, IGT needs to know the pipe. There's already
a I915_GET_PIPE_FROM_CRTC_ID IOCTL for this. However, the upcoming
Xe driver won't have that IOCTL.

Add IGT support to read the pipe from debugfs. For i915, still
fallback to ioctl method to support older kernels.

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 53 ++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 562d60bff..d7b46cd44 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2558,7 +2558,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	drmModeRes *resources;
 	drmModePlaneRes *plane_resources;
 	int i;
-	bool is_i915_dev;
+	bool is_i915_dev, is_intel_dev;
 
 	memset(display, 0, sizeof(igt_display_t));
 
@@ -2566,6 +2566,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 
 	display->drm_fd = drm_fd;
 	is_i915_dev = is_i915_device(drm_fd);
+	is_intel_dev = is_intel_device(drm_fd);
 
 	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
 
@@ -2607,17 +2608,47 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	for (i = 0; i < resources->count_crtcs; i++) {
 		igt_pipe_t *pipe;
 
-		if (is_i915_dev) {
-			struct drm_i915_get_pipe_from_crtc_id get_pipe;
+		/*
+		 * No GET_PIPE_FROM_CRTC_ID ioctl support for XE. Instead read
+		 * from the debugfs "i915_pipe".
+		 *
+		 * This debugfs is applicable for both i915 & XE. For i915, still
+		 * we can fallback to ioctl method to support older kernels.
+		 */
+		if (is_intel_dev) {
+			char buf[2];
+			int debugfs_fd, res;
 
-			get_pipe.pipe = 0;
-			get_pipe.crtc_id =  resources->crtcs[i];
-			do_ioctl(display->drm_fd,
-					DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID, &get_pipe);
-			pipe = &display->pipes[get_pipe.pipe];
-			pipe->pipe = get_pipe.pipe;
-		}
-		else {
+			debugfs_fd = igt_debugfs_pipe_dir(drm_fd, i, O_RDONLY);
+			igt_assert(debugfs_fd >= 0);
+
+			res = igt_debugfs_simple_read(debugfs_fd, "i915_pipe", buf, sizeof(buf));
+			close(debugfs_fd);
+
+			if (res <= 0) {
+				/* Fallback to older ioctl method. */
+				if (is_i915_dev) {
+					struct drm_i915_get_pipe_from_crtc_id get_pipe;
+
+					get_pipe.pipe = 0;
+					get_pipe.crtc_id =  resources->crtcs[i];
+
+					do_ioctl(drm_fd,
+						 DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID,
+						 &get_pipe);
+
+					pipe = &display->pipes[get_pipe.pipe];
+					pipe->pipe = get_pipe.pipe;
+				} else
+					igt_assert_f(false, "XE: Failed to read the debugfs i915_pipe.\n");
+			} else {
+				int p;
+
+				igt_assert_eq(sscanf(buf, "%d", &p), 1);
+				pipe = &display->pipes[p];
+				pipe->pipe = p;
+			}
+		} else {
 			pipe = &display->pipes[i];
 			pipe->pipe = i;
 		}
-- 
2.40.0
