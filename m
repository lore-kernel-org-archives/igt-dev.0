Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D10ED1712C
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 02:32:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B062A10E2E5;
	Tue, 22 Oct 2024 02:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AbGeRClW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F408910E2E5
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 02:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729564342; x=1761100342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sqjxTwqhvV3t6oqIjjWpJt6PejD3Q4xcSJPN+Do6ers=;
 b=AbGeRClW47fTGWcVzc9BjuvGtmxWZw5plVQwnbdVfy7Thiw/6dxgJ/lf
 jA5maIfUZWB1zIxT7iHGTXIfrlaJW6qqIpYv8VhRXV+sKtN0a4foDA4ol
 DOuy7jReSkzq7GjNI/04n86KGvCv2dqMOdmuSN9VwTajRfpZFcCHzRolS
 eZ57/mh0iC2HW1VBvDrrHzrY9X8PJ6VyTN7K8BE9VNMFeyGupIRRJmF3Y
 r52BvIOzCrKfrGyYFLbu2BjaRbpUPK3zk9ZylwE4NiC4BeODVYw9z77j8
 4QL1zngdpw3wRcqKStVHuBm2s5Cfcv1yu0GAzzf1EwS1IGcyAkKDvnmaY w==;
X-CSE-ConnectionGUID: Ad8OYBKHQQWZp0g8cwUpVg==
X-CSE-MsgGUID: 5cFMcdJ3Tzmv43Im6xU2Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28961625"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="28961625"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 19:32:21 -0700
X-CSE-ConnectionGUID: ZxIDPLlTSqyejTjFk9Cm0A==
X-CSE-MsgGUID: 8CgyEYJ2QmaDw7JftE+MYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="80075598"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 19:32:20 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 1/1] tests/intel/kms_joiner: switch modeset between
 uj and bj
Date: Tue, 22 Oct 2024 07:59:53 +0530
Message-Id: <20241022022953.1422653-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022022953.1422653-1-santhosh.reddy.guddati@intel.com>
References: <20241022022953.1422653-1-santhosh.reddy.guddati@intel.com>
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

v2: Add new subtests for switching without force joiner (Karthik)
v3: start with uj to bj switch, if not available switch to force mode
v4: check for uj, bj support before starting dynamic tests (karthik)
    call reset_connectors after forcing to uj
v5: Add a separate function to switch modes and execute test for each
    connected supported output (karthik)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 94 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 9a353ee1b..88d1567d7 100644
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
 
@@ -161,6 +164,82 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
 	return master_pipe;
 }
 
+static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo *mode)
+{
+	igt_plane_t *primary;
+	igt_fb_t fb;
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
+
+	drmModeConnector *connector = output->config.connector;
+
+	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	ultrajoiner_found = ultrajoiner_mode_found(data->drm_fd, connector, max_dotclock, &uj_mode);
+
+	if (ultrajoiner_found) {
+		uj_mode = *igt_output_get_mode(output);
+	} else if (data->non_ultra_joiner_output_count > 0) {
+		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector,
+							JOINED_PIPES_ULTRA_JOINER);
+		igt_assert_f(status, "Failed to toggle force joiner\n");
+		uj_mode = *igt_output_get_mode(output);
+	} else {
+		igt_skip("No ultra joiner mode found on output %s\n", output->name);
+	}
+
+	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+		set_joiner_mode(data, output, &uj_mode);
+		/* Switch to big joiner mode */
+		if (bigjoiner_mode_found(data->drm_fd, output->config.connector,
+					 max_dotclock, &bj_mode)) {
+			bj_mode = *igt_output_get_mode(output);
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
@@ -592,6 +671,21 @@ igt_main
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
2.34.1

