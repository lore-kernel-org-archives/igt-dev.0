Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50FDC4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 22:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A7510E38F;
	Thu, 15 Feb 2024 22:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j927397i";
	dkim-atps=neutral
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47BB10E38F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 22:21:11 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1d71cb97937so14168795ad.3
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 14:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708035670; x=1708640470; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RDhBfgR7uXbOqhEDXnaOaiqF5CxZCeS16N6ezCCRTwk=;
 b=j927397imdT9hvwze8VKjKbV1lgyDG+IYRjr9xZ3aA7YGkfWiwGADwNHeCBpIKHgGn
 HXFoU3rZc+4PbG8GMxpygrLqtDkB2rM5OxfI7BTy/91vj1diTQdOkUp6kXpGVZAcMq/S
 J176qd/+DOwqw7uNMZ0EO1wj4J1v1CTNoAFgcylbqDANRPzgZQkNnxJUzlM0qCN5XRby
 67q2WBo/YMbe7C0VgmsuTDPgyGmARQXFgg2XrGDxBMEDa5kVSIRWJpO45WFCm0jkBc0n
 sd5b6ivFS8ZjcOtXYL1oeVVeiSiCjnFwwgCXNibNZwKftWl2vRmzYD3hexujOXvgt+uu
 A3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708035670; x=1708640470;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RDhBfgR7uXbOqhEDXnaOaiqF5CxZCeS16N6ezCCRTwk=;
 b=apLVpDW9j5bG0CxjkmmSEFsUj4OsAeL/iEoe+JM1f0WpaVrnPUf3927h5D/ewJXtcF
 W9Nl6qwVengmZH9YSbwNuLmIUhetKL2Tyx4vZRHUo2ipukSpAb0u6663CJGavfkGzZQ0
 Lj31M5/dcYYS0pqB5hnNP/pCtEH+DYrTs8jiw832ML1xVjK7LcwDwHCgx2yM70k/h2Eb
 MYK4zOA7pcYrNBRfTJnNLyba7tFNiLa0NM2ocCknCJGBnKoAVhY2G9Gn4dHgD7Rq9htb
 hnPUCvCGLwF8tVQAHWpwmKVu+mlOEdT/TAzd/szWJrJC3JrTdNxVxw63m0ZB7YGdGh4H
 O8Wg==
X-Gm-Message-State: AOJu0YyLdiYwXjUIgrOHqfDAl+3ZKBsMEzCz7sOoFflewj8swSfM+OkC
 +fkcZ2Y/zFLA92ME4IjqaoUI1LxPTCSR6IbG7vaapicx2ylygHgsgXa7fK4U
X-Google-Smtp-Source: AGHT+IHYoarmpzgX3o0D0TfX6xHe9RlFJG5veQ1lBBIgMeXZSyL5UFUPyQ0WGuehZLjKr+9AftHQNw==
X-Received: by 2002:a17:903:246:b0:1da:2c01:fef5 with SMTP id
 j6-20020a170903024600b001da2c01fef5mr3575421plh.56.1708035670363; 
 Thu, 15 Feb 2024 14:21:10 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a1709027ec900b001d9b092bcd9sm1780929plb.148.2024.02.15.14.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 14:21:09 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>
Subject: [PATCH i-g-t 1/2] tests/kms_plane_scaling: Pass display to
 get_num_scalars()
Date: Thu, 15 Feb 2024 14:21:04 -0800
Message-ID: <20240215222105.327820-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Prep for next patch.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_kms.c             |  5 +++--
 lib/igt_kms.h             |  2 +-
 tests/kms_plane_scaling.c | 24 ++++++++++++------------
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1b4d0d7612a2..899b3a5001c4 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6333,17 +6333,18 @@ int igt_get_dp_mst_connector_id(igt_output_t *output)
 
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
index b3882808b42f..7cbaf180a63b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1217,6 +1217,6 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
-int get_num_scalers(int drm_fd, enum pipe pipe);
+int get_num_scalers(igt_display_t *display, enum pipe pipe);
 
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index acb4a1da1ecf..d2dd3fd843e8 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1038,8 +1038,8 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_output_set_pipe(output1, pipe1);
 	igt_output_set_pipe(output2, pipe2);
 
-	igt_require(get_num_scalers(d->drm_fd, pipe1) >= 2);
-	igt_require(get_num_scalers(d->drm_fd, pipe2) >= 2);
+	igt_require(get_num_scalers(display, pipe1) >= 2);
+	igt_require(get_num_scalers(display, pipe2) >= 2);
 
 	plane[0] = igt_output_get_plane(output1, 0);
 	igt_require(plane[0]);
@@ -1131,7 +1131,7 @@ static void invalid_parameter_tests(data_t *d)
 		igt_output_set_pipe(output, pipe);
 		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
-		igt_require(get_num_scalers(d->drm_fd, pipe) >= 1);
+		igt_require(get_num_scalers(&d->display, pipe) >= 1);
 
 		igt_create_fb(d->drm_fd, 256, 256,
 			      DRM_FORMAT_XRGB8888,
@@ -1308,7 +1308,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
-						if (get_num_scalers(data.drm_fd, pipe) < 1)
+						if (get_num_scalers(&data.display, pipe) < 1)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
@@ -1333,7 +1333,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
-						if (get_num_scalers(data.drm_fd, pipe) < 1)
+						if (get_num_scalers(&data.display, pipe) < 1)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
@@ -1358,7 +1358,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
-						if (get_num_scalers(data.drm_fd, pipe) < 1)
+						if (get_num_scalers(&data.display, pipe) < 1)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
@@ -1382,7 +1382,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
-					if (get_num_scalers(data.drm_fd, pipe) < 1)
+					if (get_num_scalers(&data.display, pipe) < 1)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
@@ -1402,7 +1402,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
-					if (get_num_scalers(data.drm_fd, pipe) < 1)
+					if (get_num_scalers(&data.display, pipe) < 1)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
@@ -1422,7 +1422,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
-					if (get_num_scalers(data.drm_fd, pipe) < 1)
+					if (get_num_scalers(&data.display, pipe) < 1)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
@@ -1442,7 +1442,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_valid_output_on_pipe(&data.display, pipe, output) {
 					if (!pipe_output_combo_valid(&data.display, pipe, output))
 						continue;
-					if (get_num_scalers(data.drm_fd, pipe) < 2)
+					if (get_num_scalers(&data.display, pipe) < 2)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
@@ -1469,7 +1469,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						drmModeModeInfo *mode = NULL;
 
-						if (get_num_scalers(data.drm_fd, pipe) < 1)
+						if (get_num_scalers(&data.display, pipe) < 1)
 							continue;
 						/*
 						 * Need to find mode with lowest vrefresh else
@@ -1494,7 +1494,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			for_each_pipe_with_valid_output(&data.display, pipe, output) {
 				if (!pipe_output_combo_valid(&data.display, pipe, output))
 					continue;
-				if (get_num_scalers(data.drm_fd, pipe) < 1)
+				if (get_num_scalers(&data.display, pipe) < 1)
 						continue;
 
 				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
-- 
2.43.0

