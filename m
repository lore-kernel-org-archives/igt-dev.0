Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4598D49C92
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5487C10E9B4;
	Fri, 30 Jan 2026 10:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXIpWr8V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7B310E9B4
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770370; x=1801306370;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=in5XjA9HFZguejRedhLbGbBb5Yu+4fdnkqpbl6SxUrg=;
 b=kXIpWr8V0TXBrOrTzj7B5kvyZyQQWIU402/LVND5DBTYAGiN8t8eJ+gr
 IYoyx1lD2CQ6pXHz1ir1t6Ql7vVUGCWsoX6dUIX7usuiqE1YOYpthMYCm
 zTHv7jX3SgpROjwcHNl+2Kg1PhkTBnaYHlrt0dT4hhzSSz5BT0WJmTxWV
 JJgQd8TbqrxddylMrJw3JkaS91WNQqh7AAkm2drrsTljAN8gn/+/jVpHW
 isCJaU/tJbUQv4aLK/4DZPeJ+PhqMaJx7nH6Of+tttMR68oOsGXYU1e1v
 HN7U7flSJoPUpmU0oB/7a5S6bQ2Beq7ShfxPpCVoK8GAZgL3vLoKUpnht w==;
X-CSE-ConnectionGUID: HQ8ggEoDQUaFiLxIQRN1uQ==
X-CSE-MsgGUID: pFagF36yQueHQNB8vpBFng==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88593135"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="88593135"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:52:50 -0800
X-CSE-ConnectionGUID: O8dwWf73QbyK1CyAwmMfxg==
X-CSE-MsgGUID: sd4oX0xpR565LZUTetcRuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="213354746"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:52:49 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/15] tests/drm_read: Use for_each_crtc*()
Date: Fri, 30 Jan 2026 12:52:24 +0200
Message-ID: <20260130105237.14481-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
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

Convert tests/drm_read to use the crtc based iterators
(as opposed to the old pipe based ones).

This one was done manually due to coccinelle refusing
to cooperate with me.

I left the old 'pipe' variable around since its final value
gets used in a bunch of places after the loop. I'll probably
need further cleanup later, but this seems sufficient for now.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/drm_read.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/drm_read.c b/tests/drm_read.c
index c44e207f7dd8..e745e98534bd 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -280,6 +280,7 @@ int igt_main()
 	igt_fixture() {
 		struct sigaction alarm_action = {};
 		igt_output_t *output;
+		igt_crtc_t *crtc;
 
 		igt_assert_neq(sigaction(SIGALRM, NULL, &alarm_action), -1);
 		alarm_action.sa_flags &= ~SA_RESTART;
@@ -292,16 +293,17 @@ int igt_main()
 		igt_display_require(&display, fd);
 		igt_display_require_output(&display);
 
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_crtc_with_valid_output(&display, crtc, output) {
 			drmModeModeInfo *mode = igt_output_get_mode(output);
 
 			igt_create_pattern_fb(fd, mode->hdisplay, mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
 					      DRM_FORMAT_MOD_LINEAR, &fb);
 
-			igt_output_set_crtc(output,
-				            igt_crtc_for_pipe(output->display, pipe));
+			igt_output_set_crtc(output, crtc);
 			igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), &fb);
+
+			pipe = crtc->pipe;
 			break;
 		}
 
-- 
2.52.0

