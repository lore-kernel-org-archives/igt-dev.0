Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0CCCDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 08:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D71610E9E8;
	Tue, 23 Jun 2026 08:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqFfHRyD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A09010E9E3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782202181; x=1813738181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zc0OifM6tTIW3H+vBwVtP3qI5Db4FV2BYwP4v+EUgPE=;
 b=iqFfHRyDXlV5CwhXIb51WB8vNbr7pvYQ4S7amBMOUvku0WKJouP86zxR
 LbmbCDcrwc5qZoRUMbWCfkur1S1IbM0KYv+2nJwAjgjDinFqLRq5SdsIg
 B3i6wN1pLBNrNsCFeNqYdsHcfFcC8LvK5kzcIA+eeeB1wlzK9C8H94sXA
 mh9eSpezDoW0R4dT/Va+twCQsNvHl/EoE/q9jrnT7tNsE1msc3lxQD3PV
 wWDq8955mpLZ7jT2hx7bHUPWCFPSijoTyKLHwm+sugwVTUsamYClDHUHp
 omqERbRNmPR7o5G4RXc0b/VIikZpmzq02MqWSBNDiQDqlW5hQG4nwsmCs A==;
X-CSE-ConnectionGUID: KPwSOUuxR4u9ej+4eyKWzg==
X-CSE-MsgGUID: e/2YrkG5SvOO8th9Fnl00A==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82944740"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="82944740"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 01:09:41 -0700
X-CSE-ConnectionGUID: 2q1jkcwLQlWajmVyrdaq1A==
X-CSE-MsgGUID: OS2BdmWCR8yH4xNhYCCH2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="253794170"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 01:09:40 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/kms_setmode: Use public igt_display helper
 APIs
Date: Tue, 23 Jun 2026 13:39:26 +0530
Message-ID: <20260623080927.3216500-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623080927.3216500-1-jeevan.b@intel.com>
References: <20260623080927.3216500-1-jeevan.b@intel.com>
MIME-Version: 1.0
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

Replace all direct access to igt_display_t internals with public
helper APIs to maintain proper encapsulation and improve forward
compatibility with IGT. This refactoring updates code to use
igt_display and igt_crtc accessors, adjusts function signatures
to pass objects instead of indices, and removes reliance on internal
struct fields, ensuring cleaner, more robust, and idiomatic
usage without changing functionality.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 68 ++++++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 25 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 419f5b518..1d5c4dfb0 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -334,12 +334,14 @@ static int get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
 }
 
 static void get_crtc_config_str(struct crtc_config *crtc, char *buf,
-				size_t buf_size)
+				size_t buf_size, igt_display_t *disp)
 {
-	igt_crtc_t *igt_crtc = &display.crtcs[crtc->crtc_idx];
+	igt_crtc_t *igt_crtc = igt_crtc_for_crtc_index(disp, crtc->crtc_idx);
 	int pos;
 	int i;
 
+	igt_assert(igt_crtc);
+
 	pos = snprintf(buf, buf_size,
 		       "CRTC[%d] [Pipe %s] Mode: %s@%dHz Connectors: ",
 		       igt_crtc->crtc_id, kmstest_pipe_name(igt_crtc->pipe),
@@ -374,7 +376,6 @@ static void setup_crtcs(const struct test_config *tconf,
 	/* Fetch resources locally only for encoder clone validity checks */
 	resources = drmModeGetResources(drm_fd);
 	igt_assert(resources);
-
 	encoder_usage_count = calloc(resources->count_encoders,
 				     sizeof(*encoder_usage_count));
 	igt_assert(encoder_usage_count);
@@ -409,15 +410,16 @@ static void setup_crtcs(const struct test_config *tconf,
 			igt_output_t *output;
 			drmModeConnector *connector;
 			drmModeEncoder *encoder;
-			igt_crtc_t *igt_crtc;
+			igt_crtc_t *crtc_obj;
 
 			crtc->cconfs[j] = cconf[i + j];
 			output = cconf[i + j].output;
 			connector = output->config.connector;
-			igt_crtc = &disp->crtcs[crtc->crtc_idx];
+			crtc_obj = igt_crtc_for_crtc_index(disp, crtc->crtc_idx);
+			igt_assert(crtc_obj);
 
 			/* Check CRTC/output compatibility using IGT helper */
-			config_valid &= igt_crtc_connector_valid(igt_crtc, output);
+			config_valid &= igt_crtc_connector_valid(crtc_obj, output);
 
 			/* Intel connectors have only a single encoder */
 			if (connector->count_encoders == 1) {
@@ -491,7 +493,7 @@ static void cleanup_crtcs(struct crtc_config *crtcs, int crtc_count)
 #define frame_time(km) (1000.0 * (km)->htotal * (km)->vtotal / (km)->clock)
 #define line_time(km) (1000.0 * (km)->htotal / (km)->clock)
 
-static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
+static bool check_timings(igt_crtc_t *crtc, const drmModeModeInfo *kmode)
 {
 #define CALIBRATE_TS_STEPS 120 /* ~2s has to be less than 128! */
 	drmVBlank wait;
@@ -503,10 +505,9 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 	double mean;
 	double stddev;
 	int n;
-	int pipe_crtc_index = display.crtcs[crtc_idx].crtc_index;
 
 	memset(&wait, 0, sizeof(wait));
-	wait.request.type = kmstest_get_vbl_flag(pipe_crtc_index);
+	wait.request.type = igt_crtc_get_vbl_flag(crtc);
 	wait.request.type |= DRM_VBLANK_RELATIVE | DRM_VBLANK_NEXTONMISS;
 	do_or_die(drmWaitVBlank(drm_fd, &wait));
 
@@ -516,7 +517,7 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 	last_timestamp += wait.reply.tval_usec;
 
 	memset(&wait, 0, sizeof(wait));
-	wait.request.type = kmstest_get_vbl_flag(pipe_crtc_index);
+	wait.request.type = igt_crtc_get_vbl_flag(crtc);
 	wait.request.type |= DRM_VBLANK_ABSOLUTE | DRM_VBLANK_EVENT;
 	wait.request.sequence = last_seq;
 	for (n = 0; n < CALIBRATE_TS_STEPS; n++) {
@@ -526,7 +527,7 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 		do_or_die(drmWaitVBlank(drm_fd, &wait));
 
 		/* Double check that haven't already missed the vblank */
-		check.request.type = kmstest_get_vbl_flag(pipe_crtc_index);
+		check.request.type = igt_crtc_get_vbl_flag(crtc);
 		check.request.type |= DRM_VBLANK_RELATIVE;
 		do_or_die(drmWaitVBlank(drm_fd, &check));
 
@@ -649,7 +650,7 @@ retry:
 	}
 
 	for (i = 0; i < crtc_count; i++) {
-		get_crtc_config_str(&crtcs[i], str_buf[i], sizeof(str_buf[i]));
+		get_crtc_config_str(&crtcs[i], str_buf[i], sizeof(str_buf[i]), tconf->display);
 		crtc_strs[i] = &str_buf[i][0];
 	}
 
@@ -661,12 +662,13 @@ retry:
 
 	for (i = 0; i < crtc_count; i++) {
 		igt_plane_t *primary;
-		igt_crtc_t *igt_crtc;
+		igt_crtc_t *crtc_obj;
 		bool invalid_clone;
 		int j;
 
 		crtc = &crtcs[i];
-		igt_crtc = &display.crtcs[crtc->crtc_idx];
+		crtc_obj = igt_crtc_for_crtc_index(tconf->display, crtc->crtc_idx);
+		igt_assert(crtc_obj);
 
 		/* Treat this as expected failure for invalid tests.*/
 		invalid_clone = (tconf->flags & TEST_INVALID) &&
@@ -686,11 +688,11 @@ retry:
 		for (j = 0; j < crtc->connector_count; j++) {
 			igt_output_t *output = crtc->cconfs[j].output;
 
-			igt_output_set_crtc(output, igt_crtc);
+			igt_output_set_crtc(output, crtc_obj);
 			igt_output_override_mode(output, &crtc->mode);
 		}
 
-		primary = igt_crtc_get_plane_type(igt_crtc, DRM_PLANE_TYPE_PRIMARY);
+		primary = igt_crtc_get_plane_type(crtc_obj, DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(primary, &crtc->fb_info);
 	}
 
@@ -698,8 +700,13 @@ retry:
 					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	if (is_intel_device(drm_fd) && ret == 0) {
-		for (i = 0; i < crtc_count; i++)
-			intel_drrs_disable(&display.crtcs[crtcs[i].crtc_idx]);
+		for (i = 0; i < crtc_count; i++) {
+			igt_crtc_t *crtc_obj = igt_crtc_for_crtc_index(tconf->display,
+							       crtcs[i].crtc_idx);
+
+			igt_assert(crtc_obj);
+			intel_drrs_disable(crtc_obj);
+		}
 	}
 
 	if (ret < 0) {
@@ -721,9 +728,12 @@ retry:
 
 	if (ret == 0 && tconf->flags & TEST_TIMINGS) {
 		bool status = false;
+		igt_crtc_t *crtc_obj = igt_crtc_for_crtc_index(tconf->display,
+						       crtcs[0].crtc_idx);
+		igt_assert(crtc_obj);
 
 		for (int attempt = 1; attempt <= 2; attempt++) {
-			status = check_timings(crtcs[0].crtc_idx, &crtcs[0].mode);
+			status = check_timings(crtc_obj, &crtcs[0].mode);
 			if (status)
 				break;
 			igt_info("Timing check failed on attempt %d, retrying...\n", attempt);
@@ -736,13 +746,16 @@ retry:
 }
 
 static int get_test_name_str(struct crtc_config *crtc, char *buf,
-				size_t buf_size)
+				size_t buf_size, igt_display_t *disp)
 {
+	igt_crtc_t *crtc_obj = igt_crtc_for_crtc_index(disp, crtc->crtc_idx);
 	int pos;
 	int i;
 
+	igt_assert(crtc_obj);
+
 	pos = snprintf(buf, buf_size, "pipe-%s-",
-		       kmstest_pipe_name(display.crtcs[crtc->crtc_idx].pipe));
+		       kmstest_pipe_name(crtc_obj->pipe));
 
 	for (i = 0; i < crtc->connector_count; i++) {
 		drmModeConnector *connector = crtc->cconfs[i].output->config.connector;
@@ -774,7 +787,9 @@ static void test_one_combination(const struct test_config *tconf,
 		for (i = 0; i < crtc_count; i++) {
 			if (i > 0)
 				pos += snprintf(&test_name[pos], ARRAY_SIZE(test_name) - pos, "-");
-			pos += get_test_name_str(&crtcs[i], &test_name[pos], ARRAY_SIZE(test_name) - pos);
+			pos += get_test_name_str(&crtcs[i], &test_name[pos],
+						 ARRAY_SIZE(test_name) - pos,
+						 tconf->display);
 		}
 
 		if (!is_intel_device(drm_fd))
@@ -783,7 +798,8 @@ static void test_one_combination(const struct test_config *tconf,
 		for (i = 0; i < crtc_count; i++) {
 			struct crtc_config *crtc = &crtcs[i];
 			char conn_name[64], prev_conn_name[64];
-			int n_valid_crtcs = get_crtc_count(tconf->display->n_crtcs, extended);
+			int n_valid_crtcs = get_crtc_count(igt_display_n_crtcs(tconf->display),
+							  extended);
 
 			snprintf(conn_name, sizeof(conn_name), "%s",
 				 igt_output_name(crtc->cconfs->output));
@@ -933,7 +949,8 @@ static void test_combinations(const struct test_config *tconf,
 	struct combination_set crtc_combs;
 	struct connector_config *cconfs;
 	int i;
-	int crtc_count = get_crtc_count(tconf->display->n_crtcs, extended);
+	int crtc_count = get_crtc_count(igt_display_n_crtcs(tconf->display),
+					  extended);
 
 	igt_assert(tconf->display);
 
@@ -986,7 +1003,8 @@ free_cconfs:
 static void run_test(const struct test_config *tconf)
 {
 	int connector_num;
-	int crtc_count = get_crtc_count(tconf->display->n_crtcs, extended);
+	int crtc_count = get_crtc_count(igt_display_n_crtcs(tconf->display),
+					  extended);
 
 	connector_num = tconf->flags & TEST_CLONE ? 2 : 1;
 	for (; connector_num <= crtc_count; connector_num++)
-- 
2.43.0

