Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5682F01835
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 13:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1B510ED2E;
	Fri,  6 Mar 2026 13:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlFhKUb5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1CF10ED2E
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 13:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772803461; x=1804339461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6MZOt1MzpK8hcKIs2u5fylNDQgZ7C3UI6gBko15tZOM=;
 b=LlFhKUb5sgWpyu1UPsf6jFzx7sLs+RNUmtNBEKIfsIv/ksopP0FZRhH4
 r9spL1giB5k3q7HmjJnYM/W6AS7ibZ7MNRPgSu178PdkGoKLXcUW/Let8
 u6ILNnXeLZqS//FQ2z8vQM4TNB7uB2y3bTYFlYj8rAOJCj696GX08Gn23
 1u6uVI15R5IhfVAKomITmLOyg9Bg4AM1vblTO0jWk75SXnvqxVAHTkfFO
 Whr0O/yWkP845amK2o9hYXfwUCpB87Mhy6fWpYKXNfybFvnuLW2/Rhf4D
 s614Ixk+tRkDjDoHRPCf310pukmH04HmlqhIOvW8oJcKNaIqvCtFqAode Q==;
X-CSE-ConnectionGUID: 343rXxbnTkK8Ge7mvlP2qQ==
X-CSE-MsgGUID: u/0CmqFlT+KqJwo/Zf7BNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="72933829"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="72933829"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:24:21 -0800
X-CSE-ConnectionGUID: pPDpx7AUTfukTnuKvedzTw==
X-CSE-MsgGUID: J7GsfzyFTwO+xJtFPV8OrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="256931471"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:24:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 3/5] tests/intel/xe_pxp: use igt_next_crtc()
Date: Fri,  6 Mar 2026 15:23:56 +0200
Message-ID: <34dada0e1691a1cf1afee07df22975a4b31f4ee3.1772803372.git.jani.nikula@intel.com>
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
 tests/intel/xe_pxp.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index d45bd8feab97..932007873394 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -881,8 +881,8 @@ static void test_display_pxp_fb(int fd, igt_display_t *display)
 	drmModeModeInfo *mode;
 	igt_fb_t ref_fb, pxp_fb;
 	igt_plane_t *plane;
-	igt_crtc_t *crtc;
-	int width = 0, height = 0, i = 0;
+	igt_crtc_t *crtc = NULL;
+	int width = 0, height = 0;
 	uint32_t q;
 	uint32_t vm;
 
@@ -902,15 +902,13 @@ static void test_display_pxp_fb(int fd, igt_display_t *display)
 	/* Do a modeset on all outputs */
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
-		crtc = igt_crtc_for_pipe(display, i);
+		crtc = igt_next_crtc(display, crtc);
 		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_crtc_connector_valid(crtc, output));
 		igt_output_set_crtc(output,
 				    crtc);
 
 		commit_fb(display, plane, &ref_fb, mode);
-
-		i++;
 	}
 
 	/* Create an encrypted FB with the same contents as ref_fb */
@@ -938,8 +936,8 @@ static void test_display_black_pxp_fb(int fd, igt_display_t *display)
 	drmModeModeInfo *mode;
 	igt_fb_t ref_fb, pxp_fb;
 	igt_plane_t *plane;
-	igt_crtc_t *crtc;
-	int width = 0, height = 0, i = 0;
+	igt_crtc_t *crtc = NULL;
+	int width = 0, height = 0;
 	uint32_t q;
 	uint32_t vm;
 
@@ -960,7 +958,7 @@ static void test_display_black_pxp_fb(int fd, igt_display_t *display)
 	/* Do a modeset on all outputs */
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
-		crtc = igt_crtc_for_pipe(display, i);
+		crtc = igt_next_crtc(display, crtc);
 		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_crtc_connector_valid(crtc, output));
 		igt_output_set_crtc(output,
@@ -971,7 +969,6 @@ static void test_display_black_pxp_fb(int fd, igt_display_t *display)
 		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
 
 		igt_display_commit2(display, COMMIT_ATOMIC);
-		i++;
 	}
 
 	/* Create an fb filled with a non-black color */
-- 
2.47.3

