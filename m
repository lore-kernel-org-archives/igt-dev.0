Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C317EFD530D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A07210EA53;
	Fri, 27 Feb 2026 08:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ekc9pONv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EF410EA53
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179688; x=1803715688;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=F7nVNCkDXxm8xwpTALz0HxDIx/3mvFY5NCb880eqi40=;
 b=Ekc9pONvXkxDWWjD5svQcNSHpSNt/IIx06LwNvLaEa1RglPSA/ZhclzG
 l0Yd+7Z0ck283umgjPXDOg2dbKO0VqSyU0t8GPF8EiXRkMwoUybDmi6MG
 cR9nKimD+SC87sHXQ6CILDR46ExEjbfjPAfuHOPF8K9FDafG2ueCPcoBD
 dLv0rzhLKHUyvPA/lv/okDKLFo/qw4+sIFdWEjNY4RZ4n+GvFYJRmRb1Q
 GmFvBF4RTYmhKFFhMXf3DuJRGTGtr6enEYHC/uBWPmPIenNtL36o2d3Sr
 JobSSV0tmsJL9o+4uw9QF/oU2K2bWhwuQJKM48Hq/46IIrVOIvTpgjHkb w==;
X-CSE-ConnectionGUID: Sr/AwevnTi6vv5zlk/wl6Q==
X-CSE-MsgGUID: qya8USw0RbyiYiwDy4oZug==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84345981"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="84345981"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:08:08 -0800
X-CSE-ConnectionGUID: 0NjsvcXOSSaLcBuQUCMo/g==
X-CSE-MsgGUID: 8UFmIeZXRF6WMlbApe95Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="213723593"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:08:06 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 17/17] lib/kms: Introduce igt_crtc_get_vblank()
Date: Fri, 27 Feb 2026 10:06:53 +0200
Message-ID: <20260227080653.30389-18-ville.syrjala@linux.intel.com>
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

Provide a crtc based wrapper (igt_crtc_get_vblank())
for kmstest_get_vblank(), and make use of it where
appropriate.

 #include "scripts/iterators.cocci"

@@
igt_crtc_t *CRTC;
expression FD;
@@
- kmstest_get_vblank(FD, CRTC->crtc_index
+ igt_crtc_get_vblank(CRTC
	,...)

@@
type T;
@@
T igt_crtc_get_vbl_flag(...);
+ unsigned int igt_crtc_get_vblank(igt_crtc_t *crtc, unsigned int flags);

@@
@@
kmstest_get_vblank(...) { ... }
+/**
+ * igt_crtc_get_vblank:
+ * @crtc: CRTC
+ * @flags: Flags passed to drm_ioctl_wait_vblank
+ *
+ * Blocks or request a signal when a specified vblank event occurs
+ *
+ * Returns 0 on failure or the reply vblank sequence number otherwise
+ */
+unsigned int igt_crtc_get_vblank(igt_crtc_t *crtc, unsigned int flags)
+{
+       return kmstest_get_vblank(crtc->display->drm_fd, crtc->crtc_index, flags);
+}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c             |  15 ++++++
 lib/igt_kms.h             |   1 +
 tests/drm_read.c          |   4 +-
 tests/kms_cursor_legacy.c | 104 +++++++++++++++++---------------------
 tests/kms_plane.c         |  10 ++--
 tests/kms_rotation_crc.c  |  10 ++--
 6 files changed, 72 insertions(+), 72 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c3fe6198d302..9ebf77b74d04 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2471,6 +2471,21 @@ unsigned int kmstest_get_vblank(int fd, int crtc_index, unsigned int flags)
 	return vbl.reply.sequence;
 }
 
+/**
+ * igt_crtc_get_vblank:
+ * @crtc: CRTC
+ * @flags: Flags passed to drm_ioctl_wait_vblank
+ *
+ * Blocks or request a signal when a specified vblank event occurs
+ *
+ * Returns 0 on failure or the reply vblank sequence number otherwise
+ */
+unsigned int igt_crtc_get_vblank(igt_crtc_t *crtc, unsigned int flags)
+{
+	return kmstest_get_vblank(crtc->display->drm_fd, crtc->crtc_index,
+				  flags);
+}
+
 /**
  * kmstest_wait_for_pageflip_timeout:
  * @fd: Opened drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 3e88d49fdaba..e91c6567757e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -587,6 +587,7 @@ igt_crtc_t *igt_first_crtc(igt_display_t *display);
 igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, igt_output_t **ret_output);
 
 uint32_t igt_crtc_get_vbl_flag(igt_crtc_t *crtc);
+unsigned int igt_crtc_get_vblank(igt_crtc_t *crtc, unsigned int flags);
 
 typedef struct _igt_pipe_crc igt_pipe_crc_t;
 igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
diff --git a/tests/drm_read.c b/tests/drm_read.c
index 2823238f6668..d500ae45bc86 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -79,7 +79,7 @@ static void assert_empty(int fd)
 
 static void generate_event(int fd, igt_crtc_t *crtc)
 {
-	igt_assert(kmstest_get_vblank(fd, crtc->crtc_index, DRM_VBLANK_EVENT));
+	igt_assert(igt_crtc_get_vblank(crtc, DRM_VBLANK_EVENT));
 }
 
 static void wait_for_event(int fd)
@@ -305,7 +305,7 @@ int igt_main()
 		}
 
 		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
-		igt_require(kmstest_get_vblank(fd, crtc->crtc_index, 0));
+		igt_require(igt_crtc_get_vblank(crtc, 0));
 	}
 
 	igt_subtest("invalid-buffer")
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 5cbb97676dea..2d74c7cac8ba 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -778,12 +778,12 @@ static void basic_flip_cursor(igt_display_t *display,
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	/* Quick sanity check that we can update a cursor in a single vblank */
-	vblank_start = kmstest_get_vblank(display->drm_fd, crtc->crtc_index,
-					  DRM_VBLANK_NEXTONMISS);
-	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+	vblank_start = igt_crtc_get_vblank(crtc,
+					   DRM_VBLANK_NEXTONMISS);
+	igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
 		      vblank_start);
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
-	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+	igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
 		      vblank_start);
 
 	for (i = 0; i < 25; i++) {
@@ -799,9 +799,8 @@ static void basic_flip_cursor(igt_display_t *display,
 					    .dependency = fb_info.gem_handle);
 
 		/* Start with a synchronous query to align with the vblank */
-		vblank_start = kmstest_get_vblank(display->drm_fd,
-						  crtc->crtc_index,
-						  DRM_VBLANK_NEXTONMISS);
+		vblank_start = igt_crtc_get_vblank(crtc,
+						   DRM_VBLANK_NEXTONMISS);
 
 		switch (order) {
 		case FLIP_BEFORE_CURSOR:
@@ -815,8 +814,7 @@ static void basic_flip_cursor(igt_display_t *display,
 				break;
 			}
 
-			delta = kmstest_get_vblank(display->drm_fd,
-						   crtc->crtc_index, 0) - vblank_start;
+			delta = igt_crtc_get_vblank(crtc, 0) - vblank_start;
 			miss = delta != 0;
 
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
@@ -825,8 +823,7 @@ static void basic_flip_cursor(igt_display_t *display,
 		case FLIP_AFTER_CURSOR:
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
 
-			delta = kmstest_get_vblank(display->drm_fd,
-						   crtc->crtc_index, 0) - vblank_start;
+			delta = igt_crtc_get_vblank(crtc, 0) - vblank_start;
 			miss = delta != 0;
 
 			switch (mode) {
@@ -840,8 +837,8 @@ static void basic_flip_cursor(igt_display_t *display,
 			}
 		}
 
-		delta = kmstest_get_vblank(display->drm_fd, crtc->crtc_index,
-					   0) - vblank_start;
+		delta = igt_crtc_get_vblank(crtc,
+					    0) - vblank_start;
 
 		if (spin) {
 			struct pollfd pfd = { display->drm_fd, POLLIN };
@@ -865,8 +862,8 @@ static void basic_flip_cursor(igt_display_t *display,
 		if (miss1)
 			continue;
 
-		delta = kmstest_get_vblank(display->drm_fd, crtc->crtc_index,
-					   0) - vblank_start;
+		delta = igt_crtc_get_vblank(crtc,
+					    0) - vblank_start;
 
 		if (!mode_requires_extra_vblank(mode))
 			miss2 += delta != 1;
@@ -902,16 +899,15 @@ get_cursor_updates_per_vblank(igt_display_t *display, igt_crtc_t *crtc,
 	int target;
 
 	for (target = 65536; target; target /= 2) {
-		unsigned vblank_start = kmstest_get_vblank(display->drm_fd,
-							   crtc->crtc_index,
-							   DRM_VBLANK_NEXTONMISS);
+		unsigned vblank_start = igt_crtc_get_vblank(crtc,
+							    DRM_VBLANK_NEXTONMISS);
 
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+		igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
 			      vblank_start);
 
 		for (int n = 0; n < target; n++)
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, arg);
-		if (kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0) == vblank_start)
+		if (igt_crtc_get_vblank(crtc, 0) == vblank_start)
 			break;
 	}
 
@@ -965,13 +961,13 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 	else
 		target = 1;
 
-	vblank_start = kmstest_get_vblank(display->drm_fd, crtc->crtc_index,
-					  DRM_VBLANK_NEXTONMISS);
-	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+	vblank_start = igt_crtc_get_vblank(crtc,
+					   DRM_VBLANK_NEXTONMISS);
+	igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
 		      vblank_start);
 	for (int n = 0; n < target; n++)
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
-	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+	igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
 		      vblank_start);
 
 	/*
@@ -1010,9 +1006,8 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[nloops & 1]);
 
 		/* Start with a synchronous query to align with the vblank */
-		vblank_start = kmstest_get_vblank(display->drm_fd,
-						  crtc->crtc_index,
-						  DRM_VBLANK_NEXTONMISS);
+		vblank_start = igt_crtc_get_vblank(crtc,
+						   DRM_VBLANK_NEXTONMISS);
 		switch (mode) {
 		default:
 			flip_nonblocking(display, crtc, mode >= flip_test_atomic, &fb_info, NULL);
@@ -1024,30 +1019,30 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 		}
 
 		/* The nonblocking flip should not have delayed us */
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+		igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
 			      vblank_start);
 		for (int n = 0; n < target; n++)
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[nloops & 1]);
 
 		/* Nor should it have delayed the following cursor update */
 		if (!cursor_slowpath(display, mode))
-			igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+			igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
 				      vblank_start);
 		else if (mode_requires_extra_vblank(mode))
-			igt_assert_lte(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+			igt_assert_lte(igt_crtc_get_vblank(crtc, 0),
 				       vblank_start + 2);
 		else
-			igt_assert_lte(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+			igt_assert_lte(igt_crtc_get_vblank(crtc, 0),
 				       vblank_start + 1);
 
 		igt_set_timeout(1, "Stuck page flip");
 		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
 
 		if (!mode_requires_extra_vblank(mode))
-			igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+			igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
 				      vblank_start + 1);
 		else
-			igt_assert_lte(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+			igt_assert_lte(igt_crtc_get_vblank(crtc, 0),
 				       vblank_start + 2);
 
 		igt_reset_timeout();
@@ -1257,9 +1252,8 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 		 * Try a page flip on crtc 1, if we succeed pump page flips and
 		 * modesets interleaved, else do a single atomic commit with both.
 		 */
-		vblank_start = kmstest_get_vblank(display->drm_fd,
-						  crtc->crtc_index,
-						  DRM_VBLANK_NEXTONMISS);
+		vblank_start = igt_crtc_get_vblank(crtc,
+						   DRM_VBLANK_NEXTONMISS);
 		igt_plane_set_fb(plane, &fb_info);
 		ret = igt_display_try_commit_atomic(display, flags, (void*)(ptrdiff_t)vblank_start);
 		igt_assert(!ret || ret == -EBUSY);
@@ -1291,14 +1285,12 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 			goto done;
 		}
 	} else {
-		vblank_start = kmstest_get_vblank(display->drm_fd,
-						  crtc->crtc_index,
-						  DRM_VBLANK_NEXTONMISS);
+		vblank_start = igt_crtc_get_vblank(crtc,
+						   DRM_VBLANK_NEXTONMISS);
 		flip_nonblocking(display, crtc, atomic, &fb_info, (void*)(ptrdiff_t)vblank_start);
 
-		vblank_start = kmstest_get_vblank(display->drm_fd,
-						  crtc2->crtc_index,
-						  DRM_VBLANK_NEXTONMISS);
+		vblank_start = igt_crtc_get_vblank(crtc2,
+						   DRM_VBLANK_NEXTONMISS);
 		flip_nonblocking(display, crtc2, atomic, &fb2_info, (void*)(ptrdiff_t)vblank_start);
 	}
 
@@ -1323,9 +1315,8 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 		}
 
 		if (vbl.crtc_id == crtc->crtc_id) {
-			vblank_start = kmstest_get_vblank(display->drm_fd,
-							  crtc->crtc_index,
-							  DRM_VBLANK_NEXTONMISS);
+			vblank_start = igt_crtc_get_vblank(crtc,
+							   DRM_VBLANK_NEXTONMISS);
 			flip_nonblocking(display, crtc, atomic, &fb_info, (void*)(ptrdiff_t)vblank_start);
 		} else {
 			igt_assert(vbl.crtc_id == crtc2->crtc_id);
@@ -1333,9 +1324,8 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 			nloops--;
 
 			if (!modeset) {
-				vblank_start = kmstest_get_vblank(display->drm_fd,
-								  crtc2->crtc_index,
-								  DRM_VBLANK_NEXTONMISS);
+				vblank_start = igt_crtc_get_vblank(crtc2,
+								   DRM_VBLANK_NEXTONMISS);
 				flip_nonblocking(display, crtc2, atomic, &fb2_info, (void*)(ptrdiff_t)vblank_start);
 			} else {
 				igt_output_set_crtc(output2,
@@ -1658,21 +1648,20 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 
 	/* Disable cursor, and immediately queue a flip. Check if resulting crc is correct. */
 	for (int i = 1; i >= 0; i--) {
-		vblank_start = kmstest_get_vblank(display->drm_fd,
-						  crtc->crtc_index,
-						  DRM_VBLANK_NEXTONMISS);
+		vblank_start = igt_crtc_get_vblank(crtc,
+						   DRM_VBLANK_NEXTONMISS);
 
 		flip_nonblocking(display, crtc, atomic, &fb_info, NULL);
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[i]);
 
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+		igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
 			      vblank_start);
 
 		igt_set_timeout(1, "Stuck page flip");
 		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
 		igt_reset_timeout();
 
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+		igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
 			      vblank_start + 1);
 
 		igt_pipe_crc_collect_crc(pipe_crc, &crcs[2]);
@@ -1767,14 +1756,13 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 				    .dependency = fb_info[1].gem_handle,
 				    .dependency_size = fb_info[1].size);
 
-		vblank_start = kmstest_get_vblank(display->drm_fd,
-						  crtc->crtc_index,
-						  DRM_VBLANK_NEXTONMISS);
+		vblank_start = igt_crtc_get_vblank(crtc,
+						   DRM_VBLANK_NEXTONMISS);
 
 		flip_nonblocking(display, crtc, atomic, &fb_info[1], NULL);
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[i]);
 
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+		igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
 			      vblank_start);
 
 		igt_pipe_crc_get_current(display->drm_fd, pipe_crc, &test_crc);
@@ -1786,7 +1774,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 		igt_reset_timeout();
 
 		igt_assert_lte(vblank_start + 1,
-			       kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0));
+			       igt_crtc_get_vblank(crtc, 0));
 
 		igt_plane_set_fb(plane_primary, &fb_info[0]);
 		igt_display_commit2(display, COMMIT_UNIVERSAL);
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index cdb7884fdfe2..6a78c9ff0941 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -833,9 +833,8 @@ restart_round:
 			 * is when the next flip latches.
 			 */
 			if (i >= 1)
-				vblank[i - 1] = kmstest_get_vblank(data->drm_fd,
-								   crtc->crtc_index,
-								   0) + 1;
+				vblank[i - 1] = igt_crtc_get_vblank(crtc,
+								    0) + 1;
 
 			/*
 			 * Can't use drmModePageFlip() since we need to
@@ -871,9 +870,8 @@ restart_round:
 		 * The last crc is available earliest one
 		 * frame after the last flip latched.
 		 */
-		vblank[i - 1] = kmstest_get_vblank(data->drm_fd,
-						   crtc->crtc_index,
-						   0) + 1;
+		vblank[i - 1] = igt_crtc_get_vblank(crtc,
+						    0) + 1;
 	}
 
 	/*
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index cf0ca78287c1..4420053f1c6d 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -1022,9 +1022,8 @@ static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
 								continue;
 
 							igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-							flipsw = kmstest_get_vblank(data->gfx_fd,
-										    crtc->crtc_index,
-										    0) + 1;
+							flipsw = igt_crtc_get_vblank(crtc,
+										     0) + 1;
 							have_crc = false;
 						}
 
@@ -1037,9 +1036,8 @@ static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
 							continue;
 
 						igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-						fliphw = kmstest_get_vblank(data->gfx_fd,
-									    crtc->crtc_index,
-									    0) + 1;
+						fliphw = igt_crtc_get_vblank(crtc,
+									     0) + 1;
 
 						if (!have_crc) {
 							igt_pipe_crc_get_for_frame(data->gfx_fd,
-- 
2.52.0

