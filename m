Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E951FD374E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03FC10E76F;
	Wed, 25 Feb 2026 12:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izxfMksd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5471A10E76F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023936; x=1803559936;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gmskxLBb7+tjyqLmxyxTyEMKQPatmFK5SNSQo/rJwMU=;
 b=izxfMksdbKgOMtuqezAREKStKaR7Xx80Xg46bfsLpwbF8QN48DSIz4PW
 HJhd1lLvIkTIufT18jhdhigpmCx+aKm8MLFlkedxaeKh0NCFVKoAie9uR
 floZTfABE/XDhY/ioGUdPUtbmNinEVvltGnZ5vnBzZMlF59h2plionh+k
 AZ1zAjg+XQrjSj0/85dehLAu/P30nr7eBLmuXCU4ETK32kc71XlAx7IrQ
 00hyBioLG+Hnlhm3neFjZ/hvUcDE6FxKd8gD1V3t77729GT5WFtn73ZCV
 O8DsnSbwhHQipiUg21VPSZnLK0RvKEkisZmANDkItxAX/3ZnpCsu6cR93 g==;
X-CSE-ConnectionGUID: kP6S0NpHRvmq0EQluZ0kKQ==
X-CSE-MsgGUID: Liu05ZeNQIu7VrLejJDiLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="98527422"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="98527422"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:52:16 -0800
X-CSE-ConnectionGUID: u1elRetITtOgksCthg91Qw==
X-CSE-MsgGUID: XEjXpY9MQSuhVdPu8WvNKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="214344556"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:52:15 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 18/19] tests/kms: Use for_each_valid_output_on_crtc()
Date: Wed, 25 Feb 2026 14:51:07 +0200
Message-ID: <20260225125108.31119-19-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
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

Replace for_each_valid_output_on_pipe() with
for_each_valid_output_on_crtc(). Most callers already have
the crtc around anyway, the one exception is
igt_pipe_has_valid_output() which can be cleaned up later.

 #include "scripts/iterators.cocci"

@@
iterator name for_each_valid_output_on_pipe;
iterator name for_each_valid_output_on_crtc;
expression DISPLAY, PIPE, OUTPUT;
@@
- for_each_valid_output_on_pipe(DISPLAY, PIPE, OUTPUT)
+ for_each_valid_output_on_crtc(DISPLAY, igt_crtc_for_pipe(DISPLAY, PIPE), OUTPUT)
{ ... }

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
igt_plane_t *PLANE;
@@
- igt_crtc_for_pipe(..., PLANE->crtc->pipe)
+ PLANE->crtc

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                                 |  4 ++-
 tests/amdgpu/amd_abm.c                        | 18 ++++++----
 tests/chamelium/kms_chamelium_color.c         |  6 ++--
 .../kms_chamelium_sharpness_filter.c          |  6 ++--
 tests/intel/kms_dirtyfb.c                     |  4 +--
 tests/intel/kms_fbc_dirty_rect.c              | 15 ++++----
 tests/intel/kms_flip_scaled_crc.c             |  8 ++---
 tests/kms_atomic_transition.c                 |  9 +++--
 tests/kms_color.c                             |  7 ++--
 tests/kms_cursor_legacy.c                     |  4 ++-
 tests/kms_debugfs.c                           |  4 ++-
 tests/kms_display_modes.c                     |  4 ++-
 tests/kms_feature_discovery.c                 |  4 +--
 tests/kms_plane_lowres.c                      |  3 +-
 tests/kms_plane_multiple.c                    |  4 ++-
 tests/kms_plane_scaling.c                     | 36 ++++++++++++++-----
 tests/kms_properties.c                        |  4 ++-
 tests/kms_rotation_crc.c                      |  4 ++-
 18 files changed, 98 insertions(+), 46 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index ab27928e777f..7ae6916614fc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2827,7 +2827,9 @@ static bool igt_pipe_has_valid_output(igt_display_t *display, enum pipe pipe)
 
 	igt_require_pipe(display, pipe);
 
-	for_each_valid_output_on_pipe(display, pipe, output)
+	for_each_valid_output_on_crtc(display,
+				      igt_crtc_for_pipe(display, pipe),
+				      output)
 		return true;
 
 	return false;
diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 5cd40cfb91df..bd700b90f361 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -171,7 +171,8 @@ static void test_fini(data_t *data)
 	igt_output_t *output;
 
 	/* Disable ABM before exit test */
-	for_each_valid_output_on_pipe(&data->display, data->crtc->pipe,
+	for_each_valid_output_on_crtc(&data->display,
+				      data->crtc,
 				      output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
@@ -327,7 +328,8 @@ static void backlight_dpms_cycle(data_t *data)
 	int pwm_1, pwm_2;
 	igt_output_t *output;
 
-	for_each_valid_output_on_pipe(&data->display, data->crtc->pipe,
+	for_each_valid_output_on_crtc(&data->display,
+				      data->crtc,
 				      output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
@@ -359,7 +361,8 @@ static void backlight_monotonic_basic(data_t *data)
 	int brightness;
 	igt_output_t *output;
 
-	for_each_valid_output_on_pipe(&data->display, data->crtc->pipe,
+	for_each_valid_output_on_crtc(&data->display,
+				      data->crtc,
 				      output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
@@ -393,7 +396,8 @@ static void backlight_monotonic_abm(data_t *data)
 	int brightness;
 	igt_output_t *output;
 
-	for_each_valid_output_on_pipe(&data->display, data->crtc->pipe,
+	for_each_valid_output_on_crtc(&data->display,
+				      data->crtc,
 				      output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
@@ -426,7 +430,8 @@ static void abm_enabled(data_t *data)
 	int pwm, prev_pwm, pwm_without_abm;
 	igt_output_t *output;
 
-	for_each_valid_output_on_pipe(&data->display, data->crtc->pipe,
+	for_each_valid_output_on_crtc(&data->display,
+				      data->crtc,
 				      output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
@@ -460,7 +465,8 @@ static void abm_gradual(data_t *data)
 	int max_brightness;
 	igt_output_t *output;
 
-	for_each_valid_output_on_pipe(&data->display, data->crtc->pipe,
+	for_each_valid_output_on_crtc(&data->display,
+				      data->crtc,
 				      output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index e616ba438ae5..24d66f473ca2 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -460,7 +460,8 @@ static int test_setup(data_t *data, igt_crtc_t *crtc)
 	 * Prefer to run this test on HDMI connector if its connected, since on DP we
 	 * sometimes face DP FSM issue
 	 */
-        for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+        for_each_valid_output_on_crtc(&data->display,
+				      crtc,
 				      data->output) {
                 for (i = 0; i < data->port_count; i++) {
                         if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
@@ -470,7 +471,8 @@ static int test_setup(data_t *data, igt_crtc_t *crtc)
                 }
         }
 
-	for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+	for_each_valid_output_on_crtc(&data->display,
+				      crtc,
 				      data->output) {
 		for (i = 0; i < data->port_count; i++) {
 			if (strcmp(data->output->name,
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index a68b6c80ae16..14cdd2056693 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -189,7 +189,8 @@ static int test_setup(data_t *data, igt_crtc_t *crtc)
 	 * Prefer to run this test on HDMI connector if its connected, since on DP we
 	 * sometimes face DP FSM issue
 	 */
-        for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+        for_each_valid_output_on_crtc(&data->display,
+				      crtc,
 				      data->output) {
 		data->crtc = crtc;
 		for (i = 0; i < data->port_count; i++) {
@@ -200,7 +201,8 @@ static int test_setup(data_t *data, igt_crtc_t *crtc)
 		}
 	}
 
-	for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+	for_each_valid_output_on_crtc(&data->display,
+				      crtc,
 				      data->output) {
 		data->crtc = crtc;
 		for (i = 0; i < data->port_count; i++) {
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 47bb68f0753b..0ee0fe43c463 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -379,8 +379,8 @@ int igt_main()
 
 				data.crtc = crtc;
 
-				for_each_valid_output_on_pipe(&data.display,
-							      crtc->pipe,
+				for_each_valid_output_on_crtc(&data.display,
+							      crtc,
 							      data.output) {
 					data.mode = igt_output_get_mode(data.output);
 
diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index 54ac7266eafb..ce2da42dde8f 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -463,8 +463,9 @@ int igt_main()
 			data.crtc = crtc;
 			if (single_pipe)
 				break;
-			for_each_valid_output_on_pipe(&data.display,
-						      crtc->pipe, data.output) {
+			for_each_valid_output_on_crtc(&data.display,
+						      crtc,
+						      data.output) {
 				data.format = DRM_FORMAT_XRGB8888;
 
 				igt_dynamic_f("pipe-%s-%s",
@@ -488,8 +489,9 @@ int igt_main()
 			data.crtc = crtc;
 			if (single_pipe)
 				break;
-			for_each_valid_output_on_pipe(&data.display,
-						      crtc->pipe, data.output) {
+			for_each_valid_output_on_crtc(&data.display,
+						      crtc,
+						      data.output) {
 				data.format = DRM_FORMAT_XRGB8888;
 
 				igt_dynamic_f("pipe-%s-%s",
@@ -515,8 +517,9 @@ int igt_main()
 			data.crtc = crtc;
 			if (single_pipe)
 				break;
-			for_each_valid_output_on_pipe(&data.display,
-						      crtc->pipe, data.output) {
+			for_each_valid_output_on_crtc(&data.display,
+						      crtc,
+						      data.output) {
 				for (int i = 0; i < num_formats; i++) {
 					/* on simulation platforms , limit to single format */
 					if (data.is_simulation && i > 0)
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 83674d5c267f..18e7b4b5a44a 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -913,8 +913,8 @@ int igt_main()
 			free_fbs(&data);
 			for_each_crtc(&data.display, crtc) {
 				bool found = false;
-				for_each_valid_output_on_pipe(&data.display,
-							      crtc->pipe,
+				for_each_valid_output_on_crtc(&data.display,
+							      crtc,
 							      output) {
 					igt_display_reset(&data.display);
 
@@ -936,8 +936,8 @@ int igt_main()
 					}
 				}
 				if (!found) {
-					for_each_valid_output_on_pipe(&data.display,
-								      crtc->pipe,
+					for_each_valid_output_on_crtc(&data.display,
+								      crtc,
 								      output) {
 						igt_display_reset(&data.display);
 
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 80c6f49de274..d27924c9ae18 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -884,7 +884,8 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 
 		event_mask |= 1 << crtc->pipe;
 
-		for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+		for_each_valid_output_on_crtc(&data->display,
+					      crtc,
 					      output) {
 			if (igt_output_get_driving_crtc(output) != NULL)
 				continue;
@@ -979,7 +980,8 @@ retry:
 			data->pipe_crcs[crtc->pipe] = igt_crtc_crc_new(crtc,
 							      IGT_PIPE_CRC_SOURCE_AUTO);
 
-		for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+		for_each_valid_output_on_crtc(&data->display,
+					      crtc,
 					      output) {
 			if (igt_output_get_driving_crtc(output) != NULL)
 				continue;
@@ -1110,7 +1112,8 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
 	for_each_crtc(&data->display, crtc) {
 		igt_output_t *output;
 
-		for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+		for_each_valid_output_on_crtc(&data->display,
+					      crtc,
 					      output) {
 			int i;
 
diff --git a/tests/kms_color.c b/tests/kms_color.c
index a26225c1e99a..bc6405c5947d 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -637,7 +637,8 @@ static void test_pipe_limited_range_ctm(data_t *data,
 	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
 
-	for_each_valid_output_on_pipe(&data->display, primary->crtc->pipe,
+	for_each_valid_output_on_crtc(&data->display,
+				      primary->crtc,
 				      output) {
 		drmModeModeInfo *mode;
 		struct igt_fb fb_modeset, fb;
@@ -862,7 +863,9 @@ run_deep_color_tests_for_pipe(data_t *data, igt_crtc_t *crtc)
 
 	test_setup(data, crtc);
 
-	for_each_valid_output_on_pipe(&data->display, crtc->pipe, output) {
+	for_each_valid_output_on_crtc(&data->display,
+				      crtc,
+				      output) {
 		uint64_t max_bpc = get_max_bpc(output);
 		bool ret;
 
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 9720a76dc71b..e829c74e833a 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -433,7 +433,9 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 	igt_display_reset(display);
 
 	for_each_crtc(display, crtc) {
-		for_each_valid_output_on_pipe(display, crtc->pipe, *output) {
+		for_each_valid_output_on_crtc(display,
+					      crtc,
+					      *output) {
 			if (igt_output_get_driving_crtc(*output) != NULL)
 				continue;
 
diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
index 3b7224fbd4a1..99c3078190b1 100644
--- a/tests/kms_debugfs.c
+++ b/tests/kms_debugfs.c
@@ -41,7 +41,9 @@ static void igt_display_all_on(igt_display_t *display)
 	for_each_crtc(display, crtc) {
 		igt_output_t *output;
 
-		for_each_valid_output_on_pipe(display, crtc->pipe, output) {
+		for_each_valid_output_on_crtc(display,
+					      crtc,
+					      output) {
 			igt_plane_t *primary;
 			drmModeModeInfo *mode;
 
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 608081ddd085..6c17f002d8c8 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -196,7 +196,9 @@ static void run_extendedmode_test(data_t *data) {
 	igt_display_reset(display);
 
 	for_each_crtc(display, crtc) {
-		for_each_valid_output_on_pipe(display, crtc->pipe, output1) {
+		for_each_valid_output_on_crtc(display,
+					      crtc,
+					      output1) {
 
 			for_each_crtc(display, crtc2) {
 				if (crtc->pipe == crtc2->pipe)
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index f0216a4ce491..28ec89c55443 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -98,8 +98,8 @@ int igt_main() {
 			igt_fixture() {
 				/* this is what most of the 2x tests are doing */
 				for_each_crtc(&display, crtc) {
-					for_each_valid_output_on_pipe(&display,
-								      crtc->pipe,
+					for_each_valid_output_on_crtc(&display,
+								      crtc,
 								      output) {
 						if (igt_output_get_driving_crtc(output) == NULL) {
 							igt_output_set_crtc(output,
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index c9ecd6f56c4e..79e0d7a20c2a 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -297,7 +297,8 @@ static void run_test(data_t *data, uint64_t modifier)
 		return;
 
 	for_each_crtc(&data->display, crtc) {
-		for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+		for_each_valid_output_on_crtc(&data->display,
+					      crtc,
 					      output) {
 			data->crtc = crtc;
 			data->output = output;
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 70c2381953c7..660283df751d 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -544,7 +544,9 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 	igt_display_reset(display);
 
 	for_each_crtc(display, crtc) {
-		for_each_valid_output_on_pipe(display, crtc->pipe, output1) {
+		for_each_valid_output_on_crtc(display,
+					      crtc,
+					      output1) {
 			for_each_crtc(display, crtc2) {
 				if (crtc->pipe == crtc2->pipe)
 					continue;
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 6957defd1f3b..af6caa9fbbe5 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -843,7 +843,9 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 	igt_display_reset(display);
 
 	for_each_crtc(display, crtc) {
-		for_each_valid_output_on_pipe(display, crtc->pipe, *output) {
+		for_each_valid_output_on_crtc(display,
+					      crtc,
+					      *output) {
 			if (igt_output_get_driving_crtc(*output) != NULL)
 				continue;
 
@@ -1373,7 +1375,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {
 				for_each_crtc(&data.display, crtc) {
 					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
-						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
+						for_each_valid_output_on_crtc(&data.display,
+									      crtc,
+									      output) {
 							igt_info("Trying on %s\n", igt_output_name(output));
 							if (!pipe_output_combo_valid(&data.display, crtc, output))
 								continue;
@@ -1402,7 +1406,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			igt_subtest_with_dynamic(scaler_with_rotation_tests[index].name) {
 				for_each_crtc(&data.display, crtc) {
 					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
-						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
+						for_each_valid_output_on_crtc(&data.display,
+									      crtc,
+									      output) {
 							igt_info("Trying on %s\n", igt_output_name(output));
 							if (!pipe_output_combo_valid(&data.display, crtc, output))
 								continue;
@@ -1431,7 +1437,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			igt_subtest_with_dynamic(scaler_with_modifiers_tests[index].name) {
 				for_each_crtc(&data.display, crtc) {
 					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
-						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
+						for_each_valid_output_on_crtc(&data.display,
+									      crtc,
+									      output) {
 							igt_info("Trying on %s\n", igt_output_name(output));
 							if (!pipe_output_combo_valid(&data.display, crtc, output))
 								continue;
@@ -1459,7 +1467,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-pixel-formats") {
 			for_each_crtc(&data.display, crtc) {
 				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
-					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
+					for_each_valid_output_on_crtc(&data.display,
+								      crtc,
+								      output) {
 						igt_info("Trying on %s\n", igt_output_name(output));
 						if (!pipe_output_combo_valid(&data.display, crtc, output))
 							continue;
@@ -1485,7 +1495,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-rotation") {
 			for_each_crtc(&data.display, crtc) {
 				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
-					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
+					for_each_valid_output_on_crtc(&data.display,
+								      crtc,
+								      output) {
 						igt_info("Trying on %s\n", igt_output_name(output));
 						if (!pipe_output_combo_valid(&data.display, crtc, output))
 							continue;
@@ -1510,7 +1522,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-modifiers") {
 			for_each_crtc(&data.display, crtc) {
 				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
-					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
+					for_each_valid_output_on_crtc(&data.display,
+								      crtc,
+								      output) {
 						igt_info("Trying on %s\n", igt_output_name(output));
 						if (!pipe_output_combo_valid(&data.display, crtc, output))
 							continue;
@@ -1536,7 +1550,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
 				for_each_crtc(&data.display, crtc) {
 					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
-						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
+						for_each_valid_output_on_crtc(&data.display,
+									      crtc,
+									      output) {
 							igt_info("Trying on %s\n",
 								 igt_output_name(output));
 							if (!pipe_output_combo_valid(&data.display, crtc, output))
@@ -1565,7 +1581,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			igt_subtest_with_dynamic(intel_paramtests[index].testname) {
 				igt_require_intel(data.drm_fd);
 				for_each_crtc(&data.display, crtc) {
-					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
+					for_each_valid_output_on_crtc(&data.display,
+								      crtc,
+								      output) {
 						if (igt_crtc_num_scalers(crtc) < 1)
 							continue;
 						/*
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 4f74170949e1..6cfaeaececbc 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -347,7 +347,9 @@ static void colorop_properties(igt_display_t *display, bool atomic)
 	for_each_crtc(display, crtc) {
 		found = false;
 
-		for_each_valid_output_on_pipe(display, crtc->pipe, output) {
+		for_each_valid_output_on_crtc(display,
+					      crtc,
+					      output) {
 			igt_display_reset(display);
 
 			igt_output_set_crtc(output,
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 9b087bbaa6dc..0d3e17a32593 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -942,7 +942,9 @@ static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
 
 	igt_display_require_output(display);
 
-	for_each_valid_output_on_pipe(display, crtc->pipe, output) {
+	for_each_valid_output_on_crtc(display,
+				      crtc,
+				      output) {
 		int i, j, k, l, flipsw, fliphw;
 
 		igt_display_reset(display);
-- 
2.52.0

