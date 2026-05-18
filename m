Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED809CD343F
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 03:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F44110E2CC;
	Mon, 18 May 2026 03:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9mFMEOr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C996A10E2CC
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 03:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779076391; x=1810612391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bO6k4PkRoyNSeNPDee4jXe4+IZl8sOFyTJITPEkPb2E=;
 b=A9mFMEOrVO6hQqORWJP0IA+lelB4/j6/Pjbb2fJrH2ie42IKYifyVdgs
 jock0KeSA++0aIT92VT6ibmwEE63/PscIq5lrsvMOpfn/ZdUTP6sOXmXi
 Bo8NXSq84frCkR6jAn/ZvYx9dpx8xsF6EjGbHnsC9iA2AlBgfugfjYFsQ
 QC7HRWuu4NWcWL2YzVvkiZ+39GYH5V1A2f2h/7y6C+7n7+rlgjW4qLXg8
 rIOBhXJSZjSpUVhmWu8XXDr1q00TylahEc74pvw2sL/jia6pB6two3o12
 XjGbjlCVfGFRQSvY5PWwqjOi9cky/eb9PloZAX0xPmqXpEutziQJYXVgq Q==;
X-CSE-ConnectionGUID: hhdDyCctSCm5W/ZS5xGPpg==
X-CSE-MsgGUID: 9AmUSgCLQWyfJT3A2vGB0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79970575"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="79970575"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 20:53:11 -0700
X-CSE-ConnectionGUID: YkOH6wVaR/iBY29mWcs1Bg==
X-CSE-MsgGUID: SDsz35PLR8GHNXOaoSpdwQ==
X-ExtLoop1: 1
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa003.fm.intel.com with ESMTP; 17 May 2026 20:53:09 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 3/3] tests/: Handle max bpc read failures explicitly
Date: Mon, 18 May 2026 09:33:53 +0530
Message-Id: <20260518040353.212734-4-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518040353.212734-1-pranay.samala@intel.com>
References: <20260518040353.212734-1-pranay.samala@intel.com>
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

Update test call sites of igt_get_output_max_bpc() to use the boolean
return API so each test can decide how to handle max-bpc read failures.
This separates read/parsing failures from capability checks and allows
the test to make an explicit skip/continue decision with clearer logging,
while keeping normal capability validation unchanged when max bpc is
read successfully.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/amdgpu/amd_bypass.c              |  6 +++++-
 tests/amdgpu/amd_dp_dsc.c              | 10 +++++++++-
 tests/intel/kms_dsc.c                  | 13 +++++++++++--
 tests/intel/kms_frontbuffer_tracking.c | 10 +++++++++-
 tests/kms_color_helper.c               |  5 ++++-
 tests/kms_dither.c                     |  9 ++++++++-
 tests/kms_hdr.c                        | 16 ++++++++++++++--
 7 files changed, 60 insertions(+), 9 deletions(-)

diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 3c537ea9e..e59691f16 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -323,6 +323,7 @@ static void bypass_8bpc_test(data_t *data)
 	igt_display_t *display = &data->display;
 	igt_fb_t fb;
 	enum pattern ptn;
+	unsigned int maximum;
 
 	test_init(data);
 
@@ -345,7 +346,10 @@ static void bypass_8bpc_test(data_t *data)
 	 * Rx supports only up to 6bpc, Rx-crc will different from crtc-crc
 	 * with 8bpc.
 	 */
-	igt_skip_on_f(igt_get_output_max_bpc(data->output) <= 6,
+	igt_skip_on_f(!igt_get_output_max_bpc(data->output, &maximum),
+		      "Failed to read max bpc for %s\n", igt_output_name(data->output));
+
+	igt_skip_on_f(maximum <= 6,
 		      "check /sys/kernel/debug/dri/0/eDP-1 (connector)/output_bpc\n");
 
 	igt_create_fb(data->drm_fd, data->width, data->height,
diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index 1742c7df4..dc71e903e 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -480,11 +480,19 @@ static void test_dsc_bpc(data_t *data)
 
 	/* Find max supported bpc */
 	for_each_crtc(&data->display, crtc) {
+		unsigned int maximum;
+
 		output = data->output[crtc->crtc_index];
 		if (!output || !igt_output_is_connected(output))
 			continue;
 		igt_info("Checking bpc support of conn %s\n", output->name);
-		max_supported_bpc[crtc->crtc_index] = igt_get_output_max_bpc(output);
+		if (!igt_get_output_max_bpc(output, &maximum)) {
+			igt_info("Failed to read max bpc for conn %s\n", output->name);
+			max_supported_bpc[crtc->crtc_index] = 0;
+			continue;
+		}
+
+		max_supported_bpc[crtc->crtc_index] = maximum;
 	}
 
 	/* Setup all outputs */
diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 605ad2d5c..8008fc045 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -265,6 +265,8 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
 
 	for_each_crtc_with_valid_output(display, crtc, output) {
+		unsigned int maximum;
+
 		data->output_format = output_format;
 		data->plane_format = plane_format;
 		data->input_bpc = bpc;
@@ -275,8 +277,15 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
 			continue;
 
-		if (igt_get_output_max_bpc(output) < MIN_DSC_BPC) {
-			igt_info("Output %s doesn't support min %d-bpc\n", igt_output_name(data->output), MIN_DSC_BPC);
+		if (!igt_get_output_max_bpc(output, &maximum)) {
+			igt_info("Output %s: Failed to read max bpc\n",
+				 igt_output_name(data->output));
+			continue;
+		}
+
+		if (maximum < MIN_DSC_BPC) {
+			igt_info("Output %s doesn't support min %d-bpc\n",
+				 igt_output_name(data->output), MIN_DSC_BPC);
 			continue;
 		}
 
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e7bb3fa18..996a67ee6 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2777,6 +2777,8 @@ static void setup_drrs(void)
 
 static void setup_hdr(void)
 {
+	unsigned int maximum;
+
 	if (!igt_output_has_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
 	    !igt_output_get_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
 	    !igt_output_supports_hdr(prim_mode_params.output)) {
@@ -2790,7 +2792,13 @@ static void setup_hdr(void)
 		return;
 	}
 
-	if (igt_get_output_max_bpc(prim_mode_params.output) < 10) {
+	if (!igt_get_output_max_bpc(prim_mode_params.output, &maximum)) {
+		igt_info("Can't test HDR: Failed to read max bpc for %s.\n",
+			 igt_output_name(prim_mode_params.output));
+		return;
+	}
+
+	if (maximum < 10) {
 		igt_info("Can't test HDR: %s doesn't support 10 bpc.\n", igt_output_name(prim_mode_params.output));
 		return;
 	}
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 24663444a..a50ac3a37 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -40,7 +40,10 @@ bool crtc_output_combo_valid(data_t *data, igt_crtc_t *crtc)
 bool
 panel_supports_deep_color(igt_output_t *output)
 {
-	unsigned int maximum = igt_get_output_max_bpc(output);
+	unsigned int maximum;
+
+	if (!igt_get_output_max_bpc(output, &maximum))
+		return false;
 
 	igt_info("Max supported bit depth: %d\n", maximum);
 
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index ca367db61..236e5c7c0 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -206,6 +206,7 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 
 	for_each_connected_output(display, output) {
 		igt_crtc_t *crtc;
+		unsigned int maximum;
 
 		if (!is_supported(output)) {
 			igt_info("Output %s: Doesn't support \"max bpc\" property.\n",
@@ -213,7 +214,13 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 			continue;
 		}
 
-		if (igt_get_output_max_bpc(output) < output_bpc) {
+		if (!igt_get_output_max_bpc(output, &maximum)) {
+			igt_info("Output %s: Failed to read max bpc.\n",
+				 igt_output_name(output));
+			continue;
+		}
+
+		if (maximum < output_bpc) {
 			igt_info("Output %s: Doesn't support %d-bpc.\n",
 				 igt_output_name(output), output_bpc);
 			continue;
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index bcc912d15..2f19b3237 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -254,6 +254,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 
 	for_each_connected_output(display, output) {
 		igt_crtc_t *crtc;
+		unsigned int maximum;
 
 		if (!has_max_bpc(output)) {
 			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
@@ -261,7 +262,12 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 			continue;
 		}
 
-		if (igt_get_output_max_bpc(output) < 10) {
+		if (!igt_get_output_max_bpc(output, &maximum)) {
+			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
+			continue;
+		}
+
+		if (maximum < 10) {
 			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
 			continue;
 		}
@@ -532,6 +538,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 
 	for_each_connected_output(display, output) {
 		igt_crtc_t *crtc;
+		unsigned int maximum;
 
 		/* To test HDR, 10 bpc is required, so we need to
 		 * set MAX_BPC property to 10bpc prior to setting
@@ -556,7 +563,12 @@ static void test_hdr(data_t *data, uint32_t flags)
 			continue;
 		}
 
-		if (igt_get_output_max_bpc(output) < 10) {
+		if (!igt_get_output_max_bpc(output, &maximum)) {
+			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
+			continue;
+		}
+
+		if (maximum < 10) {
 			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
 			continue;
 		}
-- 
2.34.1

