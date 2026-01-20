Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9420FCA5FB7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 17:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4774210E639;
	Tue, 20 Jan 2026 17:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9BjHV9g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE4510E648
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 17:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768929447; x=1800465447;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FWY7lFcMY9lFQw2R0aBOm+OsnuyDdtJLBfs2J1zB1rg=;
 b=D9BjHV9gEuDBX0LK/xcYPG8b1YT3DxiupqJOlonv7+1N2p4gutVsuVzS
 1m9gT9jZGAU+f6LzdyL5GP0iTN7W35iDJfyWE+9qfUfWAXT/spRqP+Vc/
 uSNLZfqQ/VEWg+/Cz3jKXk2X+YYkDTGSLe88uvwS9oeDrUqCx3FvGndEK
 SvUAmhN39rXoS1hv4B8yTSLrPWBwCHROaJ0YMGWgKdImce9e3aYpSwTsK
 YiboshjeLW0LeaY9u9F6LjJ17/q4Xg0nrUSkufkPsNnKZ5TykeZaOTpI5
 2tZ0PJfXXGKJoRA4Jo2ORMPMRRq2hXygRs/OeN45IFtG3EcWgR0M0elKF Q==;
X-CSE-ConnectionGUID: gkB7Pf/RQ/KBqWuU6hwCFA==
X-CSE-MsgGUID: xsCvdIlOQi+/Ou0GAyhwpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="72731890"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="72731890"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:27 -0800
X-CSE-ConnectionGUID: umjnUVESQfSWa+96k3TLvw==
X-CSE-MsgGUID: gp6Xrv7jSS+JHKHyH88j2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206222156"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:26 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/12] lib/kms: Eliminate some redundant
 igt_crtc_for_pipe()s
Date: Tue, 20 Jan 2026 19:16:49 +0200
Message-ID: <20260120171656.15840-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
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

A bunch of places already have the igt_crtc_t around
in some variable. Use it instead of repeating the
igt_crtc_for_pipe().

Done with cocci:
 #include "scripts/iterators.cocci"

@@
expression CRTC, DISPLAY, DISPLAY2, PIPE;
@@
{
...
CRTC = igt_crtc_for_pipe(DISPLAY, PIPE)
<+...
- igt_crtc_for_pipe(DISPLAY2, PIPE)
+ CRTC
...+>
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_abm.c                  | 2 +-
 tests/amdgpu/amd_bypass.c               | 2 +-
 tests/amdgpu/amd_color.c                | 2 +-
 tests/amdgpu/amd_ilr.c                  | 2 +-
 tests/amdgpu/amd_link_settings.c        | 2 +-
 tests/amdgpu/amd_mall.c                 | 2 +-
 tests/amdgpu/amd_max_bpc.c              | 2 +-
 tests/amdgpu/amd_mem_leak.c             | 2 +-
 tests/amdgpu/amd_multidisplay_modeset.c | 2 +-
 tests/amdgpu/amd_odm.c                  | 2 +-
 tests/amdgpu/amd_psr.c                  | 2 +-
 tests/amdgpu/amd_replay.c               | 2 +-
 tests/intel/gem_pxp.c                   | 2 +-
 tests/intel/kms_sharpness_filter.c      | 2 +-
 tests/intel/xe_pxp.c                    | 4 ++--
 tests/kms_atomic_transition.c           | 4 ++--
 tests/kms_hdr.c                         | 2 +-
 tests/kms_multipipe_modeset.c           | 4 ++--
 tools/amd_hdmi_compliance.c             | 2 +-
 19 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 0048304baf9c..ab52c83e8f9c 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -147,7 +147,7 @@ static void test_init(data_t *data)
 		 igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    data->pipe);
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 359387859d08..626c4bf36c13 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -93,7 +93,7 @@ static void test_init(data_t *data)
 					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    data->pipe);
 
 	data->width = data->mode->hdisplay;
 	data->height = data->mode->vdisplay;
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index d1e164673560..28622d8e16ed 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -197,7 +197,7 @@ static void test_init(data_t *data)
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    data->pipe);
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index f1db9649c4e8..70254bdc1288 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -104,7 +104,7 @@ static void test_init(data_t *data, igt_output_t *output)
 					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
 
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, data->pipe_id));
+			    data->pipe);
 
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 }
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index d042eb58d656..83d53ee54250 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -103,7 +103,7 @@ static void test_init(data_t *data, igt_output_t *output)
 	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
 
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, data->pipe_id));
+			    data->pipe);
 
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 }
diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
index 1673bfd8531f..baa475ed0fbf 100644
--- a/tests/amdgpu/amd_mall.c
+++ b/tests/amdgpu/amd_mall.c
@@ -89,7 +89,7 @@ static void test_init(data_t *data)
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    data->pipe);
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
index b5e3f7aa40cf..b25cc80f3817 100644
--- a/tests/amdgpu/amd_max_bpc.c
+++ b/tests/amdgpu/amd_max_bpc.c
@@ -86,7 +86,7 @@ static void test_init(data_t *data)
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    data->pipe);
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index e6321c215d4e..2897e6d82b12 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -68,7 +68,7 @@ static void test_init(data_t *data)
 		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    data->pipe);
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index e2200be2dbb3..2af063a9937b 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -161,7 +161,7 @@ static void test_init(struct data_t *data)
 		 */
 		output = igt_get_single_output_for_pipe(display, i);
 		pipes = igt_crtc_for_pipe(display, i);
-		data->primary[i] = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, i),
+		data->primary[i] = igt_crtc_get_plane_type(pipes,
 							   DRM_PLANE_TYPE_PRIMARY);
 		data->output[i] = output;
 
diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
index c8c268b982e5..b6a09b65f14b 100644
--- a/tests/amdgpu/amd_odm.c
+++ b/tests/amdgpu/amd_odm.c
@@ -78,7 +78,7 @@ static void test_init(struct data *data)
 
 	data->primary = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    data->pipe);
 
 	igt_display_reset(display);
 }
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index b98d43718251..af52f0e4ed54 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -197,7 +197,7 @@ static void test_init(data_t *data)
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    data->pipe);
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 65707a3c384e..cd340fabc3a3 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -78,7 +78,7 @@ static void test_init(struct test_data *data)
 		 igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    data->pipe);
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index 9015397c8a91..b45cfde0c1ac 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1230,7 +1230,7 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_pipe_connector_valid(i, output));
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, i));
+				    pipe);
 
 		igt_plane_set_fb(plane, &ref_fb);
 		igt_fb_set_size(&ref_fb, plane, mode->hdisplay, mode->vdisplay);
diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 2f3044c7a9c7..45285818c895 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -446,7 +446,7 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			}
 
 			igt_output_set_crtc(data->output,
-					    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+					    data->pipe);
 
 			if (!intel_pipe_output_combo_valid(display)) {
 				igt_output_set_crtc(data->output, NULL);
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 87c2c67394dd..2642109693d3 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -906,7 +906,7 @@ static void test_display_pxp_fb(int fd, igt_display_t *display)
 		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_pipe_connector_valid(i, output));
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, i));
+				    pipe);
 
 		commit_fb(display, plane, &ref_fb, mode);
 
@@ -964,7 +964,7 @@ static void test_display_black_pxp_fb(int fd, igt_display_t *display)
 		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_pipe_connector_valid(i, output));
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, i));
+				    pipe);
 
 		igt_plane_set_fb(plane, &ref_fb);
 		igt_fb_set_size(&ref_fb, plane, mode->hdisplay, mode->vdisplay);
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 883a90e04a1a..ca97edbc73e0 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -937,7 +937,7 @@ retry:
 				continue;
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, i));
+					    pipe);
 			if (intel_pipe_output_combo_valid(&data->display)) {
 				mode = igt_output_get_mode(output);
 
@@ -957,7 +957,7 @@ retry:
 			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
 
 			if (fencing)
-				igt_crtc_request_out_fence(igt_crtc_for_pipe(&data->display, i));
+				igt_crtc_request_out_fence(pipe);
 		} else {
 			igt_plane_set_fb(plane, NULL);
 		}
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 8f05a4f40e64..6fb936955d62 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -226,7 +226,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    data->pipe);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 
 	data->w = data->mode->hdisplay;
diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index cfab18cc65c5..27df48899d71 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -84,7 +84,7 @@ static void run_test(data_t *data, int valid_outputs)
 						IGT_PIPE_CRC_SOURCE_AUTO);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, i));
+				    pipe);
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
@@ -107,7 +107,7 @@ static void run_test(data_t *data, int valid_outputs)
 		mode = NULL;
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, i));
+				    pipe);
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index e8eeaf95c64c..6f6f6979ad6b 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -410,7 +410,7 @@ static void test_init(data_t *data, int conn_id)
 		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    data->pipe);
 
 	if (data->timeout_seconds > 0) {
 		struct sigaction sa;
-- 
2.52.0

