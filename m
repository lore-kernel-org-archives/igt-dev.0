Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A09C02193
	for <igt-dev@archiver.kernel.org>; Tue,  4 Feb 2025 18:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E023810E6E4;
	Tue,  4 Feb 2025 18:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zn/ZAVVV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AF110E6E5
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2025 18:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738692732; x=1770228732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aoCXWrCd+p7SZuOd4CPbIYC+lorQ7eaxGt9mwTriiXE=;
 b=Zn/ZAVVV31dLEn3wHdvuGkcn8/AiQwZDN840J06UXC/lpyqC1hextjkr
 TkU3KvMaXZAkGVEzBhgjnhlB+NJJBil9Zd0mOyoUTZspPCEy0dYN3KFah
 UD2zey5v9J2fgDCuEit9A9HDaaJT2hKIRUbbZrkZJ2B741Pnk6qQ59LK/
 JUsaBzztKfR/XQ3nsjCzfuZCKY/PfUnJmcojz0TpOIe7STDRCN4sqSuiF
 WJecf6EF50p3tzA8o5haorF3N1Ku3rXq8Wz+3xLVJ5tJCSyd6g8ouIFBK
 b31n8g8PvFt+NG0U10iGD2RTv9lzw6Dze5oSD67jFmjLbcE7URqAFKwaQ A==;
X-CSE-ConnectionGUID: Me9If9IXScG/ZDk1iuytnA==
X-CSE-MsgGUID: oP58PkKmS8yNuGSVuur6zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50652608"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50652608"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:12:12 -0800
X-CSE-ConnectionGUID: /8O2bcrCTiumy0BBMr8CGA==
X-CSE-MsgGUID: dHhtWbrSRjee6dQ2V88Org==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="110509562"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 10:12:10 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/kms_joiner: Add a new test to validate
 non-joiner mode
Date: Tue,  4 Feb 2025 23:57:34 +0530
Message-Id: <20250204182734.793645-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250204182734.793645-1-jeevan.b@intel.com>
References: <20250204182734.793645-1-jeevan.b@intel.com>
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

We need to ensure that the system does not use a joiner for modes that do
not require it. This test will validate that the correct non-joiner mode
is selected, and then forcing a modeset and flip on the last pipe. If the
joiner is mistakenly enabled for a non-joiner mode, the test should fail.
otherwise, the commit should proceed as expected.

v2: Fix nonjoiner_mode_found to find the required case(6K@30).
    Remove clk sort and minor fixes. (Karthik)
v3: Rename nonjoiner to non_joiner and minor modifications. (Swati)
v4: Add joiner check. (Karthik)
v5: Rename test name and function name, Update test description,
    update non_joiner_mode_found logic. (Karthik)

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_joiner.c | 54 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 086cfeb71..4227aa8b0 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -74,6 +74,10 @@
  *
  * SUBTEST: switch-modeset-ultra-joiner-big-joiner
  * Description: Verify switching between ultra joiner and big joiner modeset.
+ *
+ * SUBTEST: non-joiner-corner-cases
+ * Description: Validate non-joiner mode functionality by enabling corner-case display modes
+ *		that vary across different platforms.
  */
 IGT_TEST_DESCRIPTION("Test joiner / force joiner");
 
@@ -85,6 +89,7 @@ typedef struct {
 	int ultra_joiner_output_count;
 	int non_big_joiner_output_count;
 	int non_ultra_joiner_output_count;
+	int non_joiner_output_count;
 	int mixed_output_count;
 	int output_count;
 	int n_pipes;
@@ -94,6 +99,7 @@ typedef struct {
 	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *mixed_output[IGT_MAX_PIPES];
+	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
 	enum pipe pipe_seq[IGT_MAX_PIPES];
 	igt_display_t display;
 } data_t;
@@ -491,6 +497,41 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 	}
 }
 
+static void test_non_joiner_corner_cases(data_t *data)
+{
+	int count;
+	enum pipe pipe;
+	igt_output_t **outputs, *output;
+	igt_fb_t fb;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+
+	count = data->non_joiner_output_count;
+	outputs = data->non_joiner_output;
+	igt_display_reset(&data->display);
+
+	for (int i = 0; i < count; i++) {
+		output = outputs[i];
+		mode = igt_output_get_mode(output);
+		for (pipe = 0; pipe < data->n_pipes - 1; pipe++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+				igt_output_set_pipe(output, pipe);
+				primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+				igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+						      DRM_FORMAT_MOD_LINEAR, &fb);
+				igt_plane_set_fb(primary, &fb);
+				igt_display_commit2(&data->display, COMMIT_ATOMIC);
+				igt_assert_f(!igt_is_joiner_enabled(data->drm_fd, pipe),
+					     "Joiner enabled on pipe %c", 'A' + pipe);
+
+				igt_display_reset(&data->display);
+				igt_plane_set_fb(primary, NULL);
+				igt_remove_fb(data->drm_fd, &fb);
+			}
+		}
+	}
+}
+
 igt_main
 {
 	bool ultra_joiner_supported, is_dgfx;
@@ -505,6 +546,7 @@ igt_main
 		data.ultra_joiner_output_count = 0;
 		data.non_big_joiner_output_count = 0;
 		data.non_ultra_joiner_output_count = 0;
+		data.non_joiner_output_count = 0;
 		data.mixed_output_count = 0;
 		data.output_count = 0;
 		j = 0;
@@ -523,6 +565,7 @@ igt_main
 
 		for_each_connected_output(&data.display, output) {
 			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
+			bool non_joiner_found = false;
 			drmModeConnector *connector = output->config.connector;
 
 			/*
@@ -533,6 +576,7 @@ igt_main
 			 */
 			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
 			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
+			non_joiner_found = non_joiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
 
 			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
 				force_joiner_supported = true;
@@ -548,6 +592,9 @@ igt_main
 			else if (force_joiner_supported)
 				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
 
+			if (non_joiner_found)
+				data.non_joiner_output[data.non_joiner_output_count++] = output;
+
 			data.output_count++;
 		}
 		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
@@ -713,6 +760,13 @@ igt_main
 		}
 	}
 
+	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
+	igt_subtest_with_dynamic("non-joiner-corner-cases") {
+		igt_require_f(data.n_pipes >= 1,
+			      "Minimum of 1 pipe is required.\n");
+			test_non_joiner_corner_cases(&data);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

