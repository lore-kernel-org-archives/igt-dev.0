Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FC6CD5BBF
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 09:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA53910E0A8;
	Mon, 25 May 2026 09:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GrOgZglT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9564710E05F
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779700539; x=1811236539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7aps+rKcH05/POm5SQhrTruoMabKfD4cZGvUy8mZmYg=;
 b=GrOgZglTe2CMAtI8Xm2ccymHZCFYNO/iVIsj1QahEoyaoZdgM5X3dIxH
 2jgh7fgJHSAMcCOu9i3Lx7v0ySwJljkvZqJPY+OM4iAFrq+Af/uu+Ky2F
 TtoXwqX6cBAKLHH5JZRFBDJHzAFDscxhMo2waq2NotLakkqq9FdOkCBV1
 4MHxZpLukLwUCvQqOtaQ9jnfW/+ujqrI/IpevVIh5Xxlh5bcSMwgNwuuE
 RmQz1o9s3gBfSna6xXei1SdZRxa+QAOFDR+0icnbaSZPieU9l8FwwiM1s
 PVxlES1HfdguG2BbCUmCWVWR47GmCWzn+aypgqnljIEf41U6LXENa5YHi g==;
X-CSE-ConnectionGUID: MlZ4l8ApTdueUxslvWMs3w==
X-CSE-MsgGUID: QBmTpI8TQyK5JzSrTUqRwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="98097367"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="98097367"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:15:38 -0700
X-CSE-ConnectionGUID: Mx4HhqNkSY6sGEq0U29bYA==
X-CSE-MsgGUID: 1i/+ZBurSCuU/5w0vYzByg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="246627508"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa005.fm.intel.com with ESMTP; 25 May 2026 02:15:36 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 2/2] lib/tests: make igt_get_output_max_bpc() return
 status and handle failures in callers
Date: Mon, 25 May 2026 14:56:21 +0530
Message-Id: <20260525092621.668816-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525092621.668816-1-pranay.samala@intel.com>
References: <20260525092621.668816-1-pranay.samala@intel.com>
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

Change igt_get_output_max_bpc() to return bool and fill an output parameter
instead of asserting/requiring internally. This lets callers handle debugfs
read/parse failures gracefully instead of failing inside the helper.

Update test call sites to use the new boolean-return API so each test can
decide how to handle max-bpc read failures. This separates read/parsing
failures from capability checks and makes skip/continue decisions explicit
with clearer logging, while preserving normal capability validation when
max bpc is read successfully.

v2:
- Combine lib & test changes into single patch (Karthik)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_kms.c                          | 38 ++++++++++++++++++--------
 lib/igt_kms.h                          |  2 +-
 tests/amdgpu/amd_bypass.c              |  6 +++-
 tests/amdgpu/amd_dp_dsc.c              | 10 ++++++-
 tests/intel/kms_dsc.c                  | 13 +++++++--
 tests/intel/kms_frontbuffer_tracking.c | 10 ++++++-
 tests/kms_color_helper.c               |  5 +++-
 tests/kms_dither.c                     |  9 +++++-
 tests/kms_hdr.c                        | 16 +++++++++--
 9 files changed, 87 insertions(+), 22 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e20307923..a3f8d6928 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6665,32 +6665,43 @@ bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name)
 
 /**
  * igt_get_output_max_bpc:
- * @drmfd: A drm file descriptor
- * @connector_name: Name of the libdrm connector we're going to use
+ * @output: Output to query.
+ * @maximum: Returned maximum bpc value.
  *
- * Returns: The maximum bpc from the connector debugfs.
+ * Returns: true on success, false on failure.
  */
-unsigned int igt_get_output_max_bpc(igt_output_t *output)
+bool igt_get_output_max_bpc(igt_output_t *output, unsigned int *maximum)
 {
 	igt_display_t *display = output->display;
 	int drmfd = display->drm_fd;
 	char buf[24];
 	char *start_loc;
 	int fd, res;
-	unsigned int maximum;
+
+	if (!maximum)
+		return false;
+
+	*maximum = 0;
 
 	fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
-	igt_assert(fd >= 0);
+	if (fd < 0)
+		return false;
 
 	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
-	igt_require(res > 0);
-
 	close(fd);
+	if (res <= 0)
+		return false;
+
+	buf[res < sizeof(buf) ? res : sizeof(buf) - 1] = '\0';
+
+	start_loc = strstr(buf, "Maximum: ");
+	if (!start_loc)
+		return false;
 
-	igt_assert(start_loc = strstr(buf, "Maximum: "));
-	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &maximum), 1);
+	if (sscanf(start_loc, "Maximum: %u", maximum) != 1)
+		return false;
 
-	return maximum;
+	return true;
 }
 
 /**
@@ -6734,9 +6745,12 @@ unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc)
 static unsigned int get_current_bpc(igt_crtc_t *crtc, igt_output_t *output,
 				    unsigned int bpc)
 {
-	unsigned int maximum = igt_get_output_max_bpc(output);
+	unsigned int maximum;
 	unsigned int current = igt_get_crtc_current_bpc(crtc);
 
+	igt_require_f(igt_get_output_max_bpc(output, &maximum),
+		      "Failed to read max bpc for %s\n", igt_output_name(output));
+
 	igt_require_f(maximum >= bpc,
 		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
 		      maximum);
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c2a3099de..0ff1ee688 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1246,7 +1246,7 @@ bool igt_fit_modes_in_bw(igt_display_t *display);
 bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
 bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
 bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name);
-unsigned int igt_get_output_max_bpc(igt_output_t *output);
+bool igt_get_output_max_bpc(igt_output_t *output, unsigned int *maximum);
 unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc);
 void igt_assert_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
 				 unsigned int bpc);
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
index 4c41c6a3b..ee27f2630 100644
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
index 37706cab5..3adf14bd7 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2281,6 +2281,8 @@ static void setup_drrs(void)
 
 static void setup_hdr(void)
 {
+	unsigned int maximum;
+
 	if (!igt_output_has_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
 	    !igt_output_get_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
 	    !igt_output_supports_hdr(prim_mode_params.output)) {
@@ -2294,7 +2296,13 @@ static void setup_hdr(void)
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
index 32d8dfe14..d80dead6c 100644
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
@@ -536,6 +542,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 
 	for_each_connected_output(display, output) {
 		igt_crtc_t *crtc;
+		unsigned int maximum;
 
 		/* To test HDR, 10 bpc is required, so we need to
 		 * set MAX_BPC property to 10bpc prior to setting
@@ -560,7 +567,12 @@ static void test_hdr(data_t *data, uint32_t flags)
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

