Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9750FF495C
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 07:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6962310E4BE;
	Mon, 30 Mar 2026 07:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WeDVXmEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B070C10E4AD
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774856201; x=1806392201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M60QdMMhosF5W2E3yyG0cxMH3GdZlmzlRnX0nGGrSoo=;
 b=WeDVXmEvJxa1oFtYvzQ+UusTcvHWm+nWQz6fcd5Tnu1iIFJ2IzkfOpZl
 7V/+5pTyHBhsL6+k14lysxPjkyYKGdoFIztgQ032KjHpGL6RFsLMxYw3Z
 IaR+vIbfSbTSuKoeNiTVy04sx1CkC7lTqYR3+HHjjXjvkWQqiCMxMjvgz
 /TXsZUn0TaRkMjTIk2YwQO3O0//igCP8p06P33457mjreUrtB3+LDB5jR
 fmg3HT9UKvIfarzBS4qzpT/cWVYFtN4b45Xkv7wP5s3R2/OZ89nxKA1L8
 J1nigcJhHTkwwruA9JrJDu7PtAQfdiYK+T95mXh1ZnYEUhku8c6bNfYFq w==;
X-CSE-ConnectionGUID: mlgGJAjsQhez7Au1iWHPsg==
X-CSE-MsgGUID: H1GchMEHQDa9nugLre0RAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="87230779"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="87230779"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:36:40 -0700
X-CSE-ConnectionGUID: 5NyWYlB8SZym0roX0ZBFOQ==
X-CSE-MsgGUID: zfCvBOkRR2iNKjKy5bHGFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="230782591"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:36:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 1/3] lib/kms: start returning NULL for invalid pipes
 from igt_crtc_for_pipe()
Date: Mon, 30 Mar 2026 10:36:28 +0300
Message-ID: <042e479bb3400532791189ceeaa0d9e06f120f83.1774856079.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774856079.git.jani.nikula@intel.com>
References: <cover.1774856079.git.jani.nikula@intel.com>
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

Stop returning igt_crtc_t* with crtc->valid == false from
igt_crtc_for_pipe(), and return NULL for invalid pipes instead. Convert
all the call sites that check for crtc->valid into crtc != NULL checks.

While there are still invalid CRTCs in display->crtcs[], tests no longer
have interface access to them, and we can assume only pointers to valid
igt_crtc_t are being passed around. This lets us remove an extra check
in igt_output_set_crtc().

There should be no functional changes here.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c                           | 25 ++++++++++---------------
 tests/amdgpu/amd_multidisplay_modeset.c |  2 +-
 tests/intel/kms_joiner.c                | 14 +++++++-------
 tests/intel/kms_joiner_helper.c         |  4 ++--
 tests/intel/kms_pipe_b_c_ivb.c          |  4 ++--
 tests/intel/kms_pipe_stress.c           |  6 +++---
 6 files changed, 25 insertions(+), 30 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f749a5b617f4..e1bb81fce80a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3174,7 +3174,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	for (crtc_index = 0; crtc_index < resources->count_crtcs; crtc_index++) {
 		int pipe_enum = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, crtc_index) : crtc_index;
 
-		crtc = igt_crtc_for_pipe(display, pipe_enum);
+		crtc = &display->crtcs[pipe_enum];
 		crtc->pipe = pipe_enum;
 
 		crtc->valid = true;
@@ -5308,15 +5308,6 @@ void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *crtc)
 	if (output->pending_crtc)
 		old_crtc = igt_output_get_driving_crtc(output);
 
-	/*
-	 * Ensure pending_crtc is always valid.
-	 *
-	 * FIXME: Ensure we only have valid crtc objects around in general, so
-	 * we can remove this check.
-	 */
-	if (crtc && !crtc->valid)
-		crtc = NULL;
-
 	LOG(display, "%s: set_crtc(%s)\n", igt_output_name(output),
 	    igt_crtc_name(crtc));
 	output->pending_crtc = crtc;
@@ -7295,9 +7286,9 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 				}
 			}
 
-			if (!igt_crtc_for_pipe(display, pipes[i].idx + 1)->valid) {
+			if (!igt_crtc_for_pipe(display, pipes[i].idx + 1)) {
 				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
-					 igt_crtc_name(igt_crtc_for_pipe(display, pipes[i].idx + 1)));
+					 kmstest_pipe_name(pipes[i].idx + 1));
 				return false;
 			}
 
@@ -7317,9 +7308,9 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 				 max_dotclock, pipes[i - 1].force_joiner ? "Yes" : "No");
 			kmstest_dump_mode(pipes[i - 1].mode);
 
-			if (!igt_crtc_for_pipe(display, pipes[i - 1].idx + 1)->valid) {
+			if (!igt_crtc_for_pipe(display, pipes[i - 1].idx + 1)) {
 				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
-					 igt_crtc_name(igt_crtc_for_pipe(display, pipes[i - 1].idx + 1)));
+					 kmstest_pipe_name(pipes[i - 1].idx + 1));
 				return false;
 			}
 
@@ -8089,10 +8080,14 @@ igt_crtc_t *igt_crtc_for_crtc_index(igt_display_t *display, int crtc_index)
 
 igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
 {
+	igt_crtc_t *crtc;
+
 	if (pipe == PIPE_NONE)
 		return NULL;
 
-	return &display->crtcs[pipe];
+	crtc = &display->crtcs[pipe];
+
+	return crtc->valid ? crtc : NULL;
 }
 
 /*
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index 3aa7b3483a28..3069ec310116 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -327,7 +327,7 @@ static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
 
 			crtc = igt_crtc_for_pipe(display, j);
 
-			igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(j));
+			igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(j));
 
 			igt_create_pattern_fb(data->fd, kmode->hdisplay,
 					kmode->vdisplay, DRM_FORMAT_XRGB8888,
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index f8ea65a3b01a..86226a3ba689 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -148,7 +148,7 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
 	uint32_t attempt_mask;
 
 	crtc = igt_crtc_for_pipe(display, pipe);
-	igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+	igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(pipe));
 
 	attempt_mask = BIT(crtc->pipe);
 	master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
@@ -176,7 +176,7 @@ static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo
 		  output->name, mode->hdisplay, mode->vdisplay, mode->vrefresh);
 
 	crtc = igt_crtc_for_pipe(display, pipe);
-	igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+	igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(pipe));
 
 	igt_output_set_crtc(output, crtc);
 	igt_output_override_mode(output, mode);
@@ -396,7 +396,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 			igt_assert(kmstest_mode_is_valid(&mode));
 
 			crtc = igt_crtc_for_pipe(display, pipe);
-			igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+			igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(pipe));
 
 			igt_output_set_crtc(output, crtc);
 			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
@@ -450,7 +450,7 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 		}
 
 		crtc = igt_crtc_for_pipe(display, pipe);
-		igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+		igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(pipe));
 
 		igt_output_set_crtc(output, crtc);
 		igt_info("Assigning pipe %s to %s with mode %dx%d@%d\n",
@@ -514,7 +514,7 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 
 			pipe = data->pipe_seq[j];
 			crtc = igt_crtc_for_pipe(display, pipe);
-			igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+			igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(pipe));
 
 			igt_output_set_crtc(output, crtc);
 
@@ -539,7 +539,7 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 
 							pipe = data->pipe_seq[k];
 							crtc = igt_crtc_for_pipe(display, pipe);
-							igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+							igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(pipe));
 
 							igt_output_set_crtc(non_ultra_joiner_output, crtc);
 							plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -591,7 +591,7 @@ static void test_basic_max_non_joiner(data_t *data)
 				igt_crtc_t *crtc;
 
 				crtc = igt_crtc_for_pipe(display, pipe);
-				igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+				igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(pipe));
 
 				igt_output_set_crtc(output, crtc);
 				igt_require(max_non_joiner_mode_found(data->drm_fd,
diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
index 724ce41a892b..e24d7ce94f00 100644
--- a/tests/intel/kms_joiner_helper.c
+++ b/tests/intel/kms_joiner_helper.c
@@ -105,7 +105,7 @@ void igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *mas
 
 	*master_pipes = 0;
 	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
-		if (igt_crtc_for_pipe(display, pipe)->valid && igt_crtc_for_pipe(display, pipe + 1)->valid) {
+		if (igt_crtc_for_pipe(display, pipe) && igt_crtc_for_pipe(display, pipe + 1)) {
 			*master_pipes |= BIT(pipe);
 			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
 		}
@@ -163,7 +163,7 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 				kmstest_pipe_name(start + needed - 1), out->name);
 
 		crtc = igt_crtc_for_pipe(out->display, start);
-		igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(start));
+		igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(start));
 
 		if (needed > 1) {
 			mp = get_next_master_pipe(BIT(start));
diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index 0e017706373c..a39b46ca23e0 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -343,10 +343,10 @@ int igt_main()
 		igt_display_require_output(&data.display);
 
 		data.crtc_b = igt_crtc_for_pipe(&data.display, PIPE_B);
-		igt_skip_on(!data.crtc_b->valid);
+		igt_skip_on(!data.crtc_b);
 
 		data.crtc_c = igt_crtc_for_pipe(&data.display, PIPE_C);
-		igt_skip_on(!data.crtc_c->valid);
+		igt_skip_on(!data.crtc_c);
 	}
 
 	igt_describe("Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B with mode "
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 1dec3d85c443..36e3842c6195 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -579,7 +579,7 @@ static void stress_pipes(struct data *data, struct timespec *start,
 			continue;
 
 		crtc = igt_crtc_for_pipe(display, pipe);
-		igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
+		igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(pipe));
 
 		igt_assert_f(crtc->n_planes < MAX_PLANES,
 			     "Currently we don't support more than %d planes!",
@@ -741,7 +741,7 @@ static void destroy_framebuffers(struct data *data)
 			continue;
 
 		crtc = igt_crtc_for_pipe(display, i);
-		igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(i));
+		igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(i));
 
 		for (j = 0; j < MAX_PLANES; j++) {
 			if (data->fb[i * MAX_PLANES + j].fb_id) {
@@ -803,7 +803,7 @@ static void prepare_test(struct data *data)
 		igt_assert(data->highest_mode[i]);
 
 		crtc = igt_crtc_for_pipe(display, i);
-		if (!crtc->valid)
+		if (!crtc)
 			continue;
 
 		if (data->highest_mode[i]) {
-- 
2.47.3

