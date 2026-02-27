Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C6BFD530D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A925210EA4E;
	Fri, 27 Feb 2026 08:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7csPbQP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7958F10EA4E
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179630; x=1803715630;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MzvHp3uYAS2m+oH94LZ69soMdlvSkrsX/76NF7uWl/A=;
 b=j7csPbQPwqQW/yCCdo1uFCdvImXK5+yvrFTJxJBPUSekSPCKz5ef/Vd0
 0jwKRdRyMR8g2/7sHqpwex5mOw27Yl4hU2FAqdtSK55e8x20e1YA6xlum
 XO9umqzWRqYrb4HnWDN8GXBd/AN1IN8UGgDYBZv5qDK/2OTKNJWeX/OQS
 X389kb+C0mq0F42tedOxvBj0DqOA7FrCwCVd7sY4pIkYGt80l/726jAFr
 E8xzKDfeH/WiHy2OrnK3HyN4JdLmoaR3aXmpPhcT7BEgqCPtMVsledF/D
 A3cblNPqnQQ1OdW5fSHda7MTkYcREaNtSrk5wyZ6uUpboHCFF7WUPSnGW g==;
X-CSE-ConnectionGUID: 7shNoRAGRd2jstE2dfKFfQ==
X-CSE-MsgGUID: HP6hEdKISvuoFDAMHuRlHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="75859385"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="75859385"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:10 -0800
X-CSE-ConnectionGUID: qlvvKXTRQCum2NztdcVDXg==
X-CSE-MsgGUID: A9yjOHQrTqCs/eC+dhB6Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="216731082"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:09 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 03/17] lib/kms: Replace igt_get_single_output_for_pipe()
 with igt_get_single_output_for_crtc()
Date: Fri, 27 Feb 2026 10:06:39 +0200
Message-ID: <20260227080653.30389-4-ville.syrjala@linux.intel.com>
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

Replace the pipe based igt_get_single_output_for_pipe() with
the crtc based igt_get_single_output_for_crtc()

 #include "scripts/iterators.cocci"

@@
expression DISPLAY, PIPE;
@@
- igt_get_single_output_for_pipe(DISPLAY, PIPE)
+ igt_get_single_output_for_crtc(igt_crtc_for_pipe(DISPLAY, PIPE))

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
type T;
@@
T igt_get_single_output_for_pipe(...);
+igt_output_t *igt_get_single_output_for_crtc(igt_crtc_t *crtc);

@@
@@
igt_get_single_output_for_pipe(...)
{ ... }
+/**
+ * igt_get_single_output_for_crtc:
+ * @crtc: The CRTC for which an #igt_output_t must be returned.
+ *
+ * Get a compatible output for a CRTC.
+ *
+ * Returns: A compatible output for a given CRTC, or NULL.
+ */
+igt_output_t *igt_get_single_output_for_crtc(igt_crtc_t *crtc)
+{
+       igt_display_t *display = crtc->display;
+       igt_output_t *chosen_outputs[igt_display_n_crtcs(display)];
+
+       __igt_pipe_populate_outputs(display, chosen_outputs);
+
+       return chosen_outputs[crtc->pipe];
+}

@@
@@
- igt_get_single_output_for_pipe(...) { ... }

@@
@@
- igt_require_pipe(...) { ... }

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                           | 26 ++++++++-----------------
 lib/igt_kms.h                           |  2 +-
 tests/amdgpu/amd_abm.c                  |  3 +--
 tests/amdgpu/amd_bypass.c               |  3 +--
 tests/amdgpu/amd_color.c                |  3 +--
 tests/amdgpu/amd_multidisplay_modeset.c |  2 +-
 tests/amdgpu/amd_psr.c                  |  3 +--
 tests/amdgpu/amd_replay.c               |  3 +--
 tests/intel/gem_eio.c                   |  2 +-
 tests/nouveau_crc.c                     |  3 +--
 10 files changed, 17 insertions(+), 33 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 11ed109d74fb..5c2e101f08be 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2814,13 +2814,6 @@ void igt_display_reset(igt_display_t *display)
 static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane);
 static void igt_fill_display_format_mod(igt_display_t *display);
 
-static void igt_require_pipe(igt_display_t *display, enum pipe pipe)
-{
-	igt_skip_on_f(pipe >= igt_display_n_crtcs(display) || !igt_crtc_for_pipe(display, pipe)->valid,
-			"Pipe %s does not exist\n",
-			kmstest_pipe_name(pipe));
-}
-
 static bool igt_crtc_has_valid_output(igt_crtc_t *crtc)
 {
 	igt_display_t *display = crtc->display;
@@ -2949,7 +2942,7 @@ void igt_display_reset_outputs(igt_display_t *display)
 		if (!igt_crtc_has_valid_output(crtc))
 			continue;
 
-		output = igt_get_single_output_for_pipe(display, crtc->pipe);
+		output = igt_get_single_output_for_crtc(crtc);
 
 		if (crtc->num_primary_planes > 1) {
 			igt_plane_t *old_primary = &crtc->planes[0];
@@ -3655,24 +3648,21 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 }
 
 /**
- * igt_get_single_output_for_pipe:
- * @display: a pointer to an #igt_display_t structure
- * @pipe: The pipe for which an #igt_output_t must be returned.
+ * igt_get_single_output_for_crtc:
+ * @crtc: The CRTC for which an #igt_output_t must be returned.
  *
- * Get a compatible output for a pipe.
+ * Get a compatible output for a CRTC.
  *
- * Returns: A compatible output for a given pipe, or NULL.
+ * Returns: A compatible output for a given CRTC, or NULL.
  */
-igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe pipe)
+igt_output_t *igt_get_single_output_for_crtc(igt_crtc_t *crtc)
 {
+	igt_display_t *display = crtc->display;
 	igt_output_t *chosen_outputs[igt_display_n_crtcs(display)];
 
-	igt_assert(pipe != PIPE_NONE);
-	igt_require_pipe(display, pipe);
-
 	__igt_pipe_populate_outputs(display, chosen_outputs);
 
-	return chosen_outputs[pipe];
+	return chosen_outputs[crtc->pipe];
 }
 
 static igt_output_t *igt_crtc_get_output(igt_crtc_t *crtc)
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c79c8664e9a9..08573316eea6 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -616,7 +616,7 @@ int igt_crtc_count_plane_type(igt_crtc_t *crtc, int plane_type);
 igt_plane_t *igt_crtc_get_plane_type_index(igt_crtc_t *crtc, int plane_type,
 					   int index);
 bool output_is_internal_panel(igt_output_t *output);
-igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe pipe);
+igt_output_t *igt_get_single_output_for_crtc(igt_crtc_t *crtc);
 
 void igt_crtc_request_out_fence(igt_crtc_t *crtc);
 
diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index bd700b90f361..1752a7e5c48d 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -133,8 +133,7 @@ static void test_init(data_t *data)
 
 	igt_display_reset(display);
 
-	data->output = igt_get_single_output_for_pipe(display,
-						      data->crtc->pipe);
+	data->output = igt_get_single_output_for_crtc(data->crtc);
 	igt_require(data->output);
 	igt_info("output %s\n", data->output->name);
 
diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 25136e83e6ad..9d5f3dd71c89 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -67,8 +67,7 @@ static void test_init(data_t *data)
 
 	igt_display_reset(display);
 
-	data->output = igt_get_single_output_for_pipe(display,
-						      data->crtc->pipe);
+	data->output = igt_get_single_output_for_crtc(data->crtc);
 	igt_assert(data->output);
 
 	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index cdc6f3e6abd8..68f541d64d63 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -182,8 +182,7 @@ static void test_init(data_t *data)
 
 	igt_display_reset(display);
 
-	data->output = igt_get_single_output_for_pipe(display,
-						      data->crtc->pipe);
+	data->output = igt_get_single_output_for_crtc(data->crtc);
 	igt_require(data->output);
 
 	data->mode = igt_output_get_mode(data->output);
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index a2853e73225a..40d1e5d7f42b 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -159,7 +159,7 @@ static void test_init(struct data_t *data)
 		 * This will let displays connected to MST hub be
 		 * tested
 		 */
-		output = igt_get_single_output_for_pipe(display, crtc->pipe);
+		output = igt_get_single_output_for_crtc(crtc);
 		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
 							   DRM_PLANE_TYPE_PRIMARY);
 		data->output[crtc->pipe] = output;
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index b1d6d1631e26..85247d0e20da 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -174,8 +174,7 @@ static void test_init(data_t *data)
 
 	igt_display_reset(display);
 
-	data->output = igt_get_single_output_for_pipe(display,
-						      data->crtc->pipe);
+	data->output = igt_get_single_output_for_crtc(data->crtc);
 	igt_require(data->output);
 	igt_info("output %s\n", data->output->name);
 
diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 5f62465d6b72..775bed190adf 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -64,8 +64,7 @@ static void test_init(struct test_data *data)
 
 	igt_display_reset(display);
 
-	data->output = igt_get_single_output_for_pipe(display,
-						      data->crtc->pipe);
+	data->output = igt_get_single_output_for_crtc(data->crtc);
 	igt_require(data->output);
 	igt_info("output %s\n", data->output->name);
 
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index 361fd24744c4..546fff14bd5b 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -1041,7 +1041,7 @@ static void display_helper(igt_display_t *dpy, int *done)
 		if (!crtc || !crtc->valid)
 			continue;
 
-		output = igt_get_single_output_for_pipe(dpy, crtc->pipe);
+		output = igt_get_single_output_for_crtc(crtc);
 		if (!output)
 			continue;
 
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index 98394674e463..eeb544acad76 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -350,8 +350,7 @@ int igt_main()
 				igt_display_commit(&data.display);
 			}
 
-			data.output = igt_get_single_output_for_pipe(&data.display,
-								     data.crtc->pipe);
+			data.output = igt_get_single_output_for_crtc(data.crtc);
 			data.mode = igt_output_get_mode(data.output);
 
 			/* None of these tests need to perform modesets, just page flips. So running
-- 
2.52.0

