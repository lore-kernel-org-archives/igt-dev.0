Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03842FB5179
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 05:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA5910E330;
	Tue,  7 Apr 2026 05:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNXTjo+X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B71210E222
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 05:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775540591; x=1807076591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HNA+1lGhAjMYMG7bI5GuEjZbTDCLMOqSnJwXmNkax8A=;
 b=iNXTjo+X/x/SzsVLfQByVDvdROHuS3yZAnMyfWLiQGtb1+7vnZhZtign
 y1q0U6jJIeDTUbceUINVz6UjaCUDbfmbkXZSHkCszQIzOk1W2XzetxuMY
 lWDkFnvG7rTQeQL5LDwCPvux/fTMyjnVprkCi7HXKu4Ujbvz0JciZ8Bwj
 8aHZ1GZTA9WSY1EDF/NTT6hFnyzTphpbPtsffhlp2hS1wfikE5RztRePH
 VHJHkPjzmb3sDcD4wB+o+Z2SoWGlWzx20tdA6cJpe5IROK2Smwr2q3llV
 IKSTJKaF2gay7l17HHCYi5aLCkNoFFiom5EeXPM2s2FRCxFmPoyIwMRLE Q==;
X-CSE-ConnectionGUID: TZBtVB7IRICWX7Lhhq3p6w==
X-CSE-MsgGUID: oHZ+jdeGRJCQkdcIR6JzSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76460528"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76460528"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:43:10 -0700
X-CSE-ConnectionGUID: rV8UQV2/Td+f5EJh1JSe3A==
X-CSE-MsgGUID: MFUobhwtT7a3+tWknqSKuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228015635"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 22:43:09 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_pm_backlight: Setup output before
 reading writing backlight
Date: Tue,  7 Apr 2026 11:13:02 +0530
Message-Id: <20260407054302.1454584-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331073400.1316874-1-suraj.kandpal@intel.com>
References: <20260331073400.1316874-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
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

Currently many pm backlight tests assume that panel will stay up until
unless we tell it to go down or AUX transactions are happening.
That is not the case, some panels when they detect that there are no
changes or commits going in, it will go to a lower power state. This
causes issue in this test like AUX suddenly timing out (mostly in
fade tests where each backlight change has a 10ms sleep and many
steps giving panel to internally go in low power state). Also since
changing backlight has its own interface it does not count as a commit
hence does not contribute to the panel staying on.
Also trying to change a backlight when panel is not up does not make sense.
To solve this setup the output and do a flip to make sure panel is not
down to simulate a real life use case on when backlight is changed.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
v1 -> v2:
- Remove setup and commit function from check dpms as it is not
needed there (Karthik)

 tests/intel/kms_pm_backlight.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index daa70c716..f108e8387 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -84,6 +84,24 @@ enum {
 
 IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
 
+static void setup_output_and_commit(igt_backlight_context_t *context)
+{
+	igt_output_t *output = context->output;
+	igt_display_t *display = output->display;
+	drmModeModeInfo *mode;
+	igt_plane_t *primary;
+	struct igt_fb fb;
+
+	mode = igt_output_get_mode(output);
+	igt_create_pattern_fb(display->drm_fd,
+			      mode->hdisplay, mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR, &fb);
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+}
+
 static void test_and_verify(igt_backlight_context_t *context, int val)
 {
 	const int tolerance = val * TOLERANCE / 100;
@@ -133,10 +151,12 @@ static void test_fade(igt_backlight_context_t *context)
 
 	/* Fade out, then in */
 	for (i = context->max; i > 0; i -= context->max / FADESTEPS) {
+		setup_output_and_commit(context);
 		test_and_verify(context, i);
 		nanosleep(&ts, NULL);
 	}
 	for (i = 0; i <= context->max; i += context->max / FADESTEPS) {
+		setup_output_and_commit(context);
 		test_and_verify(context, i);
 		nanosleep(&ts, NULL);
 	}
-- 
2.34.1

