Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E966E091
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Sep 2021 17:56:15 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Tue,  7 Sep 2021 11:01:30 -0700
Message-Id: <20210907180130.43156-4-jose.souza@intel.com>
In-Reply-To: <20210907180130.43156-1-jose.souza@intel.com>
References: <20210907180130.43156-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/4] tests/kms_psr: Add drmModeDirtyFB()
 calls to handle frontbuffer rendering tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Without this i915 don't know that frontbuffer was modified.
And this will be a problem when frontbuffer rendering is dropped from
i915 in modern platforms.
Also for cursor planes we need to fall back to commit as it do not
support frontbuffer rendering.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 tests/kms_psr.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/kms_psr.c b/tests/kms_psr.c
index 8f2fbb8a3..270d31504 100644
--- a/tests/kms_psr.c
+++ b/tests/kms_psr.c
@@ -259,6 +259,27 @@ static bool drrs_disabled(data_t *data)
 	return !strstr(buf, "DRRS Enabled : Yes\n");
 }
 
+static void fb_dirty_fb_ioctl(data_t *data, struct igt_fb *fb)
+{
+	int ret;
+	drmModeClip clip = {
+		.x1 = 0,
+		.x2 = fb->width,
+		.y1 = 0,
+		.y2 = fb->height
+	};
+
+	/* Cursor planes don't support frontbuffer rendering */
+	if (data->test_plane->type == DRM_PLANE_TYPE_CURSOR) {
+		igt_plane_set_fb(data->test_plane, &data->fb_white);
+		igt_display_commit(&data->display);
+		return;
+	}
+
+	ret = drmModeDirtyFB(data->drm_fd, fb->fb_id, &clip, 1);
+	igt_assert(ret == 0 || ret == -ENOSYS);
+}
+
 static void run_test(data_t *data)
 {
 	uint32_t handle = data->fb_white.gem_handle;
@@ -299,6 +320,7 @@ static void run_test(data_t *data)
 			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 		memset(ptr, 0xcc, data->mod_size);
 		munmap(ptr, data->mod_size);
+		fb_dirty_fb_ioctl(data, &data->fb_white);
 		expected = "BLACK or TRANSPARENT mark on top of plane in test";
 		break;
 	case MMAP_CPU:
@@ -309,14 +331,17 @@ static void run_test(data_t *data)
 		memset(ptr, 0, data->mod_size);
 		munmap(ptr, data->mod_size);
 		gem_sw_finish(data->drm_fd, handle);
+		fb_dirty_fb_ioctl(data, &data->fb_white);
 		expected = "BLACK or TRANSPARENT mark on top of plane in test";
 		break;
 	case BLT:
 		fill_blt(data, &data->fb_white, 0);
+		fb_dirty_fb_ioctl(data, &data->fb_white);
 		expected = "BLACK or TRANSPARENT mark on top of plane in test";
 		break;
 	case RENDER:
 		fill_render(data, &data->fb_white, 0);
+		fb_dirty_fb_ioctl(data, &data->fb_white);
 		expected = "BLACK or TRANSPARENT mark on top of plane in test";
 		break;
 	case PLANE_MOVE:
-- 
2.33.0
