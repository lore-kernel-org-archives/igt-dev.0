Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32EBC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F5210E364;
	Mon, 19 Aug 2024 20:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EtWY89Ey";
	dkim-atps=neutral
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493CF10E364
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:25:51 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-201f7fb09f6so31379695ad.2
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 13:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724099150; x=1724703950; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9UxYMcWs6omjwwV8dMHxDTwHBqrOLUbUU2I+gHkrAQA=;
 b=EtWY89Eymfo7ZZs5GBYGwLpx9oui1xoic5MyhQ4M451RHsp2yW8c4iCLH9V+07C6Ec
 0YLWE/fpaqODMsyTspuCTzF/hB9S8BdW9vElsxlD/OorSLrBbAOxzZqFyQIys4OLRNbF
 uIjoOew9s/RHy20lFR+Xw8+Vf3BcoGHmvCAWlk1wxIbbzMRMS0iY69JemO3pBbDlviKD
 +SDD7SriEXL3AhQiXRMoxU70UtjMNfDzaxLb+UD4tMeKajXSKKMrK47JUhDBoEjadViM
 uUh/Vveq/0+dsxGcotsYrBRGmxVSlF3Pii5uyCS7fbLgcdda9yCi3RLQ1f+dyyUmwqQm
 F4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724099150; x=1724703950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9UxYMcWs6omjwwV8dMHxDTwHBqrOLUbUU2I+gHkrAQA=;
 b=r4nyGw/erNGeqOgIKKnJ6ogLNSPLUlgwBo23uq7nD/0i9sPsBaRAnIeh+ncreiFQBR
 9uYUQuZzP/EqV4hXT/dpnnCA3JIl5jGYjpC/n2tf121hTuqQsU+zpV3HkSPkFewk+fwr
 wRt957ZqdjrlI9ALcRmXfRZGjE8U39EWWzGWrRf3E6JtvwZVEuTZNir97RVQ3ccYgPvK
 LaMrACpjCSq9HFe+shVP0xPi4O8OwNiAQEaxwAuM+/l+q+1UDPsxmnzff6/AT2j78jEs
 bZHgFfAGkjSrPti/cTlq5/4dkDjwqhb+EQdP+yfxWZjFrGUbNBSTEEKLBwlbx4tMzfqB
 C20w==
X-Gm-Message-State: AOJu0YyfZh0GI/RX8EDN4ETJ9L2Zw3BdzZoQ/wwBADegC39eX5F+y6hS
 I2tsyyj1nk5DXIYcPLOjLIFPSoRTS3EFehKZIMe7M7NGQgbbolKyJVNZnw==
X-Google-Smtp-Source: AGHT+IHRAZsNTG2Lvo4zrB80KKubvDrdCOARhtOYmzZsQXPaPCGRjqFWvsMrOd3HAIyoA2eDHW4ztw==
X-Received: by 2002:a17:902:ced1:b0:202:46cc:696c with SMTP id
 d9443c01a7336-20246cc6c1cmr41245925ad.18.1724099149917; 
 Mon, 19 Aug 2024 13:25:49 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f038a688sm66141905ad.191.2024.08.19.13.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 13:25:49 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH 1/2] tests/kms_plane_scaling: Pass display to get_num_scalers()
Date: Mon, 19 Aug 2024 13:25:45 -0700
Message-ID: <20240819202546.111243-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
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

From: Rob Clark <robdclark@chromium.org>

Prep for next patch.  The next commit will need the display to figure
out the number of scalers.  This commit has no functional change, just
plumbing the extra parameter everywhere.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kms.c             |  5 +++--
 lib/igt_kms.h             |  2 +-
 tests/kms_plane_scaling.c | 24 ++++++++++++------------
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e030b35a6051..99cdeeb76033 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6650,17 +6650,18 @@ int igt_get_dp_mst_connector_id(igt_output_t *output)
 
 /**
  * get_num_scalers:
- * @drm_fd: drm file descriptor
+ * @display: the display
  * @pipe: display pipe
  *
  * Returns: Number of scalers supported per pipe.
  */
-int get_num_scalers(int drm_fd, enum pipe pipe)
+int get_num_scalers(igt_display_t *display, enum pipe pipe)
 {
 	char buf[8120];
 	char *start_loc1, *start_loc2;
 	int dir, res;
 	int num_scalers = 0;
+	int drm_fd = display->drm_fd;
 	char dest[20] = ":pipe ";
 
 	strcat(dest, kmstest_pipe_name(pipe));
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e8582a45b53e..25ba509164e3 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1223,6 +1223,6 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
-int get_num_scalers(int drm_fd, enum pipe pipe);
+int get_num_scalers(igt_display_t *display, enum pipe pipe);
 
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 90bfb004773b..42eb67409899 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1080,8 +1080,8 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_output_set_pipe(output1, pipe1);
 	igt_output_set_pipe(output2, pipe2);
 
-	igt_require(get_num_scalers(d->drm_fd, pipe1) >= 2);
-	igt_require(get_num_scalers(d->drm_fd, pipe2) >= 2);
+	igt_require(get_num_scalers(display, pipe1) >= 2);
+	igt_require(get_num_scalers(display, pipe2) >= 2);
 
 	plane[0] = igt_output_get_plane(output1, 0);
 	igt_require(plane[0]);
@@ -1169,7 +1169,7 @@ static void invalid_parameter_tests(data_t *d)
 		igt_output_set_pipe(output, pipe);
 		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
-		igt_require(get_num_scalers(d->drm_fd, pipe) >= 1);
+		igt_require(get_num_scalers(&d->display, pipe) >= 1);
 
 		igt_create_fb(d->drm_fd, 256, 256,
 			      DRM_FORMAT_XRGB8888,
@@ -1346,7 +1346,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
-						if (get_num_scalers(data.drm_fd, pipe) < 1)
+						if (get_num_scalers(&data.display, pipe) < 1)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
@@ -1370,7 +1370,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
-						if (get_num_scalers(data.drm_fd, pipe) < 1)
+						if (get_num_scalers(&data.display, pipe) < 1)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
@@ -1394,7 +1394,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
-						if (get_num_scalers(data.drm_fd, pipe) < 1)
+						if (get_num_scalers(&data.display, pipe) < 1)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
@@ -1417,7 +1417,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
-					if (get_num_scalers(data.drm_fd, pipe) < 1)
+					if (get_num_scalers(&data.display, pipe) < 1)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
@@ -1437,7 +1437,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
-					if (get_num_scalers(data.drm_fd, pipe) < 1)
+					if (get_num_scalers(&data.display, pipe) < 1)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
@@ -1457,7 +1457,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
-					if (get_num_scalers(data.drm_fd, pipe) < 1)
+					if (get_num_scalers(&data.display, pipe) < 1)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
@@ -1477,7 +1477,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
-					if (get_num_scalers(data.drm_fd, pipe) < 2)
+					if (get_num_scalers(&data.display, pipe) < 2)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
@@ -1502,7 +1502,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						drmModeModeInfo *mode = NULL;
 
-						if (get_num_scalers(data.drm_fd, pipe) < 1)
+						if (get_num_scalers(&data.display, pipe) < 1)
 							continue;
 						/*
 						 * Need to find mode with lowest vrefresh else
@@ -1527,7 +1527,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			for_each_pipe_with_valid_output(&data.display, pipe, output) {
 				if (!pipe_output_combo_valid(&data.display, pipe, output))
 					continue;
-				if (get_num_scalers(data.drm_fd, pipe) < 1)
+				if (get_num_scalers(&data.display, pipe) < 1)
 						continue;
 
 				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
-- 
2.46.0

