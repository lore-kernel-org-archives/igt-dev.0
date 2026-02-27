Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796AEFD530D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A4510EA53;
	Fri, 27 Feb 2026 08:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jM2LvjL8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6BB10EA54
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179679; x=1803715679;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=moQYhJdnByCvMoX9h1LRoHDgXQR38JDl6LUhmhfv90k=;
 b=jM2LvjL8oS0T4Ex2QV21cdLkG5+V5nBl3e0PWsDfANmhxXm3DGRYvfTU
 x1meeql5Jt9W3ppCOlhHZaUT9bHBW9qYqCPwfWO19pGrQwwfKM8Eqbraa
 YnLg8afxXibWvyVUBDgfGbetEUeg+OT+4bxuEZkEPIinF66SpqqMHtpK9
 /GVdLk7Lu6CcOj4bDO523sGqY+JimbG327/8j32mHIq1hj7VB850sG2T9
 9U0CAGcsgb/HTN17u9vvHacGXtzAbBc0fBC6bfgxrSN2xZd3/nrNlbrby
 Aev4ttxXRSxXL5BkK0QKbj+XefDyOy8QO+gUALlRJ5oOwkOtX7B3o19Eh Q==;
X-CSE-ConnectionGUID: 8tgEBscRSjaJQc0SHFjeDQ==
X-CSE-MsgGUID: /Ux4VdToR0C440/ahUceGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83893259"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="83893259"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:59 -0800
X-CSE-ConnectionGUID: gAwqI6HESD6L6aIZRmolKw==
X-CSE-MsgGUID: IARQPGZoQH+t9gyZMCsyFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="214278258"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:58 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 15/17] tests/kms: Pass crtc_index to kmstest_get_vblank()
Date: Fri, 27 Feb 2026 10:06:51 +0200
Message-ID: <20260227080653.30389-16-ville.syrjala@linux.intel.com>
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

kmstest_get_vblank() is supposed to take the crtc_index
rather than the pipe. Make it so.

 #include "scripts/iterators.cocci"

@@
typedef igt_crtc_t;
igt_crtc_t *CRTC;
expression FD;
@@
kmstest_get_vblank(FD,
-	CRTC->pipe
+ 	CRTC->crtc_index
	,...)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/drm_read.c          |   4 +-
 tests/kms_cursor_legacy.c | 105 ++++++++++++++++++++++++++------------
 tests/kms_plane.c         |   5 +-
 tests/kms_rotation_crc.c  |   4 +-
 4 files changed, 80 insertions(+), 38 deletions(-)

diff --git a/tests/drm_read.c b/tests/drm_read.c
index 23b9ebe0faa3..2823238f6668 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -79,7 +79,7 @@ static void assert_empty(int fd)
 
 static void generate_event(int fd, igt_crtc_t *crtc)
 {
-	igt_assert(kmstest_get_vblank(fd, crtc->pipe, DRM_VBLANK_EVENT));
+	igt_assert(kmstest_get_vblank(fd, crtc->crtc_index, DRM_VBLANK_EVENT));
 }
 
 static void wait_for_event(int fd)
@@ -305,7 +305,7 @@ int igt_main()
 		}
 
 		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
-		igt_require(kmstest_get_vblank(fd, crtc->pipe, 0));
+		igt_require(kmstest_get_vblank(fd, crtc->crtc_index, 0));
 	}
 
 	igt_subtest("invalid-buffer")
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 3d5b8b851383..5cbb97676dea 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -778,10 +778,13 @@ static void basic_flip_cursor(igt_display_t *display,
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	/* Quick sanity check that we can update a cursor in a single vblank */
-	vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
-	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
+	vblank_start = kmstest_get_vblank(display->drm_fd, crtc->crtc_index,
+					  DRM_VBLANK_NEXTONMISS);
+	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+		      vblank_start);
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
-	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
+	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+		      vblank_start);
 
 	for (i = 0; i < 25; i++) {
 		bool miss;
@@ -796,7 +799,9 @@ static void basic_flip_cursor(igt_display_t *display,
 					    .dependency = fb_info.gem_handle);
 
 		/* Start with a synchronous query to align with the vblank */
-		vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
+		vblank_start = kmstest_get_vblank(display->drm_fd,
+						  crtc->crtc_index,
+						  DRM_VBLANK_NEXTONMISS);
 
 		switch (order) {
 		case FLIP_BEFORE_CURSOR:
@@ -810,7 +815,8 @@ static void basic_flip_cursor(igt_display_t *display,
 				break;
 			}
 
-			delta = kmstest_get_vblank(display->drm_fd, crtc->pipe, 0) - vblank_start;
+			delta = kmstest_get_vblank(display->drm_fd,
+						   crtc->crtc_index, 0) - vblank_start;
 			miss = delta != 0;
 
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
@@ -819,7 +825,8 @@ static void basic_flip_cursor(igt_display_t *display,
 		case FLIP_AFTER_CURSOR:
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
 
-			delta = kmstest_get_vblank(display->drm_fd, crtc->pipe, 0) - vblank_start;
+			delta = kmstest_get_vblank(display->drm_fd,
+						   crtc->crtc_index, 0) - vblank_start;
 			miss = delta != 0;
 
 			switch (mode) {
@@ -833,7 +840,8 @@ static void basic_flip_cursor(igt_display_t *display,
 			}
 		}
 
-		delta = kmstest_get_vblank(display->drm_fd, crtc->pipe, 0) - vblank_start;
+		delta = kmstest_get_vblank(display->drm_fd, crtc->crtc_index,
+					   0) - vblank_start;
 
 		if (spin) {
 			struct pollfd pfd = { display->drm_fd, POLLIN };
@@ -857,7 +865,8 @@ static void basic_flip_cursor(igt_display_t *display,
 		if (miss1)
 			continue;
 
-		delta = kmstest_get_vblank(display->drm_fd, crtc->pipe, 0) - vblank_start;
+		delta = kmstest_get_vblank(display->drm_fd, crtc->crtc_index,
+					   0) - vblank_start;
 
 		if (!mode_requires_extra_vblank(mode))
 			miss2 += delta != 1;
@@ -893,13 +902,16 @@ get_cursor_updates_per_vblank(igt_display_t *display, igt_crtc_t *crtc,
 	int target;
 
 	for (target = 65536; target; target /= 2) {
-		unsigned vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
+		unsigned vblank_start = kmstest_get_vblank(display->drm_fd,
+							   crtc->crtc_index,
+							   DRM_VBLANK_NEXTONMISS);
 
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
+		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+			      vblank_start);
 
 		for (int n = 0; n < target; n++)
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, arg);
-		if (kmstest_get_vblank(display->drm_fd, crtc->pipe, 0) == vblank_start)
+		if (kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0) == vblank_start)
 			break;
 	}
 
@@ -953,11 +965,14 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 	else
 		target = 1;
 
-	vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
-	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
+	vblank_start = kmstest_get_vblank(display->drm_fd, crtc->crtc_index,
+					  DRM_VBLANK_NEXTONMISS);
+	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+		      vblank_start);
 	for (int n = 0; n < target; n++)
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
-	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
+	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+		      vblank_start);
 
 	/*
 	 * There are variations caused by using cpu frequency changing. To
@@ -995,7 +1010,9 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[nloops & 1]);
 
 		/* Start with a synchronous query to align with the vblank */
-		vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
+		vblank_start = kmstest_get_vblank(display->drm_fd,
+						  crtc->crtc_index,
+						  DRM_VBLANK_NEXTONMISS);
 		switch (mode) {
 		default:
 			flip_nonblocking(display, crtc, mode >= flip_test_atomic, &fb_info, NULL);
@@ -1007,25 +1024,31 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 		}
 
 		/* The nonblocking flip should not have delayed us */
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
+		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+			      vblank_start);
 		for (int n = 0; n < target; n++)
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[nloops & 1]);
 
 		/* Nor should it have delayed the following cursor update */
 		if (!cursor_slowpath(display, mode))
-			igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
+			igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+				      vblank_start);
 		else if (mode_requires_extra_vblank(mode))
-			igt_assert_lte(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start + 2);
+			igt_assert_lte(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+				       vblank_start + 2);
 		else
-			igt_assert_lte(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start + 1);
+			igt_assert_lte(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+				       vblank_start + 1);
 
 		igt_set_timeout(1, "Stuck page flip");
 		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
 
 		if (!mode_requires_extra_vblank(mode))
-			igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start + 1);
+			igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+				      vblank_start + 1);
 		else
-			igt_assert_lte(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start + 2);
+			igt_assert_lte(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+				       vblank_start + 2);
 
 		igt_reset_timeout();
 	} while (nloops--);
@@ -1234,7 +1257,9 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 		 * Try a page flip on crtc 1, if we succeed pump page flips and
 		 * modesets interleaved, else do a single atomic commit with both.
 		 */
-		vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
+		vblank_start = kmstest_get_vblank(display->drm_fd,
+						  crtc->crtc_index,
+						  DRM_VBLANK_NEXTONMISS);
 		igt_plane_set_fb(plane, &fb_info);
 		ret = igt_display_try_commit_atomic(display, flags, (void*)(ptrdiff_t)vblank_start);
 		igt_assert(!ret || ret == -EBUSY);
@@ -1266,10 +1291,14 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 			goto done;
 		}
 	} else {
-		vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
+		vblank_start = kmstest_get_vblank(display->drm_fd,
+						  crtc->crtc_index,
+						  DRM_VBLANK_NEXTONMISS);
 		flip_nonblocking(display, crtc, atomic, &fb_info, (void*)(ptrdiff_t)vblank_start);
 
-		vblank_start = kmstest_get_vblank(display->drm_fd, crtc2->pipe, DRM_VBLANK_NEXTONMISS);
+		vblank_start = kmstest_get_vblank(display->drm_fd,
+						  crtc2->crtc_index,
+						  DRM_VBLANK_NEXTONMISS);
 		flip_nonblocking(display, crtc2, atomic, &fb2_info, (void*)(ptrdiff_t)vblank_start);
 	}
 
@@ -1294,7 +1323,9 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 		}
 
 		if (vbl.crtc_id == crtc->crtc_id) {
-			vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
+			vblank_start = kmstest_get_vblank(display->drm_fd,
+							  crtc->crtc_index,
+							  DRM_VBLANK_NEXTONMISS);
 			flip_nonblocking(display, crtc, atomic, &fb_info, (void*)(ptrdiff_t)vblank_start);
 		} else {
 			igt_assert(vbl.crtc_id == crtc2->crtc_id);
@@ -1302,7 +1333,9 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 			nloops--;
 
 			if (!modeset) {
-				vblank_start = kmstest_get_vblank(display->drm_fd, crtc2->pipe, DRM_VBLANK_NEXTONMISS);
+				vblank_start = kmstest_get_vblank(display->drm_fd,
+								  crtc2->crtc_index,
+								  DRM_VBLANK_NEXTONMISS);
 				flip_nonblocking(display, crtc2, atomic, &fb2_info, (void*)(ptrdiff_t)vblank_start);
 			} else {
 				igt_output_set_crtc(output2,
@@ -1625,18 +1658,22 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 
 	/* Disable cursor, and immediately queue a flip. Check if resulting crc is correct. */
 	for (int i = 1; i >= 0; i--) {
-		vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
+		vblank_start = kmstest_get_vblank(display->drm_fd,
+						  crtc->crtc_index,
+						  DRM_VBLANK_NEXTONMISS);
 
 		flip_nonblocking(display, crtc, atomic, &fb_info, NULL);
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[i]);
 
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
+		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+			      vblank_start);
 
 		igt_set_timeout(1, "Stuck page flip");
 		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
 		igt_reset_timeout();
 
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start + 1);
+		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+			      vblank_start + 1);
 
 		igt_pipe_crc_collect_crc(pipe_crc, &crcs[2]);
 
@@ -1730,12 +1767,15 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 				    .dependency = fb_info[1].gem_handle,
 				    .dependency_size = fb_info[1].size);
 
-		vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
+		vblank_start = kmstest_get_vblank(display->drm_fd,
+						  crtc->crtc_index,
+						  DRM_VBLANK_NEXTONMISS);
 
 		flip_nonblocking(display, crtc, atomic, &fb_info[1], NULL);
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[i]);
 
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
+		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0),
+			      vblank_start);
 
 		igt_pipe_crc_get_current(display->drm_fd, pipe_crc, &test_crc);
 
@@ -1745,7 +1785,8 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
 		igt_reset_timeout();
 
-		igt_assert_lte(vblank_start + 1, kmstest_get_vblank(display->drm_fd, crtc->pipe, 0));
+		igt_assert_lte(vblank_start + 1,
+			       kmstest_get_vblank(display->drm_fd, crtc->crtc_index, 0));
 
 		igt_plane_set_fb(plane_primary, &fb_info[0]);
 		igt_display_commit2(display, COMMIT_UNIVERSAL);
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 15924f550ebf..cdb7884fdfe2 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -834,7 +834,7 @@ restart_round:
 			 */
 			if (i >= 1)
 				vblank[i - 1] = kmstest_get_vblank(data->drm_fd,
-								   crtc->pipe,
+								   crtc->crtc_index,
 								   0) + 1;
 
 			/*
@@ -871,7 +871,8 @@ restart_round:
 		 * The last crc is available earliest one
 		 * frame after the last flip latched.
 		 */
-		vblank[i - 1] = kmstest_get_vblank(data->drm_fd, crtc->pipe,
+		vblank[i - 1] = kmstest_get_vblank(data->drm_fd,
+						   crtc->crtc_index,
 						   0) + 1;
 	}
 
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 0d3e17a32593..cf0ca78287c1 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -1023,7 +1023,7 @@ static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
 
 							igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 							flipsw = kmstest_get_vblank(data->gfx_fd,
-										    crtc->pipe,
+										    crtc->crtc_index,
 										    0) + 1;
 							have_crc = false;
 						}
@@ -1038,7 +1038,7 @@ static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
 
 						igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 						fliphw = kmstest_get_vblank(data->gfx_fd,
-									    crtc->pipe,
+									    crtc->crtc_index,
 									    0) + 1;
 
 						if (!have_crc) {
-- 
2.52.0

