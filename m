Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF54F01835
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 13:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40F310ED33;
	Fri,  6 Mar 2026 13:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nle5WeQw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE6010ED33
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 13:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772803457; x=1804339457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rURr3Tqau7QOGwDby89NMKW6IATbUTlF8VrxxUi2Xm4=;
 b=nle5WeQwbzyjuAfCvIVD7Ewd6WQHjOQ6pEWnxiTVvyXYjsbl56DMRUS1
 wE2QhnMeUpL8q4ZeeNxJfw72+u6ycsIBVj+KTjG+IO6dTOuxu4+2ROgC6
 WmzY0tDgTXCG4H4VpQ/Z1DZdH8xbDEpY57cV3pDLp4lVcoVwoyMe5fLrI
 Y+KoiJCsrgwjWPw2zZll87XMEhOcuc884AVZ2v2OIFTX4roh6NccaZa1I
 7u6B5r9Ux1s6hp1Xs0XHH8NL6UidYXg7kQWlkbQBA1aJAAdsrJFaasK88
 bS1OFrPqBzMDla+RSp3zNye5K+zPe7m5/6rtWdSpy0aO5YJaN7BN0GZ+v w==;
X-CSE-ConnectionGUID: DJg/dvIYSUO+ywxUbDQliw==
X-CSE-MsgGUID: g+B38Wb8T8imJ+PZtKb8jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91297421"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="91297421"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:24:17 -0800
X-CSE-ConnectionGUID: IX04UezPRwKCG2ElLpIMRA==
X-CSE-MsgGUID: jvmpDLyhS72NjZ2grYt4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218237264"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:24:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 2/5] tests/intel/gem_pxp: use igt_next_crtc()
Date: Fri,  6 Mar 2026 15:23:55 +0200
Message-ID: <9a8d688c60d441b59544d1a4839596119a9c5e92.1772803372.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772803372.git.jani.nikula@intel.com>
References: <cover.1772803372.git.jani.nikula@intel.com>
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

The test doesn't care about pipes, but rather just another CRTC, so
prefer igt_next_crtc() over looping pipes and igt_crtc_for_pipe.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/gem_pxp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index 69a16d3420ce..d9c2bd4a2d7e 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1204,10 +1204,10 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 	drmModeModeInfo *mode;
 	igt_fb_t ref_fb, protected_fb;
 	igt_plane_t *plane;
-	igt_crtc_t *crtc;
+	igt_crtc_t *crtc = NULL;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t ref_crc, new_crc;
-	int width = 0, height = 0, i = 0, ret;
+	int width = 0, height = 0, ret;
 	uint32_t ctx;
 
 	ret = create_ctx_with_params(i915, true, true, true, false, &ctx);
@@ -1226,7 +1226,7 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 	/* Do a modeset on all outputs */
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
-		crtc = igt_crtc_for_pipe(display, i);
+		crtc = igt_next_crtc(display, crtc);
 		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_crtc_connector_valid(crtc, output));
 		igt_output_set_crtc(output,
@@ -1237,7 +1237,6 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
 
 		igt_display_commit2(display, COMMIT_ATOMIC);
-		i++;
 	}
 
 	setup_protected_fb(i915, width, height, &protected_fb, ctx);
-- 
2.47.3

