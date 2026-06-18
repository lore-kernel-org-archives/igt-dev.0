Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148F4CD98DE
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 06:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE45910EC72;
	Thu, 18 Jun 2026 06:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnRYpOqM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCA710ECA5
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 06:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781763778; x=1813299778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B9hzVsRH2uznhNL/R3U/9ODWRNoy4A1kOLkbYnXvpfQ=;
 b=dnRYpOqMZdcBi6W4IJ5YKZSPQZFLN53CEEQ6UYGQtZJQdExm7vV2/84c
 k5RauJkov46dQw1mrX7LcMmhLPpCddg14HCsCZNeuH3YYinhH+znq65Dq
 H5YPLW0rHBwmqmEoqHFDTtwBp64ss1LFyjZiMysDb1fJN1lzUDqM0VdhU
 kXa/s+ZD3GRk/S+K1Gy3XNyFfRNA7sjgzqwkML0dgKbvGAlkVHMkfgKqh
 WlmA5+vzzEzuuRtM1Z/fDIKb37LiLLk5VgXmS4AmjPg7W8rK32ztLBNTx
 4lgntnZi/qebx27loIgpP2rEBUUhBy2eanAEjytirqFB8+IyC7pqLJOb9 w==;
X-CSE-ConnectionGUID: OEpOp+M/ROWc3sNVBhepKQ==
X-CSE-MsgGUID: /+FIq94vQXe/xFjj0DiHiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86430452"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="86430452"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:22:58 -0700
X-CSE-ConnectionGUID: e882J1q9RdKF3npoiQ7d7w==
X-CSE-MsgGUID: tJ0Ca9A4Q1SSGc7dFKYX7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="241903077"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa009.fm.intel.com with ESMTP; 17 Jun 2026 23:22:56 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t v6 3/3] lib/tests: make igt_get_output_max_bpc() return
 status and handle failures in callers
Date: Thu, 18 Jun 2026 12:03:47 +0530
Message-Id: <20260618063347.2940031-4-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618063347.2940031-1-pranay.samala@intel.com>
References: <20260618063347.2940031-1-pranay.samala@intel.com>
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

v3:
- Add description for the helper (Swati)

v4:
- Rebase (Jason)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_kms.c                          | 41 ++++++++++++++++++--------
 lib/igt_kms.h                          |  2 +-
 tests/amdgpu/amd_bypass.c              |  6 +++-
 tests/amdgpu/amd_dp_dsc.c              | 10 ++++++-
 tests/intel/kms_dsc.c                  |  5 +++-
 tests/intel/kms_frontbuffer_tracking.c | 10 ++++++-
 tests/kms_color_helper.c               |  5 +++-
 tests/kms_dither.c                     |  9 +++++-
 tests/kms_hdr.c                        | 16 ++++++++--
 9 files changed, 83 insertions(+), 21 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e82d32130..ed9f2231b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6769,32 +6769,46 @@ bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name)
 
 /**
  * igt_get_output_max_bpc:
- * @drmfd: A drm file descriptor
- * @connector_name: Name of the libdrm connector we're going to use
+ * @output: Output to query.
+ * @maximum: Pointer to store the maximum supported bpc value.
+ *
+ * Read and parse the connector's debugfs output_bpc entry to obtain the
+ * maximum supported bits-per-component value.
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
 
-	igt_assert(start_loc = strstr(buf, "Maximum: "));
-	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &maximum), 1);
+	buf[res < sizeof(buf) ? res : sizeof(buf) - 1] = '\0';
+
+	start_loc = strstr(buf, "Maximum: ");
+	if (!start_loc)
+		return false;
 
-	return maximum;
+	if (sscanf(start_loc, "Maximum: %u", maximum) != 1)
+		return false;
+
+	return true;
 }
 
 /**
@@ -6838,9 +6852,12 @@ unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc)
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
index 3df3ba866..521a03c01 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1322,7 +1322,7 @@ bool igt_fit_modes_in_bw(igt_display_t *display);
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
index 3687e795d..056fd37ae 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -422,8 +422,11 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 		igt_require(is_dsc_supported_by_source(data.drm_fd));
 
 		for_each_connected_output(&data.display, output) {
+			unsigned int maximum;
+
 			if (is_dsc_supported_by_sink(data.drm_fd, output) &&
-			    igt_get_output_max_bpc(output) >= MIN_DSC_BPC)
+			    igt_get_output_max_bpc(output, &maximum) &&
+			    maximum >= MIN_DSC_BPC)
 				data.valid_output[data.count++] = output;
 		}
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
index c334c907a..9a9c8e197 100644
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
@@ -535,6 +541,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 
 	for_each_connected_output(display, output) {
 		igt_crtc_t *crtc;
+		unsigned int maximum;
 
 		/* To test HDR, 10 bpc is required, so we need to
 		 * set MAX_BPC property to 10bpc prior to setting
@@ -559,7 +566,12 @@ static void test_hdr(data_t *data, uint32_t flags)
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

