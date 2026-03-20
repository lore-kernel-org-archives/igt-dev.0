Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27292108B8E9
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 10:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94C110E97C;
	Fri, 20 Mar 2026 10:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8XJPLzw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6166F10E97C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 10:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774003187; x=1805539187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JeS+EUrFXu9fGwxQtajPsOMUd90o2JehwiCMulb/5U0=;
 b=n8XJPLzw1CIwT4iPmBd2pruoci8m/U4TqiD/aQfvLQtr/WrrERDX9SEX
 eRf3OvoP37Vuy1kFMC9ZAEdc7/PPHonRViOWCKsS0gHgBG9iHFuxohs9+
 HorhlIqW3bTVOSioEQIlQEDUP67Cf0OMpvtAq4HXjg+1qcuJayCwG+aqe
 2W3UAZsXg/Cyx0bJBXTbUWjvprWzGzyymLrG/HZBrjoma7mkXSnqEyMsY
 7jq16omG6nSqnO43AsXFwLG2jR0SAYmdBGs1u16O0lsWah3uFXD9sb89b
 0XKa1sAfFdghEJV0m4LWAQD9LoDmabeMafCBPjCwrC6w+sJpeGUxCqFGl A==;
X-CSE-ConnectionGUID: OU4s5AncRca6eQUhQYi5mg==
X-CSE-MsgGUID: Awep0GorQHSmRvqseBLeWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75159032"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75159032"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:39:47 -0700
X-CSE-ConnectionGUID: daTtxcogTIK4hqVPYXXGcA==
X-CSE-MsgGUID: Q4AIw4rARUe45l0qNkdHAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="222473342"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:39:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, Mika Kahola <mika.kahola@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t v2 02/11] tests/intel/kms_cdclk: use igt_next_crtc()
Date: Fri, 20 Mar 2026 12:39:22 +0200
Message-ID: <fb72360008ab66d863c8a5dc02a2d6f60622c59e.1774002591.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774002591.git.jani.nikula@intel.com>
References: <cover.1774002591.git.jani.nikula@intel.com>
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

The test doesn't care about pipes, but rather just another CRTC, so
prefer igt_next_crtc() over igt_crtc_for_pipe(). The i < count loop is
really just about count here, not about specific pipes.

Reviewed-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/kms_cdclk.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 20b8a5f0a018..662bdbe439e5 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -240,10 +240,13 @@ static void set_mode(data_t *data, int count, drmModeModeInfo *mode,
 		     igt_output_t **valid_outputs, struct igt_fb fb)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = NULL;
 
 	for (int i = 0; i < count; i++) {
-		igt_crtc_t *crtc = igt_crtc_for_pipe(display, i);
-		igt_plane_t *plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_t *plane;
+
+		crtc = igt_next_crtc(display, crtc);
+		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 
 		igt_output_override_mode(valid_outputs[i], &mode[i]);
 
@@ -259,6 +262,7 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	drmModeModeInfo *mode, mode_highres[IGT_MAX_PIPES] = {0}, mode_lowres[IGT_MAX_PIPES] = {0};
 	igt_output_t *valid_outputs[IGT_MAX_PIPES] = {NULL};
 	igt_output_t *output;
+	igt_crtc_t *crtc = NULL;
 	int count = 0;
 	int cdclk_ref, cdclk_new;
 	uint16_t width = 0, height = 0;
@@ -288,7 +292,7 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		      "Number of valid outputs (%d) must be greater than or equal to 2\n", count);
 
 	for (int i = 0; i < count; i++) {
-		igt_crtc_t *crtc = igt_crtc_for_pipe(display, i);
+		crtc = igt_next_crtc(display, crtc);
 
 		mode = igt_output_get_mode(valid_outputs[i]);
 		igt_assert(mode);
-- 
2.47.3

