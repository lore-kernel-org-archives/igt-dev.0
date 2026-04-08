Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03B4FD5F70
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 05:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BDE10E11A;
	Wed,  8 Apr 2026 05:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPqTnUGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94AD10E11A
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 05:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775624622; x=1807160622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mw2xSDuMiKRSrt32U0Q/XzQfT7t4dv074KiixOkvRXE=;
 b=bPqTnUGk8Ld6vLdET4m9ciJwm8Xm7DiND6UcTxjrz7BUErGrt0AQbbth
 azxaVRRwbdYr1s/hF5jTfYT9xbuHP4BiSnE4/BXLCZbiMu5ov1ClpG2kq
 jmGlD+//Qj226V4I7SrUVUWRvNn6HbVTrSHpCwmROEv3/sx7yHLLZmRxd
 uprKMwjoDtmDLDf5YkseZETnJ4vA4Vx/nL/hQubgztuzj0RPJPA+Mm4yg
 f+JH2nxf5gXMdVDuz5Tjl9vAfIk7+TcRZ2NOdUYqGFzSj+OJMmC8nkEXo
 mzlACGpA7xja0YkftFB/l4B1KknqtLqPE/kCNSYfozTuAdh5uEmmTUB9L A==;
X-CSE-ConnectionGUID: mINPcLjjSmqVziwAC3lZUg==
X-CSE-MsgGUID: dd8h+03ZTCeypebP5wQ+iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="86890003"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="86890003"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 22:03:41 -0700
X-CSE-ConnectionGUID: ZQ2S0DCIQdGOXwPdKMhswQ==
X-CSE-MsgGUID: 3GpQznCQQ9K1GAyiopt6QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="224078188"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa010.fm.intel.com with ESMTP; 07 Apr 2026 22:03:39 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/kms_pm_backlight: Setup output before
 reading writing backlight
Date: Wed,  8 Apr 2026 10:33:27 +0530
Message-Id: <20260408050326.1569511-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260407054302.1454584-1-suraj.kandpal@intel.com>
References: <20260407054302.1454584-1-suraj.kandpal@intel.com>
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
Reviewed-by: Karthik B S <karthik.b.s@intel.com> #V2
---
v1 -> v2:
- Remove setup and commit function from check dpms as it is not
needed there (Karthik)

v2 -> v3:
- Redesign to make sure we are not creating FB's every 10ms before
moving backlight (Karthik)
- Make sure we are releasing all the FB's we are creating
  (Karthik/Ramanaidu)

 lib/igt_kms.h                  |  3 ++
 tests/intel/kms_pm_backlight.c | 60 +++++++++++++++++++++++++++++++---
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f994d91d3..69cca327d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -550,6 +550,9 @@ typedef struct {
 typedef struct {
 	int max;
 	int old;
+	int color_flag;
+	struct igt_fb green;
+	struct igt_fb red;
 	igt_output_t *output;
 	char path[PATH_MAX];
 	char backlight_dir_path[PATH_MAX];
diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index daa70c716..58c0b4427 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -84,6 +84,44 @@ enum {
 
 IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
 
+static void cleanup_fbs(igt_backlight_context_t *context)
+{
+	igt_output_t *output = context->output;
+	igt_display_t *display = output->display;
+
+	igt_remove_fb(display->drm_fd, &context->red);
+	igt_remove_fb(display->drm_fd, &context->green);
+}
+
+static void create_color_fbs(igt_backlight_context_t *context)
+{
+	drmModeModeInfo *mode;
+	igt_output_t *output = context->output;
+	igt_display_t *display = output->display;
+
+	mode = igt_output_get_mode(output);
+	igt_create_color_pattern_fb(display->drm_fd, mode->hdisplay,
+				    mode->vdisplay,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    1.f, 0.f, 0.f, &context->red);
+	igt_create_color_pattern_fb(display->drm_fd, mode->hdisplay,
+				    mode->vdisplay,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    0.f, 1.f, 0.f, &context->green);
+}
+
+static void commit_new_color(igt_backlight_context_t *context)
+{
+	igt_output_t *output = context->output;
+	igt_display_t *display = output->display;
+	igt_plane_t *primary;
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, context->color_flag ? &context->green : &context->red);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+	context->color_flag ^= 1;
+}
+
 static void test_and_verify(igt_backlight_context_t *context, int val)
 {
 	const int tolerance = val * TOLERANCE / 100;
@@ -131,12 +169,16 @@ static void test_fade(igt_backlight_context_t *context)
 	int i;
 	static const struct timespec ts = { .tv_sec = 0, .tv_nsec = FADESPEED*1000000 };
 
+	create_color_fbs(context);
+
 	/* Fade out, then in */
 	for (i = context->max; i > 0; i -= context->max / FADESTEPS) {
+		commit_new_color(context);
 		test_and_verify(context, i);
 		nanosleep(&ts, NULL);
 	}
 	for (i = 0; i <= context->max; i += context->max / FADESTEPS) {
+		commit_new_color(context);
 		test_and_verify(context, i);
 		nanosleep(&ts, NULL);
 	}
@@ -164,15 +206,21 @@ check_suspend(igt_output_t *output)
 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 }
 
-static void test_cleanup(igt_display_t *display, igt_output_t *output)
+static void test_cleanup(igt_display_t *display, igt_backlight_context_t *context)
 {
+	igt_output_t *output = context->output;
+	igt_plane_t *primary;
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
 	igt_output_set_crtc(output, NULL);
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	igt_pm_restore_sata_link_power_management();
 }
 
-static void test_setup(igt_display_t display, igt_output_t *output)
+static void test_setup(igt_display_t display, igt_backlight_context_t *context)
 {
+	igt_output_t *output = context->output;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	struct igt_fb fb;
@@ -292,7 +340,7 @@ int igt_main()
 		igt_describe(tests[i].desc);
 		igt_subtest_with_dynamic(tests[i].name) {
 			for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
-				test_setup(display, &contexts->output[j]);
+				test_setup(display, &contexts[j]);
 
 				if (tests[i].flags == TEST_DPMS)
 					igt_pm_dpms_toggle(contexts[j].output);
@@ -302,7 +350,7 @@ int igt_main()
 
 				igt_dynamic_f("%s", igt_output_name(contexts[j].output)) {
 					tests[i].test_t(&contexts[j]);
-					test_cleanup(&display, contexts[j].output);
+					test_cleanup(&display, &contexts[j]);
 				}
 			}
 		}
@@ -310,8 +358,10 @@ int igt_main()
 
 	igt_fixture() {
 		/* Restore old brightness */
-		for (i = 0; i < (dual_edp ? 2 : 1); i++)
+		for (i = 0; i < (dual_edp ? 2 : 1); i++) {
 			igt_backlight_write(contexts[i].old, "brightness", &contexts[i]);
+			cleanup_fbs(&contexts[i]);
+		}
 
 		igt_display_fini(&display);
 		igt_pm_restore_sata_link_power_management();
-- 
2.34.1

