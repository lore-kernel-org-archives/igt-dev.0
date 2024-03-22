Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8ECC47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A65510E5C8;
	Fri, 22 Mar 2024 20:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikMiatu+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2451610E3FA
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711139853; x=1742675853;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HcZCX/jvMjJ32IUeMDxHx5tY83ERpPkIAIb7w9Wftks=;
 b=ikMiatu+xn+P20WsNHqb+BGQduCw8rrtbBlI9+rwU4UyWk+qBmXzKPd4
 XEeYeyrQosPaIDT9dbjVWfBfx6SkCx9KTSO7l7fCCWAYvbVqTxeRRQNnD
 DgeSkF8Q75sdPf0TqESHs5HuV6fCiENDKHMiyfwK79Q0lseJMdJnS7t6v
 ugVGwrzxFiBoha3dsSYpUt0uN8Zo7+AADvykcVMClWp3beEij+GtB0evn
 7aujP3hEHvBJTcuowUKVy4FHAkpoS2aVAeq1GN2aL7WzBWTcRQJaACoz3
 VfCzByLJWpx6QQJHqyvtLlY4t2CT18m7QXVOwrzws+Xi+zqhkwsKhBcke A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329077"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329077"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:37:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783608"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783608"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:37:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:37:29 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/kms_async_flips: Allow the first async flip
 to change modifier
Date: Fri, 22 Mar 2024 22:37:26 +0200
Message-ID: <20240322203726.16637-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240322203726.16637-1-ville.syrjala@linux.intel.com>
References: <20240322203726.16637-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The kernel will now allow the first async flip to change the modifier.
Test that it works as indended: first async flip the attempts to
change the modifier will succeed, and subsequent async flips that
attempt the same will fail.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index efbc8778d7e1..1c80e95149eb 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -438,10 +438,8 @@ static void test_cursor(data_t *data)
 
 static void test_invalid(data_t *data)
 {
-	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
-	int ret;
-	uint32_t width, height;
-	struct igt_fb fb;
+	int ret, width, height;
+	struct igt_fb fb[2];
 	drmModeModeInfo *mode;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
@@ -451,17 +449,28 @@ static void test_invalid(data_t *data)
 	height = mode->vdisplay;
 
 	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-		      I915_FORMAT_MOD_Y_TILED, &fb);
+		      I915_FORMAT_MOD_X_TILED, &fb[0]);
+	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
+		      I915_FORMAT_MOD_Y_TILED, &fb[1]);
 
-	/* Flip with a different fb modifier which is expected to be rejected */
-	ret = drmModePageFlip(data->drm_fd, data->crtc_id,
-			      fb.fb_id, flags, data);
+	igt_plane_set_fb(data->plane, &fb[0]);
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
+	/* first async flip is expected to allow modifier changes */
+	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id,
+			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
+	igt_assert(ret == 0);
+	wait_flip_event(data);
+
+	/* subsequent async flips should reject modifier changes */
+	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id,
+			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
 	igt_assert(ret == -EINVAL);
 
 	/* TODO: Add verification for changes in stride, pixel format */
 
-	igt_remove_fb(data->drm_fd, &fb);
+	igt_remove_fb(data->drm_fd, &fb[1]);
+	igt_remove_fb(data->drm_fd, &fb[0]);
 }
 
 static void queue_vblank(data_t *data)
@@ -725,6 +734,8 @@ igt_main
 	igt_subtest_with_dynamic("invalid-async-flip") {
 		/* TODO: support more vendors */
 		igt_require(is_intel_device(data.drm_fd));
+		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
+						       I915_FORMAT_MOD_X_TILED));
 		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
 						       I915_FORMAT_MOD_Y_TILED));
 
-- 
2.43.2

