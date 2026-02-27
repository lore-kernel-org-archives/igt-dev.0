Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE66FD530D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDAB10EA4E;
	Fri, 27 Feb 2026 08:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfJGBmvy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B352B10EA53
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179668; x=1803715668;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ed0DsmOQss8pOUhfvwmmnU43IFW1CbP/azB7YT+RpeU=;
 b=jfJGBmvyarPTsWpDfdnelM3vvNZLw6H7yHskraoI4mSl6bfPpOzAZseb
 g4iCtnwLIo8QPWEuGfqUj0/bE+qFefd+zashjcs34C2uz8BMNS8E7WO54
 AkaEkX3oa/Wa7rY8SOF8j0u1gI9rbnWhNhVdZ6SWlKMPAzgTvAsL88eyP
 QEr/Yxqdra9tAf4klxVXLxedGsf2u7Mic+bzwvoKszblqzljRgAnCz3N1
 VDHgL4EOpV7t+wtaHc0fptALnJFlC3YH5SyDmURd0On9/244sSGsl5MgN
 fMcrCby+u4W26/9TJRt4FA+U4O5K7fR4EtpJQw1LJMffZApVcpJqUMogI A==;
X-CSE-ConnectionGUID: k76D2KCwQ5GDT19Zq7VeCw==
X-CSE-MsgGUID: 5o8uVkqJSU25OULXeZl6Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83893249"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="83893249"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:47 -0800
X-CSE-ConnectionGUID: UPWOKQJ1QyKp9azMgDsbzw==
X-CSE-MsgGUID: G4TJ0BhcQsOKe1HTH7MK/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="214278234"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:46 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/17] tests/kms: Remove hand rolled get_vblank() stuff
Date: Fri, 27 Feb 2026 10:06:48 +0200
Message-ID: <20260227080653.30389-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace the hand rolled get_vblank() stuff with the
identical kmstest_get_vblank().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_pipe_stress.c | 24 +-----------------------
 tests/prime_vgem.c            | 28 +++-------------------------
 2 files changed, 4 insertions(+), 48 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index b35f19f75b9b..85ab2ec50621 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -315,28 +315,6 @@ static void *gpu_load(void *ptr)
 	return NULL;
 }
 
-static inline uint32_t pipe_select(igt_crtc_t *crtc)
-{
-	if (crtc->pipe > 1)
-		return crtc->pipe << DRM_VBLANK_HIGH_CRTC_SHIFT;
-	else if (crtc->pipe > 0)
-		return DRM_VBLANK_SECONDARY;
-	else
-		return 0;
-}
-
-static unsigned get_vblank(int fd, igt_crtc_t *crtc, unsigned flags)
-{
-	union drm_wait_vblank vbl;
-
-	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = DRM_VBLANK_RELATIVE | pipe_select(crtc) | flags;
-	if (drmIoctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl))
-		return 0;
-
-	return vbl.reply.sequence;
-}
-
 static int commit_mode(struct data *data, igt_output_t *output,
 		       igt_crtc_t *crtc, drmModeModeInfo *mode)
 {
@@ -613,7 +591,7 @@ static void stress_pipes(struct data *data, struct timespec *start,
 
 		igt_pipe_crc_start(data->pipe_crc[pipe]);
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc[pipe], &crc);
-		get_vblank(data->display.drm_fd, crtc, DRM_VBLANK_NEXTONMISS);
+		kmstest_get_vblank(data->display.drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc[pipe], &crc2);
 		igt_pipe_crc_stop(data->pipe_crc[pipe]);
 		igt_assert_crc_equal(&crc, &crc2);
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index bbf5ab97f459..6abd2ac53093 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -970,28 +970,6 @@ static uint32_t set_fb_on_crtc(int fd, int pipe, struct vgem_bo *bo, uint32_t fb
 	return 0;
 }
 
-static inline uint32_t pipe_select(int pipe)
-{
-	if (pipe > 1)
-		return pipe << DRM_VBLANK_HIGH_CRTC_SHIFT;
-	else if (pipe > 0)
-		return DRM_VBLANK_SECONDARY;
-	else
-		return 0;
-}
-
-static unsigned get_vblank(int fd, int pipe, unsigned flags)
-{
-	union drm_wait_vblank vbl;
-
-	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = DRM_VBLANK_RELATIVE | pipe_select(pipe) | flags;
-	if (drmIoctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl))
-		return 0;
-
-	return vbl.reply.sequence;
-}
-
 static void flip_to_vgem(int i915, int vgem,
 			 struct vgem_bo *bo,
 			 uint32_t fb_id,
@@ -1013,7 +991,7 @@ static void flip_to_vgem(int i915, int vgem,
 			igt_assert_f(poll(&pfd, 1, 0) == 0,
 				     "flip to %s completed whilst busy\n",
 				     name);
-			get_vblank(i915, 0, DRM_VBLANK_NEXTONMISS);
+			kmstest_get_vblank(i915, 0, DRM_VBLANK_NEXTONMISS);
 		}
 	}
 	igt_waitchildren_timeout(2, "flip blocked by waiting for busy vgem fence");
@@ -1023,12 +1001,12 @@ static void flip_to_vgem(int i915, int vgem,
 		unsigned long miss;
 
 		/* Signal fence at the start of the next vblank */
-		get_vblank(i915, 0, DRM_VBLANK_NEXTONMISS);
+		kmstest_get_vblank(i915, 0, DRM_VBLANK_NEXTONMISS);
 		vgem_fence_signal(vgem, fence);
 
 		miss = 0;
 		igt_until_timeout(5) {
-			get_vblank(i915, 0, DRM_VBLANK_NEXTONMISS);
+			kmstest_get_vblank(i915, 0, DRM_VBLANK_NEXTONMISS);
 			if (poll(&pfd, 1, 0))
 				break;
 			miss++;
-- 
2.52.0

