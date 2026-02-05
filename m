Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0CDEC1EB5
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 13:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0C410E8A8;
	Thu,  5 Feb 2026 13:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QaLEdn7e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EEC10E8A8
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770298263; x=1801834263;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=X/d1ht1g5IULj7sYP+CHPkqbrsugMVi0uwCJdLJzF3s=;
 b=QaLEdn7e+8lbdxZcDSbUXH3/NxgFeBNIMqLZ3Xl26lvKBAZEUvjZMDH0
 F9pdBgOxSaJ/YoLQWW67/i5fjp0ZopekxK1hhOSLM0/NCy1VUyJ+ib0qI
 /IWBzcy7F+yJ7+WU8yR5KxULkB1+FzYl+a+CxMbql0UKY1skw0d6WyDe5
 AbLsoAp4etU/13FMnMSthQuYJRIO7/4zvz8650WmfesKS4+G3xOF1/ay3
 BiT5ivnUmWeA4JL33d/uay/LH/vCbODGa4mcls7/gbsuaGcfHicP0G3TW
 kjCnYZZFDXibREo69Ka6uR48Z/916PrTw8MiTQxV8rgLaTMgordbbiXwE Q==;
X-CSE-ConnectionGUID: Sm+hu5xCQbKsdBJ3+eLPhA==
X-CSE-MsgGUID: bTNhV58ET+OID4d8zkZS8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70693540"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70693540"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:31:03 -0800
X-CSE-ConnectionGUID: 8L/xNHiwTm+G+PRakfMcjQ==
X-CSE-MsgGUID: phAQAM+cRoaWIL9Xcx8GGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215499317"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.121])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:31:01 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/12] tests/kms: Convert to for_each_crtc(), part 6
Date: Thu,  5 Feb 2026 15:30:18 +0200
Message-ID: <20260205133019.9161-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
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

Convert more for_each_pipe()s into for_each_crtc(). These
are some of the simple cases.

Done with cocci, with a manual fixup to remove some
shadowing 'crtc' variables (couldn't get coccinelle
to do that reliably for me).

 #include "scripts/iterators.cocci"

@change@
iterator name for_each_pipe;
iterator name for_each_crtc;
typedef igt_crtc_t;
identifier PIPE;
expression DISPLAY;
@@
{
...
(
+ igt_crtc_t *crtc;
enum pipe PIPE;
|
+ igt_crtc_t *crtc;
int PIPE;
)
<+...
- for_each_pipe(DISPLAY, PIPE)
+ for_each_crtc(DISPLAY, crtc)
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
...+>
}

@depends on change@
identifier change.PIPE;
expression E;
@@
{...
(
- enum pipe PIPE;
|
- enum pipe PIPE = E;
|
- int PIPE;
|
- int PIPE = E;
)
... when != PIPE
}

@depends on change@
identifier CRTC;
@@
igt_crtc_t *CRTC;
...
- igt_crtc_t *CRTC;

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 benchmarks/kms_fb_stress.c                    |  8 +--
 lib/igt_kms.c                                 | 22 ++++----
 tests/amdgpu/amd_freesync_video_mode.c        | 15 +++---
 tests/amdgpu/amd_ilr.c                        |  8 +--
 tests/amdgpu/amd_link_settings.c              |  8 +--
 tests/amdgpu/amd_mode_switch.c                | 12 ++---
 tests/amdgpu/amd_multidisplay_modeset.c       | 10 ++--
 tests/amdgpu/amd_vrr_range.c                  |  8 +--
 tests/chamelium/kms_chamelium_color.c         | 15 +++---
 tests/chamelium/kms_chamelium_helper.c        |  8 +--
 tests/chamelium/kms_chamelium_hpd.c           |  6 +--
 .../kms_chamelium_sharpness_filter.c          |  6 +--
 tests/intel/kms_busy.c                        |  6 +--
 tests/intel/kms_cdclk.c                       |  6 +--
 tests/intel/kms_dp_link_training.c            |  6 +--
 tests/intel/kms_flip_scaled_crc.c             | 32 ++++++++----
 tests/intel/kms_joiner.c                      |  7 +--
 tests/intel/kms_pm_backlight.c                |  6 +--
 tests/intel/kms_pm_lpsp.c                     | 14 ++---
 tests/intel/kms_psr.c                         |  8 +--
 tests/intel/kms_sharpness_filter.c            |  6 +--
 tests/kms_atomic_transition.c                 | 51 ++++++++++---------
 tests/kms_colorop.c                           | 15 +++---
 tests/kms_content_protection.c                | 18 ++++---
 tests/kms_cursor_crc.c                        |  6 +--
 tests/kms_cursor_edge_walk.c                  |  5 +-
 tests/kms_cursor_legacy.c                     | 18 ++++---
 tests/kms_debugfs.c                           | 19 +++----
 tests/kms_display_modes.c                     | 15 +++---
 tests/kms_dither.c                            | 12 +++--
 tests/kms_feature_discovery.c                 | 10 ++--
 tests/kms_hdr.c                               | 33 ++++++------
 tests/kms_lease.c                             |  9 ++--
 tests/kms_plane_alpha_blend.c                 |  6 +--
 tests/kms_plane_lowres.c                      | 12 +++--
 tests/kms_plane_multiple.c                    | 16 +++---
 tests/kms_properties.c                        | 48 +++++++++--------
 tests/kms_tiled_display.c                     | 10 ++--
 tests/kms_vrr.c                               | 12 ++---
 tests/kms_writeback.c                         |  8 +--
 40 files changed, 291 insertions(+), 249 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 4bc23eb4bbd9..d9501ffd2fe6 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -142,7 +142,7 @@ static struct kms_t default_kms = {
 int igt_simple_main()
 {
 	struct data_t data = {0};
-	enum pipe pipe = PIPE_NONE;
+	igt_crtc_t *crtc;
 	struct timespec then, now;
 	double elapsed;
 
@@ -162,12 +162,12 @@ int igt_simple_main()
 	data.wb_output = find_wb_output(&data);
 	igt_require(data.wb_output);
 
-	for_each_pipe(&data.display, pipe) {
+	for_each_crtc(&data.display, crtc) {
 		igt_debug("Selecting pipe %s to %s\n",
-			  kmstest_pipe_name(pipe),
+			  igt_crtc_name(crtc),
 			  igt_output_name(data.wb_output));
 		igt_output_set_crtc(data.wb_output,
-				    igt_crtc_for_pipe(data.wb_output->display, pipe));
+				    crtc);
 		break;
 	}
 
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8508230a6142..1a8bf19c2bd4 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3142,6 +3142,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 {
 	drmModeRes *resources;
 	drmModePlaneRes *plane_resources;
+	igt_crtc_t *crtc;
 	int i;
 	bool is_intel_dev;
 
@@ -3190,7 +3191,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		     igt_display_n_crtcs(display));
 
 	for (i = 0; i < resources->count_crtcs; i++) {
-		igt_crtc_t *crtc;
 		int pipe_enum = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, i) : i;
 
 		crtc = igt_crtc_for_pipe(display, pipe_enum);
@@ -3230,8 +3230,8 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	display->colorops = calloc(MAX_NUM_COLOROPS, sizeof(igt_colorop_t));
 	display->n_colorops = 0;
 
-	for_each_pipe(display, i)
-		igt_crtc_init(display, resources, i);
+	for_each_crtc(display, crtc)
+		igt_crtc_init(display, resources, crtc->pipe);
 
 	drmModeFreeResources(resources);
 
@@ -6268,13 +6268,13 @@ bool igt_plane_has_format_mod(igt_plane_t *plane, uint32_t format,
 
 static int igt_count_display_format_mod(igt_display_t *display)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	int count = 0;
 
-	for_each_pipe(display, pipe) {
+	for_each_crtc(display, crtc) {
 		igt_plane_t *plane;
 
-		for_each_plane_on_pipe(display, pipe, plane) {
+		for_each_plane_on_pipe(display, crtc->pipe, plane) {
 			count += plane->format_mod_count;
 		}
 	}
@@ -6303,7 +6303,7 @@ igt_add_display_format_mod(igt_display_t *display, uint32_t format,
 static void igt_fill_display_format_mod(igt_display_t *display)
 {
 	int count = igt_count_display_format_mod(display);
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	if (!count)
 		return;
@@ -6313,10 +6313,10 @@ static void igt_fill_display_format_mod(igt_display_t *display)
 	display->modifiers = calloc(count, sizeof(display->modifiers[0]));
 	igt_assert(display->modifiers);
 
-	for_each_pipe(display, pipe) {
+	for_each_crtc(display, crtc) {
 		igt_plane_t *plane;
 
-		for_each_plane_on_pipe(display, pipe, plane) {
+		for_each_plane_on_pipe(display, crtc->pipe, plane) {
 			for (int i = 0; i < plane->format_mod_count; i++) {
 				igt_add_display_format_mod(display,
 							   plane->formats[i],
@@ -7138,7 +7138,7 @@ bool igt_check_force_joiner_status(int drmfd, char *connector_name)
 bool igt_check_bigjoiner_support(igt_display_t *display)
 {
 	uint8_t i, total_pipes = 0, pipes_in_use = 0;
-	enum pipe p;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 	struct {
 		enum pipe idx;
@@ -7149,7 +7149,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	int max_dotclock;
 
 	/* Get total enabled pipes. */
-	for_each_pipe(display, p)
+	for_each_crtc(display, crtc)
 		total_pipes++;
 
 	/*
diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 964833994533..4d29cdb13a21 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -838,21 +838,24 @@ run_test(data_t *data, uint32_t scene)
 	bool found = false;
 
 	for_each_connected_output(&data->display, output) {
-		enum pipe pipe;
+		igt_crtc_t *crtc;
 
 		if (!has_vrr(output)) {
 			igt_info("%s is not a vrr capable output. Skip it.\n", output->name);
 			continue;
 		}
 
-		for_each_pipe(&data->display, pipe)
-			if (igt_pipe_connector_valid(pipe, output)) {
+		for_each_crtc(&data->display, crtc)
+			if (igt_pipe_connector_valid(crtc->pipe, output)) {
 				igt_display_reset(&data->display);
 				igt_output_set_crtc(output,
-						    igt_crtc_for_pipe(output->display, pipe));
+						    crtc);
 
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
-				mode_transition(data, pipe, output, scene);
+				igt_dynamic_f("pipe-%s-%s",
+					      igt_crtc_name(crtc),
+					      output->name)
+				mode_transition(data, crtc->pipe, output,
+						scene);
 				found = true;
 				break;
 			}
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index 8404bb673205..746742ad1746 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -81,15 +81,15 @@ static void set_all_output_pipe_to_none(data_t *data)
 
 static void test_init(data_t *data, igt_output_t *output)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	igt_require(output->config.connector->count_modes >= 1);
 
 	set_all_output_pipe_to_none(data);
 
-	for_each_pipe(&data->display, pipe) {
-		if (igt_pipe_connector_valid(pipe, output)) {
-			data->pipe_id = pipe;
+	for_each_crtc(&data->display, crtc) {
+		if (igt_pipe_connector_valid(crtc->pipe, output)) {
+			data->pipe_id = crtc->pipe;
 			break;
 		}
 	}
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index 5975fbc782db..86fb8761f571 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -83,15 +83,15 @@ static void set_all_output_pipe_to_none(data_t *data)
 
 static void test_init(data_t *data, igt_output_t *output)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	igt_require(output->config.connector->count_modes >= 1);
 
 	set_all_output_pipe_to_none(data);
 
-	for_each_pipe(&data->display, pipe) {
-		if (igt_pipe_connector_valid(pipe, output)) {
-			data->pipe_id = pipe;
+	for_each_crtc(&data->display, crtc) {
+		if (igt_pipe_connector_valid(crtc->pipe, output)) {
+			data->pipe_id = crtc->pipe;
 			break;
 		}
 	}
diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
index fa6d5a323a27..014b0baf6bf3 100644
--- a/tests/amdgpu/amd_mode_switch.c
+++ b/tests/amdgpu/amd_mode_switch.c
@@ -36,15 +36,15 @@ typedef struct data {
 static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	int i;
+	igt_crtc_t *crtc;
 
-	for_each_pipe(display, i) {
-		igt_output_t *output = &display->outputs[i];
+	for_each_crtc(display, crtc) {
+		igt_output_t *output = &display->outputs[crtc->pipe];
 
-		data->primary[i] = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, i),
-							   DRM_PLANE_TYPE_PRIMARY);
+		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
+								    DRM_PLANE_TYPE_PRIMARY);
 
-		data->output[i] = output;
+		data->output[crtc->pipe] = output;
 	}
 
 	igt_require(data->output[0]);
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index 2c92c7b822f2..6b9e933f2f1b 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -202,12 +202,12 @@ static void test_init(struct data_t *data)
 static void test_fini(struct data_t *data)
 {
 	igt_display_t *display = &data->display;
-	int i = 0;
+	igt_crtc_t *crtc;
 
-	for_each_pipe(display, i) {
-		if (data->pipe_crc_dprx[i])
-			igt_pipe_crc_free(data->pipe_crc_dprx[i]);
-		igt_pipe_crc_free(data->pipe_crc_otg[i]);
+	for_each_crtc(display, crtc) {
+		if (data->pipe_crc_dprx[crtc->pipe])
+			igt_pipe_crc_free(data->pipe_crc_dprx[crtc->pipe]);
+		igt_pipe_crc_free(data->pipe_crc_otg[crtc->pipe]);
 	}
 
 	igt_display_reset(display);
diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index dc911323e2e2..9666ed320e35 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -186,12 +186,12 @@ struct {
 static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	int i;
+	igt_crtc_t *crtc;
 
-	for_each_pipe(display, i) {
-		igt_output_t *output = &display->outputs[i];
+	for_each_crtc(display, crtc) {
+		igt_output_t *output = &display->outputs[crtc->pipe];
 
-		data->output[i] = output;
+		data->output[crtc->pipe] = output;
 	}
 
 	igt_display_reset(display);
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 875dd5ff83af..04822312c362 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -593,7 +593,7 @@ run_limited_range_ctm_test_for_pipe(data_t *data, enum pipe p,
 static void
 run_tests_for_pipe(data_t *data)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	struct {
 		const char *name;
 		bool (*test_t)(data_t*, igt_plane_t*, struct chamelium_port*);
@@ -684,8 +684,9 @@ run_tests_for_pipe(data_t *data)
 	for (i = 0; i < ARRAY_SIZE(gamma_degamma_tests); i++) {
 		igt_describe_f("%s", gamma_degamma_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
-			for_each_pipe(&data->display, pipe) {
-				run_gamma_degamma_tests_for_pipe(data, pipe,
+			for_each_crtc(&data->display, crtc) {
+				run_gamma_degamma_tests_for_pipe(data,
+								 crtc->pipe,
 								 gamma_degamma_tests[i].test_t);
 			}
 		}
@@ -694,8 +695,8 @@ run_tests_for_pipe(data_t *data)
 	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
 		igt_describe_f("%s", ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
-			for_each_pipe(&data->display, pipe) {
-				run_ctm_tests_for_pipe(data, pipe,
+			for_each_crtc(&data->display, crtc) {
+				run_ctm_tests_for_pipe(data, crtc->pipe,
 						       ctm_tests[i].colors,
 						       ctm_tests[i].ctm,
 						       ctm_tests[i].iter);
@@ -705,8 +706,8 @@ run_tests_for_pipe(data_t *data)
 
 	igt_describe("Compare after applying ctm matrix & identity matrix");
 	igt_subtest_with_dynamic("ctm-limited-range") {
-		for_each_pipe(&data->display, pipe) {
-			run_limited_range_ctm_test_for_pipe(data, pipe,
+		for_each_crtc(&data->display, crtc) {
+			run_limited_range_ctm_test_for_pipe(data, crtc->pipe,
 							    test_pipe_limited_range_ctm);
 		}
 	}
diff --git a/tests/chamelium/kms_chamelium_helper.c b/tests/chamelium/kms_chamelium_helper.c
index f3229a85c9ec..9eaeb3f769bf 100644
--- a/tests/chamelium/kms_chamelium_helper.c
+++ b/tests/chamelium/kms_chamelium_helper.c
@@ -204,11 +204,11 @@ void chamelium_enable_output(chamelium_data_t *data,
 enum pipe chamelium_get_pipe_for_output(igt_display_t *display,
 					igt_output_t *output)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
-	for_each_pipe(display, pipe) {
+	for_each_crtc(display, crtc) {
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 
 		if (!intel_pipe_output_combo_valid(display)) {
 			igt_output_set_crtc(output, NULL);
@@ -216,7 +216,7 @@ enum pipe chamelium_get_pipe_for_output(igt_display_t *display,
 		}
 
 		igt_output_set_crtc(output, NULL);
-		return pipe;
+		return crtc->pipe;
 	}
 
 	igt_assert_f(false, "No pipe found for output %s\n",
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 8f13b380a46b..e74e774be680 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -297,7 +297,7 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
 				       struct chamelium_port *port)
 {
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	struct udev_monitor *mon = igt_watch_uevents();
 
 	chamelium_reset_state(&data->display, data->chamelium, port,
@@ -305,7 +305,7 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
 
 	igt_hpd_storm_set_threshold(data->drm_fd, 0);
 
-	for_each_pipe(&data->display, pipe) {
+	for_each_crtc(&data->display, crtc) {
 		igt_modeset_disable_all_outputs(&data->display);
 		igt_flush_uevents(mon);
 		/* Check if we get a sysfs hotplug event */
@@ -317,7 +317,7 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
 
 		/* If pipe is valid for output then set it */
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		if (intel_pipe_output_combo_valid(&data->display))
 			igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index 433a2d5c8dab..2d9cb6ccee98 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -232,13 +232,13 @@ static void
 run_sharpness_filter_test(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	igt_describe("Verify basic content adaptive sharpness filter.");
 	igt_subtest_with_dynamic("filter-basic") {
-		for_each_pipe(display, pipe) {
+		for_each_crtc(display, crtc) {
 			data->filter_strength = MID_FILTER_STRENGTH;
-			test_sharpness_filter(data, pipe);
+			test_sharpness_filter(data, crtc->pipe);
 		}
 	}
 }
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index e3c2be0b4e41..a1878993d848 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -92,12 +92,12 @@ set_fb_on_crtc(igt_display_t *dpy, int pipe,
 
 static void do_cleanup_display(igt_display_t *dpy)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 	igt_plane_t *plane;
 
-	for_each_pipe(dpy, pipe)
-		for_each_plane_on_pipe(dpy, pipe, plane)
+	for_each_crtc(dpy, crtc)
+		for_each_plane_on_pipe(dpy, crtc->pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
 	for_each_connected_output(dpy, output)
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index bb7c5922b643..9e912c50f0a4 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -114,12 +114,12 @@ static drmModeModeInfo *get_lowres_mode(igt_output_t *output)
 
 static void do_cleanup_display(igt_display_t *dpy)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 	igt_plane_t *plane;
 
-	for_each_pipe(dpy, pipe)
-		for_each_plane_on_pipe(dpy, pipe, plane)
+	for_each_crtc(dpy, crtc)
+		for_each_plane_on_pipe(dpy, crtc->pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
 	for_each_connected_output(dpy, output)
diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 625d3ead21b5..d859db64b4ff 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -151,10 +151,10 @@ static void do_modeset(data_t *data, bool mst)
 	struct igt_plane *planes[IGT_MAX_PIPES];
 	int n_pipes = 0;
 	int out_count = 0;
-	int i;
+	igt_crtc_t *crtc;
 
-	for_each_pipe(&data->display, i) {
-		valid_pipes_mask |= BIT(i);
+	for_each_crtc(&data->display, crtc) {
+		valid_pipes_mask |= BIT(crtc->pipe);
 		n_pipes++;
 	}
 
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 40229743d45c..f7d069309e80 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -871,7 +871,7 @@ static void run_tests(data_t *data, uint32_t index, enum pipe pipe,
 
 int igt_main()
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	data_t data = {};
 	igt_output_t *output;
 	drmModeModeInfoPtr modetoset = NULL;
@@ -911,35 +911,47 @@ int igt_main()
 					      "Linear fb with REFLECT_X unsupported\n");
 
 			free_fbs(&data);
-			for_each_pipe(&data.display, pipe) {
+			for_each_crtc(&data.display, crtc) {
 				bool found = false;
-				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				for_each_valid_output_on_pipe(&data.display,
+							      crtc->pipe,
+							      output) {
 					igt_display_reset(&data.display);
 
 					modetoset = find_mode(&data, output);
 					igt_output_set_crtc(output,
-							    igt_crtc_for_pipe(output->display, pipe));
+							    crtc);
 					igt_output_override_mode(output, modetoset);
 
 					if (modetoset && intel_pipe_output_combo_valid(&data.display)) {
 						found = true;
-						igt_dynamic_f("pipe-%s-valid-mode", kmstest_pipe_name(pipe))
-							run_tests(&data, index, pipe, output, modetoset);
+						igt_dynamic_f("pipe-%s-valid-mode",
+							      igt_crtc_name(crtc))
+							run_tests(&data, index,
+								  crtc->pipe,
+								  output,
+								  modetoset);
 						break;
 					}
 				}
 				if (!found) {
-					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					for_each_valid_output_on_pipe(&data.display,
+								      crtc->pipe,
+								      output) {
 						igt_display_reset(&data.display);
 
 						igt_output_set_crtc(output,
-								    igt_crtc_for_pipe(output->display, pipe));
+								    crtc);
 						if (!intel_pipe_output_combo_valid(&data.display))
 							continue;
 
 						modetoset = NULL;
-						igt_dynamic_f("pipe-%s-default-mode", kmstest_pipe_name(pipe))
-							run_tests(&data, index, pipe, output, modetoset);
+						igt_dynamic_f("pipe-%s-default-mode",
+							      igt_crtc_name(crtc))
+							run_tests(&data, index,
+								  crtc->pipe,
+								  output,
+								  modetoset);
 					}
 				}
 				break;
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 1f8d6600b4a8..41f6126d2d1b 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -582,7 +582,8 @@ static void test_basic_max_non_joiner(data_t *data)
 int igt_main()
 {
 	bool is_dgfx;
-	int i, j, display_ver;
+	igt_crtc_t *crtc;
+	int j, display_ver;
 	igt_output_t *output;
 	drmModeModeInfo mode;
 	data_t data;
@@ -654,9 +655,9 @@ int igt_main()
 		}
 
 		data.n_pipes = 0;
-		for_each_pipe(&data.display, i) {
+		for_each_crtc(&data.display, crtc) {
 			data.n_pipes++;
-			data.pipe_seq[j] = i;
+			data.pipe_seq[j] = crtc->pipe;
 			j++;
 		}
 	}
diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 360887f1772f..daa70c71688a 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -176,13 +176,13 @@ static void test_setup(igt_display_t display, igt_output_t *output)
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	struct igt_fb fb;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	igt_display_reset(&display);
 
-	for_each_pipe(&display, pipe) {
+	for_each_crtc(&display, crtc) {
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(&display)) {
 			igt_output_set_crtc(output, NULL);
 			continue;
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index eef10e54ab3d..21f299429e23 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -223,7 +223,7 @@ int igt_main()
 	igt_subtest_with_dynamic_f("kms-lpsp") {
 		igt_display_t *display = &data.display;
 		igt_output_t *output;
-		enum pipe pipe;
+		igt_crtc_t *crtc;
 
 		for_each_connected_output(display, output) {
 			drmModeConnectorPtr connector = output->config.connector;
@@ -231,12 +231,12 @@ int igt_main()
 			if (!i915_output_is_lpsp_capable(data.drm_fd, output))
 				continue;
 
-			for_each_pipe(display, pipe) {
-				if (!igt_pipe_connector_valid(pipe, output))
+			for_each_crtc(display, crtc) {
+				if (!igt_pipe_connector_valid(crtc->pipe, output))
 					continue;
 
 				/* LPSP is low power single pipe usages i.e. PIPE_A */
-				if (pipe != PIPE_A)
+				if (crtc->pipe != PIPE_A)
 					continue;
 
 				if (connector->connector_type != DRM_MODE_CONNECTOR_eDP)
@@ -244,12 +244,14 @@ int igt_main()
 						     "LPSP support on external panel from Gen13+ platform\n");
 
 				data.output = output;
-				data.pipe = pipe;
+				data.pipe = crtc->pipe;
 
 				if (!test_constraint(&data))
 					continue;
 
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
+				igt_dynamic_f("pipe-%s-%s",
+					      igt_crtc_name(crtc),
+					      igt_output_name(output))
 					test_lpsp(&data);
 
 				test_cleanup(&data);
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 8bb4b15482ae..c411981c0104 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -694,18 +694,18 @@ static void setup_test_plane(data_t *data, int test_plane)
 static enum pipe get_pipe_for_output(igt_display_t *display,
 				     igt_output_t *output)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
-	for_each_pipe(display, pipe) {
+	for_each_crtc(display, crtc) {
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 
 		if (!intel_pipe_output_combo_valid(display)) {
 			igt_output_set_crtc(output, NULL);
 			continue;
 		}
 
-		return pipe;
+		return crtc->pipe;
 	}
 
 	igt_assert_f(false, "No pipe found for output %s\n",
diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 56eccf2dece0..4a34b4a0ec70 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -428,15 +428,15 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	char name[40];
 
 	for_each_connected_output(display, output) {
-		for_each_pipe(display, pipe) {
+		for_each_crtc(display, crtc) {
 			igt_display_reset(display);
 
 			data->output = output;
-			data->pipe_id = pipe;
+			data->pipe_id = crtc->pipe;
 			data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 			data->mode = igt_output_get_mode(data->output);
 
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 01d739c759f1..e017d58e1f5b 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -799,13 +799,13 @@ static void unset_output_pipe(igt_display_t *display)
 static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 {
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	unsigned event_mask = 0;
 
 	unset_output_pipe(&data->display);
 
-	for_each_pipe(&data->display, pipe) {
-		igt_plane_t *plane = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, pipe),
+	for_each_crtc(&data->display, crtc) {
+		igt_plane_t *plane = igt_crtc_get_plane_type(crtc,
 							     DRM_PLANE_TYPE_PRIMARY);
 
 		enum pipe old_pipe = plane->ref->crtc->pipe;
@@ -814,7 +814,7 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 		 * If a plane is being shared by multiple pipes, we must disable the pipe that
 		 * currently is holding the plane
 		 */
-		if (old_pipe != pipe) {
+		if (old_pipe != crtc->pipe) {
 			igt_plane_t *old_plane = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, old_pipe),
 									 DRM_PLANE_TYPE_PRIMARY);
 
@@ -823,28 +823,29 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 		}
 	}
 
-	for_each_pipe(&data->display, pipe) {
-		igt_plane_t *plane = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, pipe),
+	for_each_crtc(&data->display, crtc) {
+		igt_plane_t *plane = igt_crtc_get_plane_type(crtc,
 							     DRM_PLANE_TYPE_PRIMARY);
 		drmModeModeInfo *mode = NULL;
 
-		if (!(mask & (1 << pipe))) {
-			if (igt_crtc_is_prop_changed(igt_crtc_for_pipe(&data->display, pipe), IGT_CRTC_ACTIVE)) {
-				event_mask |= 1 << pipe;
+		if (!(mask & (1 << crtc->pipe))) {
+			if (igt_crtc_is_prop_changed(crtc, IGT_CRTC_ACTIVE)) {
+				event_mask |= 1 << crtc->pipe;
 				igt_plane_set_fb(plane, NULL);
 			}
 
 			continue;
 		}
 
-		event_mask |= 1 << pipe;
+		event_mask |= 1 << crtc->pipe;
 
-		for_each_valid_output_on_pipe(&data->display, pipe, output) {
+		for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+					      output) {
 			if (igt_output_get_driving_crtc(output) != NULL)
 				continue;
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 			if (intel_pipe_output_combo_valid(&data->display)) {
 				mode = igt_output_get_mode(output);
 				break;
@@ -857,7 +858,7 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 			return 0;
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		igt_plane_set_fb(plane, fb);
 		igt_fb_set_size(fb, plane, mode->hdisplay, mode->vdisplay);
 		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
@@ -868,14 +869,14 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 
 static void refresh_primaries(data_t  *data, int mask)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_plane_t *plane;
 
-	for_each_pipe(&data->display, pipe) {
-		if (!((1 << pipe) & mask))
+	for_each_crtc(&data->display, crtc) {
+		if (!((1 << crtc->pipe) & mask))
 			continue;
 
-		for_each_plane_on_pipe(&data->display, pipe, plane)
+		for_each_plane_on_pipe(&data->display, crtc->pipe, plane)
 			if (plane->type == DRM_PLANE_TYPE_PRIMARY)
 				igt_plane_set_position(plane, 0, 0);
 	}
@@ -903,7 +904,6 @@ static void run_modeset_tests(data_t *data, int howmany, bool nonblocking, bool
 	unsigned iter_max;
 	igt_output_t *output;
 	uint16_t width = 0, height = 0;
-	enum pipe pipe_enum;
 
 retry:
 	unset_output_pipe(&data->display);
@@ -1047,8 +1047,8 @@ retry:
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	if (is_intel_device(data->drm_fd)) {
-		for_each_pipe(&data->display, pipe_enum)
-			igt_pipe_crc_free(data->pipe_crcs[pipe_enum]);
+		for_each_crtc(&data->display, crtc)
+			igt_pipe_crc_free(data->pipe_crcs[crtc->pipe]);
 	}
 
 	igt_remove_fb(data->drm_fd, &data->fbs[0]);
@@ -1059,20 +1059,21 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
 {
 	igt_output_t *outputs[IGT_MAX_PIPES] = {};
 	int num_outputs = 0;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
-	for_each_pipe(&data->display, pipe) {
+	for_each_crtc(&data->display, crtc) {
 		igt_output_t *output;
 
-		for_each_valid_output_on_pipe(&data->display, pipe, output) {
+		for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+					      output) {
 			int i;
 
-			for (i = pipe - 1; i >= 0; i--)
+			for (i = crtc->pipe - 1; i >= 0; i--)
 				if (outputs[i] == output)
 					break;
 
 			if (i < 0) {
-				outputs[pipe] = output;
+				outputs[crtc->pipe] = output;
 				num_outputs++;
 				break;
 			}
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index bc894482bbc1..876f089fdabe 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -126,7 +126,7 @@ static data_t data;
 static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 fourcc_in, __u32 fourcc_out)
 {
 	int i;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	drmModeModeInfo override_mode = {
 		.clock = 25175,
@@ -151,14 +151,14 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 four
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 			continue;
 
-		for_each_pipe(display, pipe) {
+		for_each_crtc(display, crtc) {
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 
 			if (check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out)) {
 				igt_debug("Using connector %u:%s on pipe %d\n",
 					  output->config.connector->connector_id,
-					  output->name, pipe);
+					  output->name, crtc->pipe);
 				return output;
 			}
 		}
@@ -296,14 +296,15 @@ static void check_plane_colorop_ids(igt_display_t *display)
 	igt_plane_t *plane;
 	int colorop_idx;
 	igt_colorop_t *next;
-	int prop_val = 0, pipe = 0;
+	igt_crtc_t *crtc;
+	int prop_val = 0;
 
 	/* Use hash tables to track drm_planes and unique IDs */
 	GHashTable *plane_set = g_hash_table_new(g_direct_hash, g_direct_equal);
 	GHashTable *id_set = g_hash_table_new(g_direct_hash, g_direct_equal);
 
-	for_each_pipe(display, pipe) {
-		for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_crtc(display, crtc) {
+		for_each_plane_on_pipe(display, crtc->pipe, plane) {
 			/* Skip when a drm_plane is already scanned */
 			if (g_hash_table_contains(plane_set, GINT_TO_POINTER(plane->drm_plane->plane_id)))
 				continue;
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 67710dad1beb..40f9c418d7a5 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -712,7 +712,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 {
 	igt_display_t *display = &data.display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	if (data.cp_tests & CP_MEI_RELOAD)
 		igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
@@ -724,7 +724,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 	}
 
 	for_each_connected_output(display, output) {
-		for_each_pipe(display, pipe) {
+		for_each_crtc(display, crtc) {
 			if (!output_hdcp_capable(output, content_type))
 				continue;
 			if (is_output_hdcp_test_exempt(output)) {
@@ -735,16 +735,20 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 
 			igt_display_reset(display);
 			igt_output_set_crtc(output,
-				            igt_crtc_for_pipe(output->display, pipe));
+				            crtc);
 			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
-			modeset_with_fb(pipe, output, commit_style);
+			modeset_with_fb(crtc->pipe, output, commit_style);
 			if (data.is_force_hdcp14)
 				set_i915_force_hdcp14(output);
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
-				test_content_protection_on_output(output, pipe, commit_style, content_type);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      output->name)
+				test_content_protection_on_output(output,
+								  crtc->pipe,
+								  commit_style,
+								  content_type);
 
 			if (data.is_force_hdcp14)
 				reset_i915_force_hdcp14(output);
@@ -867,7 +871,7 @@ test_content_protection_mst(int content_type)
 	bool pipe_found;
 	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
 
-	for_each_pipe(display, pipe)
+	for_each_crtc(display, crtc)
 		max_pipe++;
 
 	pipe = PIPE_A;
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 10e51b457a15..d3bd54408efe 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -1276,7 +1276,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	int ret;
 
 	igt_fixture() {
-		enum pipe pipe;
+		igt_crtc_t *crtc;
 
 		last_pipe = 0;
 
@@ -1285,8 +1285,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
 		/* Get active pipes. */
-		for_each_pipe(&data.display, pipe)
-			active_pipes[last_pipe++] = pipe;
+		for_each_crtc(&data.display, crtc)
+			active_pipes[last_pipe++] = crtc->pipe;
 		last_pipe--;
 
 		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &cursor_width);
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 86577fbc53d8..688a2e5c67f3 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -358,7 +358,6 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_fixture() {
 		int ret;
-		enum pipe pipe;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
@@ -380,8 +379,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		/* Get active pipes. */
 		last_pipe = 0;
-		for_each_pipe(&data.display, pipe)
-			active_pipes[last_pipe++] = pipe;
+		for_each_crtc(&data.display, crtc)
+			active_pipes[last_pipe++] = crtc->pipe;
 		last_pipe--;
 	}
 
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 717a31f4fa64..ad2a15d0f33c 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -267,7 +267,7 @@ static void stress(igt_display_t *display,
 	struct drm_mode_cursor arg;
 	uint64_t *results;
 	bool torture;
-	int n;
+	igt_crtc_t *crtc;
 	unsigned crtc_id[IGT_MAX_PIPES] = {0}, num_crtcs;
 
 	torture = false;
@@ -288,9 +288,8 @@ static void stress(igt_display_t *display,
 
 	if (pipe < 0) {
 		num_crtcs = igt_display_n_crtcs(display);
-		for_each_pipe(display, n) {
-			arg.crtc_id = crtc_id[n] = igt_crtc_for_pipe(display,
-								     n)->crtc_id;
+		for_each_crtc(display, crtc) {
+			arg.crtc_id = crtc_id[crtc->pipe] = crtc->crtc_id;
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
 		}
 	} else {
@@ -1869,7 +1868,7 @@ int igt_main()
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
 		     "on single/all pipes with different modes, priority and number of processes");
 	igt_subtest_group() {
-		enum pipe n;
+		igt_crtc_t *crtc;
 		struct {
 			const char *name;
 			int ncpus;
@@ -1885,11 +1884,14 @@ int igt_main()
 
 		for (i = 0; i < ARRAY_SIZE(tests); i++) {
 			igt_subtest_with_dynamic(tests[i].name) {
-				for_each_pipe(&display, n) {
+				for_each_crtc(&display, crtc) {
 					errno = 0;
 
-					igt_dynamic_f("pipe-%s", kmstest_pipe_name(n))
-						stress(&display, n, tests[i].ncpus, tests[i].flags, 5);
+					igt_dynamic_f("pipe-%s",
+						      igt_crtc_name(crtc))
+						stress(&display, crtc->pipe,
+						       tests[i].ncpus,
+						       tests[i].flags, 5);
 				}
 
 				errno = 0;
diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
index 228a54cd1a35..1f23eac69979 100644
--- a/tests/kms_debugfs.c
+++ b/tests/kms_debugfs.c
@@ -35,13 +35,13 @@
 static void igt_display_all_on(igt_display_t *display)
 {
 	struct igt_fb fb[IGT_MAX_PIPES];
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	/* try to light all pipes */
-	for_each_pipe(display, pipe) {
+	for_each_crtc(display, crtc) {
 		igt_output_t *output;
 
-		for_each_valid_output_on_pipe(display, pipe, output) {
+		for_each_valid_output_on_pipe(display, crtc->pipe, output) {
 			igt_plane_t *primary;
 			drmModeModeInfo *mode;
 
@@ -49,18 +49,19 @@ static void igt_display_all_on(igt_display_t *display)
 				continue;
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 			mode = igt_output_get_mode(output);
 			igt_create_pattern_fb(display->drm_fd,
 					      mode->hdisplay, mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
+					      DRM_FORMAT_MOD_LINEAR,
+					      &fb[crtc->pipe]);
 
 			/* Set a valid fb as some debugfs like to
 			 * inspect it on a active pipe
 			 */
-			igt_plane_set_fb(primary, &fb[pipe]);
+			igt_plane_set_fb(primary, &fb[crtc->pipe]);
 			break;
 		}
 	}
@@ -79,15 +80,15 @@ static void igt_display_all_on(igt_display_t *display)
  */
 static void igt_display_all_off(igt_display_t *display)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 	igt_plane_t *plane;
 
 	for_each_connected_output(display, output)
 		igt_output_set_crtc(output, NULL);
 
-	for_each_pipe(display, pipe)
-		for_each_plane_on_pipe(display, pipe, plane)
+	for_each_crtc(display, crtc)
+		for_each_plane_on_pipe(display, crtc->pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 1bb4b483aafd..fc0ba956e45f 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -188,18 +188,18 @@ static void run_extendedmode_basic(data_t *data,
 
 static void run_extendedmode_test(data_t *data) {
 	igt_crtc_t *crtc2;
-	enum pipe pipe1;
+	igt_crtc_t *crtc;
 	bool sim_flag = igt_run_in_simulation();
 	igt_output_t *output1, *output2;
 	igt_display_t *display = &data->display;
 
 	igt_display_reset(display);
 
-	for_each_pipe(display, pipe1) {
-		for_each_valid_output_on_pipe(display, pipe1, output1) {
+	for_each_crtc(display, crtc) {
+		for_each_valid_output_on_pipe(display, crtc->pipe, output1) {
 
 			for_each_crtc(display, crtc2) {
-				if (pipe1 == crtc2->pipe)
+				if (crtc->pipe == crtc2->pipe)
 					continue;
 
 				for_each_valid_output_on_pipe_local(display,
@@ -211,7 +211,7 @@ static void run_extendedmode_test(data_t *data) {
 					igt_display_reset(display);
 
 					igt_output_set_crtc(output1,
-							    igt_crtc_for_pipe(output1->display, pipe1));
+							    crtc);
 					igt_output_set_crtc(output2,
 							    crtc2);
 
@@ -219,12 +219,13 @@ static void run_extendedmode_test(data_t *data) {
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
-						      kmstest_pipe_name(pipe1),
+						      igt_crtc_name(crtc),
 						      igt_output_name(output1),
 						      igt_crtc_name(crtc2),
 						      igt_output_name(output2))
 						run_extendedmode_basic(data,
-								pipe1, output1,
+								crtc->pipe,
+								output1,
 								crtc2->pipe,
 								output2);
 				}
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 6baab2436634..38b2c8b74527 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -203,7 +203,7 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 	igt_display_reset(display);
 
 	for_each_connected_output(display, output) {
-		enum pipe pipe;
+		igt_crtc_t *crtc;
 
 		if (!is_supported(output)) {
 			igt_info("Output %s: Doesn't support \"max bpc\" property.\n",
@@ -217,9 +217,9 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 			continue;
 		}
 
-		for_each_pipe(display, pipe) {
+		for_each_crtc(display, crtc) {
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 
 			if (!intel_pipe_output_combo_valid(display)) {
 				igt_output_set_crtc(output, NULL);
@@ -227,8 +227,10 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 			}
 
 			igt_dynamic_f("pipe-%s-%s",
-					      kmstest_pipe_name(pipe), output->name)
-				test_dithering(data, pipe, output, fb_bpc,
+					      igt_crtc_name(crtc),
+					      output->name)
+				test_dithering(data, crtc->pipe, output,
+							   fb_bpc,
 							   fb_format, output_bpc);
 
 			/* One pipe is enough */
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index a2af0e2dfc2a..f0216a4ce491 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -93,15 +93,17 @@ int igt_main() {
 		igt_subtest_group() {
 			volatile int output_count = 0;
 			igt_output_t *output;
-			enum pipe pipe;
+			igt_crtc_t *crtc;
 
 			igt_fixture() {
 				/* this is what most of the 2x tests are doing */
-				for_each_pipe(&display, pipe) {
-					for_each_valid_output_on_pipe(&display, pipe, output) {
+				for_each_crtc(&display, crtc) {
+					for_each_valid_output_on_pipe(&display,
+								      crtc->pipe,
+								      output) {
 						if (igt_output_get_driving_crtc(output) == NULL) {
 							igt_output_set_crtc(output,
-									    igt_crtc_for_pipe(output->display, pipe));
+									    crtc);
 							output_count++;
 							break;
 						}
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index be11f6527903..738651aefb27 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -315,7 +315,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 	igt_display_reset(display);
 
 	for_each_connected_output(display, output) {
-		enum pipe pipe;
+		igt_crtc_t *crtc;
 
 		if (!has_max_bpc(output)) {
 			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
@@ -328,18 +328,18 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 			continue;
 		}
 
-		for_each_pipe(display, pipe) {
+		for_each_crtc(display, crtc) {
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 			if (!intel_pipe_output_combo_valid(display)) {
 				igt_output_set_crtc(output, NULL);
 				continue;
 			}
 
-			prepare_test(data, output, pipe);
+			prepare_test(data, output, crtc->pipe);
 
 			if (is_intel_device(data->fd) &&
-			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+			    !igt_max_bpc_constraint(display, crtc->pipe, output, 10)) {
 				igt_info("%s: No suitable mode found to use 10 bpc.\n",
 					 igt_output_name(output));
 
@@ -352,8 +352,9 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 			data->h = data->mode->vdisplay;
 
 			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe), output->name)
-				test_bpc_switch_on_output(data, pipe, output, flags);
+				      igt_crtc_name(crtc), output->name)
+				test_bpc_switch_on_output(data, crtc->pipe,
+							  output, flags);
 
 			/* One pipe is enough */
 			break;
@@ -701,7 +702,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 	igt_display_reset(display);
 
 	for_each_connected_output(display, output) {
-		enum pipe pipe;
+		igt_crtc_t *crtc;
 
 		/* To test HDR, 10 bpc is required, so we need to
 		 * set MAX_BPC property to 10bpc prior to setting
@@ -737,15 +738,15 @@ static void test_hdr(data_t *data, uint32_t flags)
 			continue;
 		}
 
-		for_each_pipe(display, pipe) {
+		for_each_crtc(display, crtc) {
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 			if (!intel_pipe_output_combo_valid(display)) {
 				igt_output_set_crtc(output, NULL);
 				continue;
 			}
 
-			prepare_test(data, output, pipe);
+			prepare_test(data, output, crtc->pipe);
 
 			/* Signal HDR requirement via metadata */
 			fill_hdr_output_metadata_st2084(&hdr);
@@ -759,7 +760,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 			}
 
 			if (is_intel_device(data->fd) &&
-			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+			    !igt_max_bpc_constraint(display, crtc->pipe, output, 10)) {
 				igt_info("%s: No suitable mode found to use 10 bpc.\n",
 					 igt_output_name(output));
 
@@ -781,12 +782,14 @@ static void test_hdr(data_t *data, uint32_t flags)
 			data->h = data->mode->vdisplay;
 
 			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe), output->name) {
+				      igt_crtc_name(crtc), output->name) {
 				if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
 					     TEST_INVALID_HDR | TEST_BRIGHTNESS))
-					test_static_toggle(data, pipe, output, flags);
+					test_static_toggle(data, crtc->pipe,
+							   output, flags);
 				if (flags & TEST_SWAP)
-					test_static_swap(data, pipe, output, flags);
+					test_static_swap(data, crtc->pipe,
+							 output, flags);
 				if (flags & TEST_INVALID_METADATA_SIZES)
 					test_invalid_metadata_sizes(data, output);
 			}
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 951159e97779..8c0412d32222 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -696,7 +696,7 @@ static void lease_get(data_t *data)
 
 static void lease_unleased_crtc(data_t *data)
 {
-	enum pipe p;
+	igt_crtc_t *crtc;
 	uint32_t bad_crtc_id;
 	drmModeCrtc *drm_crtc;
 	int ret;
@@ -709,12 +709,11 @@ static void lease_unleased_crtc(data_t *data)
 	/* Find another CRTC that we don't control */
 	bad_crtc_id = 0;
 
-	for_each_pipe(&data->master.display, p) {
+	for_each_crtc(&data->master.display, crtc) {
 		if (bad_crtc_id != 0)
 			break;
-		if (igt_crtc_for_pipe(&data->master.display, p)->crtc_id != data->crtc_id)
-			bad_crtc_id = igt_crtc_for_pipe(&data->master.display,
-							p)->crtc_id;
+		if (crtc->crtc_id != data->crtc_id)
+			bad_crtc_id = crtc->crtc_id;
 	}
 
 	/* Give up if there isn't another crtc */
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index eaa4f8e2ef1b..b46740d32271 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -749,7 +749,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	data_t data = {};
 
 	igt_fixture() {
-		enum pipe pipe;
+		igt_crtc_t *crtc;
 
 		last_pipe = 0;
 
@@ -759,8 +759,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_require(data.display.is_atomic);
 
 		/* Get active pipes. */
-		for_each_pipe(&data.display, pipe)
-			active_pipes[last_pipe++] = pipe;
+		for_each_crtc(&data.display, crtc)
+			active_pipes[last_pipe++] = crtc->pipe;
 		last_pipe--;
 
 		in_simulation = igt_run_in_simulation();
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 1b08685f2aac..ce0101f76800 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -289,15 +289,16 @@ static void test_cleanup(data_t *data)
 
 static void run_test(data_t *data, uint64_t modifier)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 
 	if(!igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888, modifier))
 		return;
 
-	for_each_pipe(&data->display, pipe) {
-		for_each_valid_output_on_pipe(&data->display, pipe, output) {
-			data->pipe = pipe;
+	for_each_crtc(&data->display, crtc) {
+		for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+					      output) {
+			data->pipe = crtc->pipe;
 			data->output = output;
 
 			igt_display_reset(&data->display);
@@ -310,7 +311,8 @@ static void run_test(data_t *data, uint64_t modifier)
 			data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
 							  IGT_PIPE_CRC_SOURCE_AUTO);
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), data->output->name)
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      data->output->name)
 				test_planes_on_pipe(data, modifier);
 
 			test_cleanup(data);
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index aeaf6bf514a9..b56ef2d82eed 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -512,7 +512,7 @@ static void test_plane_position_2_display(data_t *data, enum pipe pipe1, enum pi
 static void run_2_display_test(data_t *data, uint64_t modifier, const char *name)
 {
 	igt_crtc_t *crtc2;
-	enum pipe pipe1;
+	igt_crtc_t *crtc;
 	igt_output_t *output1, *output2;
 	igt_display_t *display = &data->display;
 
@@ -521,10 +521,10 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 
 	igt_display_reset(display);
 
-	for_each_pipe(display, pipe1) {
-		for_each_valid_output_on_pipe(display, pipe1, output1) {
+	for_each_crtc(display, crtc) {
+		for_each_valid_output_on_pipe(display, crtc->pipe, output1) {
 			for_each_crtc(display, crtc2) {
-				if (pipe1 == crtc2->pipe)
+				if (crtc->pipe == crtc2->pipe)
 					continue;
 
 				for_each_valid_output_on_pipe_local(display,
@@ -536,7 +536,7 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 					igt_display_reset(display);
 
 					igt_output_set_crtc(output1,
-							    igt_crtc_for_pipe(output1->display, pipe1));
+							    crtc);
 					igt_output_set_crtc(output2,
 							    crtc2);
 
@@ -544,10 +544,12 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
-						       kmstest_pipe_name(pipe1), output1->name,
+						       igt_crtc_name(crtc),
+						       output1->name,
 						       igt_crtc_name(crtc2),
 						       output2->name)
-						test_plane_position_2_display(data, pipe1,
+						test_plane_position_2_display(data,
+									      crtc->pipe,
 									      crtc2->pipe,
 									      output1, output2,
 									      modifier);
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 1d46bca52114..3d21b79b2392 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -317,27 +317,29 @@ static void colorop_properties(igt_display_t *display, bool atomic)
 {
 	bool found_any = false, found;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	/* colorops are only available with atomic */
 	igt_skip_on(!display->is_atomic);
 
-	for_each_pipe(display, pipe) {
+	for_each_crtc(display, crtc) {
 		found = false;
 
-		for_each_valid_output_on_pipe(display, pipe, output) {
+		for_each_valid_output_on_pipe(display, crtc->pipe, output) {
 			igt_display_reset(display);
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
 			found_any = found = true;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
-				igt_output_name(output)) {
-				run_colorop_property_tests(display, pipe, output, atomic);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output)) {
+				run_colorop_property_tests(display,
+							   crtc->pipe, output,
+							   atomic);
 			}
 		}
 	}
@@ -389,25 +391,27 @@ static void crtc_properties(igt_display_t *display, bool atomic)
 
 static void connector_properties(igt_display_t *display, bool atomic)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 
 	for_each_connected_output(display, output) {
 		igt_display_reset(display);
 
-		for_each_pipe(display, pipe) {
+		for_each_crtc(display, crtc) {
 			igt_display_reset(display);
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 			if (!intel_pipe_output_combo_valid(display)) {
 				igt_output_set_crtc(output, NULL);
 				continue;
 			}
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
-				run_connector_property_tests(display, pipe, output, atomic);
+				run_connector_property_tests(display,
+							     crtc->pipe,
+							     output, atomic);
 			}
 
 			break;
@@ -487,15 +491,15 @@ static void test_object_invalid_properties(igt_display_t *display,
 {
 	igt_output_t *output;
 	igt_plane_t *plane;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
-	for_each_pipe(display, pipe)
+	for_each_crtc(display, crtc)
 		test_invalid_properties(display->drm_fd, id, type,
-				        igt_crtc_for_pipe(display, pipe)->crtc_id,
+				        crtc->crtc_id,
 				        DRM_MODE_OBJECT_CRTC, atomic);
 
-	for_each_pipe(display, pipe)
-		for_each_plane_on_pipe(display, pipe, plane)
+	for_each_crtc(display, crtc)
+		for_each_plane_on_pipe(display, crtc->pipe, plane)
 			test_invalid_properties(display->drm_fd, id, type, plane->drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
 
 	for_each_output(display, output)
@@ -892,18 +896,18 @@ static void invalid_properties(igt_display_t *display, bool atomic)
 {
 	igt_output_t *output;
 	igt_plane_t *plane;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	if (atomic)
 		igt_skip_on(!display->is_atomic);
 
-	for_each_pipe(display, pipe)
+	for_each_crtc(display, crtc)
 		test_object_invalid_properties(display,
-				               igt_crtc_for_pipe(display, pipe)->crtc_id,
+				               crtc->crtc_id,
 				               DRM_MODE_OBJECT_CRTC, atomic);
 
-	for_each_pipe(display, pipe)
-		for_each_plane_on_pipe(display, pipe, plane)
+	for_each_crtc(display, crtc)
+		for_each_plane_on_pipe(display, crtc->pipe, plane)
 			test_object_invalid_properties(display, plane->drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
 
 	for_each_output(display, output)
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index b63b03c0cd51..1e3bbfdd51e3 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -215,7 +215,7 @@ static void setup_mode(data_t *data)
 {
 	int count = 0, prev = 0, i = 0;
 	bool pipe_in_use = false, found = false;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	drmModeModeInfo *mode;
 	igt_output_t *output;
 	data_connector_t *conns = data->conns;
@@ -231,13 +231,13 @@ static void setup_mode(data_t *data)
 		output = igt_output_from_connector(&data->display,
 						   conns[count].connector);
 
-		for_each_pipe(&data->display, pipe) {
+		for_each_crtc(&data->display, crtc) {
 			pipe_in_use = false;
 			found = false;
 
 			if (count > 0) {
 				for (prev = count - 1; prev >= 0; prev--) {
-					if (pipe == conns[prev].pipe) {
+					if (crtc->pipe == conns[prev].pipe) {
 						pipe_in_use = true;
 						break;
 					}
@@ -246,8 +246,8 @@ static void setup_mode(data_t *data)
 					continue;
 			}
 
-			if (igt_pipe_connector_valid(pipe, output)) {
-				conns[count].pipe = pipe;
+			if (igt_pipe_connector_valid(crtc->pipe, output)) {
+				conns[count].pipe = crtc->pipe;
 				conns[count].output = output;
 
 				igt_output_set_crtc(conns[count].output,
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index eaceea0035ea..99078707d543 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1090,14 +1090,14 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 	igt_output_t *output;
 
 	for_each_connected_output(&data->display, output) {
-		enum pipe pipe;
+		igt_crtc_t *crtc;
 
 		if (!config_constraint(data, output, flags))
 			continue;
 
-		for_each_pipe(&data->display, pipe) {
+		for_each_crtc(&data->display, crtc) {
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 
 			if (!intel_pipe_output_combo_valid(&data->display)) {
 				igt_output_set_crtc(output, NULL);
@@ -1105,10 +1105,10 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 			}
 
 			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe), output->name)
-				test(data, pipe, output, flags);
+				      igt_crtc_name(crtc), output->name)
+				test(data, crtc->pipe, output, flags);
 
-			test_cleanup(data, pipe, output);
+			test_cleanup(data, crtc->pipe, output);
 
 			break;
 		}
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 0b968baa260a..e94e3b7842da 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -144,7 +144,7 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 {
 	int i;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	drmModeModeInfo override_mode = {
 		.clock = 25175,
@@ -169,9 +169,9 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 			continue;
 
-		for_each_pipe(display, pipe) {
+		for_each_crtc(display, crtc) {
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 
 			if (data.custom_mode)
 				override_mode = data.user_mode;
@@ -181,7 +181,7 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 			if (check_writeback_config(display, output, override_mode)) {
 				igt_debug("Using connector %u:%s on pipe %d\n",
 					  output->config.connector->connector_id,
-					  output->name, pipe);
+					  output->name, crtc->pipe);
 				return output;
 			}
 		}
-- 
2.52.0

