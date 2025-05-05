Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9EBC3ABB0
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 10:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366C510E076;
	Mon,  5 May 2025 10:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OGxdjNup";
	dkim-atps=neutral
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5407010E076
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 10:45:56 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-22928d629faso38428555ad.3
 for <igt-dev@lists.freedesktop.org>; Mon, 05 May 2025 03:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746441952; x=1747046752; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gN21l0iN1fDfZJaaT1LK8TfYILNYGR8Z9/Qp6gw8PkI=;
 b=OGxdjNupLAbprOdJvwxxwCiX+ZWraC6J/xMp40w8xoH1mDKs/Zm/qhNpiV/X1ExK8/
 s15fwrScbmASrsBtaB3x8csDRUgfebwFA3vfBa74pWhgKxNW4COuSUNd9tePhoNKjdPE
 W9Awe7uQ39NWa/r4ANuggdOf2S17u0ATwPTOT/2q7dYRQ/0ckGbVmiNp8fwiA80OGfGw
 jfMcdrZJ5SAmtoWvmHft5GMWiMwyDCxk1rveBC2hOQXI9zjInm3H0pwcqmj54XzMS2Dx
 n0XpGolAlcRrK8it7HXsoTn3IrswJh+O/2xICbvRUi9F3KN10AdsIUhsbvZW1sbxSYGz
 sdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746441952; x=1747046752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gN21l0iN1fDfZJaaT1LK8TfYILNYGR8Z9/Qp6gw8PkI=;
 b=A+jUrBFYVY2MAstr3jgbISg2O2h98VPbLABA3Rcs3QdhLJmjz/fZsBUH7C5Xh13E8t
 dMdAunLQ+1d/20gp+/42TZVOmiohLbEjVcStwjEWfMloapdkCaRekXxLsYSVL6qQ1yCY
 FAMY98bs5sVjTibTaNXw9LJwlvo1sQhSdD2VcxXfjegk+/yFVQjiduiWIwIZJZVnI5Yi
 kFg7Of8bPLHma9Y9cHjTHrsQs0W8nAGFjsV3VX4xZEmho8gmDRl1bd65pymg4oRWDlCG
 y+qW3V/0udd70a0TawX+jbAuYkLZbjk6CoaDKlbFKe/h/uu/X5wNFI9j3rBBaoHzLSP3
 v3nQ==
X-Gm-Message-State: AOJu0YzmxXL7bvYueYE5h0wF1cXE9c00cyspCwL3LH08m4f6OR7IiYUj
 cK2xJ6XTwekCHYOuIpJckHvOsXLitagD5KPI5RWoj/ow4mlx7zbHamF6KynL
X-Gm-Gg: ASbGncvdtZuSn1mLs9DX6DTq5xUCN4xnKK4tZ4BXl4DS+Vxd7/qjWpEvkFV9/JC/s0C
 TLDUsG/0XeS4TXBuJ+d7EWSa1ti+o6DNOHxQNdtAvK+C97NWnb5MH2Q7O4vDPw9HlhKO74VH9Gw
 ydXwCpwQEodm2GrHzQr9SHJNkvMwnZb2EPWl1DCUq2pDaPpjjFD47Z7MtlfOcXoy8m66Ak1SWJh
 3+HCCKdbWswaT5s5mx2XcU3zWbwQ3HPv2jWhFMWMZup/UUmmRIzSFExI/G1t9nShvpJPigwi2ir
 y3KAH3hJB40bcNvOaU+yoc0lFCH/HyJuSbirYDUPOnL5Sg==
X-Google-Smtp-Source: AGHT+IFCy5Ti5JNezymEDcalGslMlJaQbW6GquHDqA96aeVOyVznQfCMJC6C5q0Sl2G9EFfHFoYBkw==
X-Received: by 2002:a17:903:1b0b:b0:223:5c33:56a2 with SMTP id
 d9443c01a7336-22e1ea30944mr100642165ad.28.1746441952392; 
 Mon, 05 May 2025 03:45:52 -0700 (PDT)
Received: from localhost ([192.55.55.48]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e151eb166sm51441095ad.96.2025.05.05.03.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 03:45:52 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t] tests/kms_plane: Fix crash on fail and print out tested
 formats
Date: Mon,  5 May 2025 13:45:37 +0300
Message-ID: <20250505104537.35593-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Pixel format tests would crash out on failure, let's fix that.

Earlier tested pixel formats were moved from igt_info to igt_debug, let's put
igt_info back in place so it's easier for debug time to see what's going on.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane.c | 52 ++++++++++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 28 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index d08ec81e4..f7b672c7a 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -887,9 +887,9 @@ static bool test_format_plane_rgb(data_t *data, enum pipe pipe,
 				  igt_crc_t ref_crc[],
 				  struct igt_fb *fb)
 {
-	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
-		  IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
-		  kmstest_pipe_name(pipe), plane->index);
+	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+		 kmstest_pipe_name(pipe), plane->index);
 
 	return test_format_plane_colors(data, pipe, plane,
 					format, modifier,
@@ -925,13 +925,13 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
 						     igt_color_range_to_str(r)))
 				continue;
 
-			igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT
-				" (%s, %s) on %s.%u\n", IGT_FORMAT_ARGS(format),
-				IGT_MODIFIER_ARGS(modifier),
-				igt_color_encoding_to_str(e),
-				igt_color_range_to_str(r),
-				kmstest_pipe_name(pipe),
-				plane->index);
+			igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT
+				 " (%s, %s) on %s.%u\n", IGT_FORMAT_ARGS(format),
+				 IGT_MODIFIER_ARGS(modifier),
+				 igt_color_encoding_to_str(e),
+				 igt_color_range_to_str(r),
+				 kmstest_pipe_name(pipe),
+				 plane->index);
 
 			result &= test_format_plane_colors(data, pipe, plane,
 							   format, modifier,
@@ -1029,7 +1029,7 @@ static bool skip_format_mod(data_t *data,
 	return false;
 }
 
-static bool test_format_plane(data_t *data, enum pipe pipe,
+static void test_format_plane(data_t *data, enum pipe pipe,
 			      igt_output_t *output, igt_plane_t *plane, igt_fb_t *primary_fb)
 {
 	struct igt_fb fb = {};
@@ -1046,7 +1046,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 	 * No clamping test for cursor plane
 	 */
 	if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
-		return true;
+		return;
 
 	igt_vec_init(&tested_formats, sizeof(struct format_mod));
 
@@ -1059,7 +1059,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 	} else {
 		if (!plane->drm_plane) {
 			igt_debug("Only legacy cursor ioctl supported, skipping cursor plane\n");
-			return true;
+			return;
 		}
 		do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
 		do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_HEIGHT, &height));
@@ -1073,9 +1073,9 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 
 	igt_pipe_crc_start(data->pipe_crc);
 
-	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
-		  IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
-		  kmstest_pipe_name(pipe), plane->index);
+	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+		 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
+		 kmstest_pipe_name(pipe), plane->index);
 
 	check_allowed_plane_size_64x64(data, plane, &width, &height, ref.format);
 
@@ -1107,12 +1107,12 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 			continue;
 
 		if (skip_format_mod(data, f.format, f.modifier, &tested_formats)) {
-			igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
-				  IGT_MODIFIER_FMT " on %s.%u\n",
-				  IGT_FORMAT_ARGS(f.format),
-				  IGT_MODIFIER_ARGS(f.modifier),
-				  kmstest_pipe_name(pipe),
-				  plane->index);
+			igt_info("Skipping format " IGT_FORMAT_FMT " / modifier "
+				 IGT_MODIFIER_FMT " on %s.%u\n",
+				 IGT_FORMAT_ARGS(f.format),
+				 IGT_MODIFIER_ARGS(f.modifier),
+				 kmstest_pipe_name(pipe),
+				 plane->index);
 			continue;
 		}
 
@@ -1149,7 +1149,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 
 	igt_vec_fini(&tested_formats);
 
-	return result;
+	igt_assert_f(result, "At least one CRC mismatch happened\n");
 }
 
 static bool skip_plane(data_t *data, igt_plane_t *plane)
@@ -1195,7 +1195,6 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	struct igt_fb primary_fb;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
-	bool result;
 	igt_output_t *output = data->output;
 	igt_plane_t *plane;
 
@@ -1225,12 +1224,11 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 
 	set_legacy_lut(data, pipe, LUT_MASK);
 
-	result = true;
 	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		if (skip_plane(data, plane))
 			continue;
 		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane->index)
-			result &= test_format_plane(data, pipe, output, plane, &primary_fb);
+			test_format_plane(data, pipe, output, plane, &primary_fb);
 	}
 
 	test_fini(data);
@@ -1242,8 +1240,6 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	igt_remove_fb(data->drm_fd, &primary_fb);
-
-	igt_assert_f(result, "At least one CRC mismatch happened\n");
 }
 
 static void test_planar_settings(data_t *data)
-- 
2.45.2

