Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A35F46452
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA34A10E3B9;
	Mon, 16 Mar 2026 11:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSJ/wsSV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBA010E4A6
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773659998; x=1805195998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7/0XUgw2NjZtooNd09Hv0o0C7ceRckVSYXwAYi1D5vo=;
 b=YSJ/wsSVV3ZBHpDV3hqwJkk2FgCGGeGFe3AaFwvokzrhiobidb5cGJmY
 qolL7MGII7c6L29113suKedMLJmbKx/FiEMvrdjTOCTp4hICzEc0MvbBM
 Zn9SN9geP0uAolVQdcweqksP9Pc9qTOBHgxu3iLXYiRawynSNe2et+Rhq
 l1WLUzp4grSjMRJfWf+HKg/hQNCDvblGE0S5LBI6BLwcoEcUQUCgxDugm
 QhpKNJzpZuVDk++K/27p9YAyH03NT6a95H8J4M1XbJqUURuDZC2tRSrYb
 1+UNDORUAOXwy4PnjaC0ulFJ1NCKCnWuABZBFmidLiXFyTbrYOL24zII7 w==;
X-CSE-ConnectionGUID: xsHcsfaPQ5KaA5R8sXTFqw==
X-CSE-MsgGUID: QE7wDoy6Qp61F83keOSO5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74562428"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74562428"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:58 -0700
X-CSE-ConnectionGUID: PLVeb1YZQsKe6BpdQKVvmg==
X-CSE-MsgGUID: 0NNnu6bKQqO+Bc57vxgEPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221832933"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 04/12] tests/intel/kms_joiner: Prepare for returning
 NULL from igt_crtc_for_pipe()
Date: Mon, 16 Mar 2026 13:19:06 +0200
Message-ID: <ac74ddc808b179f0de6098758a86190edea75d40.1773659680.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773659680.git.jani.nikula@intel.com>
References: <cover.1773659680.git.jani.nikula@intel.com>
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

Assert that the pipe is really there during testing.

Add some local variables to make the logic easier to follow.

This prepares for returning NULL for invalid pipes from
igt_crtc_for_pipe() by ensuring the test logic is sound.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/kms_joiner.c | 66 +++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index a582f6f93029..f8ea65a3b01a 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -143,10 +143,13 @@ static enum pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask
 static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe, uint32_t available_pipe_mask)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
+	igt_crtc_t *crtc;
 	enum pipe master_pipe;
 	uint32_t attempt_mask;
 
+	crtc = igt_crtc_for_pipe(display, pipe);
+	igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+
 	attempt_mask = BIT(crtc->pipe);
 	master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
 
@@ -164,14 +167,18 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
 static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo *mode)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc;
+	enum pipe pipe = PIPE_A;
 	igt_plane_t *primary;
 	igt_fb_t fb;
 
 	igt_info("Committing joiner mode for output %s with mode %dx%d@%d\n",
 		  output->name, mode->hdisplay, mode->vdisplay, mode->vrefresh);
 
-	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(display, PIPE_A));
+	crtc = igt_crtc_for_pipe(display, pipe);
+	igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+
+	igt_output_set_crtc(output, crtc);
 	igt_output_override_mode(output, mode);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
@@ -374,6 +381,9 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 			continue;
 
 		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
+			igt_crtc_t *crtc;
+			enum pipe pipe = data->pipe_seq[i + j];
+
 			output = outputs[j];
 
 			if (!force_joiner) {
@@ -385,10 +395,12 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 			}
 			igt_assert(kmstest_mode_is_valid(&mode));
 
-			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(display, data->pipe_seq[i + j]));
+			crtc = igt_crtc_for_pipe(display, pipe);
+			igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+
+			igt_output_set_crtc(output, crtc);
 			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
-				 kmstest_pipe_name(data->pipe_seq[i + j]),
+				 igt_crtc_name(crtc),
 				 igt_output_name(output), mode.hdisplay,
 				 mode.vdisplay, mode.vrefresh,
 				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
@@ -422,6 +434,9 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
 
 	for (i = 0; i < len; i++) {
+		igt_crtc_t *crtc;
+		enum pipe pipe = data->pipe_seq[data->n_pipes - 1];
+
 		igt_display_reset(&data->display);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 		output = outputs[i];
@@ -434,12 +449,14 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 			mode = *igt_output_get_mode(output);
 		}
 
-		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(display, data->pipe_seq[data->n_pipes - 1]));
-		igt_info(" Assigning pipe %s to %s with mode %dx%d@%d\n",
-				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
-				 igt_output_name(output), mode.hdisplay,
-				 mode.vdisplay, mode.vrefresh);
+		crtc = igt_crtc_for_pipe(display, pipe);
+		igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+
+		igt_output_set_crtc(output, crtc);
+		igt_info("Assigning pipe %s to %s with mode %dx%d@%d\n",
+			 igt_crtc_name(crtc),
+			 igt_output_name(output), mode.hdisplay,
+			 mode.vdisplay, mode.vrefresh);
 		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
 				      DRM_FORMAT_XRGB8888,
@@ -484,6 +501,9 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 		}
 
 		for (j = 0; j < data->n_pipes; j++) {
+			igt_crtc_t *crtc;
+			enum pipe pipe;
+
 			/* Ultra joiner is only valid on PIPE_A */
 			if (invalid_pipe && j == PIPE_A)
 				continue;
@@ -492,8 +512,11 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 			if (two_display && j != PIPE_A)
 				continue;
 
-			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(display, data->pipe_seq[j]));
+			pipe = data->pipe_seq[j];
+			crtc = igt_crtc_for_pipe(display, pipe);
+			igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+
+			igt_output_set_crtc(output, crtc);
 
 			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 			igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay, DRM_FORMAT_XRGB8888,
@@ -514,8 +537,11 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 
 							mode1 = igt_output_get_mode(non_ultra_joiner_output);
 
-							igt_output_set_crtc(non_ultra_joiner_output,
-									    igt_crtc_for_pipe(display, data->pipe_seq[k]));
+							pipe = data->pipe_seq[k];
+							crtc = igt_crtc_for_pipe(display, pipe);
+							igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+
+							igt_output_set_crtc(non_ultra_joiner_output, crtc);
 							plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 							igt_plane_set_fb(plane, &fb);
@@ -562,8 +588,12 @@ static void test_basic_max_non_joiner(data_t *data)
 
 		for (pipe = 0; pipe < data->n_pipes; pipe++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
-				igt_output_set_crtc(output,
-						    igt_crtc_for_pipe(display, pipe));
+				igt_crtc_t *crtc;
+
+				crtc = igt_crtc_for_pipe(display, pipe);
+				igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+
+				igt_output_set_crtc(output, crtc);
 				igt_require(max_non_joiner_mode_found(data->drm_fd,
 								      output->config.connector,
 								      max_dotclock, &mode));
-- 
2.47.3

