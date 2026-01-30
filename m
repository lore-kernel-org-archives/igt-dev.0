Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B12D49C92
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A6610E9BC;
	Fri, 30 Jan 2026 10:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m82s2nfO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FDE10E9BC
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770422; x=1801306422;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5ElAzrHtupjSWMf9mbDIrTu6kIkSmUvreg+yJqNY+5E=;
 b=m82s2nfOaASYiLZn4nx7P+GyoKV+ETYZdV++OR4E2V7TfgD93+v6VJGo
 PWgTiMBsUAF8BX13C3qxBdvP1XQBvxL2bougMMArHB7fYNNVmw4HihG1X
 bI/l9vsONlU7jt6QmUTXc0lvUpKh0G1VxQLtiv2JjEi4cu+iREPFHYNBP
 Fo5QwLmY7PwcFxnuA3NKFofJkT6zItxNDabuNnB1s8oimeQFZKYXsX3Ar
 TrDljd5ZSt1a2gv+fVeCKO4t+np6nzs3JAamLd+m8/iq7mwOKjY3SQI1W
 14uh5pXeme/7jhKP8zeoNA2qHzSEqa1MdSWYXCLL6bmB9ZMPUm34EouqQ Q==;
X-CSE-ConnectionGUID: IBIgDPAWS+KQAofD6oULLA==
X-CSE-MsgGUID: QbQCliJoQ2GNbSvwd4U4Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81653050"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="81653050"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:41 -0800
X-CSE-ConnectionGUID: xTGbH0WNTNiRXbwWj/Bdrw==
X-CSE-MsgGUID: so6naZsNTkeoFhBoULRW3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208826881"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:40 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 14/15] lib/kms: Use for_each_crtc_with_valid_output(),
 part 4
Date: Fri, 30 Jan 2026 12:52:36 +0200
Message-ID: <20260130105237.14481-15-ville.syrjala@linux.intel.com>
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

Convert the remaining uses of for_each_pipe_with_valid_output()
to for_each_crtc_with_valid_output(). These should all be
straiggtforward cases.

Done with cocci:
 #include "scripts/iterators.cocci"

@find@
typedef igt_crtc_t;
iterator name for_each_pipe_with_valid_output;
iterator name for_each_crtc_with_valid_output;
expression DISPLAY, OUTPUT;
identifier PIPE;
type T;
@@
{
...
(
- T PIPE;
+ igt_crtc_t *crtc;
|
- T PIPE = PIPE_NONE;
+ igt_crtc_t *crtc;
)
<+...
for_each_pipe_with_valid_output(DISPLAY, PIPE, OUTPUT) { ... }
...+>
}

@change depends on find@
expression DISPLAY, OUTPUT;
identifier find.PIPE;
@@
- for_each_pipe_with_valid_output(DISPLAY, PIPE, OUTPUT)
+ for_each_crtc_with_valid_output(DISPLAY, crtc, OUTPUT)
{
<...
(
- igt_crtc_for_pipe(..., PIPE)
+ crtc
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(crtc)
|
- PIPE
+ crtc->pipe
)
...>
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                          |  4 +-
 tests/intel/kms_cdclk.c                | 12 ++--
 tests/intel/kms_draw_crc.c             |  8 +--
 tests/intel/kms_dsc.c                  |  6 +-
 tests/intel/kms_fence_pin_leak.c       |  8 +--
 tests/intel/kms_flip_tiling.c          | 15 +++--
 tests/intel/kms_frontbuffer_tracking.c | 14 ++---
 tests/intel/kms_mmap_write_crc.c       | 10 ++--
 tests/intel/kms_pipe_b_c_ivb.c         |  8 +--
 tests/intel/kms_pm_rpm.c               |  8 +--
 tests/intel/kms_psr2_su.c              | 15 ++---
 tests/intel/kms_psr_stress_test.c      |  6 +-
 tests/intel/perf_pmu.c                 |  8 +--
 tests/intel/prime_mmap_kms.c           |  6 +-
 tests/intel/xe_pat.c                   |  8 +--
 tests/kms_atomic_interruptible.c       | 79 ++++++++++++++++----------
 tests/kms_atomic_transition.c          | 25 ++++----
 tests/kms_flip_event_leak.c            | 11 ++--
 tests/kms_invalid_mode.c               | 13 +++--
 tests/kms_panel_fitting.c              | 12 ++--
 tests/kms_plane_multiple.c             | 11 ++--
 tests/kms_scaling_modes.c              | 12 ++--
 tests/kms_sequence.c                   | 13 +++--
 tests/prime_vgem.c                     |  4 +-
 tests/vmwgfx/vmw_prime.c               | 16 +++---
 25 files changed, 186 insertions(+), 146 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a94c4820bd87..97b41778a52a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3274,10 +3274,10 @@ int igt_display_n_crtcs(igt_display_t *display)
  */
 void igt_display_require_output(igt_display_t *display)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 
-	for_each_pipe_with_valid_output(display, pipe, output)
+	for_each_crtc_with_valid_output(display, crtc, output)
 		return;
 
 	igt_skip("No valid crtc/connector combinations found.\n");
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 3ed6e88852e3..bb7c5922b643 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -324,21 +324,21 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(display)) {
 			igt_output_set_crtc(output, NULL);
 			continue;
 		}
 
-		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output->name) {
 			if (flags & TEST_PLANESCALING)
-				test_plane_scaling(data, pipe, output);
+				test_plane_scaling(data, crtc->pipe, output);
 			if (flags & TEST_MODETRANSITION)
-				test_mode_transition(data, pipe, output);
+				test_mode_transition(data, crtc->pipe, output);
 		}
 	}
 }
diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index 26bd1fbb1961..9f7f213877b0 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -93,18 +93,18 @@ struct base_crc base_crcs[ARRAY_SIZE(formats)];
 
 static void find_modeset_params(void)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
-	for_each_pipe_with_valid_output(&display, pipe, output) {
+	for_each_crtc_with_valid_output(&display, crtc, output) {
 		igt_display_reset(&display);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(&display))
 			continue;
 
 		mode = igt_output_get_mode(output);
-		pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&display, pipe),
+		pipe_crc = igt_crtc_crc_new(crtc,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		/*Only one pipe/output is enough*/
 		break;
diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index e70cae2524a8..e70e0d202628 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -251,7 +251,7 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	char name[3][LEN] = {
 				{0},
 				{0},
@@ -260,12 +260,12 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 
 	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		data->output_format = output_format;
 		data->plane_format = plane_format;
 		data->input_bpc = bpc;
 		data->output = output;
-		data->pipe = pipe;
+		data->pipe = crtc->pipe;
 
 		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
 		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
index 15ae038d8b08..8dd39e157a95 100644
--- a/tests/intel/kms_fence_pin_leak.c
+++ b/tests/intel/kms_fence_pin_leak.c
@@ -210,17 +210,17 @@ static void run_test(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	enum pipe p;
+	igt_crtc_t *crtc;
 
-	for_each_pipe_with_valid_output(display, p, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		igt_display_reset(display);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, p));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
-		run_single_test(data, p, output);
+		run_single_test(data, crtc->pipe, output);
 
 		return; /* one time ought to be enough */
 	}
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index 269bb0e24d0a..c063a60c8423 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -225,17 +225,17 @@ int igt_main()
 
 	igt_describe("Check pageflip between modifiers");
 	igt_subtest_with_dynamic("flip-change-tiling") {
-		enum pipe pipe;
+		igt_crtc_t *crtc;
 		bool run_in_simulation = igt_run_in_simulation();
 
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+		for_each_crtc_with_valid_output(&data.display, crtc, output) {
 			igt_plane_t *plane;
 
 			igt_display_reset(&data.display);
 			pipe_crc_free(&data);
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 			if (!intel_pipe_output_combo_valid(&data.display))
 				continue;
 
@@ -260,17 +260,20 @@ int igt_main()
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s-%s-to-%s",
-						      kmstest_pipe_name(pipe),
+						      igt_crtc_name(crtc),
 						      igt_output_name(output),
 						      igt_fb_modifier_name(modifier[0]),
 						      igt_fb_modifier_name(modifier[1]))
-						test_flip_tiling(&data, pipe, output, modifier);
+						test_flip_tiling(&data,
+								 crtc->pipe,
+								 output,
+								 modifier);
 
 					if (data.flipevent_in_queue)
 						handle_lost_event(&data);
 				}
 			}
-			test_cleanup(&data, pipe, output);
+			test_cleanup(&data, crtc->pipe, output);
 		}
 	}
 
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index cd80ba444cf5..b60874db000a 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1163,20 +1163,20 @@ static bool find_connector(bool edp_only, bool pipe_a,
 			   enum pipe *ret_pipe)
 {
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
-	for_each_pipe_with_valid_output(&drm.display, pipe, output) {
+	for_each_crtc_with_valid_output(&drm.display, crtc, output) {
 		drmModeConnectorPtr c = output->config.connector;
 
 		if (edp_only && c->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
-		if (pipe_a && pipe != PIPE_A)
+		if (pipe_a && crtc->pipe != PIPE_A)
 			continue;
 
-		if (output == forbidden_output || pipe == forbidden_pipe) {
+		if (output == forbidden_output || crtc->pipe == forbidden_pipe) {
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 			igt_output_override_mode(output, connector_get_mode(output));
 
 			continue;
@@ -1186,11 +1186,11 @@ static bool find_connector(bool edp_only, bool pipe_a,
 			continue;
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		igt_output_override_mode(output, connector_get_mode(output));
 		if (intel_pipe_output_combo_valid(&drm.display)) {
 			*ret_output = output;
-			*ret_pipe = pipe;
+			*ret_pipe = crtc->pipe;
 			return true;
 		}
 	}
diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index 453bcd0198a7..c68fd69c402d 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -269,7 +269,7 @@ int igt_main_args("n", NULL, NULL, opt_handler, NULL)
 {
 	int i;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
@@ -289,18 +289,18 @@ int igt_main_args("n", NULL, NULL, opt_handler, NULL)
 	igt_describe("Tests that caching mode has become UC/WT and flushed using mmap write");
 
 	igt_subtest_with_dynamic("main") {
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+		for_each_crtc_with_valid_output(&data.display, crtc, output) {
 			igt_display_reset(&data.display);
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 			if (!intel_pipe_output_combo_valid(&data.display))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
 				data.output = output;
-				data.pipe = pipe;
+				data.pipe = crtc->pipe;
 
 				igt_info("Using %d rounds for each pipe in the test\n", ROUNDS);
 				prepare_crtc(&data);
diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index 4559c8b9e951..f6261cb885b9 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -150,16 +150,16 @@ static void
 find_outputs(data_t *data, igt_output_t **output1, igt_output_t **output2)
 {
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	*output1 = NULL;
 	*output2 = NULL;
 
-	for_each_pipe_with_valid_output(&data->display, pipe, output) {
-		if (pipe == PIPE_B && !*output1 && output != *output2)
+	for_each_crtc_with_valid_output(&data->display, crtc, output) {
+		if (crtc->pipe == PIPE_B && !*output1 && output != *output2)
 			*output1 = output;
 
-		if (pipe == PIPE_C && output != *output1 && !*output2)
+		if (crtc->pipe == PIPE_C && output != *output1 && !*output2)
 			*output2 = output;
 
 		igt_output_set_crtc(output, NULL);
diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index d7d0989b9a67..31f596413f9f 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1620,22 +1620,22 @@ static bool is_preferred_mode_present(igt_output_t *output, enum pipe pipe,
 
 static void set_prefered_mode(void)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 	bool mode_found = false;
 	igt_display_t *display = &ms_data.display;
 
 	igt_display_reset(display);
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
-		if (is_preferred_mode_present(output, pipe, display)) {
+		if (is_preferred_mode_present(output, crtc->pipe, display)) {
 			mode_found = true;
 			break;
 		}
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 24318037ea44..39ee3ee17e54 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -118,9 +118,9 @@ static void setup_output(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		drmModeConnectorPtr c = output->config.connector;
 
 		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
@@ -128,7 +128,7 @@ static void setup_output(data_t *data)
 
 		igt_display_reset(display);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
@@ -313,7 +313,7 @@ static int check_psr2_support(data_t *data, enum pipe pipe)
 int igt_main()
 {
 	data_t data = {};
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	int r, i;
 	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
 	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
@@ -354,9 +354,10 @@ int igt_main()
 		r = timerfd_settime(data.change_screen_timerfd, 0, &interval, NULL);
 		igt_require_f(r != -1, "Error setting timerfd\n");
 
-		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
-			if (check_psr2_support(&data, pipe)) {
-				pipes[n_pipes] = pipe;
+		for_each_crtc_with_valid_output(&data.display, crtc,
+						data.output) {
+			if (check_psr2_support(&data, crtc->pipe)) {
+				pipes[n_pipes] = crtc->pipe;
 				outputs[n_pipes] = data.output;
 				n_pipes++;
 			}
diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index 87016eb94f4f..09e73bd49bb3 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -83,11 +83,11 @@ static void setup_output(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	igt_display_require(&data->display, data->drm_fd);
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		drmModeConnectorPtr c = output->config.connector;
 
 		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
@@ -95,7 +95,7 @@ static void setup_output(data_t *data)
 
 		igt_display_reset(display);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(display)) {
 			igt_output_set_crtc(output, NULL);
 			continue;
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 57113981d70a..f87674f74e8f 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -1120,7 +1120,7 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
 	uint16_t devid;
 	igt_output_t *output;
 	data_t data;
-	enum pipe p;
+	igt_crtc_t *crtc;
 	int fd;
 
 	devid = intel_get_drm_devid(gem_fd);
@@ -1167,13 +1167,13 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
 	eb.flags = e->flags | I915_EXEC_SECURE;
 	eb.rsvd1 = ctx->id;
 
-	for_each_pipe_with_valid_output(&data.display, p, output) {
+	for_each_crtc_with_valid_output(&data.display, crtc, output) {
 		struct igt_helper_process waiter = { };
 		const unsigned int frames = 3;
 		uint64_t val[2];
 
 		batch[6] = MI_WAIT_FOR_EVENT;
-		switch (p) {
+		switch (crtc->pipe) {
 		case PIPE_A:
 			batch[6] |= MI_WAIT_FOR_PIPE_A_VBLANK;
 			batch[5] = ~(1 << 3);
@@ -1192,7 +1192,7 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
 
 		gem_write(gem_fd, obj.handle, 0, batch, sizeof(batch));
 
-		data.pipe = p;
+		data.pipe = crtc->pipe;
 		prepare_crtc(&data, gem_fd, output);
 
 		fd = open_pmu(gem_fd,
diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
index c19c3763fc04..b263a5822063 100644
--- a/tests/intel/prime_mmap_kms.c
+++ b/tests/intel/prime_mmap_kms.c
@@ -201,13 +201,13 @@ static void run_test(gpu_process_t *gpu)
 {
 	igt_display_t *display = &gpu->display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		int prime_fd;
 
 		gpu->output = output;
-		gpu->pipe = pipe;
+		gpu->pipe = crtc->pipe;
 
 		prepare_crtc(gpu);
 
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 24339f688ce6..21547c84e7f9 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -910,7 +910,7 @@ static void display_vs_wb_transient(int fd)
 	struct buf_ops *bops;
 	struct igt_fb src_fb, dst_fb;
 	struct intel_buf src, dst;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	int bpp = 32;
 	int i;
 
@@ -927,16 +927,16 @@ static void display_vs_wb_transient(int fd)
 	bops = buf_ops_create(fd);
 	ibb = intel_bb_create(fd, SZ_4K);
 
-	for_each_pipe_with_valid_output(&display, pipe, output) {
+	for_each_crtc_with_valid_output(&display, crtc, output) {
 		igt_display_reset(&display);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(&display))
 			continue;
 
 		mode = igt_output_get_mode(output);
-		pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&display, pipe),
+		pipe_crc = igt_crtc_crc_new(crtc,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		break;
 	}
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 05cf3f956e1f..8565fc501dc7 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -325,7 +325,7 @@ int igt_main()
 {
 	igt_display_t display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	igt_fixture() {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -341,84 +341,105 @@ int igt_main()
 
 	igt_describe("Tests the interrupt properties of legacy modeset");
 	igt_subtest_with_dynamic("legacy-setmode") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
-			if (!pipe_output_combo_valid(&display, pipe, output))
+		for_each_crtc_with_valid_output(&display, crtc, output) {
+			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				run_plane_test(&display, pipe, output, test_legacy_modeset, DRM_PLANE_TYPE_PRIMARY);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output))
+				run_plane_test(&display, crtc->pipe, output,
+					       test_legacy_modeset,
+					       DRM_PLANE_TYPE_PRIMARY);
 			break;
 		}
 	}
 
 	igt_describe("Tests the interrupt properties of atomic modeset");
 	igt_subtest_with_dynamic("atomic-setmode") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
-			if (!pipe_output_combo_valid(&display, pipe, output))
+		for_each_crtc_with_valid_output(&display, crtc, output) {
+			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				run_plane_test(&display, pipe, output, test_atomic_modeset, DRM_PLANE_TYPE_PRIMARY);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output))
+				run_plane_test(&display, crtc->pipe, output,
+					       test_atomic_modeset,
+					       DRM_PLANE_TYPE_PRIMARY);
 			break;
 		}
 	}
 
 	igt_describe("Tests the interrupt properties for DPMS");
 	igt_subtest_with_dynamic("legacy-dpms") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
-			if (!pipe_output_combo_valid(&display, pipe, output))
+		for_each_crtc_with_valid_output(&display, crtc, output) {
+			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				run_plane_test(&display, pipe, output, test_legacy_dpms, DRM_PLANE_TYPE_PRIMARY);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output))
+				run_plane_test(&display, crtc->pipe, output,
+					       test_legacy_dpms,
+					       DRM_PLANE_TYPE_PRIMARY);
 			break;
 		}
 	}
 
 	igt_describe("Tests the interrupt properties for pageflip");
 	igt_subtest_with_dynamic("legacy-pageflip") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
-			if (!pipe_output_combo_valid(&display, pipe, output))
+		for_each_crtc_with_valid_output(&display, crtc, output) {
+			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				run_plane_test(&display, pipe, output, test_pageflip, DRM_PLANE_TYPE_PRIMARY);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output))
+				run_plane_test(&display, crtc->pipe, output,
+					       test_pageflip,
+					       DRM_PLANE_TYPE_PRIMARY);
 			break;
 		}
 	}
 
 	igt_describe("Tests the interrupt properties for cursor");
 	igt_subtest_with_dynamic("legacy-cursor") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
-			if (!pipe_output_combo_valid(&display, pipe, output))
+		for_each_crtc_with_valid_output(&display, crtc, output) {
+			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				run_plane_test(&display, pipe, output, test_setcursor, DRM_PLANE_TYPE_CURSOR);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output))
+				run_plane_test(&display, crtc->pipe, output,
+					       test_setcursor,
+					       DRM_PLANE_TYPE_CURSOR);
 			break;
 		}
 	}
 
 	igt_describe("Tests the interrupt properties for primary plane");
 	igt_subtest_with_dynamic("universal-setplane-primary") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
-			if (!pipe_output_combo_valid(&display, pipe, output))
+		for_each_crtc_with_valid_output(&display, crtc, output) {
+			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_PRIMARY);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output))
+				run_plane_test(&display, crtc->pipe, output,
+					       test_setplane,
+					       DRM_PLANE_TYPE_PRIMARY);
 			break;
 		}
 	}
 
 	igt_describe("Tests the interrupt properties for cursor plane");
 	igt_subtest_with_dynamic("universal-setplane-cursor") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
-			if (!pipe_output_combo_valid(&display, pipe, output))
+		for_each_crtc_with_valid_output(&display, crtc, output) {
+			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_CURSOR);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output))
+				run_plane_test(&display, crtc->pipe, output,
+					       test_setplane,
+					       DRM_PLANE_TYPE_CURSOR);
 			break;
 		}
 	}
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index f0598e486111..ece95961cdf2 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1128,7 +1128,7 @@ static data_t data;
 int igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	struct {
 		const char *name;
 		enum transition_type type;
@@ -1201,17 +1201,18 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_subtest_with_dynamic("plane-primary-toggle-with-vblank-wait") {
 		pipe_count = 0;
 
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+		for_each_crtc_with_valid_output(&data.display, crtc, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 
-			if (!pipe_output_combo_valid(&data.display, pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 				continue;
 
 			pipe_count++;
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				run_primary_test(&data, pipe, output);
-			test_cleanup(&data, pipe, output, false);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output))
+				run_primary_test(&data, crtc->pipe, output);
+			test_cleanup(&data, crtc->pipe, output, false);
 		}
 	}
 
@@ -1223,7 +1224,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
 			pipe_count = 0;
 
-			for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			for_each_crtc_with_valid_output(&data.display, crtc,
+							output) {
 				/*
 				 * Test modeset cases on internal panels separately with a reduced
 				 * number of combinations, to avoid long runtimes due to modesets on
@@ -1240,19 +1242,20 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 				if (pipe_count == 2 * count && !data.extended)
 					break;
 
-				if (!pipe_output_combo_valid(&data.display, pipe, output))
+				if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 					continue;
 
 				pipe_count++;
 				igt_dynamic_f("pipe-%s-%s",
-					      kmstest_pipe_name(pipe),
+					      igt_crtc_name(crtc),
 					      igt_output_name(output))
-					run_transition_test(&data, pipe, output,
+					run_transition_test(&data, crtc->pipe,
+							    output,
 							    transition_tests[i].type,
 							    transition_tests[i].nonblocking,
 							    transition_tests[i].fencing);
 
-				test_cleanup(&data, pipe, output,
+				test_cleanup(&data, crtc->pipe, output,
 					     transition_tests[i].fencing);
 			}
 		}
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index ce8993ccb681..545719638898 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -107,7 +107,7 @@ int igt_main()
 {
 	data_t data = {};
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -118,16 +118,17 @@ int igt_main()
 	}
 
 	igt_subtest_with_dynamic("basic") {
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+		for_each_crtc_with_valid_output(&data.display, crtc, output) {
 			igt_display_reset(&data.display);
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 			if (!intel_pipe_output_combo_valid(&data.display))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-				test(&data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output)) {
+				test(&data, crtc->pipe, output);
 			}
 		}
 	}
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index a3d52deafd7f..163bdb96bc3a 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -337,7 +337,7 @@ static data_t data;
 int igt_main()
 {
 
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 
 	igt_fixture() {
@@ -356,17 +356,20 @@ int igt_main()
 	igt_describe("Make sure all modesets are rejected when the requested mode is invalid");
 	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
 		igt_subtest_with_dynamic(subtests[i].name) {
-			for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			for_each_crtc_with_valid_output(&data.display, crtc,
+							output) {
 				igt_display_reset(&data.display);
 
 				igt_output_set_crtc(output,
-						    igt_crtc_for_pipe(output->display, pipe));
+						    crtc);
 				if (!intel_pipe_output_combo_valid(&data.display))
 					continue;
 
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				igt_dynamic_f("pipe-%s-%s",
+					      igt_crtc_name(crtc),
+					      igt_output_name(output)) {
 					data.output = output;
-					data.pipe = pipe;
+					data.pipe = crtc->pipe;
 					data.adjust_mode = subtests[i].adjust_mode;
 					test_output(&data);
 				}
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 9bfb7d3f1356..f4c2d0697539 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -246,7 +246,7 @@ static void test_panel_fitting(data_t *data, enum test_type type)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	struct stat sb;
 
 	if (type == TEST_ATOMIC) {
@@ -265,18 +265,20 @@ static void test_panel_fitting(data_t *data, enum test_type type)
 
 	}
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		/* Check that the "scaling mode" property has been set. */
 		if (!igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE))
 			continue;
 
 		cleanup_crtc(data);
 
-		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output->name) {
 			if (type == TEST_ATOMIC)
-				test_panel_fitting_fastset(display, pipe, output);
+				test_panel_fitting_fastset(display,
+							   crtc->pipe, output);
 			if (type == TEST_LEGACY)
-				test_panel_fitting_legacy(data, display, pipe, output);
+				test_panel_fitting_legacy(data, display,
+							  crtc->pipe, output);
 		}
 	}
 }
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index fd2293a6c742..e399f3ee270d 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -556,23 +556,24 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 
 static void run_test(data_t *data, uint64_t modifier, const char *name)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 	igt_display_t *display = &data->display;
 
 	igt_skip_on_f(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier),
 		      "%s modifier is not supported\n", name);
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		igt_display_reset(display);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
-		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
-			test_plane_position(data, pipe, output, modifier);
+		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output->name)
+			test_plane_position(data, crtc->pipe, output,
+					    modifier);
 	}
 }
 
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 588513750257..f74db2912561 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -110,9 +110,9 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		igt_display_reset(display);
 
 		if (!has_scaling_mode(output)) {
@@ -122,12 +122,14 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
 		}
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
-		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-			test_scaling_mode_on_output(display, pipe, output, flags);
+		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+			      igt_output_name(output))
+			test_scaling_mode_on_output(display, crtc->pipe,
+						    output, flags);
 	}
 }
 
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 9eea70cf7a88..7fe314afaf7f 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -272,7 +272,7 @@ int igt_main()
 {
 	int fd;
 	igt_output_t *output;
-	enum pipe p;
+	igt_crtc_t *crtc;
 	data_t data;
 	const struct {
 		const char *name;
@@ -309,16 +309,19 @@ int igt_main()
 			igt_describe("This is a test of drmCrtcGetSequence and "
 				     "drmCrtcQueueSequence");
 			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
-				for_each_pipe_with_valid_output(&data.display, p, output) {
+				for_each_crtc_with_valid_output(&data.display,
+								crtc, output) {
 					igt_display_reset(&data.display);
 
 					igt_output_set_crtc(output,
-							    igt_crtc_for_pipe(output->display, p));
+							    crtc);
 					if (!intel_pipe_output_combo_valid(&data.display))
 						continue;
 
-					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), igt_output_name(output)) {
-						data.pipe = p;
+					igt_dynamic_f("pipe-%s-%s",
+						      igt_crtc_name(crtc),
+						      igt_output_name(output)) {
+						data.pipe = crtc->pipe;
 						data.output = output;
 						data.flags = m->flags;
 						run_test(&data, fd, f->func);
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 79963648f132..bbf5ab97f459 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -1053,12 +1053,12 @@ static void test_flip(int i915, int vgem, unsigned hang)
 	igt_display_t display;
 	igt_output_t *output;
 	struct vgem_bo bo[2];
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	igt_display_require(&display, i915);
 	igt_display_require_output(&display);
 
-	for_each_pipe_with_valid_output(&display, pipe, output) {
+	for_each_crtc_with_valid_output(&display, crtc, output) {
 		mode = igt_output_get_mode(output);
 		break;
 	}
diff --git a/tests/vmwgfx/vmw_prime.c b/tests/vmwgfx/vmw_prime.c
index 5f704089b146..e5aca6169e3b 100644
--- a/tests/vmwgfx/vmw_prime.c
+++ b/tests/vmwgfx/vmw_prime.c
@@ -287,20 +287,20 @@ static void draw_triangle_3d(struct gpu_process_t *gpu, uint32_t draw_flags)
 {
 	igt_display_t *display = &gpu->display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t blank_crc, tri_crc;
 	char *blank_crc_str, *tri_crc_str;
 	bool crc_equal;
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		int prime_fd;
 
 		gpu->output = output;
-		gpu->pipe = pipe;
+		gpu->pipe = crtc->pipe;
 
 		prepare_crtc(gpu);
-		pipe_crc = igt_pipe_crc_new(gpu->mdevice.drm_fd, pipe,
+		pipe_crc = igt_pipe_crc_new(gpu->mdevice.drm_fd, crtc->pipe,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_collect_crc(pipe_crc, &blank_crc);
 
@@ -352,7 +352,7 @@ static void draw_dumb_buffer(struct gpu_process_t *gpu)
 {
 	igt_display_t *display = &gpu->display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t blank_crc, red_crc, blue_crc, tri_crc, red2_crc;
 	char *blank_crc_str, *red_crc_str, *red2_crc_str, *blue_crc_str,
@@ -362,12 +362,12 @@ static void draw_dumb_buffer(struct gpu_process_t *gpu)
 	struct vmw_default_objects objects = { 0 };
 	int32_t cid = vmw_ioctl_context_create(gpu->mdevice.drm_fd);
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		gpu->output = output;
-		gpu->pipe = pipe;
+		gpu->pipe = crtc->pipe;
 
 		prepare_crtc_surface(gpu);
-		pipe_crc = igt_pipe_crc_new(gpu->mdevice.drm_fd, pipe,
+		pipe_crc = igt_pipe_crc_new(gpu->mdevice.drm_fd, crtc->pipe,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_collect_crc(pipe_crc, &blank_crc);
 
-- 
2.52.0

