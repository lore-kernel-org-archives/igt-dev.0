Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2D7CD129D
	for <igt-dev@archiver.kernel.org>; Mon,  8 Apr 2024 06:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254AF112117;
	Mon,  8 Apr 2024 06:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmulEU8t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E0D11212E
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2024 06:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712557113; x=1744093113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KBbImUIk7OE9mbjkgfcs2xmLAioWyiYyQoesoJAgLjM=;
 b=BmulEU8tToC8/H1/ByY1v7/NZlz+8l3in1G7rZhv3JSmp9xSkO8ne/uX
 v4q5h4r/PMaHg1w1yT/6dlj6ocleFEabEBWud0AsX4tVbgQ2ntrJti/v/
 sgBQePPW9YkGbK9kl+qysZUqfHkkvVKpa2IpclATCrZLblqEf6ynqH+7m
 mR3lxDWaRjtesctQWvVp6/f0D05Dk6VWNy+SxGGInZfhJxRpjzzYHUsE5
 JL5c95kHo0tSml2afINR3VeFywtXA/3YPx2qmKnc/VSB6PKYurOQ3ktLQ
 8D2Da1DPcfzF91tnr8lYxDKD1SFw4x/zHKIWOCsLBXxb4XjDfg3xKe+QC Q==;
X-CSE-ConnectionGUID: IfrP8eapRm6x1vcpHy2HEA==
X-CSE-MsgGUID: yGgMU1G+R6epq+GSHLs6fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7940254"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7940254"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:18:21 -0700
X-CSE-ConnectionGUID: dWaW9WrFRsKkQiVtJ7z+IA==
X-CSE-MsgGUID: UD3mM8BRRNadWE/XTO4kqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="50976989"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:18:19 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 5/5] tests/kms: Use lib helper to check the pipe/output
 combo validity
Date: Mon,  8 Apr 2024 11:42:21 +0530
Message-ID: <20240408061221.291523-6-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408061221.291523-1-bhanuprakash.modem@intel.com>
References: <20240408061221.291523-1-bhanuprakash.modem@intel.com>
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

Use IGT lib helper intel_pipe_output_combo_valid() to make sure the
selected pipe/output/mode combo is valid.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_dither.c | 24 +++++++------
 tests/kms_hdr.c    | 90 ++++++++++++++++++++++++++--------------------
 2 files changed, 65 insertions(+), 49 deletions(-)

diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index af7b7f05c..21b1210b4 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -76,13 +76,10 @@ typedef struct {
 /* Prepare test data. */
 static void prepare_test(data_t *data, igt_output_t *output, enum pipe p)
 {
-	igt_display_t *display = &data->display;
 	igt_pipe_t *pipe = &data->display.pipes[p];
 
 	igt_assert(pipe);
 
-	igt_display_reset(display);
-
 	data->primary =
 		igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
@@ -205,6 +202,8 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 	igt_output_t *output;
 	igt_display_t *display = &data->display;
 
+	igt_display_reset(display);
+
 	for_each_connected_output(display, output) {
 		enum pipe pipe;
 
@@ -215,15 +214,20 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 			continue;
 
 		for_each_pipe(display, pipe) {
-			if (igt_pipe_connector_valid(pipe, output)) {
-				igt_dynamic_f("pipe-%s-%s",
-					      kmstest_pipe_name(pipe), output->name)
-					test_dithering(data, pipe, output, fb_bpc,
-							fb_format, output_bpc);
+			igt_output_set_pipe(output, pipe);
 
-				/* One pipe is enough */
-				break;
+			if (!intel_pipe_output_combo_valid(display)) {
+				igt_output_set_pipe(output, PIPE_NONE);
+				continue;
 			}
+
+			igt_dynamic_f("pipe-%s-%s",
+					      kmstest_pipe_name(pipe), output->name)
+				test_dithering(data, pipe, output, fb_bpc,
+							   fb_format, output_bpc);
+
+			/* One pipe is enough */
+			break;
 		}
 	}
 }
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 99b78f7ef..475463c21 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -261,6 +261,8 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 
+	igt_display_reset(display);
+
 	for_each_connected_output(display, output) {
 		enum pipe pipe;
 
@@ -271,26 +273,30 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 			continue;
 
 		for_each_pipe(display, pipe) {
-			if (igt_pipe_connector_valid(pipe, output)) {
-				prepare_test(data, output, pipe);
-
-				if (is_intel_device(data->fd) &&
-				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
-					test_fini(data);
-					break;
-				}
-
-				data->mode = igt_output_get_mode(output);
-				data->w = data->mode->hdisplay;
-				data->h = data->mode->vdisplay;
+			igt_output_set_pipe(output, pipe);
+			if (intel_pipe_output_combo_valid(display)) {
+				igt_output_set_pipe(output, PIPE_NONE);
+				continue;
+			}
 
-				igt_dynamic_f("pipe-%s-%s",
-					      kmstest_pipe_name(pipe), output->name)
-					test_bpc_switch_on_output(data, pipe, output, flags);
+			prepare_test(data, output, pipe);
 
-				/* One pipe is enough */
+			if (is_intel_device(data->fd) &&
+			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+				test_fini(data);
 				break;
 			}
+
+			data->mode = igt_output_get_mode(output);
+			data->w = data->mode->hdisplay;
+			data->h = data->mode->vdisplay;
+
+			igt_dynamic_f("pipe-%s-%s",
+				      kmstest_pipe_name(pipe), output->name)
+				test_bpc_switch_on_output(data, pipe, output, flags);
+
+			/* One pipe is enough */
+			break;
 		}
 	}
 }
@@ -614,6 +620,8 @@ static void test_hdr(data_t *data, uint32_t flags)
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 
+	igt_display_reset(display);
+
 	for_each_connected_output(display, output) {
 		enum pipe pipe;
 
@@ -635,32 +643,36 @@ static void test_hdr(data_t *data, uint32_t flags)
 			continue;
 
 		for_each_pipe(display, pipe) {
-			if (igt_pipe_connector_valid(pipe, output)) {
-				prepare_test(data, output, pipe);
+			igt_output_set_pipe(output, pipe);
+			if (!intel_pipe_output_combo_valid(display)) {
+				igt_output_set_pipe(output, PIPE_NONE);
+				continue;
+			}
 
-				if (is_intel_device(data->fd) &&
-				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
-					test_fini(data);
-					break;
-				}
-
-				data->mode = igt_output_get_mode(output);
-				data->w = data->mode->hdisplay;
-				data->h = data->mode->vdisplay;
-
-				igt_dynamic_f("pipe-%s-%s",
-					      kmstest_pipe_name(pipe), output->name) {
-					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND | TEST_INVALID_HDR))
-						test_static_toggle(data, pipe, output, flags);
-					if (flags & TEST_SWAP)
-						test_static_swap(data, pipe, output);
-					if (flags & TEST_INVALID_METADATA_SIZES)
-						test_invalid_metadata_sizes(data, output);
-				}
-
-				/* One pipe is enough */
+			prepare_test(data, output, pipe);
+
+			if (is_intel_device(data->fd) &&
+			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+				test_fini(data);
 				break;
 			}
+
+			data->mode = igt_output_get_mode(output);
+			data->w = data->mode->hdisplay;
+			data->h = data->mode->vdisplay;
+
+			igt_dynamic_f("pipe-%s-%s",
+				      kmstest_pipe_name(pipe), output->name) {
+				if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND | TEST_INVALID_HDR))
+					test_static_toggle(data, pipe, output, flags);
+				if (flags & TEST_SWAP)
+					test_static_swap(data, pipe, output);
+				if (flags & TEST_INVALID_METADATA_SIZES)
+					test_invalid_metadata_sizes(data, output);
+			}
+
+			/* One pipe is enough */
+			break;
 		}
 	}
 }
-- 
2.43.2

