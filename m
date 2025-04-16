Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B720BC369B1
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 07:51:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7063B10E877;
	Wed, 16 Apr 2025 07:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+5+tiwl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0520D10E878
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744789898; x=1776325898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hAsPJe16ezOqYQQUcPm/rL/6rZaEc9dyMg9rXdOOABw=;
 b=H+5+tiwla4DvgTHzFzR50c4qI3rAhJycNdooKO+KxlnWttiC7rbJoV93
 QCAp6ti4XdMKIBDSXtOSWMXtfcaDNyxbsf1YivMBusVi062X4zWQ0Hw0G
 KFDPTs1K3JffBXvjWBv4guI0TzrzTa6knsr3FZD3uMlMskVu5KkJcxOZX
 gchl+3RGYAeVeeX97K1u39ZJhA7FNlr02olV42v3/uCj68Q8yDymqCY+D
 cYB+cZbuyEn5xo8JA5zsizbDymweEbZXtZVCjWpxCT5HEuqJKe4SNa1bN
 e32ARyyAcYoErwnxuXe1BAxAf5txiwu4Bt/vNVJASBRjtuXphQI+McbAX g==;
X-CSE-ConnectionGUID: 9u7+UsFLQb6oW2O3Y19Juw==
X-CSE-MsgGUID: EjpYHduGQLqPWNms4d7q0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="45556578"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="45556578"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 00:51:37 -0700
X-CSE-ConnectionGUID: hQ9nMAncQi2c8e3ch+kMUQ==
X-CSE-MsgGUID: 2QN35HFeRfeVv8IjWbF6bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="130217808"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 00:51:35 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, jeevan.b@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_joiner: Fix mode handling invalid
 joiner subtest
Date: Wed, 16 Apr 2025 13:14:34 +0530
Message-Id: <20250416074434.2887040-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411075225.2855770-1-santhosh.reddy.guddati@intel.com>
References: <20250411075225.2855770-1-santhosh.reddy.guddati@intel.com>
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

V2:
- Fix: force invalid sub tests skipping on valid outputs.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index b150894af..22c7c6d85 100644
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
@@ -341,15 +341,24 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 
 		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
 			output = outputs[j];
+
+			if (!force_joiner) {
+				igt_require_f(bigjoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode),
+							  "No big joiner mode found on output %s\n", output->name);
+				igt_output_override_mode(output, &mode);
+			} else {
+				mode = *igt_output_get_mode(output);
+			}
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
@@ -370,7 +379,7 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 	igt_output_t *output;
 	igt_plane_t *primary;
 	igt_fb_t fb;
-	drmModeModeInfo *mode;
+	drmModeModeInfo mode;
 
 	len = force_joiner ? data->non_big_joiner_output_count : data->big_joiner_output_count;
 	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
@@ -379,15 +388,24 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 		igt_display_reset(&data->display);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 		output = outputs[i];
+
+		if (!force_joiner) {
+			igt_require_f(bigjoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode),
+						  "No big joiner mode found on output %s\n", output->name);
+			igt_output_override_mode(output, &mode);
+		} else {
+			mode = *igt_output_get_mode(output);
+		}
+
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

