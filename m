Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC90CEFB816
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA8010E51D;
	Tue, 24 Feb 2026 08:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YWq1a5a3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B62710E531
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771923118; x=1803459118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I9UkYNIXp5qMB0A2JILXw67x3eMFYmftyZ/8H3DDMSU=;
 b=YWq1a5a3jF17fXAe3Vl3950BPXDTeRBr2n0493lm58j/zBxwU/WwEg2t
 LOdQihrRAXFu2lSXghY9mxz9VCiAyiswWW3vaUog8Trr4NYlHtcI9khxl
 3UGSEgEbQYdHuZkKnH14AcliA4WX3HWt0/LnY0V2xoOWP7+G8ZAgbvIoc
 LT0QhFaBWZ8WUUGSxJaRt8CYEjzAj5UHNWshLX9W4+X5E/ZAEFfHA37PB
 a5MwaBrfO7VpXhHP/CSAIF6Xyv5GZvyzdP0j29d2UpSREM5koP5Nd0/3M
 F92yJ6LrrXfKDqYFz5Hw9mJ5KdWzTgtgeEqcBVxbtwGzZHX+dcJjBlkJK A==;
X-CSE-ConnectionGUID: SMCPClyJTL2voakVMNykgA==
X-CSE-MsgGUID: v6iWf2aVRC+8Y3AvhJusow==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72842453"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72842453"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:51:58 -0800
X-CSE-ConnectionGUID: yWJzJda/SyKY/CtCkmBCag==
X-CSE-MsgGUID: F4sSA8MiQGuB86n0EViJRw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.101])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:51:56 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v3 22/23] tests/kms: Use igt_crtc_t instead of enum pipe, part 3
Date: Tue, 24 Feb 2026 10:51:53 +0200
Message-ID: <20260224085153.12766-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260221032003.30936-23-ville.syrjala@linux.intel.com>
References: <20260221032003.30936-23-ville.syrjala@linux.intel.com>
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

Convert several kms tests to use igt_crtc_t instead
of enum pipe. These specific tests currently track the pipe
in their data structure. Replace that with the crtc instead.

 #include "scripts/iterators.cocci"

@find_data@
typedef igt_crtc_t;
typedef igt_display_t;
identifier DISPLAY, PIPE;
type T;
@@
(
T {
  ...
- enum pipe PIPE;
+ igt_crtc_t *crtc;
  ...
  igt_display_t DISPLAY;
  ...
};
|
T {
  ...
  igt_display_t DISPLAY;
  ...
-  enum pipe PIPE;
+  igt_crtc_t *crtc;
  ...
};
)

@depends on find_data@
identifier find_data.PIPE;
identifier find_data.DISPLAY;
find_data.T S;
find_data.T *P;
expression _PIPE;
@@
(
- S.PIPE = _PIPE;
+ S.crtc = igt_crtc_for_pipe(&S.DISPLAY, _PIPE);
|
- P->PIPE = _PIPE;
+ P->crtc = igt_crtc_for_pipe(&P->DISPLAY, _PIPE);
)

@depends on find_data@
identifier find_data.PIPE;
identifier find_data.DISPLAY;
find_data.T S;
find_data.T *P;
expression E;
@@
(
- S.PIPE = E
+ S.crtc = igt_crtc_for_pipe(&S.DISPLAY, E)
|
- P->PIPE = E
+ P->crtc = igt_crtc_for_pipe(&P->DISPLAY, E)
|
- igt_crtc_for_pipe(..., S.PIPE)
+ S.crtc
|
- igt_crtc_for_pipe(..., P->PIPE)
+ P->crtc
|
- kmstest_pipe_name(S.PIPE)
+ igt_crtc_name(S.crtc)
|
- kmstest_pipe_name(P->PIPE)
+ igt_crtc_name(P->crtc)
)

@depends on find_data@
find_data.T S;
find_data.T *P;
@@
(
- S.crtc = S.crtc;
|
- P->crtc = P->crtc;
)

@depends on find_data@
identifier find_data.PIPE;
find_data.T S;
find_data.T *P;
@@
(
- S.PIPE
+ S.crtc->pipe
|
- P->PIPE
+ P->crtc->pipe
)

@depends on find_data@
find_data.T S;
find_data.T *P;
binary operator OP = { ==, != };
@@
(
- S.crtc->pipe OP PIPE_NONE
+ S.crtc OP NULL
|
- P->crtc->pipe OP PIPE_NONE
+ P->crtc OP NULL
)

@depends on find_data@
expression CRTC;
identifier PIPE;
@@
{...
CRTC = igt_crtc_for_pipe(..., PIPE);
<... when != PIPE = ...
(
- igt_crtc_for_pipe(..., PIPE)
+ CRTC
|
- PIPE
+ CRTC->pipe
)
...>
}

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
typedef igt_display_t;
identifier DISPLAY;
@@
- igt_display_t *DISPLAY = ...;
... when != DISPLAY

v2: Rebase due to an earlier kms_psr2_sf fix
v3: Rebase due to intel_fbc_supported_on_chipset() changes

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../kms_chamelium_sharpness_filter.c          | 15 +++---
 tests/intel/kms_big_fb.c                      | 28 +++++-----
 tests/intel/kms_ccs.c                         |  8 +--
 tests/intel/kms_dirtyfb.c                     | 25 +++++----
 tests/intel/kms_dp_linktrain_fallback.c       | 11 ++--
 tests/intel/kms_fb_coherency.c                |  8 +--
 tests/intel/kms_fbc_dirty_rect.c              | 17 +++---
 tests/intel/kms_mmap_write_crc.c              |  8 +--
 tests/intel/kms_pm_lpsp.c                     |  7 ++-
 tests/intel/kms_psr2_sf.c                     | 52 +++++++++----------
 tests/intel/kms_pwrite_crc.c                  |  8 +--
 tests/intel/perf_pmu.c                        | 10 ++--
 tests/intel/prime_mmap_kms.c                  |  6 +--
 tests/kms_async_flips.c                       | 13 +++--
 tests/kms_cursor_crc.c                        | 40 +++++++-------
 tests/kms_cursor_edge_walk.c                  | 13 +++--
 tests/kms_invalid_mode.c                      |  7 ++-
 tests/kms_plane_lowres.c                      | 11 ++--
 tests/kms_sequence.c                          | 12 ++---
 tests/nouveau_crc.c                           | 31 ++++++-----
 tests/vmwgfx/vmw_prime.c                      | 10 ++--
 tools/intel_hdcp.c                            |  4 +-
 22 files changed, 162 insertions(+), 182 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index c8dc3ee879e3..b7a70d4a2f15 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -26,7 +26,7 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter using C
 
 typedef struct {
 	int drm_fd;
-	enum pipe pipe_id;
+	igt_crtc_t *crtc;
 	struct igt_fb fb;
 	igt_display_t display;
 	igt_output_t *output;
@@ -55,16 +55,14 @@ static bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
 
 static void set_filter_strength_on_pipe(data_t *data)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_set_prop_value(igt_crtc_for_pipe(display, data->pipe_id),
+	igt_crtc_set_prop_value(data->crtc,
 				    IGT_CRTC_SHARPNESS_STRENGTH,
 				    data->filter_strength);
 }
 
 static void reset_filter_strength_on_pipe(data_t *data)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_set_prop_value(igt_crtc_for_pipe(display, data->pipe_id),
+	igt_crtc_set_prop_value(data->crtc,
 				    IGT_CRTC_SHARPNESS_STRENGTH, 0);
 }
 
@@ -115,14 +113,13 @@ static void cleanup(data_t *data)
 static void test_t(data_t *data, igt_plane_t *primary,
 		   struct chamelium_port *port)
 {
-	igt_display_t *display = &data->display;
 	struct chamelium_frame_dump *frame[4];
 	drmModeModeInfo *mode;
 	int height, width;
 	bool match[4], match_ok = false;
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe_id));
+			    data->crtc);
 
 	mode = igt_output_get_mode(data->output);
 	height = mode->hdisplay;
@@ -198,7 +195,7 @@ static int test_setup(data_t *data, enum pipe p)
 	 */
         for_each_valid_output_on_pipe(&data->display, crtc->pipe,
 				      data->output) {
-		data->pipe_id = crtc->pipe;
+		data->crtc = crtc;
 		for (i = 0; i < data->port_count; i++) {
 			if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 			     data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
@@ -209,7 +206,7 @@ static int test_setup(data_t *data, enum pipe p)
 
 	for_each_valid_output_on_pipe(&data->display, crtc->pipe,
 				      data->output) {
-		data->pipe_id = crtc->pipe;
+		data->crtc = crtc;
 		for (i = 0; i < data->port_count; i++) {
 			if (strcmp(data->output->name,
 				   chamelium_port_get_name(data->ports[i])) == 0)
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index d6aa8d6ec608..66d7c5428d1e 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -152,7 +152,7 @@ typedef struct {
 	int drm_fd;
 	uint32_t devid;
 	igt_display_t display;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 	igt_plane_t *plane;
 	igt_pipe_crc_t *pipe_crc;
@@ -376,8 +376,7 @@ static void prep_fb(data_t *data)
 
 static void set_c8_lut(data_t *data)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, data->pipe);
+	igt_crtc_t *crtc = data->crtc;
 	struct drm_color_lut *lut;
 	int i, lut_size = 256;
 
@@ -398,8 +397,7 @@ static void set_c8_lut(data_t *data)
 
 static void unset_lut(data_t *data)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, data->pipe);
+	igt_crtc_t *crtc = data->crtc;
 
 	igt_crtc_replace_prop_blob(crtc, IGT_CRTC_GAMMA_LUT, NULL, 0);
 }
@@ -510,7 +508,6 @@ static bool test_plane(data_t *data)
 
 static bool test_pipe(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	uint16_t width, height;
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
@@ -518,10 +515,10 @@ static bool test_pipe(data_t *data)
 	bool run_in_simulation = igt_run_in_simulation();
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
+		 igt_crtc_name(data->crtc), igt_output_name(data->output));
 
 	if (data->format == DRM_FORMAT_C8 &&
-	    !igt_crtc_has_prop(igt_crtc_for_pipe(display, data->pipe),
+	    !igt_crtc_has_prop(data->crtc,
 				   IGT_CRTC_GAMMA_LUT))
 		return false;
 
@@ -541,7 +538,7 @@ static bool test_pipe(data_t *data)
 		      data->format, data->modifier, &data->small_fb);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
@@ -569,10 +566,10 @@ static bool test_pipe(data_t *data)
 	igt_display_commit2(&data->display, data->display.is_atomic ?
 			    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
+	for_each_plane_on_pipe(&data->display, data->crtc->pipe, data->plane) {
 		ret = test_plane(data);
 		if (ret || run_in_simulation)
 			break;
@@ -589,7 +586,6 @@ static bool test_pipe(data_t *data)
 static bool
 max_hw_stride_async_flip_test(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	uint32_t ret;
 	const uint32_t w = data->output->config.default_mode.hdisplay,
 		       h = data->output->config.default_mode.vdisplay;
@@ -599,10 +595,10 @@ max_hw_stride_async_flip_test(data_t *data)
 	igt_require(data->display.is_atomic);
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
+		 igt_crtc_name(data->crtc), igt_output_name(data->output));
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -636,7 +632,7 @@ max_hw_stride_async_flip_test(data_t *data)
 		 data->hw_stride);
 	generate_pattern(data, &data->big_fb_flip[1], 640, 480);
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_pipe_crc_start(data->pipe_crc);
 
@@ -714,7 +710,7 @@ static void test_scanout(data_t *data)
 		    data->format, data->modifier);
 
 	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
-		data->pipe = crtc->pipe;
+		data->crtc = crtc;
 		igt_display_reset(&data->display);
 
 		igt_output_set_crtc(data->output,
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 37d21718bab4..19d12027b68f 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -177,7 +177,7 @@ typedef struct {
 	int drm_fd;
 	igt_display_t display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	enum test_flags flags;
 	igt_plane_t *plane;
 	igt_pipe_crc_t *pipe_crc;
@@ -1040,7 +1040,7 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 
 static int test_ccs(data_t *data)
 {
-	igt_display_t *display = &data->display;	int valid_tests = 0;
+	int valid_tests = 0;
 	igt_crc_t crc, ref_crc;
 	enum test_fb_flags fb_flags = 0;
 
@@ -1053,7 +1053,7 @@ static int test_ccs(data_t *data)
 		 IGT_FORMAT_ARGS(data->format), IGT_MODIFIER_ARGS(data->ccs_modifier));
 
 	if (data->flags & TEST_CRC) {
-		data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+		data->pipe_crc = igt_crtc_crc_new(data->crtc,
 						  IGT_PIPE_CRC_SOURCE_AUTO);
 
 		if (try_config(data, fb_flags | FB_COMPRESSED, &ref_crc) &&
@@ -1154,7 +1154,7 @@ static void test_output(data_t *data, const int testnum)
 
 			for_each_crtc_with_valid_output(&data->display, crtc,
 							data->output) {
-				data->pipe = crtc->pipe;
+				data->crtc = crtc;
 				igt_display_reset(&data->display);
 
 				igt_output_set_crtc(data->output,
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 03b6ea264678..47bb68f0753b 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -58,7 +58,7 @@ typedef struct {
 	uint64_t modifier;
 	igt_output_t *output;
 	igt_pipe_crc_t *pipe_crc;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	struct igt_fb fbs[3];
 
@@ -100,7 +100,7 @@ static bool check_support(data_t *data)
 	case FEATURE_NONE:
 		return true;
 	case FEATURE_FBC:
-		if (!intel_fbc_supported_on_chipset(data->drm_fd, data->pipe)) {
+		if (!intel_fbc_supported_on_chipset(data->drm_fd, data->crtc->pipe)) {
 			igt_info("FBC is not supported on this chipset\n");
 			return false;
 		}
@@ -127,7 +127,7 @@ static bool check_support(data_t *data)
 		return true;
 
 	case FEATURE_DRRS:
-		if (!(intel_is_drrs_supported(data->drm_fd, data->pipe) &&
+		if (!(intel_is_drrs_supported(data->drm_fd, data->crtc->pipe) &&
 		      intel_output_has_drrs(data->drm_fd, data->output))) {
 			igt_info("Output doesn't support DRRS\n");
 			return false;
@@ -153,7 +153,7 @@ static void enable_feature(data_t *data)
 		psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL);
 		break;
 	case FEATURE_DRRS:
-		intel_drrs_enable(data->drm_fd, data->pipe);
+		intel_drrs_enable(data->drm_fd, data->crtc->pipe);
 		break;
 	case FEATURE_DEFAULT:
 		break;
@@ -169,7 +169,7 @@ static void check_feature_enabled(data_t *data)
 		break;
 	case FEATURE_FBC:
 		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
-							  data->pipe),
+							  data->crtc->pipe),
 			     "FBC still disabled\n");
 		break;
 	case FEATURE_PSR:
@@ -178,7 +178,7 @@ static void check_feature_enabled(data_t *data)
 			     "PSR still disabled\n");
 		break;
 	case FEATURE_DRRS:
-		igt_assert_f(!intel_is_drrs_inactive(data->drm_fd, data->pipe),
+		igt_assert_f(!intel_is_drrs_inactive(data->drm_fd, data->crtc->pipe),
 			     "DRRS INACTIVE\n");
 		break;
 	case FEATURE_DEFAULT:
@@ -195,7 +195,7 @@ static void check_feature(data_t *data)
 		break;
 	case FEATURE_FBC:
 		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
-							  data->pipe),
+							  data->crtc->pipe),
 			     "FBC disabled\n");
 		/* TODO: Add compression check here */
 		break;
@@ -205,7 +205,7 @@ static void check_feature(data_t *data)
 		psr_sink_error_check(data->debugfs_fd, PSR_MODE_1, data->output);
 		break;
 	case FEATURE_DRRS:
-		igt_assert_f(!intel_is_drrs_inactive(data->drm_fd, data->pipe),
+		igt_assert_f(!intel_is_drrs_inactive(data->drm_fd, data->crtc->pipe),
 			     "DRRS INACTIVE\n");
 		break;
 	case FEATURE_DEFAULT:
@@ -222,18 +222,17 @@ static void disable_features(data_t *data)
 	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL))
 		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
 
-	intel_drrs_disable(data->drm_fd, data->pipe);
+	intel_drrs_disable(data->drm_fd, data->crtc->pipe);
 }
 
 static void prepare(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
@@ -378,7 +377,7 @@ int igt_main()
 			for_each_crtc(&data.display, crtc) {
 				int valid_tests = 0;
 
-				data.pipe = crtc->pipe;
+				data.crtc = crtc;
 
 				for_each_valid_output_on_pipe(&data.display,
 							      crtc->pipe,
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index ad34b1fabc23..b7e02be2d8aa 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -40,7 +40,7 @@ typedef struct {
 	igt_display_t display;
 	drmModeModeInfo *mode;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	struct igt_fb fb;
 	struct igt_plane *primary;
 	int n_pipes;
@@ -96,7 +96,7 @@ static void setup_pipe_on_outputs(data_t *data,
 		      data->n_pipes, *output_count);
 
 	for_each_crtc(&data->display, crtc) {
-		data->pipe = crtc->pipe;
+		data->crtc = crtc;
 		if (i >= *output_count)
 			break;
 		/*
@@ -459,7 +459,6 @@ static bool run_lt_fallback_test(data_t *data)
 
 static void test_dsc_sst_fallback(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	bool non_dsc_mode_found = false;
 	bool dsc_fallback_successful = false;
 	int ret;
@@ -469,7 +468,7 @@ static void test_dsc_sst_fallback(data_t *data)
 	int output_count = 0;
 
 	igt_info("Checking DSC fallback on %s\n", igt_output_name(data->output));
-	data->pipe = PIPE_A;
+	data->crtc = igt_crtc_for_pipe(&data->display, PIPE_A);
 
 	igt_display_reset(&data->display);
 	igt_reset_link_params(data->drm_fd, data->output);
@@ -484,7 +483,7 @@ static void test_dsc_sst_fallback(data_t *data)
 				    &data->fb);
 		igt_output_override_mode(data->output, data->mode);
 		igt_output_set_crtc(data->output,
-				    igt_crtc_for_pipe(display, data->pipe));
+				    data->crtc);
 		data->primary = igt_output_get_plane_type(data->output,
 						DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(data->primary, &data->fb);
@@ -616,7 +615,7 @@ int igt_main()
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
 		for_each_crtc(&data.display, crtc) {
-			data.pipe = crtc->pipe;
+			data.crtc = crtc;
 			data.n_pipes++;
 		}
 		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
index 840da92e2e0e..1131555602d6 100644
--- a/tests/intel/kms_fb_coherency.c
+++ b/tests/intel/kms_fb_coherency.c
@@ -33,7 +33,7 @@ typedef struct {
 	struct igt_fb fb[2];
 	igt_output_t *output;
 	igt_plane_t *primary;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_crc_t ref_crc;
 	igt_pipe_crc_t *pipe_crc;
 	uint32_t devid;
@@ -48,7 +48,7 @@ static void prepare_crtc(data_t *data)
 	igt_display_reset(display);
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 
 	mode = igt_output_get_mode(output);
 
@@ -65,7 +65,7 @@ static void prepare_crtc(data_t *data)
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc for the white fb */
@@ -226,7 +226,7 @@ static void select_valid_pipe_output_combo(data_t *data)
 	igt_display_t *display = &data->display;
 
 	for_each_crtc_with_valid_output(display, crtc, data->output) {
-		data->pipe = crtc->pipe;
+		data->crtc = crtc;
 		igt_display_reset(display);
 
 		igt_output_set_crtc(data->output,
diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index 393b787ae4e8..54ac7266eafb 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -60,7 +60,7 @@ typedef struct {
 	drmModeModeInfo *mode;
 	igt_output_t *output;
 	igt_pipe_crc_t *pipe_crc;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	u32 format;
 
 	struct igt_fb fb[N_FBS];
@@ -122,7 +122,7 @@ set_fb_and_collect_crc(data_t *data, igt_plane_t *plane, struct igt_fb *fb,
 	igt_pipe_crc_start(data->pipe_crc);
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, crc);
 	igt_pipe_crc_stop(data->pipe_crc);
-	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
+	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->crtc->pipe,
 					  IGT_LOG_INFO),
 					  "FBC is not enabled\n");
 }
@@ -404,16 +404,15 @@ static void cleanup(data_t *data)
 
 static bool prepare_test(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	igt_display_reset(&data->display);
 
 	data->mode = igt_output_get_mode(data->output);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe));
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+			    data->crtc);
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	igt_require_f(intel_fbc_supported_on_chipset(data->drm_fd, data->pipe),
+	igt_require_f(intel_fbc_supported_on_chipset(data->drm_fd, data->crtc->pipe),
 		      "FBC not supported by the chipset on pipe\n");
 
 	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
@@ -461,7 +460,7 @@ int igt_main()
 		data.feature = FEATURE_FBC;
 
 		for_each_crtc(&data.display, crtc) {
-			data.pipe = crtc->pipe;
+			data.crtc = crtc;
 			if (single_pipe)
 				break;
 			for_each_valid_output_on_pipe(&data.display,
@@ -486,7 +485,7 @@ int igt_main()
 		data.feature = FEATURE_FBC;
 
 		for_each_crtc(&data.display, crtc) {
-			data.pipe = crtc->pipe;
+			data.crtc = crtc;
 			if (single_pipe)
 				break;
 			for_each_valid_output_on_pipe(&data.display,
@@ -513,7 +512,7 @@ int igt_main()
 		data.feature = FEATURE_FBC;
 
 		for_each_crtc(&data.display, crtc) {
-			data.pipe = crtc->pipe;
+			data.crtc = crtc;
 			if (single_pipe)
 				break;
 			for_each_valid_output_on_pipe(&data.display,
diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index 329605f30c15..48be830d8592 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -63,7 +63,7 @@ typedef struct {
 	struct igt_fb fb[2];
 	igt_output_t *output;
 	igt_plane_t *primary;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_crc_t ref_crc;
 	igt_pipe_crc_t *pipe_crc;
 	uint32_t devid;
@@ -189,7 +189,7 @@ static void prepare_crtc(data_t *data)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 
 	mode = igt_output_get_mode(output);
 
@@ -206,7 +206,7 @@ static void prepare_crtc(data_t *data)
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc for the white fb */
@@ -300,7 +300,7 @@ int igt_main_args("n", NULL, NULL, opt_handler, NULL)
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
 				data.output = output;
-				data.pipe = crtc->pipe;
+				data.crtc = crtc;
 
 				igt_info("Using %d rounds for each pipe in the test\n", ROUNDS);
 				prepare_crtc(&data);
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 43d58a8421e7..595c81f0e693 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -62,7 +62,7 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 } data_t;
 
 static int max_dotclock;
@@ -153,12 +153,11 @@ static void test_cleanup(data_t *data)
 
 static bool test_constraint(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 
 	igt_display_reset(&data->display);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 
 	mode = igt_output_get_mode(data->output);
 
@@ -245,7 +244,7 @@ int igt_main()
 						     "LPSP support on external panel from Gen13+ platform\n");
 
 				data.output = output;
-				data.pipe = crtc->pipe;
+				data.crtc = crtc;
 
 				if (!test_constraint(&data))
 					continue;
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index d55b68e35ecf..5bcbc8df4741 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -227,7 +227,7 @@ typedef struct {
 	cairo_t *cr;
 	uint32_t screen_changes;
 	int cur_x, cur_y;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	enum psr_mode psr_mode;
 	enum {
 		FEATURE_NONE  = 0,
@@ -396,7 +396,6 @@ static void plane_move_setup_square(data_t *data, igt_fb_t *fb, uint32_t h,
 
 static void prepare(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	igt_output_t *output = data->output;
 	igt_plane_t *primary, *sprite = NULL, *cursor = NULL;
 	int fb_w, fb_h, x, y, view_w, view_h;
@@ -414,7 +413,7 @@ static void prepare(data_t *data)
 	}
 
 	igt_output_set_crtc(output,
-		            igt_crtc_for_pipe(display, data->pipe));
+		            data->crtc);
 
 	if (data->big_fb_test) {
 		fb_w = data->big_fb_width;
@@ -959,7 +958,7 @@ static void run(data_t *data)
 
 	if (data->fbc_flag == true && data->op_fbc_mode == FBC_ENABLED)
 		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
-							  data->pipe),
+							  data->crtc->pipe),
 							  "FBC still disabled\n");
 
 	if (is_et_check_needed(data))
@@ -1041,11 +1040,11 @@ static void cleanup(data_t *data)
 
 static bool sel_fetch_pipe_combo_valid(data_t *data)
 {
-	if (data->devid < 14 && !IS_ALDERLAKE_P(data->devid) && data->pipe != PIPE_A)
+	if (data->devid < 14 && !IS_ALDERLAKE_P(data->devid) && data->crtc->pipe != PIPE_A)
 		return false;
 
 	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
-	    data->pipe != PIPE_A && data->pipe != PIPE_B)
+	    data->crtc->pipe != PIPE_A && data->crtc->pipe != PIPE_B)
 		return false;
 
 	return true;
@@ -1054,7 +1053,6 @@ static bool sel_fetch_pipe_combo_valid(data_t *data)
 static bool
 pipe_output_combo_valid(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	bool ret = psr_sink_support(data->drm_fd, data->debugfs_fd,
 				    data->psr_mode, data->output);
 	if (!ret)
@@ -1067,7 +1065,7 @@ pipe_output_combo_valid(data_t *data)
 	igt_display_reset(&data->display);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 	if (!intel_pipe_output_combo_valid(&data->display))
 		ret = false;
 	igt_output_set_crtc(data->output, NULL);
@@ -1080,7 +1078,7 @@ static void run_dynamic_test_damage_areas(data_t data, int i, int coexist_featur
 	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 		if (j != FEATURE_NONE && !(coexist_features[i] & j))
 			continue;
-		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
+		igt_dynamic_f("pipe-%s-%s%s", igt_crtc_name(data.crtc),
 			      igt_output_name(data.output), coexist_feature_str(j)) {
 			data.coexist_feature = j;
 			for (int k = 1; k <= MAX_DAMAGE_AREAS; k++) {
@@ -1098,7 +1096,7 @@ static void run_dynamic_test(data_t data, int i, int coexist_features[])
 	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 		if (j != FEATURE_NONE && !(coexist_features[i] & j))
 			continue;
-		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
+		igt_dynamic_f("pipe-%s-%s%s", igt_crtc_name(data.crtc),
 			      igt_output_name(data.output), coexist_feature_str(j)) {
 			data.coexist_feature = j;
 			prepare(&data);
@@ -1113,7 +1111,7 @@ static void run_plane_move(data_t data, int i, int coexist_features[])
 	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 		if (j != FEATURE_NONE && !(coexist_features[i] & j))
 			continue;
-		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
+		igt_dynamic_f("pipe-%s-%s%s", igt_crtc_name(data.crtc),
 			      igt_output_name(data.output), coexist_feature_str(j)) {
 			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 			data.coexist_feature = j;
@@ -1132,7 +1130,7 @@ static void run_plane_update_continuous(data_t data, int i, int coexist_features
 	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 		if (j != FEATURE_NONE && !(coexist_features[i] & j))
 			continue;
-		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
+		igt_dynamic_f("pipe-%s-%s%s", igt_crtc_name(data.crtc),
 			      igt_output_name(data.output), coexist_feature_str(j)) {
 			data.damage_area_count = 1;
 			if (data.op_fbc_mode == FBC_ENABLED)
@@ -1197,9 +1195,9 @@ int igt_main()
 
 		for_each_crtc_with_valid_output(&data.display, crtc,
 						data.output) {
-			data.pipe = crtc->pipe;
+			data.crtc = crtc;
 
-			if (intel_fbc_supported_on_chipset(data.drm_fd, data.pipe))
+			if (intel_fbc_supported_on_chipset(data.drm_fd, data.crtc->pipe))
 				fbc_chipset_support = true;
 
 			for (i = 0; i < ARRAY_SIZE(psr_status); i++) {
@@ -1245,7 +1243,7 @@ int igt_main()
 						   append_psr_subtest[z],
 						   op_str(data.op)) {
 				for (i = 0; i < n_crtcs; i++) {
-					data.pipe = crtcs[i]->pipe;
+					data.crtc = crtcs[i];
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1266,7 +1264,7 @@ int igt_main()
 							   append_psr_subtest[z],
 							   op_str(data.op)) {
 					for (i = 0; i < n_crtcs; i++) {
-						data.pipe = crtcs[i]->pipe;
+						data.crtc = crtcs[i];
 						data.output = outputs[i];
 
 						if (!pipe_output_combo_valid(&data))
@@ -1287,7 +1285,7 @@ int igt_main()
 						   append_psr_subtest[z],
 						   op_str(data.op)) {
 				for (i = 0; i < n_crtcs; i++) {
-					data.pipe = crtcs[i]->pipe;
+					data.crtc = crtcs[i];
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1304,7 +1302,7 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_crtcs; i++) {
-					data.pipe = crtcs[i]->pipe;
+					data.crtc = crtcs[i];
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1321,7 +1319,7 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_crtcs; i++) {
-					data.pipe = crtcs[i]->pipe;
+					data.crtc = crtcs[i];
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1338,7 +1336,7 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_crtcs; i++) {
-					data.pipe = crtcs[i]->pipe;
+					data.crtc = crtcs[i];
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1355,7 +1353,7 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_crtcs; i++) {
-					data.pipe = crtcs[i]->pipe;
+					data.crtc = crtcs[i];
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1373,7 +1371,7 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_crtcs; i++) {
-					data.pipe = crtcs[i]->pipe;
+					data.crtc = crtcs[i];
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1389,7 +1387,7 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_crtcs; i++) {
-					data.pipe = crtcs[i]->pipe;
+					data.crtc = crtcs[i];
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1406,7 +1404,7 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_crtcs; i++) {
-					data.pipe = crtcs[i]->pipe;
+					data.crtc = crtcs[i];
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1423,7 +1421,7 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_crtcs; i++) {
-					data.pipe = crtcs[i]->pipe;
+					data.crtc = crtcs[i];
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1441,7 +1439,7 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_crtcs; i++) {
-					data.pipe = crtcs[i]->pipe;
+					data.crtc = crtcs[i];
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1461,7 +1459,7 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_crtcs; i++) {
-					data.pipe = crtcs[i]->pipe;
+					data.crtc = crtcs[i];
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
index 4728d252d467..bd536007c9a3 100644
--- a/tests/intel/kms_pwrite_crc.c
+++ b/tests/intel/kms_pwrite_crc.c
@@ -52,7 +52,7 @@ typedef struct {
 	struct igt_fb fb[2];
 	igt_output_t *output;
 	igt_plane_t *primary;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_crc_t ref_crc;
 	igt_pipe_crc_t *pipe_crc;
 	uint32_t devid;
@@ -125,7 +125,7 @@ static void prepare_crtc(data_t *data)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 
 	mode = igt_output_get_mode(output);
 
@@ -142,7 +142,7 @@ static void prepare_crtc(data_t *data)
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc for the white fb */
@@ -173,7 +173,7 @@ static void run_test(data_t *data)
 	igt_display_t *display = &data->display;
 
 	for_each_crtc_with_valid_output(display, crtc, data->output) {
-		data->pipe = crtc->pipe;
+		data->crtc = crtc;
 		igt_display_reset(display);
 
 		igt_output_set_crtc(data->output,
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 91f80f2e0a54..787fe81d21ca 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -1040,7 +1040,7 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb primary_fb;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 } data_t;
 
 static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
@@ -1051,7 +1051,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 
 	/* create and set the primary plane fb */
 	mode = igt_output_get_mode(output);
@@ -1066,7 +1066,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 
 	igt_display_commit(display);
 
-	igt_wait_for_vblank(igt_crtc_for_pipe(display, data->pipe));
+	igt_wait_for_vblank(data->crtc);
 }
 
 static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
@@ -1192,7 +1192,7 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
 
 		gem_write(gem_fd, obj.handle, 0, batch, sizeof(batch));
 
-		data.pipe = crtc->pipe;
+		data.crtc = crtc;
 		prepare_crtc(&data, gem_fd, output);
 
 		fd = open_pmu(gem_fd,
@@ -1202,7 +1202,7 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
 
 		igt_fork_helper(&waiter) {
 			const uint32_t pipe_id_flag =
-					kmstest_get_vbl_flag(data.pipe);
+					kmstest_get_vbl_flag(data.crtc->pipe);
 
 			for (;;) {
 				union drm_wait_vblank vbl = { };
diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
index 74fe05ca9605..10e450114d0e 100644
--- a/tests/intel/prime_mmap_kms.c
+++ b/tests/intel/prime_mmap_kms.c
@@ -151,7 +151,7 @@ typedef struct {
 	struct igt_fb fb;
 	igt_output_t *output;
 	igt_plane_t *primary;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 } gpu_process_t;
 
 static void cleanup_crtc(gpu_process_t *gpu)
@@ -175,7 +175,7 @@ static void prepare_crtc(gpu_process_t *gpu)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(display, gpu->pipe));
+			    gpu->crtc);
 
 	mode = igt_output_get_mode(output);
 
@@ -207,7 +207,7 @@ static void run_test(gpu_process_t *gpu)
 		int prime_fd;
 
 		gpu->output = output;
-		gpu->pipe = crtc->pipe;
+		gpu->crtc = crtc;
 
 		prepare_crtc(gpu);
 
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 1a4941ef76b8..014b7f3476be 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -140,7 +140,7 @@ typedef struct {
 	int flip_count;
 	int frame_count;
 	bool flip_pending;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	bool alternate_sync_async;
 	bool suspend_resume;
 	bool hang;
@@ -292,7 +292,6 @@ static void require_overlay_flip_support(data_t *data)
 
 static void test_init(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 
 	igt_display_reset(&data->display);
@@ -300,11 +299,11 @@ static void test_init(data_t *data)
 
 	mode = igt_output_get_mode(data->output);
 
-	data->crtc_id = igt_crtc_for_pipe(display, data->pipe)->crtc_id;
+	data->crtc_id = data->crtc->crtc_id;
 	data->refresh_rate = mode->vrefresh;
 
 	igt_output_set_crtc(data->output,
-		            igt_crtc_for_pipe(display, data->pipe));
+		            data->crtc);
 
 	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	if (data->overlay_path)
@@ -912,7 +911,7 @@ static void run_test(data_t *data, void (*test)(data_t *))
 		require_atomic_async_cap(data);
 
 	for_each_crtc_with_valid_output(display, crtc, data->output) {
-		data->pipe = crtc->pipe;
+		data->crtc = crtc;
 		igt_display_reset(display);
 
 		igt_output_set_crtc(data->output,
@@ -980,7 +979,7 @@ static void run_test_with_async_format_modifiers(data_t *data, void (*test)(data
 	igt_vec_init(&tested_formats, sizeof(struct format_mod));
 
 	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
-		data->pipe = crtc->pipe;
+		data->crtc = crtc;
 		test_init(data);
 
 		igt_assert_f(data->plane->async_format_mod_count > 0,
@@ -1034,7 +1033,7 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 		require_atomic_async_cap(data);
 
 	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
-		data->pipe = crtc->pipe;
+		data->crtc = crtc;
 		test_init(data);
 
 		igt_require_f(data->plane->async_format_mod_count > 0,
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 61a7de8eb00b..b6b155130edb 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -146,7 +146,7 @@ typedef struct {
 	struct igt_fb primary_fb[MAXCURSORBUFFER];
 	struct igt_fb fb;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	int left, right, top, bottom;
 	int screenw, screenh;
 	int refresh;
@@ -209,13 +209,12 @@ static void cursor_enable(data_t *data)
 
 static void cursor_disable(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	igt_plane_set_fb(data->cursor, NULL);
 	igt_plane_set_position(data->cursor, 0, 0);
 	igt_display_commit(&data->display);
 
 	/* do this wait here so it will not need to be added everywhere */
-	igt_wait_for_vblank_count(igt_crtc_for_pipe(display, data->pipe),
+	igt_wait_for_vblank_count(data->crtc,
 				  data->vblank_wait_count);
 }
 
@@ -241,7 +240,7 @@ static bool chv_cursor_broken(data_t *data, int x)
 	if (x >= 0)
 		return false;
 
-	return IS_CHERRYVIEW(devid) && data->pipe == PIPE_C;
+	return IS_CHERRYVIEW(devid) && data->crtc->pipe == PIPE_C;
 }
 
 static bool cursor_visible(data_t *data, int x, int y)
@@ -300,7 +299,7 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 		igt_display_commit(display);
 
 		/* Extra vblank wait is because nonblocking cursor ioctl */
-		igt_wait_for_vblank_count(igt_crtc_for_pipe(display, data->pipe),
+		igt_wait_for_vblank_count(data->crtc,
 					  data->vblank_wait_count);
 
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, hwcrc);
@@ -349,7 +348,7 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 		 * synchronized to the same frame on AMD HW
 		 */
 		if (is_amdgpu_device(data->drm_fd))
-			igt_wait_for_vblank_count(igt_crtc_for_pipe(display, data->pipe),
+			igt_wait_for_vblank_count(data->crtc,
 						  data->vblank_wait_count);
 
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
@@ -580,7 +579,7 @@ static void prepare_crtc(data_t *data, int cursor_w, int cursor_h)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 
 	/* create and set the primary plane fbs */
 	mode = igt_output_get_mode(output);
@@ -606,7 +605,7 @@ static void prepare_crtc(data_t *data, int cursor_w, int cursor_h)
 	/* create the pipe_crc object for this pipe */
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* x/y position where the cursor is still fully visible */
@@ -720,7 +719,6 @@ static void do_timed_cursor_fb_pos_change(data_t *data, enum cursor_change chang
 
 static void timed_cursor_changes(data_t *data, void (changefunc)(data_t *, enum cursor_change))
 {
-	igt_display_t *display = &data->display;
 	igt_crc_t crc1, crc2;
 
 	/* Legacy cursor API does not guarantee that the cursor update happens at vBlank.
@@ -735,7 +733,7 @@ static void timed_cursor_changes(data_t *data, void (changefunc)(data_t *, enum
 	igt_display_commit(&data->display);
 
 	/* Extra vblank wait is because nonblocking cursor ioctl */
-	igt_wait_for_vblank_count(igt_crtc_for_pipe(display, data->pipe),
+	igt_wait_for_vblank_count(data->crtc,
 				  data->vblank_wait_count);
 
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc1);
@@ -784,7 +782,7 @@ static bool cursor_size_supported(data_t *data, int w, int h)
 
 	igt_display_reset(display);
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 
 	mode = igt_output_get_mode(output);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -889,7 +887,7 @@ static bool valid_pipe_output_combo(data_t *data)
 
 	igt_display_reset(display);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 
 	if (intel_pipe_output_combo_valid(display))
 		ret = true;
@@ -1013,7 +1011,7 @@ static void run_size_tests(data_t *data, int w, int h)
 				if (execution_constraint(crtc->pipe))
 					continue;
 
-				data->pipe = crtc->pipe;
+				data->crtc = crtc;
 
 				if (!valid_pipe_output_combo(data))
 					continue;
@@ -1054,7 +1052,7 @@ static void run_tests_on_pipe(data_t *data)
 			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = crtc->pipe;
+			data->crtc = crtc;
 
 			if (!valid_pipe_output_combo(data))
 				continue;
@@ -1075,7 +1073,7 @@ static void run_tests_on_pipe(data_t *data)
 			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = crtc->pipe;
+			data->crtc = crtc;
 
 			if (!valid_pipe_output_combo(data))
 				continue;
@@ -1096,7 +1094,7 @@ static void run_tests_on_pipe(data_t *data)
 			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = crtc->pipe;
+			data->crtc = crtc;
 
 			if (!valid_pipe_output_combo(data))
 				continue;
@@ -1126,7 +1124,7 @@ static void run_tests_on_pipe(data_t *data)
 			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = crtc->pipe;
+			data->crtc = crtc;
 
 			if (!valid_pipe_output_combo(data))
 				continue;
@@ -1146,7 +1144,7 @@ static void run_tests_on_pipe(data_t *data)
 			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = crtc->pipe;
+			data->crtc = crtc;
 
 			if (!valid_pipe_output_combo(data))
 				continue;
@@ -1173,7 +1171,7 @@ static void run_tests_on_pipe(data_t *data)
 			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = crtc->pipe;
+			data->crtc = crtc;
 			data->flags = TEST_DPMS;
 
 			if (!valid_pipe_output_combo(data))
@@ -1195,7 +1193,7 @@ static void run_tests_on_pipe(data_t *data)
 			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = crtc->pipe;
+			data->crtc = crtc;
 			data->flags = TEST_SUSPEND;
 
 			if (!valid_pipe_output_combo(data))
@@ -1220,7 +1218,7 @@ static void run_tests_on_pipe(data_t *data)
 			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = crtc->pipe;
+			data->crtc = crtc;
 
 			if (!valid_pipe_output_combo(data))
 				continue;
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 2a29cd62f408..08c9de601ce3 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -70,7 +70,7 @@ typedef struct {
 	struct igt_fb primary_fb;
 	struct igt_fb fb;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_crc_t ref_crc;
 	int curw, curh; /* cursor size */
 	igt_pipe_crc_t *pipe_crc;
@@ -114,7 +114,6 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 static void cursor_move(data_t *data, int x, int y, int i)
 {
 	int crtc_id = data->output->config.crtc->crtc_id;
-	igt_display_t *display = &data->display;
 
 	igt_debug("[%d] x=%d, y=%d\n", i, x, y);
 
@@ -124,9 +123,9 @@ static void cursor_move(data_t *data, int x, int y, int i)
 	 * fails). So let's accept a failure from the ioctl in that case.
 	 */
 	igt_assert(drmModeMoveCursor(data->drm_fd, crtc_id, x, y) == 0 ||
-		   (IS_CHERRYVIEW(data->devid) && data->pipe == PIPE_C &&
+		   (IS_CHERRYVIEW(data->devid) && data->crtc->pipe == PIPE_C &&
 		    x < 0 && x > -data->curw));
-	igt_wait_for_vblank(igt_crtc_for_pipe(display, data->pipe));
+	igt_wait_for_vblank(data->crtc);
 }
 
 #define XSTEP 8
@@ -267,7 +266,7 @@ static void prepare_crtc(data_t *data)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 
 	mode = igt_output_get_mode(data->output);
 	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
@@ -284,7 +283,7 @@ static void prepare_crtc(data_t *data)
 	data->jump_y = (mode->vdisplay - data->curh) / 2;
 
 	/* create the pipe_crc object for this pipe */
-	data->pipe_crc = igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new_nonblock(data->crtc,
 						   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc w/o cursor */
@@ -397,7 +396,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_crtc_with_single_output(&data.display,
 								 crtc,
 								 data.output) {
-					data.pipe = crtc->pipe;
+					data.crtc = crtc;
 					if (!extended && crtc->pipe != active_pipes[0] &&
 					    crtc->pipe != active_pipes[last_pipe])
 						continue;
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 9f6b2df9ed7c..5edffb649ef4 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -64,7 +64,7 @@ typedef struct _data data_t;
 
 struct _data {
 	int drm_fd;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_display_t display;
 	igt_output_t *output;
 	drmModeResPtr res;
@@ -255,7 +255,6 @@ adjust_mode_overflow_vrefresh(data_t *data, drmModeModeInfoPtr mode)
 static void
 test_output(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	igt_output_t *output = data->output;
 	drmModeModeInfo mode;
 	struct igt_fb fb;
@@ -278,7 +277,7 @@ test_output(data_t *data)
 
 	kmstest_unset_all_crtcs(data->drm_fd, data->res);
 
-	crtc_id = igt_crtc_for_pipe(display, data->pipe)->crtc_id;
+	crtc_id = data->crtc->crtc_id;
 
 	ret = drmModeSetCrtc(data->drm_fd, crtc_id,
 			     fb.fb_id, 0, 0,
@@ -370,7 +369,7 @@ int igt_main()
 					      igt_crtc_name(crtc),
 					      igt_output_name(output)) {
 					data.output = output;
-					data.pipe = crtc->pipe;
+					data.crtc = crtc;
 					data.adjust_mode = subtests[i].adjust_mode;
 					test_output(&data);
 				}
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index fb3980fade53..8b4e5809d14e 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -66,7 +66,7 @@ typedef struct {
 	igt_display_t display;
 	uint32_t devid;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	struct igt_fb fb_primary;
 	struct igt_fb fb_plane[2];
 	struct {
@@ -273,7 +273,7 @@ test_planes_on_pipe(data_t *data, uint64_t modifier)
 	igt_plane_t *plane;
 	unsigned tested = 0;
 
-	for_each_plane_on_pipe(&data->display, data->pipe, plane)
+	for_each_plane_on_pipe(&data->display, data->crtc->pipe, plane)
 		tested += test_planes_on_pipe_with_output(data, plane, modifier);
 
 	igt_assert(tested > 0);
@@ -289,7 +289,6 @@ static void test_cleanup(data_t *data)
 
 static void run_test(data_t *data, uint64_t modifier)
 {
-	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
 	igt_output_t *output;
 
@@ -299,17 +298,17 @@ static void run_test(data_t *data, uint64_t modifier)
 	for_each_crtc(&data->display, crtc) {
 		for_each_valid_output_on_pipe(&data->display, crtc->pipe,
 					      output) {
-			data->pipe = crtc->pipe;
+			data->crtc = crtc;
 			data->output = output;
 
 			igt_display_reset(&data->display);
 			igt_output_set_crtc(data->output,
-					    igt_crtc_for_pipe(display, data->pipe));
+					    data->crtc);
 
 			if (!intel_pipe_output_combo_valid(&data->display))
 				continue;
 
-			data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+			data->pipe_crc = igt_crtc_crc_new(data->crtc,
 							  IGT_PIPE_CRC_SOURCE_AUTO);
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index ff1c1338c063..05f9149391a1 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -74,7 +74,7 @@ typedef struct {
 	struct igt_fb primary_fb;
 	igt_output_t *output;
 	uint32_t crtc_id;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	unsigned int flags;
 #define IDLE 1
 #define BUSY 2
@@ -106,7 +106,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 
 	/* create and set the primary plane fb */
 	mode = igt_output_get_mode(output);
@@ -123,7 +123,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 
 	igt_display_commit(display);
 
-	igt_wait_for_vblank(igt_crtc_for_pipe(display, data->pipe));
+	igt_wait_for_vblank(data->crtc);
 }
 
 static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
@@ -171,7 +171,7 @@ static void run_test(data_t *data, int fd, void (*testfunc)(data_t *, int, int))
 
 	igt_info("Beginning %s on pipe %s, connector %s (%d threads)\n",
 		 igt_subtest_name(),
-		 kmstest_pipe_name(data->pipe),
+		 igt_crtc_name(data->crtc),
 		 igt_output_name(output),
 		 nchildren);
 
@@ -199,7 +199,7 @@ static void run_test(data_t *data, int fd, void (*testfunc)(data_t *, int, int))
 
 	igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
 		 igt_subtest_name(),
-		 kmstest_pipe_name(data->pipe),
+		 igt_crtc_name(data->crtc),
 		 igt_output_name(output));
 
 	/* cleanup what prepare_crtc() has done */
@@ -321,7 +321,7 @@ int igt_main()
 					igt_dynamic_f("pipe-%s-%s",
 						      igt_crtc_name(crtc),
 						      igt_output_name(output)) {
-						data.pipe = crtc->pipe;
+						data.crtc = crtc;
 						data.output = output;
 						data.flags = m->flags;
 						run_test(&data, fd, f->func);
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index b2f9f3bdd08d..3137884dcfc6 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -31,7 +31,7 @@ IGT_TEST_DESCRIPTION(
 "such as context flipping.");
 
 typedef struct {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	int drm_fd;
 	int nv_crc_dir;
 	igt_display_t display;
@@ -105,7 +105,6 @@ static void destroy_crc_colors(data_t *data, struct color_fb *colors, size_t len
  */
 static void test_ctx_flip_detection(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	struct color_fb colors[] = {
 		HEX_COLOR(0xFF, 0x00, 0x18),
 		HEX_COLOR(0xFF, 0xA5, 0x2C),
@@ -123,7 +122,7 @@ static void test_ctx_flip_detection(data_t *data)
 	int start = -1, frame, start_color = -1, i;
 	bool found_skip = false;
 
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+	pipe_crc = igt_crtc_crc_new(data->crtc,
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	create_crc_colors(data, colors, n_colors, pipe_crc);
@@ -222,7 +221,6 @@ static void test_ctx_flip_detection(data_t *data)
  */
 static void test_ctx_flip_skip_current_frame(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	struct color_fb colors[] = {
 		{ .r = 1.0, .g = 0.0, .b = 0.0 },
 		{ .r = 0.0, .g = 1.0, .b = 0.0 },
@@ -235,7 +233,7 @@ static void test_ctx_flip_skip_current_frame(data_t *data)
 	const int n_colors = ARRAY_SIZE(colors);
 	const int n_crcs = 30;
 
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+	pipe_crc = igt_crtc_crc_new(data->crtc,
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 	create_crc_colors(data, colors, n_colors, pipe_crc);
 
@@ -265,11 +263,10 @@ static void test_ctx_flip_skip_current_frame(data_t *data)
 
 static void test_ctx_flip_threshold_reset_after_capture(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	igt_pipe_crc_t *pipe_crc;
 	uint32_t value = 0;
 
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+	pipe_crc = igt_crtc_crc_new(data->crtc,
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	set_crc_flip_threshold(data, 5);
@@ -285,8 +282,7 @@ static void test_ctx_flip_threshold_reset_after_capture(data_t *data)
 
 static void test_source(data_t *data, const char *source)
 {
-	igt_display_t *display = &data->display;
-	igt_pipe_crc_t *pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+	igt_pipe_crc_t *pipe_crc = igt_crtc_crc_new(data->crtc,
 						    source);
 	igt_crc_t *crcs;
 
@@ -303,7 +299,6 @@ static void test_source(data_t *data, const char *source)
 
 static void test_source_outp_inactive(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	struct color_fb colors[] = {
 		{ .r = 1.0, .g = 0.0, .b = 0.0 },
 		{ .r = 0.0, .g = 1.0, .b = 0.0 },
@@ -311,7 +306,7 @@ static void test_source_outp_inactive(data_t *data)
 	igt_pipe_crc_t *pipe_crc;
 	const int n_colors = ARRAY_SIZE(colors);
 
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
+	pipe_crc = igt_crtc_crc_new(data->crtc,
 				    "outp-inactive");
 	create_crc_colors(data, colors, n_colors, pipe_crc);
 
@@ -344,8 +339,9 @@ int igt_main()
 		igt_fixture() {
 			int dir;
 
-			data.pipe = pipe;
-			igt_display_require_output_on_pipe(&data.display, pipe);
+			data.crtc = igt_crtc_for_pipe(&data.display, pipe);
+			igt_display_require_output_on_pipe(&data.display,
+							   data.crtc->pipe);
 
 			/* Disable the output from the previous iteration of pipe tests, if there is
 			 * one
@@ -355,14 +351,15 @@ int igt_main()
 				igt_display_commit(&data.display);
 			}
 
-			data.output = igt_get_single_output_for_pipe(&data.display, pipe);
+			data.output = igt_get_single_output_for_pipe(&data.display,
+								     data.crtc->pipe);
 			data.mode = igt_output_get_mode(data.output);
 
 			/* None of these tests need to perform modesets, just page flips. So running
 			 * display setup here is fine
 			 */
 			igt_output_set_crtc(data.output,
-					    igt_crtc_for_pipe(data.output->display, pipe));
+					    data.crtc);
 			data.primary = igt_output_get_plane(data.output, 0);
 			igt_create_color_fb(data.drm_fd,
 					    data.mode->hdisplay,
@@ -374,7 +371,9 @@ int igt_main()
 			igt_plane_set_fb(data.primary, &data.default_fb);
 			igt_display_commit(&data.display);
 
-			dir = igt_debugfs_crtc_dir(data.drm_fd, pipe, O_DIRECTORY);
+			dir = igt_debugfs_crtc_dir(data.drm_fd,
+						   data.crtc->pipe,
+						   O_DIRECTORY);
 			igt_require_fd(dir);
 			data.nv_crc_dir = openat(dir, "nv_crc", O_DIRECTORY);
 			close(dir);
diff --git a/tests/vmwgfx/vmw_prime.c b/tests/vmwgfx/vmw_prime.c
index 570bcc993496..0640b2476dc8 100644
--- a/tests/vmwgfx/vmw_prime.c
+++ b/tests/vmwgfx/vmw_prime.c
@@ -174,7 +174,7 @@ struct gpu_process_t {
 	struct vmw_surface *fb_surface;
 	igt_output_t *output;
 	igt_plane_t *primary;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_crc_t reference_tri_crc;
 };
 
@@ -204,7 +204,7 @@ static void prepare_crtc(struct gpu_process_t *gpu)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(display, gpu->pipe));
+			    gpu->crtc);
 
 	mode = igt_output_get_mode(output);
 
@@ -231,7 +231,7 @@ static void prepare_crtc_surface(struct gpu_process_t *gpu)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(display, gpu->pipe));
+			    gpu->crtc);
 
 	mode = igt_output_get_mode(output);
 
@@ -297,7 +297,7 @@ static void draw_triangle_3d(struct gpu_process_t *gpu, uint32_t draw_flags)
 		int prime_fd;
 
 		gpu->output = output;
-		gpu->pipe = crtc->pipe;
+		gpu->crtc = crtc;
 
 		prepare_crtc(gpu);
 		pipe_crc = igt_pipe_crc_new(gpu->mdevice.drm_fd, crtc->pipe,
@@ -364,7 +364,7 @@ static void draw_dumb_buffer(struct gpu_process_t *gpu)
 
 	for_each_crtc_with_valid_output(display, crtc, output) {
 		gpu->output = output;
-		gpu->pipe = crtc->pipe;
+		gpu->crtc = crtc;
 
 		prepare_crtc_surface(gpu);
 		pipe_crc = igt_pipe_crc_new(gpu->mdevice.drm_fd, crtc->pipe,
diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index cd5d2b6be108..266ee196862d 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -28,7 +28,7 @@ typedef struct data {
 	struct igt_fb fb;
 	int height, width;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	enum hdcp_type hdcp_type;
 	int user_cmd;
 	bool running;
@@ -628,7 +628,7 @@ static void test_init(data_t *data)
 	igt_display_reset(&data->display);
 
 	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
-		data->pipe = crtc->pipe;
+		data->crtc = crtc;
 		if (!igt_output_has_prop(data->output, IGT_CONNECTOR_CONTENT_PROTECTION))
 			continue;
 
-- 
2.52.0

