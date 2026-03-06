Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5785F01835
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 13:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7478F10ED31;
	Fri,  6 Mar 2026 13:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMO+fRFg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD7110ED31
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 13:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772803467; x=1804339467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kACKEObjKrQl2esC0CwGlPUDRLWakTDTarM9tv4/10A=;
 b=jMO+fRFgSe6f1WDV2QVSuKqsj1n3mcCfz0c22Ja0zKntS6cMFzNtrAYg
 dkYPz6kKxkC76ohn5YDceoeeTxh3NA7atZOWHCHudqxoE10EEKsD1JWFj
 02hL4ezDi2lUgpomlqdwl+W5zJMKROcEiPy8onsIe7zLfS2MsSs/hgLzP
 ovyVL2VkwmWj84VEG62jAX0gSKUA44hcCUISrLZRUo36hdJfVcrPU/f0w
 PqhMb4wTx8hxnmPOoYzMgKzgSnejwTjW9w+hJ0Tu76Dh95B4S7CDwjEke
 XF+8AkA7HWwCMKKW5eiHCRNQXUTjHSf18epGXg21lY3jyc5NIscsNF7OL g==;
X-CSE-ConnectionGUID: cs1xB3gFTuuId/YyDI9TtA==
X-CSE-MsgGUID: BtmjrROQQ3uKsARYQazYlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91297428"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="91297428"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:24:27 -0800
X-CSE-ConnectionGUID: VQR7mPVTRoWTNSoI8lbMbA==
X-CSE-MsgGUID: pNPCbHdAReqx00fJdpzrRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218237285"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:24:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 4/5] tests/kms_multipipe_modeset: use igt_next_crtc()
Date: Fri,  6 Mar 2026 15:23:57 +0200
Message-ID: <7d66e7bd76f0a7b1caf2274eaf870c483ed75ae7.1772803372.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772803372.git.jani.nikula@intel.com>
References: <cover.1772803372.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

The test doesn't care about pipes, but rather just another CRTC, so
prefer igt_next_crtc() over looping pipes and igt_crtc_for_pipe().

It's all a bit subtle, but previously the test depended on consecutive
pipes. Using CRTC indices allows for fused off pipes in between.

While at it, prefer CRTC nomenclature in the variables and messages.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_multipipe_modeset.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index 1980a0c61116..3c10bb1bd5fe 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -48,17 +48,16 @@ typedef struct {
 	struct igt_fb fb;
 } data_t;
 
-static void run_test(data_t *data, int valid_outputs)
+static void run_test(data_t *data)
 {
 	igt_output_t *output;
 	igt_pipe_crc_t *pipe_crcs[IGT_MAX_PIPES] = { 0 };
 	igt_crc_t ref_crcs[IGT_MAX_PIPES], new_crcs[IGT_MAX_PIPES];
 	igt_display_t *display = &data->display;
 	uint16_t width = 0, height = 0;
-	igt_crtc_t *crtc;
+	igt_crtc_t *crtc = NULL;
 	igt_plane_t *plane;
 	drmModeModeInfo *mode;
-	int i = 0;
 
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
@@ -75,13 +74,12 @@ static void run_test(data_t *data, int valid_outputs)
 
 	/* Collect reference CRC by Committing individually on all outputs*/
 	for_each_connected_output(display, output) {
-		crtc = igt_crtc_for_pipe(display, i);
+		crtc = igt_next_crtc(display, crtc);
 		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 
 		mode = NULL;
 
-		pipe_crcs[i] = igt_crtc_crc_new(crtc,
-						IGT_PIPE_CRC_SOURCE_AUTO);
+		pipe_crcs[crtc->crtc_index] = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 
 		igt_output_set_crtc(output,
 				    crtc);
@@ -93,15 +91,14 @@ static void run_test(data_t *data, int valid_outputs)
 		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
 
 		igt_display_commit2(display, COMMIT_ATOMIC);
-		igt_pipe_crc_collect_crc(pipe_crcs[i], &ref_crcs[i]);
+		igt_pipe_crc_collect_crc(pipe_crcs[crtc->crtc_index], &ref_crcs[crtc->crtc_index]);
 		igt_output_set_crtc(output, NULL);
-		i++;
 	}
 
-	i = 0;
 	/* Simultaneously commit on all outputs */
+	crtc = NULL;
 	for_each_connected_output(display, output) {
-		crtc = igt_crtc_for_pipe(display, i);
+		crtc = igt_next_crtc(display, crtc);
 		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 
 		mode = NULL;
@@ -114,22 +111,21 @@ static void run_test(data_t *data, int valid_outputs)
 		igt_plane_set_fb(plane, &data->fb);
 		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
 		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
-		i++;
 	}
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	/* CRC Verification */
-	for (i = 0; i < valid_outputs; i++) {
-		igt_pipe_crc_collect_crc(pipe_crcs[i], &new_crcs[i]);
-		igt_assert_crc_equal(&ref_crcs[i], &new_crcs[i]);
+	for_each_crtc(display, crtc) {
+		igt_pipe_crc_collect_crc(pipe_crcs[crtc->crtc_index], &new_crcs[crtc->crtc_index]);
+		igt_assert_crc_equal(&ref_crcs[crtc->crtc_index], &new_crcs[crtc->crtc_index]);
 	}
 
 	igt_plane_set_fb(plane, NULL);
 	igt_remove_fb(data->drm_fd, &data->fb);
 }
 
-static void test_multipipe(data_t *data, int num_pipes)
+static void test_multipipe(data_t *data, int num_crtcs)
 {
 	igt_output_t *output;
 	int valid_outputs = 0;
@@ -137,11 +133,11 @@ static void test_multipipe(data_t *data, int num_pipes)
 	for_each_connected_output(&data->display, output)
 		valid_outputs++;
 
-	igt_require_f(valid_outputs == num_pipes,
+	igt_require_f(valid_outputs == num_crtcs,
 		      "Number of connected outputs(%d) not equal to the "
-		      "number of pipes supported(%d)\n", valid_outputs, num_pipes);
+		      "number of CRTCs supported(%d)\n", valid_outputs, num_crtcs);
 
-	run_test(data, valid_outputs);
+	run_test(data);
 }
 
 int igt_main()
-- 
2.47.3

