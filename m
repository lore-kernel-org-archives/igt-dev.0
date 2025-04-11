Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EAFC36010
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 07:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C2510E252;
	Fri, 11 Apr 2025 07:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFee0z9v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A1A10E252
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744358351; x=1775894351;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AsMuENL0PDvYD0DrZ33T2vnGboIhmyD3LXahHVu3GZo=;
 b=HFee0z9vA79E3YO5iBIF33/UfprHVkVBrWM4XeT3sV7N2DQFlwT0k/Mu
 1OA2sZYzIlErUDaPcr3GBvh1PSZkslCGvFKwQVYrFHIYUT4h2QR0a4RdC
 Clh4zB6+ZUz/RLdlahhuehXEN7dvD8ROpF/jGbX0IKo6BffNvR/hZYk2h
 iCsRu5KCWjQUXgQYFbPaQ7SvfudFdouD2tQUrGS/ewjGCtTFudaOKPkLH
 LElHawky9MJOJCcRYuNzk3EmT04Kv2t+UVdLTnCC5nag43cDuTrCRvmId
 jEw9GuwEIzK8l1C52q8Y0Db5s9leOENbVjAD5oStBbDCxFt6CJQruW+Uj A==;
X-CSE-ConnectionGUID: B1BifCxdTZiqg67iYVrsdQ==
X-CSE-MsgGUID: FRb502ygSBGW1Xo6ukUW/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="46031744"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="46031744"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 00:59:10 -0700
X-CSE-ConnectionGUID: airsdwkFSZ2Tr0Ou9+LJmA==
X-CSE-MsgGUID: 7yQ0ScuHQry8ks24tCSb+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="129124004"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 00:59:08 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, jeevan.b@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/intel/kms_joiner: Fix mode handling invalid
 joiner subtest
Date: Fri, 11 Apr 2025 13:22:25 +0530
Message-Id: <20250411075225.2855770-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Use a valid big joiner mode before trying modeset on the last pipe.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index b150894af..d93006d50 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -324,7 +324,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 	igt_output_t *output;
 	igt_plane_t *primary[INVALID_TEST_OUTPUT];
 	igt_fb_t fb[INVALID_TEST_OUTPUT];
-	drmModeModeInfo *mode;
+	drmModeModeInfo mode;
 
 	available_pipe_mask = BIT(data->n_pipes) - 1;
 	outputs = force_joiner ? data->non_big_joiner_output :
@@ -341,15 +341,21 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 
 		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
 			output = outputs[j];
+			igt_require_f(bigjoiner_mode_found(data->drm_fd,
+							   output->config.connector,
+							   max_dotclock, &mode),
+				     "No big joiner mode found on output %s\n", output->name);
+			igt_output_override_mode(output, &mode);
+
 			igt_output_set_pipe(output, data->pipe_seq[i + j]);
-			mode = igt_output_get_mode(output);
 			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
 				 kmstest_pipe_name(data->pipe_seq[i + j]),
-				 igt_output_name(output), mode->hdisplay,
-				 mode->vdisplay, mode->vrefresh,
+				 igt_output_name(output), mode.hdisplay,
+				 mode.vdisplay, mode.vrefresh,
 				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
 			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+			igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
+					      DRM_FORMAT_XRGB8888,
 					      DRM_FORMAT_MOD_LINEAR, &fb[j]);
 			igt_plane_set_fb(primary[j], &fb[j]);
 		}
@@ -370,7 +376,7 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 	igt_output_t *output;
 	igt_plane_t *primary;
 	igt_fb_t fb;
-	drmModeModeInfo *mode;
+	drmModeModeInfo mode;
 
 	len = force_joiner ? data->non_big_joiner_output_count : data->big_joiner_output_count;
 	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
@@ -379,15 +385,21 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 		igt_display_reset(&data->display);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 		output = outputs[i];
+
+		igt_require_f(bigjoiner_mode_found(data->drm_fd,
+						   output->config.connector,
+						   max_dotclock, &mode),
+			      "No big joiner mode found on output %s\n", output->name);
+		igt_output_override_mode(output, &mode);
 		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
-		mode = igt_output_get_mode(output);
 		igt_info(" Assigning pipe %s to %s with mode %dx%d@%d\n",
 				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
-				 igt_output_name(output), mode->hdisplay,
-				 mode->vdisplay, mode->vrefresh);
+				 igt_output_name(output), mode.hdisplay,
+				 mode.vdisplay, mode.vrefresh);
 		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-		igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
-							  DRM_FORMAT_MOD_LINEAR, &fb);
+		igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR, &fb);
 		igt_plane_set_fb(primary, &fb);
 		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 		igt_plane_set_fb(primary, NULL);
-- 
2.34.1

