Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC14F01832
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 13:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A015310ED41;
	Fri,  6 Mar 2026 13:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bys0o0Ld";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865AF10E3CA
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 13:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772804983; x=1804340983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cYMDVu+1tKA0Tr4O4/vsrLgrljmqblkXBrSycQpmj+0=;
 b=bys0o0LdaNzM5skYl2oSBKO3baHuFMdXKk4sG8CuKszNHHottbXGjVsx
 IDEs83tsFrEjgnLOmkwPgCyUjip4T5RoPyjI96QvVu7loFTLEbvr6AXa3
 u68lRRHK3FR6bcvxRb1JHKMVNX+uVCyDqeT0y6pXMFnh7WE7CzNr2d6zD
 h6wY3fPwnNqiAdyuplEyAg8NUsAAdKKKEU+H/zA76HcZ5llaKXYytAtYm
 BoOvEW+weDKZaE1QagNocs/qsaELnpE7XoDPkHkRtUA/1XssRGBLDwQzx
 euuRlwH6LTY1L4wFEf8t/Actw7Bn5h8IUK1dLM39hUacTxH/HvjMYSiaJ w==;
X-CSE-ConnectionGUID: kFQhOh3GSrCWib8iKZ/74Q==
X-CSE-MsgGUID: 4p02sloeQPW7vTDHXbogvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73784816"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73784816"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:49:43 -0800
X-CSE-ConnectionGUID: 6B1ToSVQTVOMcmHVLzmySQ==
X-CSE-MsgGUID: KnHh8W6WRt6n7GSwO1yFTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="242029389"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:49:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t] tests/amdgpu/amd_mode_switch: switch to for_each_crtc()
Date: Fri,  6 Mar 2026 15:49:37 +0200
Message-ID: <20260306134937.136749-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

Convert the test to use for_each_crtc() to avoid having to use
igt_crtc_for_pipe(). Prefer crtc->crtc_index over crtc->pipe.

As a side effect, fix an off-by-one in i <= num_pipes loop.

Note: The implementation relies on the fact that on AMD hardware
for_each_crtc() returns CRTCs in CRTC index order.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/amdgpu/amd_mode_switch.c | 60 +++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
index 4da07c412996..5815ec34cb12 100644
--- a/tests/amdgpu/amd_mode_switch.c
+++ b/tests/amdgpu/amd_mode_switch.c
@@ -39,12 +39,12 @@ static void test_init(data_t *data)
 	igt_crtc_t *crtc;
 
 	for_each_crtc(display, crtc) {
-		igt_output_t *output = &display->outputs[crtc->pipe];
+		igt_output_t *output = &display->outputs[crtc->crtc_index];
 
-		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
-								    DRM_PLANE_TYPE_PRIMARY);
+		data->primary[crtc->crtc_index] = igt_crtc_get_plane_type(crtc,
+									  DRM_PLANE_TYPE_PRIMARY);
 
-		data->output[crtc->pipe] = output;
+		data->output[crtc->crtc_index] = output;
 	}
 
 	igt_require(data->output[0]);
@@ -79,13 +79,12 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
+	igt_crtc_t *crtc;
 	struct igt_fb *buffer1[MAX_PIPES] = { NULL };
 	struct igt_fb *buffer2[MAX_PIPES] = { NULL };
 	drmModeConnectorPtr conn;
 	drmModeModeInfoPtr kmode;
 	void *user_data = NULL;
-	int i = 0;
-	int j = 0;
 
 	test_init(data);
 
@@ -94,11 +93,11 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 		      "ASIC does not have %d outputs/pipes\n", num_pipes);
 
 	/* First supported mode */
+	for_each_crtc(display, crtc) {
+		if (crtc->crtc_index >= num_pipes)
+			break;
 
-	for (j = 0; j < num_pipes; j++) {
-		igt_crtc_t *crtc = igt_crtc_for_pipe(display, j);
-
-		output = data->output[j];
+		output = data->output[crtc->crtc_index];
 		if (!igt_output_is_connected(output))
 			continue;
 
@@ -106,18 +105,18 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 			data->fd, output->config.connector->connector_id);
 
 		kmode = &conn->modes[0];
-		if (buffer1[j] == NULL) {
+		if (buffer1[crtc->crtc_index] == NULL) {
 			igt_fb_t fb;
-			buffer1[j] = &fb;
+			buffer1[crtc->crtc_index] = &fb;
 			igt_create_color_fb(data->fd, kmode->hdisplay,
 					    kmode->vdisplay,
 					    DRM_FORMAT_XRGB8888,
 					    DRM_FORMAT_MOD_NONE, 1.f, 0.f,
-					    0.f, buffer1[j]);
+					    0.f, buffer1[crtc->crtc_index]);
 		}
 		igt_output_set_crtc(output, crtc);
 		force_output_mode(data, output, kmode);
-		igt_plane_set_fb(data->primary[j], buffer1[j]);
+		igt_plane_set_fb(data->primary[crtc->crtc_index], buffer1[crtc->crtc_index]);
 		drmModeFreeConnector(conn);
 	}
 
@@ -126,8 +125,11 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 
 	/* Last supported mode */
 
-	for (j = 0; j < num_pipes; j++) {
-		output = data->output[j];
+	for_each_crtc(display, crtc) {
+		if (crtc->crtc_index >= num_pipes)
+			break;
+
+		output = data->output[crtc->crtc_index];
 		if (!igt_output_is_connected(output))
 			continue;
 
@@ -135,17 +137,17 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 			data->fd, output->config.connector->connector_id);
 
 		kmode = &conn->modes[conn->count_modes - 1];
-		if (buffer2[j] == NULL) {
+		if (buffer2[crtc->crtc_index] == NULL) {
 			igt_fb_t fb;
-			buffer2[j] = &fb;
+			buffer2[crtc->crtc_index] = &fb;
 			igt_create_color_fb(data->fd, kmode->hdisplay,
 					    kmode->vdisplay,
 					    DRM_FORMAT_XRGB8888,
 					    DRM_FORMAT_MOD_NONE, 1.f, 0.f,
-					    0.f, buffer2[j]);
+					    0.f, buffer2[crtc->crtc_index]);
 		}
 		force_output_mode(data, output, kmode);
-		igt_plane_set_fb(data->primary[j], buffer2[j]);
+		igt_plane_set_fb(data->primary[crtc->crtc_index], buffer2[crtc->crtc_index]);
 		drmModeFreeConnector(conn);
 	}
 
@@ -153,8 +155,11 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 				  user_data);
 
 	/* First supported again */
-	for (j = 0; j < num_pipes; j++) {
-		output = data->output[j];
+	for_each_crtc(display, crtc) {
+		if (crtc->crtc_index >= num_pipes)
+			break;
+
+		output = data->output[crtc->crtc_index];
 		if (!igt_output_is_connected(output))
 			continue;
 
@@ -163,7 +168,7 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 
 		kmode = &conn->modes[0];
 		force_output_mode(data, output, kmode);
-		igt_plane_set_fb(data->primary[j], buffer1[j]);
+		igt_plane_set_fb(data->primary[crtc->crtc_index], buffer1[crtc->crtc_index]);
 		drmModeFreeConnector(conn);
 	}
 
@@ -172,9 +177,12 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 
 	test_fini(data);
 
-	for (i = 0; i <= num_pipes; i++) {
-		igt_remove_fb(data->fd, buffer1[i]);
-		igt_remove_fb(data->fd, buffer2[i]);
+	for_each_crtc(display, crtc) {
+		if (crtc->crtc_index >= num_pipes)
+			break;
+
+		igt_remove_fb(data->fd, buffer1[crtc->crtc_index]);
+		igt_remove_fb(data->fd, buffer2[crtc->crtc_index]);
 	}
 }
 
-- 
2.47.3

