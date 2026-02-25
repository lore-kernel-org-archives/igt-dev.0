Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AD4FD3758
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864EF10E773;
	Wed, 25 Feb 2026 12:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRjxqrZD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1B310E772
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023904; x=1803559904;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hrqjrw/KpHLI6YNMdD1VNW9pjzfHBzTHDhFfbqQQoKk=;
 b=CRjxqrZD6NghSAOrwIZtxsfNXZpdnVR8YvEXPSEQTgB/irrzcxFXvt+w
 aPTKwA5VMCIaW4alHeTnVWlegEC0CH88OxfaAQFoNl1rJl9F/RJrIRK8q
 3UZuk9t9iKBlJY6p4yCuc0gLOOSsuZrCEpBgkDm2fKYlNQD2yAA6JqDfD
 vRtPr0/yAhpSEUjeA4dzoBGM4jONV8vwvuG/tzsLb06gySlvuFgYdNKpb
 boxZGLiofxkuPqWYK5AAzwruCqBitIGLpyvFOECtu5Q0H0DcvEFRV+r/Q
 jKeLYr+B1nkKcguludNbrm94HCqDaoNDimaLPrKE8R4azEdxcpNHYR9O4 w==;
X-CSE-ConnectionGUID: LJXscn9XQHKFfVj6jydUGw==
X-CSE-MsgGUID: tr1DQWJcTlm6OUwRyTeEvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83772232"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="83772232"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:44 -0800
X-CSE-ConnectionGUID: suyEyvspQ3uHJBqOVnnseQ==
X-CSE-MsgGUID: glYXDLuuQziiDxZtYJD7HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="213350051"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:43 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/19] lib/kms: Replace get_num_scalers() with
 igt_crtc_num_scalers()
Date: Wed, 25 Feb 2026 14:50:58 +0200
Message-ID: <20260225125108.31119-10-ville.syrjala@linux.intel.com>
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

Replace the pipe based (and badly namespaced) get_num_scalers()
with igt_crtc_num_scalers() that takes an igt_crtc_t.

Note that I had to play some games with cocci in the semantic
patch (the weird '+ { return 0; }') to get it to actually
remove the old docs for get_num_scalers().

 #include "scripts/iterators.cocci"

@@
expression DISPLAY, PIPE;
@@
- get_num_scalers(DISPLAY, PIPE)
+ igt_crtc_num_scalers(igt_crtc_for_pipe(DISPLAY, PIPE))

@@
typedef igt_crtc_t;
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
identifier DISPLAY, PIPE;
@@
int get_num_scalers(igt_display_t *DISPLAY, enum pipe PIPE);
+ int igt_crtc_num_scalers(igt_crtc_t *crtc);

@@
identifier DISPLAY, PIPE;
@@
get_num_scalers(igt_display_t *DISPLAY, enum pipe PIPE)
+ { return 0; }
+
+/**
+ * igt_crtc_num_scalers:
+ * @crtc: the CRTC
+ *
+ * Returns: Number of scalers supported on the CRTC.
+ */
+int igt_crtc_num_scalers(igt_crtc_t *crtc)
{
+ igt_display_t *DISPLAY = crtc->display;
<...
(
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(crtc)
|
- PIPE
+ crtc->pipe
)
...>
}

@@
@@
- get_num_scalers(...) { ... }

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c             | 14 +++++++-------
 lib/igt_kms.h             |  2 +-
 tests/kms_hdr.c           |  2 +-
 tests/kms_plane_scaling.c | 24 ++++++++++++------------
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b39e262303b5..2170e775b3a5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7340,14 +7340,14 @@ int igt_get_dp_mst_connector_id(igt_output_t *output)
 }
 
 /**
- * get_num_scalers:
- * @display: the display
- * @pipe: display pipe
+ * igt_crtc_num_scalers:
+ * @crtc: the CRTC
  *
- * Returns: Number of scalers supported per pipe.
+ * Returns: Number of scalers supported on the CRTC.
  */
-int get_num_scalers(igt_display_t *display, enum pipe pipe)
+int igt_crtc_num_scalers(igt_crtc_t *crtc)
 {
+	igt_display_t *display = crtc->display;
 	char buf[8120];
 	char *start_loc1, *start_loc2;
 	int dir, res;
@@ -7355,7 +7355,7 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
 	int drm_fd = display->drm_fd;
 	char dest[20] = ":pipe ";
 
-	strcat(dest, kmstest_pipe_name(pipe));
+	strcat(dest, igt_crtc_name(crtc));
 
 	if (is_intel_device(drm_fd) &&
 	    intel_display_ver(intel_get_drm_devid(drm_fd)) >= 9) {
@@ -7384,7 +7384,7 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
 		 * as a rough approximation of the # of scalars.. it may
 		 * undercount on some hw, but it will not overcount
 		 */
-		for_each_plane_on_pipe(display, pipe, plane) {
+		for_each_plane_on_pipe(display, crtc->pipe, plane) {
 			for (unsigned i = 0; i < plane->format_mod_count; i++) {
 				if (igt_format_is_yuv(plane->formats[i])) {
 					num_scalers++;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 86991da20de3..2d1f14330617 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1284,7 +1284,7 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
-int get_num_scalers(igt_display_t *display, enum pipe pipe);
+int igt_crtc_num_scalers(igt_crtc_t *crtc);
 int igt_get_current_lane_count(int drm_fd, igt_output_t *output);
 int igt_get_current_link_rate(int drm_fd, igt_output_t *output);
 int igt_get_max_link_rate(int drm_fd, igt_output_t *output);
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 5a2e3f1cfdcc..f677c6629430 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -251,7 +251,7 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
 	 * smaller plane size in following tests.
 	 */
 	igt_plane_set_fb(data->primary, &afb);
-	if (get_num_scalers(display, crtc->pipe) >= 1)
+	if (igt_crtc_num_scalers(crtc) >= 1)
 		igt_plane_set_size(data->primary, data->w, data->h);
 	else
 		igt_plane_set_size(data->primary, 512, 512);
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 1d91ad1493b1..ac301924f937 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1097,8 +1097,8 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_output_set_crtc(output2,
 			    crtc2);
 
-	igt_require(get_num_scalers(display, crtc1->pipe) >= 2);
-	igt_require(get_num_scalers(display, crtc2->pipe) >= 2);
+	igt_require(igt_crtc_num_scalers(crtc1) >= 2);
+	igt_require(igt_crtc_num_scalers(crtc2) >= 2);
 
 	plane[0] = igt_output_get_plane(output1, 0);
 	igt_require(plane[0]);
@@ -1187,7 +1187,7 @@ static void invalid_parameter_tests(data_t *d)
 		igt_output_set_crtc(output, crtc);
 		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
-		igt_require(get_num_scalers(&d->display, crtc->pipe) >= 1);
+		igt_require(igt_crtc_num_scalers(crtc) >= 1);
 
 		igt_create_fb(d->drm_fd, 256, 256,
 			      DRM_FORMAT_XRGB8888,
@@ -1380,7 +1380,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 							igt_info("Trying on %s\n", igt_output_name(output));
 							if (!pipe_output_combo_valid(&data.display, crtc, output))
 								continue;
-							if (get_num_scalers(&data.display, crtc->pipe) < 1)
+							if (igt_crtc_num_scalers(crtc) < 1)
 								continue;
 
 							ret = test_scaler_with_pixel_format_pipe(&data,
@@ -1409,7 +1409,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 							igt_info("Trying on %s\n", igt_output_name(output));
 							if (!pipe_output_combo_valid(&data.display, crtc, output))
 								continue;
-							if (get_num_scalers(&data.display, crtc->pipe) < 1)
+							if (igt_crtc_num_scalers(crtc) < 1)
 								continue;
 
 							ret = test_scaler_with_rotation_pipe(&data,
@@ -1438,7 +1438,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 							igt_info("Trying on %s\n", igt_output_name(output));
 							if (!pipe_output_combo_valid(&data.display, crtc, output))
 								continue;
-							if (get_num_scalers(&data.display, crtc->pipe) < 1)
+							if (igt_crtc_num_scalers(crtc) < 1)
 								continue;
 
 							ret = test_scaler_with_modifier_pipe(&data,
@@ -1466,7 +1466,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 						igt_info("Trying on %s\n", igt_output_name(output));
 						if (!pipe_output_combo_valid(&data.display, crtc, output))
 							continue;
-						if (get_num_scalers(&data.display, crtc->pipe) < 1)
+						if (igt_crtc_num_scalers(crtc) < 1)
 							continue;
 
 						ret = test_scaler_with_pixel_format_pipe(&data, 0.0, true,
@@ -1492,7 +1492,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 						igt_info("Trying on %s\n", igt_output_name(output));
 						if (!pipe_output_combo_valid(&data.display, crtc, output))
 							continue;
-						if (get_num_scalers(&data.display, crtc->pipe) < 1)
+						if (igt_crtc_num_scalers(crtc) < 1)
 							continue;
 
 						ret = test_scaler_with_rotation_pipe(&data, 0.0, true,
@@ -1517,7 +1517,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 						igt_info("Trying on %s\n", igt_output_name(output));
 						if (!pipe_output_combo_valid(&data.display, crtc, output))
 							continue;
-						if (get_num_scalers(&data.display, crtc->pipe) < 1)
+						if (igt_crtc_num_scalers(crtc) < 1)
 							continue;
 
 						ret = test_scaler_with_modifier_pipe(&data, 0.0, true,
@@ -1544,7 +1544,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 								 igt_output_name(output));
 							if (!pipe_output_combo_valid(&data.display, crtc, output))
 								continue;
-							if (get_num_scalers(&data.display, crtc->pipe) < 2)
+							if (igt_crtc_num_scalers(crtc) < 2)
 								continue;
 							ret = test_planes_scaling_combo(&data,
 								scaler_with_2_planes_tests[index].sf_plane1,
@@ -1569,7 +1569,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 				igt_require_intel(data.drm_fd);
 				for_each_crtc(&data.display, crtc) {
 					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
-						if (get_num_scalers(&data.display, crtc->pipe) < 1)
+						if (igt_crtc_num_scalers(crtc) < 1)
 							continue;
 						/*
 						 * Need to find mode with lowest vrefresh else
@@ -1600,7 +1600,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			for_each_crtc_with_valid_output(&data.display, crtc, output) {
 				if (!pipe_output_combo_valid(&data.display, crtc, output))
 					continue;
-				if (get_num_scalers(&data.display, crtc->pipe) < 1)
+				if (igt_crtc_num_scalers(crtc) < 1)
 						continue;
 
 				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
-- 
2.52.0

