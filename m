Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03695E77188
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 05:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9D910E2E6;
	Thu,  2 Jan 2025 05:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoHUhTtF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD9110E2E6
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jan 2025 05:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735796735; x=1767332735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mId9ZO3/Q9mGTzh0/BgDxULKmzCmCaMfAjohoKGcBNo=;
 b=LoHUhTtFbZK0+9PzeaQpcstGGwaggQNpJtfGLxZ5K6t0YgpGvCB1K9m7
 kNvMlphwbn3Edv4D8lYWVY+RwJkuML+WCH+Y4U/9FL7onQy3yjxSN30m8
 Tm5rmHx4r3+SzCauchuUlWVgf/voIdTQmiwhC0C1HS5lRCb1XRLd0/30b
 cm/mg0jJarzwSrROPAzn5lsgLK9eu11h5VsB9toh2Gqkuzqh7JUzQsNb0
 YHokAH+L4DHll5MiGpFBQtPz2PS7quiSeWr7Wgtfcna53Rgo1Sy9M3n5G
 F4UhZSx22fbM+R/WQieyw1GdlIrScZzylFBQeSnGJx0YikznU4UJfJDka w==;
X-CSE-ConnectionGUID: BSpR/AHERLWsvbac65qYrQ==
X-CSE-MsgGUID: jhlKexhKStWMHls37t+FgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35335275"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; d="scan'208";a="35335275"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 21:45:35 -0800
X-CSE-ConnectionGUID: zap0Ie5wTouoWu+Fs3TyQw==
X-CSE-MsgGUID: ZJXqe33yQxO01YsMqmjGDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105457682"
Received: from unknown (HELO
 dg2setup4-CoffeeLake-Client-Platform.iind.intel.com) ([10.145.169.180])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 21:45:33 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 1/2] tests/intel/kms_joiner: switch modeset between
 uj and bj
Date: Thu,  2 Jan 2025 11:14:56 +0530
Message-ID: <20250102054457.58520-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102054457.58520-1-santhosh.reddy.guddati@intel.com>
References: <20250102054457.58520-1-santhosh.reddy.guddati@intel.com>
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

Add a subtest to validate switching from ultra joiner to big joiner
and vice-versa.

v2: Add new subtests for switching without force joiner (Karthik).

v3: Start with uj to bj switch, if not available switch to force mode.

v4: Check for uj, bj support before starting dynamic tests (karthik)
    call reset_connectors after forcing to uj.

v5: Add a separate function to switch modes and execute test for each
    connected supported output (karthik).

v6: Add force_joiner and dsc supported checks, remove redundant checks
    while setting modes (karthik).
    Remove display_reset during switch-modeset, intentionally force
    big joiner and then switch to ultra joiner.

v7: Remove redundant switching modeset.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 97 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 418ff26a6..086cfeb71 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -71,6 +71,9 @@
  * SUBTEST: invalid-modeset-force-ultra-joiner
  * Description: Verify if the modeset on the other pipes are rejected when
  *              the pipe A is active with force ultra joiner modeset.
+ *
+ * SUBTEST: switch-modeset-ultra-joiner-big-joiner
+ * Description: Verify switching between ultra joiner and big joiner modeset.
  */
 IGT_TEST_DESCRIPTION("Test joiner / force joiner");
 
@@ -161,6 +164,85 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
 	return master_pipe;
 }
 
+static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo *mode)
+{
+	igt_plane_t *primary;
+	igt_fb_t fb;
+
+	igt_info("Committing joiner mode for output %s with mode %dx%d@%d\n",
+		  output->name, mode->hdisplay, mode->vdisplay, mode->vrefresh);
+
+	igt_output_set_pipe(output, PIPE_A);
+	igt_output_override_mode(output, mode);
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	igt_display_reset(&data->display);
+	igt_reset_connectors();
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data->drm_fd, &fb);
+}
+
+static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *output)
+{
+	drmModeModeInfo bj_mode;
+	drmModeModeInfo uj_mode;
+	int status;
+	bool ultrajoiner_found;
+	enum pipe pipe;
+	bool force_joiner_supported;
+
+	drmModeConnector *connector = output->config.connector;
+
+	ultrajoiner_found = ultrajoiner_mode_found(data->drm_fd, connector, max_dotclock, &uj_mode);
+	force_joiner_supported = igt_has_force_joiner_debugfs(data->drm_fd, output->name) &&
+				 is_dsc_supported_by_sink(data->drm_fd, output);
+
+	if (ultrajoiner_found) {
+		igt_output_override_mode(output, &uj_mode);
+	} else if (force_joiner_supported) {
+		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector,
+							JOINED_PIPES_ULTRA_JOINER);
+		igt_assert_f(status, "Failed to toggle force joiner\n");
+		uj_mode = *igt_output_get_mode(output);
+	} else {
+		igt_info("No ultra joiner mode found on output %s\n", output->name);
+		return;
+	}
+
+	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+		set_joiner_mode(data, output, &uj_mode);
+		/* Switch to big joiner mode */
+		if (bigjoiner_mode_found(data->drm_fd, output->config.connector,
+					 max_dotclock, &bj_mode)) {
+			igt_output_override_mode(output, &bj_mode);
+		} else {
+			status = kmstest_force_connector_joiner(data->drm_fd,
+								output->config.connector,
+								JOINED_PIPES_BIG_JOINER);
+			igt_assert_f(status, "Failed to toggle force joiner\n");
+			bj_mode = *igt_output_get_mode(output);
+		}
+
+		set_joiner_mode(data, output, &bj_mode);
+
+		/* Switch back to ultra joiner*/
+		if (ultrajoiner_found) {
+			igt_output_override_mode(output, &uj_mode);
+		} else {
+			status = kmstest_force_connector_joiner(data->drm_fd,
+								output->config.connector,
+								JOINED_PIPES_ULTRA_JOINER);
+			igt_assert_f(status, "Failed to toggle force joiner\n");
+		}
+
+		set_joiner_mode(data, output, &uj_mode);
+	}
+}
+
 static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
 {
 	int i;
@@ -593,6 +675,21 @@ igt_main
 		}
 	}
 
+	igt_describe("Verify modeset switch between ultra joiner and big joiner");
+	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
+		igt_require_f(ultra_joiner_supported,
+			      "Ultra joiner not supported on this platform\n");
+		igt_require_f(data.ultra_joiner_output_count > 0 ||
+			      data.non_ultra_joiner_output_count > 0,
+				  "No ultra joiner or force ultra joiner output found\n");
+		igt_require_f(data.n_pipes > 3,
+			      "Minimum 4 pipes required\n");
+
+		for_each_connected_output(&data.display, output) {
+			switch_modeset_ultra_joiner_big_joiner(&data, output);
+		}
+	}
+
 	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
 		igt_require_f(ultra_joiner_supported,
 			      "Ultra joiner not supported on this platform\n");
-- 
2.43.0

