Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5B1F53D7E
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 18:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3322110E323;
	Mon, 16 Mar 2026 18:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNcpR0BJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5F410E323
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 18:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773686371; x=1805222371;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wSQ+p8GjUaEdAeFOwo1nPOtc2cjBxyRabgQ2cF/+9MI=;
 b=eNcpR0BJf9P0DzI/62s7ijzI7bZZWLXWtlCQgyn446VSI7v1gVUgkrsA
 2ePbm4sQ+/OAmbGE+Abyfz5kkU83WS0yxTkO0vMmWeddzudUf51ksj0lM
 INYxNNxa464f3YyKhbuY3E/yInpqT346hN5U8vfOZI9LBrePH9Ac1GyJv
 gPdTs+D7SfO1nsjBpAzT5UOfCqW4VzIv7JnYxlmtb6aJEd7Csa96HsYXc
 MX2BXDfLbRcoZxEnL+opiYPY9Hx1W9N9B0FR448yLD5JCcqaAuvmMeVyW
 CZKh2KcxGqSSpt8nnWXt55txeHyYWJ0fYJ7389gmNdXuFD1qXyHE4U4g3 A==;
X-CSE-ConnectionGUID: Dzno5TqpTUGHIJf2CWsT4g==
X-CSE-MsgGUID: qrHfeuO+SVGLqHWnWILumA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78606932"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="78606932"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 11:39:22 -0700
X-CSE-ConnectionGUID: a+OnqWH1Sf+W5IGJtAZ1Zw==
X-CSE-MsgGUID: mL1393SmTTCtg3l5L4ARvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="252520189"
Received: from chu13-desk.fm.intel.com ([10.80.209.210])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 11:39:20 -0700
From: Austin Hu <austin.hu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chris@chris-wilson.co.uk
Subject: [PATCH i-g-t] tools/intel_framebuffer_dump: dump frame buffers with
 igt_fb API.
Date: Mon, 16 Mar 2026 11:36:58 -0700
Message-Id: <20260316183658.384575-1-austin.hu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

This app is out of date as it opens i915 DRM device to just dump
the "main" frame buffer connected to a CRTC.

So improve it to support Xe driver as well, and dump all the frame
buffers attached to active Planes (including Cursor) of each CRTC
with igt_fb API.

Signed-off-by: Austin Hu <austin.hu@intel.com>
---
 tools/intel_framebuffer_dump.c | 137 +++++++++++++++++++--------------
 1 file changed, 81 insertions(+), 56 deletions(-)

diff --git a/tools/intel_framebuffer_dump.c b/tools/intel_framebuffer_dump.c
index 79c0688b1..907c65a14 100644
--- a/tools/intel_framebuffer_dump.c
+++ b/tools/intel_framebuffer_dump.c
@@ -36,75 +36,100 @@
 
 #include "intel_io.h"
 #include "drmtest.h"
+#include "igt_fb.h"
 
-int main(int argc, char **argv)
+static void dump_frame_buffer(int fd, uint32_t crtc_id, uint32_t fb_id)
 {
-	drmModeResPtr res;
-	int fd, n;
+	drmModeFB2Ptr fb = drmModeGetFB2(fd, fb_id);
+
+	if (fb == NULL)
+		return;
+
+	/* Wrap drmModeFB2Ptr object into the igt_fb one. */
+	struct igt_fb igt_fb;
+
+	igt_init_fb(&igt_fb, fd, fb->width, fb->height,
+			fb->pixel_format, fb->modifier,
+			IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+
+	/* Update more attributes of the igt_fb object. */
+	igt_calc_fb_size(&igt_fb);
+
+	/* Import the GEM handle from drmModeFB2Ptr object into igt_fb object. */
+	igt_fb.gem_handle = fb->handles[0];
+
+	/* Dump the framebuffer contents with igt_fb and Cairo APIs. */
+	/* Note: the FB memory layout may be non-linear (like X/Y-Major Tile). */
+	cairo_surface_t *surface = igt_get_cairo_surface(fd, &igt_fb);
+
+	if (surface != NULL) {
+		char name[80];
 
-	fd = drmOpen("i915", NULL);
+		snprintf(name, sizeof(name), "crtc-%d-fb-%d.png", crtc_id, fb->fb_id);
+		cairo_surface_write_to_png(surface, name);
+		fprintf(stdout, "Framebuffer dumped to %s\n", name);
+
+		cairo_surface_destroy(surface);
+	}
+
+	drmModeFreeFB2(fb);
+}
+
+int main(int argc, char **argv)
+{
+	int fd = drm_open_driver(DRIVER_INTEL | DRIVER_XE);
 	if (fd < 0)
-		return ENOENT;
+		return -ENOENT;
 
-	res = drmModeGetResources(fd);
-	if (res == NULL)
-		return ENOMEM;
+	/* To enumerate DRM Plane attached to cursor frame buffer. */
+	drmSetClientCap(fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
-	for (n = 0; n < res->count_crtcs; n++) {
-		struct drm_gem_open open_arg;
-		struct drm_gem_flink flink;
-		drmModeCrtcPtr crtc;
-		drmModeFBPtr fb;
+	drmModeResPtr res = drmModeGetResources(fd);
 
-		crtc = drmModeGetCrtc(fd, res->crtcs[n]);
-		if (crtc == NULL)
-			continue;
+	if (res == NULL) {
+		close(fd);
+		return -ENOMEM;
+	}
 
-		fb = drmModeGetFB(fd, crtc->buffer_id);
-		drmModeFreeCrtc(crtc);
-		if (fb == NULL)
-			continue;
+	drmModePlaneResPtr pres = drmModeGetPlaneResources(fd);
 
-		flink.handle = fb->handle;
-		if (drmIoctl(fd, DRM_IOCTL_GEM_FLINK, &flink)) {
-			drmModeFreeFB(fb);
+	if (pres == NULL) {
+		drmModeFreeResources(res);
+		close(fd);
+		return -ENOMEM;
+	}
+
+	/* Iterate CRTCs. */
+	for (int c = 0; c < res->count_crtcs; c++) {
+		uint32_t cid = res->crtcs[c];
+		drmModeCrtcPtr crtc = drmModeGetCrtc(fd, cid);
+
+		if ((crtc == NULL) || (crtc->buffer_id == 0))
 			continue;
-		}
 
-		open_arg.name = flink.name;
-		if (drmIoctl(fd, DRM_IOCTL_GEM_OPEN, &open_arg) == 0) {
-			struct drm_i915_gem_mmap_gtt mmap_arg;
-			void *ptr;
-
-						mmap_arg.handle = open_arg.handle;
-			if (drmIoctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg) == 0 &&
-			    (ptr = mmap(0, open_arg.size, PROT_READ, MAP_SHARED, fd, mmap_arg.offset)) != (void *)-1) {
-				cairo_surface_t *surface;
-				cairo_format_t format;
-				char name[80];
-
-				snprintf(name, sizeof(name), "fb-%d.png",  fb->fb_id);
-
-				switch (fb->depth) {
-				case 16: format = CAIRO_FORMAT_RGB16_565; break;
-				case 24: format = CAIRO_FORMAT_RGB24; break;
-				case 30: format = CAIRO_FORMAT_RGB30; break;
-				case 32: format = CAIRO_FORMAT_ARGB32; break;
-				default: format = CAIRO_FORMAT_INVALID; break;
-				}
-
-				surface = cairo_image_surface_create_for_data(ptr, format,
-									      fb->width, fb->height, fb->pitch);
-				cairo_surface_write_to_png(surface, name);
-				cairo_surface_destroy(surface);
-
-				munmap(ptr, open_arg.size);
-			}
-			drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &open_arg.handle);
-		}
+		/* Dump the 'main' frame buffer attached to this CRTC. */
+		dump_frame_buffer(fd, cid, crtc->buffer_id);
+
+		/* Iterate and dump other FBs of Planes attached to this CRTC. */
+		for (int p = 0; p < pres->count_planes; p++) {
+			uint32_t pid = pres->planes[p];
+			drmModePlanePtr pl = drmModeGetPlane(fd, pid);
+
+			if (!pl)
+				continue;
+
+			if ((pl->crtc_id == cid) && (pl->fb_id != 0) &&
+					(pl->fb_id != crtc->buffer_id))
+				dump_frame_buffer(fd, cid, pl->fb_id);
 
-		drmModeFreeFB(fb);
+			drmModeFreePlane(pl);
+		}
+		drmModeFreeCrtc(crtc);
 	}
 
+	drmModeFreePlaneResources(pres);
+	drmModeFreeResources(res);
+	close(fd);
+
 	return 0;
 }
-- 
2.34.1

