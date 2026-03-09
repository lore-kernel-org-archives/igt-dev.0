Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01FBF41807
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 16:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632B210E551;
	Mon,  9 Mar 2026 16:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CpQCVWQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9706110E551
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 16:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773073399; x=1804609399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ft2SysvgqpJCc8rDW6pAlBfEf07zGpMV0rB7U2uI8QE=;
 b=CpQCVWQFpdQvzaAq5DgXJ4PLbiTM7Jt+YQWBEg6kagkgG8uX9jT10iqf
 fh1ELjvFuzqrDT/IuJLteH6iJVUFyJfMtpwLTfTEeppX61eWgTcOHg3Zv
 MEyrM2FA6E7PVeQEmzlhhzkYe2td4DG4vjn5/KJvMXEHIAwI93ztW92MU
 gdpJy7MOIP22M5XYNKgc6d8eJkjiqbLsafnki3VkpJGmaKE7nvm2abPKy
 GFfPckk7RwtToUG66avnUG/3omw/KUXdljZO9MgGcmVNf9EhSWuctjhgE
 mz83Xa1+SLiLkgMIiDRamiF6C7vfuvNlsBpcTyvrxv/0F1m8jGqMXUehY g==;
X-CSE-ConnectionGUID: vcMDP+0bT3e69mF2hRc1Fg==
X-CSE-MsgGUID: HI6M8Br8SqaisJunwyb0/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77707863"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77707863"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 09:23:19 -0700
X-CSE-ConnectionGUID: aFCpE7rkTfmVTmat5luHeQ==
X-CSE-MsgGUID: gigX/2AMQRKu3USRPcEpFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224254119"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 09:23:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_cdclk: use igt_next_crtc()
Date: Mon,  9 Mar 2026 18:23:11 +0200
Message-ID: <20260309162311.706849-1-jani.nikula@intel.com>
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

The test doesn't care about pipes, but rather just another CRTC, so
prefer igt_next_crtc() over igt_crtc_for_pipe(). The i < count loop is
really just about count here, not about specific pipes.

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

