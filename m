Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9E8F506C3
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 13:01:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5905810E50B;
	Mon, 16 Mar 2026 13:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rn6VH6xt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC1310E50B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773666079; x=1805202079;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sAgzuIX+gVLmurYeSat7JS7bxndYNZnjEOXldrPe1Zw=;
 b=Rn6VH6xtFVRPHuOIl+5V2Qwctsr0qmzPLw6KJTTJbrpldfEplK3Px+77
 VzFCDvoSF4ki+oYkXguu+MLCdPt37JyhxnLXIATTwrhDE8Ihou4g2CHTY
 68HN5N8UIgWvwY0jvdxkhVXQrwXmtzzGCaT5Hucv5VXdCKKMNsWdwPMVj
 jeaScJ+DSGKjTCZLapTzypKwsdgollUnAYaQ9bedxcpI8HaWtPspd8JP7
 6qS8ezy7Q99yqn9UMHkqbSnkqVWS7XtN6jEaMuAfg4I14xu8N/Mq0aYpf
 EALq2K64PdqoMHetniKt/Bb3CIZp/gUcYZbihTJZgKhUp2S4Aa3m4lJBd A==;
X-CSE-ConnectionGUID: AlKTumESSdeND4aQIi7Pig==
X-CSE-MsgGUID: YxQMziAERIOy1AKZviIncg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="100136563"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="100136563"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 06:01:18 -0700
X-CSE-ConnectionGUID: 8QE69VNCQ0GqvEamow4ObQ==
X-CSE-MsgGUID: QxVa+TAwQreXfzeTlzuIxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226585466"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 06:01:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t] tests/prime_vgem: partial conversion to igt_crtc_t *
Date: Mon, 16 Mar 2026 15:01:13 +0200
Message-ID: <20260316130113.1274878-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Use igt_crtc_t and use the first CRTC with valid output, instead of hard
coding 0 and calling it pipe, and pass the crtc pointer around. Clean up
the relevant parts of the CRTC index and id usage, but limit the
refactoring to that.

Note that crtc is initialized during for_each_crtc_with_valid_output(),
and breaking out of it gives us the first CRTC with valid output.

The test is fairly old fashioned, using drmModeGetResources() and ioctls
directly, and could use a more thorough cleanup.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/prime_vgem.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 6abd2ac53093..ac20ee1cf266 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -908,8 +908,9 @@ static bool has_prime_import(int fd)
 	return value & DRM_PRIME_CAP_IMPORT;
 }
 
-static uint32_t set_fb_on_crtc(int fd, int pipe, struct vgem_bo *bo, uint32_t fb_id)
+static bool set_fb_on_crtc(igt_crtc_t *crtc, struct vgem_bo *bo, uint32_t fb_id)
 {
+	int fd = crtc->display->drm_fd;
 	drmModeRes *resources = drmModeGetResources(fd);
 	struct drm_mode_modeinfo *modes = malloc(4096*sizeof(*modes));
 	uint32_t encoders[32];
@@ -939,7 +940,7 @@ static uint32_t set_fb_on_crtc(int fd, int pipe, struct vgem_bo *bo, uint32_t fb
 			memset(&enc, 0, sizeof(enc));
 			enc.encoder_id = encoders[e];
 			drmIoctl(fd, DRM_IOCTL_MODE_GETENCODER, &enc);
-			if (enc.possible_crtcs & (1 << pipe))
+			if (enc.possible_crtcs & (1 << crtc->crtc_index))
 				break;
 		}
 		if (e == conn.count_encoders)
@@ -954,7 +955,7 @@ static uint32_t set_fb_on_crtc(int fd, int pipe, struct vgem_bo *bo, uint32_t fb
 			continue;
 
 		memset(&set, 0, sizeof(set));
-		set.crtc_id = resources->crtcs[pipe];
+		set.crtc_id = crtc->crtc_id;
 		set.fb_id = fb_id;
 		set.set_connectors_ptr = (uintptr_t)&conn.connector_id;
 		set.count_connectors = 1;
@@ -962,18 +963,18 @@ static uint32_t set_fb_on_crtc(int fd, int pipe, struct vgem_bo *bo, uint32_t fb
 		set.mode_valid = 1;
 		if (drmIoctl(fd, DRM_IOCTL_MODE_SETCRTC, &set) == 0) {
 			drmModeFreeResources(resources);
-			return set.crtc_id;
+			return true;
 		}
 	}
 
 	drmModeFreeResources(resources);
-	return 0;
+	return false;
 }
 
 static void flip_to_vgem(int i915, int vgem,
 			 struct vgem_bo *bo,
 			 uint32_t fb_id,
-			 uint32_t crtc_id,
+			 igt_crtc_t *crtc,
 			 unsigned hang,
 			 const char *name)
 {
@@ -985,13 +986,13 @@ static void flip_to_vgem(int i915, int vgem,
 
 	igt_fork(child, 1) { /* Use a child in case we block uninterruptibly */
 		/* Check we don't block nor flip before the fence is ready */
-		do_or_die(drmModePageFlip(i915, crtc_id, fb_id,
+		do_or_die(drmModePageFlip(i915, crtc->crtc_id, fb_id,
 					  DRM_MODE_PAGE_FLIP_EVENT, &fb_id));
 		for (int n = 0; n < 5; n++) { /* 5 frames should be <100ms */
 			igt_assert_f(poll(&pfd, 1, 0) == 0,
 				     "flip to %s completed whilst busy\n",
 				     name);
-			kmstest_get_vblank(i915, 0, DRM_VBLANK_NEXTONMISS);
+			igt_crtc_get_vblank(crtc, DRM_VBLANK_NEXTONMISS);
 		}
 	}
 	igt_waitchildren_timeout(2, "flip blocked by waiting for busy vgem fence");
@@ -1001,12 +1002,12 @@ static void flip_to_vgem(int i915, int vgem,
 		unsigned long miss;
 
 		/* Signal fence at the start of the next vblank */
-		kmstest_get_vblank(i915, 0, DRM_VBLANK_NEXTONMISS);
+		igt_crtc_get_vblank(crtc, DRM_VBLANK_NEXTONMISS);
 		vgem_fence_signal(vgem, fence);
 
 		miss = 0;
 		igt_until_timeout(5) {
-			kmstest_get_vblank(i915, 0, DRM_VBLANK_NEXTONMISS);
+			igt_crtc_get_vblank(crtc, DRM_VBLANK_NEXTONMISS);
 			if (poll(&pfd, 1, 0))
 				break;
 			miss++;
@@ -1027,7 +1028,7 @@ static void flip_to_vgem(int i915, int vgem,
 static void test_flip(int i915, int vgem, unsigned hang)
 {
 	drmModeModeInfo *mode = NULL;
-	uint32_t fb_id[2], handle[2], crtc_id;
+	uint32_t fb_id[2], handle[2];
 	igt_display_t display;
 	igt_output_t *output;
 	struct vgem_bo bo[2];
@@ -1070,22 +1071,22 @@ static void test_flip(int i915, int vgem, unsigned hang)
 		igt_assert(fb_id[i]);
 	}
 
-	igt_require((crtc_id = set_fb_on_crtc(i915, 0, &bo[0], fb_id[0])));
+	igt_require(set_fb_on_crtc(crtc, &bo[0], fb_id[0]));
 
 	/* Bind both fb for use by flipping */
 	for (int i = 1; i >= 0; i--) {
 		struct drm_event_vblank vbl;
 
-		do_or_die(drmModePageFlip(i915, crtc_id, fb_id[i],
+		do_or_die(drmModePageFlip(i915, crtc->crtc_id, fb_id[i],
 					  DRM_MODE_PAGE_FLIP_EVENT, &fb_id[i]));
 		igt_assert_eq(read(i915, &vbl, sizeof(vbl)), sizeof(vbl));
 	}
 
 	/* Schedule a flip to wait upon the frontbuffer vgem being written */
-	flip_to_vgem(i915, vgem, &bo[0], fb_id[0], crtc_id, hang, "front");
+	flip_to_vgem(i915, vgem, &bo[0], fb_id[0], crtc, hang, "front");
 
 	/* Schedule a flip to wait upon the backbuffer vgem being written */
-	flip_to_vgem(i915, vgem, &bo[1], fb_id[1], crtc_id, hang, "back");
+	flip_to_vgem(i915, vgem, &bo[1], fb_id[1], crtc, hang, "back");
 
 	for (int i = 0; i < 2; i++) {
 		do_or_die(drmModeRmFB(i915, fb_id[i]));
-- 
2.47.3

