Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BE2FD530E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F66A10EA54;
	Fri, 27 Feb 2026 08:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R1Ch6RxZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E46C10EA52
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179634; x=1803715634;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GgE42hAad2+YLkVbmM9yLfHYF0c1rNSFks7wD/e9b4g=;
 b=R1Ch6RxZSc7Fmf6R4ZY889FVPHcnTUaIIxr/8bJ72VQyELXJ6eqXLAS1
 OLpUvTEZprudaIejVl1W9Gh25ZASTELgZi3VxfGMtCjF42zbomoLerMYZ
 PlF4gUVzx8iguRV960J7MrP0sgC5DJN/f3IDdp43TMMUyfn85XFxGWHbs
 3lwpuBZnSNOEpDWVMyFZ7kRz8m5oLtxcHHvdSsY6mEyC3QwnzKNlxGGMy
 FSgW7g+swFPcT0bR7btTKzn4ZSaQMACM+TI+McF+c+SjiAU0oa72XCoJR
 4sn+SnnJlxndMjWpWPikykQAtHzD2AMgoO/JTtQw/7juFwclF3LF3wJZW g==;
X-CSE-ConnectionGUID: Waa/fy2CRQmV7WJXRUq4GA==
X-CSE-MsgGUID: klADggkRQMaCD8ii4DJq0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="75859391"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="75859391"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:14 -0800
X-CSE-ConnectionGUID: 6RfEWNWIQE2NcpnLjD8c2w==
X-CSE-MsgGUID: Fu2sVqqDQVi+LNJSPejZcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="216731100"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:13 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/17] lib/kms: Make the igt_*_bpc_*() interfaces more
 abstract
Date: Fri, 27 Feb 2026 10:06:40 +0200
Message-ID: <20260227080653.30389-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
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

Various igt_*_bpc_*() functions are way too low level. Instead of
passing cumbersome things like fds and strings just pass in the
proper igt_crtc_t* and/or igt_output_t*. All the callers have
those around already anyway.

 #include "scripts/iterators.cocci"

@pipe_and_output@
typedef igt_output_t;
identifier FUNC =~ "^(igt_check_output_bpc_equal|get_current_bpc|igt_assert_output_bpc_equal)$";
identifier FD, PIPE, OUTPUT_NAME;
@@
FUNC(
-	int FD, enum pipe PIPE, char *OUTPUT_NAME
+	igt_crtc_t *crtc, igt_output_t *output
	,...)
{
+	igt_display_t *display = output->display;
+	int FD = display->drm_fd;
<...
(
- OUTPUT_NAME
+ output->name
|
- PIPE
+ crtc->pipe
)
...>
}

@@
identifier FUNC =~ "^(igt_check_output_bpc_equal|get_current_bpc|igt_assert_output_bpc_equal)$";
igt_output_t *OUTPUT;
expression FD, PIPE;
@@
FUNC(
-	FD, PIPE, OUTPUT->name
+ 	igt_crtc_for_pipe(display, PIPE), OUTPUT
	,...)

@output_only@
typedef igt_output_t;
identifier FUNC =~ "^(igt_get_output_max_bpc|panel_supports_deep_color)$";
identifier FD, OUTPUT_NAME;
@@
FUNC(
-	int FD, char *OUTPUT_NAME
+	igt_output_t *output
	,...)
{
+	igt_display_t *display = output->display;
+	int FD = display->drm_fd;
<...
- OUTPUT_NAME
+ output->name
...>
}

@@
identifier FUNC =~ "^(igt_get_output_max_bpc|panel_supports_deep_color)$";
igt_output_t *OUTPUT;
expression FD;
@@
FUNC(
-	FD, OUTPUT->name
+ 	OUTPUT
	,...)

@pipe_only@
typedef igt_output_t;
identifier FUNC =~ "^(igt_get_pipe_current_bpc)$";
identifier FD, PIPE;
@@
FUNC(
-	int FD, enum pipe PIPE
+	igt_crtc_t *crtc
	,...)
{
+	igt_display_t *display = crtc->display;
+	int FD = display->drm_fd;
<...
- PIPE
+ crtc->pipe
...>
}

@@
identifier FUNC =~ "^(igt_get_pipe_current_bpc)$";
expression FD, PIPE;
@@
FUNC(
-	FD, PIPE
+ 	igt_crtc_for_pipe(display, PIPE)
	,...)

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
identifier DISPLAY, FD;
@@
  igt_display_t *DISPLAY = ...;
- int FD = DISPLAY->drm_fd;
... when != FD

@@
identifier DISPLAY;
@@
- igt_display_t *DISPLAY = ...;
... when != DISPLAY

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c              | 37 +++++++++++++++++++++----------------
 lib/igt_kms.h              | 12 ++++++------
 tests/amdgpu/amd_bypass.c  |  2 +-
 tests/amdgpu/amd_dp_dsc.c  |  7 +++----
 tests/amdgpu/amd_max_bpc.c |  4 ++--
 tests/intel/kms_dsc.c      |  4 ++--
 tests/kms_color.c          |  2 +-
 tests/kms_color_helper.c   |  4 ++--
 tests/kms_color_helper.h   |  2 +-
 tests/kms_dither.c         |  4 ++--
 tests/kms_hdr.c            | 31 ++++++++++++++++++++-----------
 11 files changed, 61 insertions(+), 48 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5c2e101f08be..85dcff02efbc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6568,14 +6568,16 @@ bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name)
  *
  * Returns: The maximum bpc from the connector debugfs.
  */
-unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name)
+unsigned int igt_get_output_max_bpc(igt_output_t *output)
 {
+	igt_display_t *display = output->display;
+	int drmfd = display->drm_fd;
 	char buf[24];
 	char *start_loc;
 	int fd, res;
 	unsigned int maximum;
 
-	fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
+	fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
 	igt_assert(fd >= 0);
 
 	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
@@ -6596,15 +6598,17 @@ unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name)
  *
  * Returns: The current bpc from the crtc debugfs.
  */
-unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe)
+unsigned int igt_get_pipe_current_bpc(igt_crtc_t *crtc)
 {
+	igt_display_t *display = crtc->display;
+	int drmfd = display->drm_fd;
 	char buf[24];
 	char debugfs_name[24];
 	char *start_loc;
 	int fd, res;
 	unsigned int current;
 
-	fd = igt_debugfs_crtc_dir(drmfd, pipe, O_RDONLY);
+	fd = igt_debugfs_crtc_dir(drmfd, crtc->pipe, O_RDONLY);
 	igt_assert(fd >= 0);
 
 	if (is_intel_device(drmfd))
@@ -6625,11 +6629,11 @@ unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe)
 	return current;
 }
 
-static unsigned int get_current_bpc(int drmfd, enum pipe pipe,
-				    char *output_name, unsigned int bpc)
+static unsigned int get_current_bpc(igt_crtc_t *crtc, igt_output_t *output,
+				    unsigned int bpc)
 {
-	unsigned int maximum = igt_get_output_max_bpc(drmfd, output_name);
-	unsigned int current = igt_get_pipe_current_bpc(drmfd, pipe);
+	unsigned int maximum = igt_get_output_max_bpc(output);
+	unsigned int current = igt_get_pipe_current_bpc(crtc);
 
 	igt_require_f(maximum >= bpc,
 		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
@@ -6647,10 +6651,11 @@ static unsigned int get_current_bpc(int drmfd, enum pipe pipe,
  *
  * Assert if crtc's current bpc is not matched with the requested one.
  */
-void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
-				 char *output_name, unsigned int bpc)
+void igt_assert_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
+				 unsigned int bpc)
 {
-	unsigned int current = get_current_bpc(drmfd, pipe, output_name, bpc);
+	unsigned int current = get_current_bpc(crtc,
+					       output, bpc);
 
 	igt_assert_eq(current, bpc);
 }
@@ -6668,10 +6673,11 @@ void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
  * Returns: True if crtc's current bpc is matched with the requested bpc,
  * else False.
  */
-bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
-				char *output_name, unsigned int bpc)
+bool igt_check_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
+				unsigned int bpc)
 {
-	unsigned int current = get_current_bpc(drmfd, pipe, output_name, bpc);
+	unsigned int current = get_current_bpc(crtc,
+					       output, bpc);
 
 	return (current == bpc);
 }
@@ -6710,8 +6716,7 @@ bool igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
 					    display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY))
 			continue;
 
-		if (!igt_check_output_bpc_equal(display->drm_fd, crtc->pipe,
-						output->name, bpc))
+		if (!igt_check_output_bpc_equal(crtc, output, bpc))
 			continue;
 
 		return true;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 08573316eea6..24fe6db70128 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1233,12 +1233,12 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
 bool igt_fit_modes_in_bw(igt_display_t *display);
 bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
 bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
-unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
-unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
-void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
-				char *output_name, unsigned int bpc);
-bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
-				char *output_name, unsigned int bpc);
+unsigned int igt_get_output_max_bpc(igt_output_t *output);
+unsigned int igt_get_pipe_current_bpc(igt_crtc_t *crtc);
+void igt_assert_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
+				 unsigned int bpc);
+bool igt_check_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
+				unsigned int bpc);
 
 int sort_drm_modes_by_clk_dsc(const void *a, const void *b);
 int sort_drm_modes_by_clk_asc(const void *a, const void *b);
diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 9d5f3dd71c89..3c537ea9e24f 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -345,7 +345,7 @@ static void bypass_8bpc_test(data_t *data)
 	 * Rx supports only up to 6bpc, Rx-crc will different from crtc-crc
 	 * with 8bpc.
 	 */
-	igt_skip_on_f(igt_get_output_max_bpc(data->drm_fd, data->output->name) <= 6,
+	igt_skip_on_f(igt_get_output_max_bpc(data->output) <= 6,
 		      "check /sys/kernel/debug/dri/0/eDP-1 (connector)/output_bpc\n");
 
 	igt_create_fb(data->drm_fd, data->width, data->height,
diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index 4403f9205d83..3874e4a88ca9 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -478,7 +478,7 @@ static void test_dsc_bpc(data_t *data)
 		if (!output || !igt_output_is_connected(output))
 			continue;
 		igt_info("Checking bpc support of conn %s\n", output->name);
-		max_supported_bpc[crtc->pipe] = igt_get_output_max_bpc(data->fd, output->name);
+		max_supported_bpc[crtc->pipe] = igt_get_output_max_bpc(output);
 	}
 
 	/* Setup all outputs */
@@ -526,9 +526,8 @@ static void test_dsc_bpc(data_t *data)
 
 			/* Check current bpc */
 			igt_info("Verifying display %s has correct bpc\n", output->name);
-			igt_assert_output_bpc_equal(data->fd,
-						    crtc->pipe,
-						    output->name,
+			igt_assert_output_bpc_equal(crtc,
+						    output,
 						    bpc_vals[bpc]);
 
 			/* Log current mode and DSC status */
diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
index eb76762fa954..627ed87441a7 100644
--- a/tests/amdgpu/amd_max_bpc.c
+++ b/tests/amdgpu/amd_max_bpc.c
@@ -74,8 +74,8 @@ static void test_init(data_t *data)
 
 	data->mode = igt_output_get_mode(data->output);
 	igt_assert(data->mode);
-	igt_assert_output_bpc_equal(data->fd, data->crtc->pipe,
-				    data->output->name, 8);
+	igt_assert_output_bpc_equal(data->crtc,
+				    data->output, 8);
 
 	data->primary =
 		igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index f832500b7eeb..74bc4af53ceb 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -226,7 +226,7 @@ static void update_display(data_t *data, uint32_t test_type)
 	restore_force_dsc_fractional_bpp_en();
 
 	if (test_type & TEST_DSC_BPC) {
-		current_bpc = igt_get_pipe_current_bpc(data->drm_fd, data->crtc->pipe);
+		current_bpc = igt_get_pipe_current_bpc(data->crtc);
 		igt_skip_on_f(data->input_bpc != current_bpc,
 			      "Input bpc = %d is not equal to current bpc = %d\n",
 			      data->input_bpc, current_bpc);
@@ -270,7 +270,7 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
 			continue;
 
-		if (igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC) {
+		if (igt_get_output_max_bpc(output) < MIN_DSC_BPC) {
 			igt_info("Output %s doesn't support min %d-bpc\n", igt_output_name(data->output), MIN_DSC_BPC);
 			continue;
 		}
diff --git a/tests/kms_color.c b/tests/kms_color.c
index bc6405c5947d..f54911b204a6 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -875,7 +875,7 @@ run_deep_color_tests_for_pipe(data_t *data, igt_crtc_t *crtc)
 			continue;
 		}
 
-		if (!panel_supports_deep_color(data->drm_fd, output->name)) {
+		if (!panel_supports_deep_color(output)) {
 			igt_info("Output %s: Doesn't support deep-color.\n",
 				 igt_output_name(output));
 			continue;
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index aa47324dff6a..3cd282cbbee3 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -38,9 +38,9 @@ bool pipe_output_combo_valid(data_t *data, igt_crtc_t *crtc)
 }
 
 bool
-panel_supports_deep_color(int drm_fd, char *output_name)
+panel_supports_deep_color(igt_output_t *output)
 {
-	unsigned int maximum = igt_get_output_max_bpc(drm_fd, output_name);
+	unsigned int maximum = igt_get_output_max_bpc(output);
 
 	igt_info("Max supported bit depth: %d\n", maximum);
 
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 6a700d4610fe..daa0a729c9c6 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -69,7 +69,7 @@ typedef struct {
 } gamma_lut_t;
 
 bool pipe_output_combo_valid(data_t *data, igt_crtc_t *crtc);
-bool panel_supports_deep_color(int fd, char *output_name);
+bool panel_supports_deep_color(igt_output_t *output);
 uint64_t get_max_bpc(igt_output_t *output);
 void paint_gradient_rectangles(data_t *data,
 			       drmModeModeInfo *mode,
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index fc6f794f5ea1..ca3b76b62459 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -103,7 +103,7 @@ static dither_status_t get_dither_state(data_t *data, igt_crtc_t *crtc)
 	igt_assert_eq(sscanf(start_loc, ", dither=%s", tmp), 1);
 	status.dither = !strcmp(tmp, "yes,");
 
-	status.bpc = igt_get_pipe_current_bpc(data->drm_fd, crtc->pipe);
+	status.bpc = igt_get_pipe_current_bpc(crtc);
 
 	return status;
 }
@@ -213,7 +213,7 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 			continue;
 		}
 
-		if (igt_get_output_max_bpc(data->drm_fd, output->name) < output_bpc) {
+		if (igt_get_output_max_bpc(output) < output_bpc) {
 			igt_info("Output %s: Doesn't support %d-bpc.\n",
 				 igt_output_name(output), output_bpc);
 			continue;
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index d9d8a17adaf8..f30902b72bb6 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -265,7 +265,8 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
 	/* Start in 8bpc. */
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 8);
+	igt_assert_output_bpc_equal(crtc,
+				    output, 8);
 
 	/*
 	 * amdgpu requires a primary plane when the CRTC is enabled.
@@ -279,7 +280,8 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
 	/* Switch to 10bpc. */
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 10);
+	igt_assert_output_bpc_equal(crtc,
+				    output, 10);
 
 	/* Verify that the CRC are equal after DPMS or suspend. */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
@@ -289,7 +291,8 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
 	/* Drop back to 8bpc. */
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 8);
+	igt_assert_output_bpc_equal(crtc,
+				    output, 8);
 
 	/* CRC capture is clamped to 8bpc, so capture should match. */
 	igt_assert_crc_equal(&ref_crc, &new_crc);
@@ -321,7 +324,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 			continue;
 		}
 
-		if (igt_get_output_max_bpc(data->fd, output->name) < 10) {
+		if (igt_get_output_max_bpc(output) < 10) {
 			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
 			continue;
 		}
@@ -501,7 +504,8 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 	}
 
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 8);
+	igt_assert_output_bpc_equal(crtc,
+				    output, 8);
 
 	if (flags & TEST_NEEDS_DSC) {
 		igt_force_dsc_disable(data->fd, output->name);
@@ -522,7 +526,8 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 		adjust_brightness(data, flags);
 	}
 
-	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 10);
+	igt_assert_output_bpc_equal(crtc,
+				    output, 10);
 
 	/* Verify that the CRC are equal after DPMS or suspend. */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
@@ -539,7 +544,8 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 	}
 
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 8);
+	igt_assert_output_bpc_equal(crtc,
+				    output, 8);
 
 	igt_assert_crc_equal(&ref_crc, &new_crc);
 
@@ -610,7 +616,8 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 	}
 
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 8);
+	igt_assert_output_bpc_equal(crtc,
+				    output, 8);
 
 	if (flags & TEST_NEEDS_DSC) {
 		igt_force_dsc_disable(data->fd, output->name);
@@ -622,7 +629,8 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 	set_hdr_output_metadata(data, &hdr);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 10);
+	igt_assert_output_bpc_equal(crtc,
+				    output, 10);
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
 
@@ -659,7 +667,8 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 	set_hdr_output_metadata(data, NULL);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 8);
+	igt_assert_output_bpc_equal(crtc,
+				    output, 8);
 
 	/* Verify that the CRC didn't change while cycling metadata. */
 	igt_assert_crc_equal(&ref_crc, &new_crc);
@@ -728,7 +737,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 			continue;
 		}
 
-		if (igt_get_output_max_bpc(data->fd, output->name) < 10) {
+		if (igt_get_output_max_bpc(output) < 10) {
 			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
 			continue;
 		}
-- 
2.52.0

