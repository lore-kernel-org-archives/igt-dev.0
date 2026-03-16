Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0F5F46452
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D42C10E3B9;
	Mon, 16 Mar 2026 11:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgWSiS72";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36A710E4B3
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773659986; x=1805195986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tl7lt3N40RN+x8lJuKX9UAe/OGXynjFF1dIGNkmiRjo=;
 b=WgWSiS72gwMY1Ae36MnUY1Gq/m2zkum3Os+MccEReLgPN7rjXZqKHgUH
 FO33c4i5RfipmzPKPmMqxyiB2JF8Sx4rwU4FoCO4Xdp+7hPigEetuI2Em
 dofj+mcd+bSi1Vvu7v+azGtlRQrC9bBPILM+pCkxofihuseyoLoZt5OeN
 zM2BaQqv37eZ30x/etCAku9sUS84o0IA9yvb5jaEPxAxtrOzMvx7Cnk/N
 2TBD44eSwPD7L7hjXtBVy+/SFPF6b7jbUE+oKxLy6rRCm6kzIQ5ZAQN2f
 CljDHTJ/r07imUiaiqDzF9xPrkzDUUebCiKDdTbNP7ZbcLL/PSSwCtkOM Q==;
X-CSE-ConnectionGUID: BdJd54BVQZmoG2V3xxZ0FA==
X-CSE-MsgGUID: nXEtA5kZQLexfp9F2YmBlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74859411"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74859411"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:45 -0700
X-CSE-ConnectionGUID: 3c8MmARTSqKOLQRTArCtoQ==
X-CSE-MsgGUID: Pvhw2e5QRg23XrImLwqUPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="252401158"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t 03/12] tests/intel/kms_cdclk: use igt_next_crtc()
Date: Mon, 16 Mar 2026 13:19:05 +0200
Message-ID: <58d147a0dad891911d57a8a697b2352d0074e9c1.1773659680.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773659680.git.jani.nikula@intel.com>
References: <cover.1773659680.git.jani.nikula@intel.com>
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

Reviewed-by: Mika Kahola <mika.kahola@intel.com>
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

