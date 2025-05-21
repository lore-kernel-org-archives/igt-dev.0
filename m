Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C174C2D0CD
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 12:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2987011B651;
	Wed, 21 May 2025 12:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A69ARm0f";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE2D11B632
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 12:17:16 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2320d2a7852so33396575ad.3
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 05:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747829835; x=1748434635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aBq23qCIeXQaaV9ExnAmMr2oFM3el+oqJ+ucMHhrWJM=;
 b=A69ARm0fuc6FKnuZHy/piHbdyoGnHcxJJIEiSLD0xGZByEJy1Ws6bd2mHLOiNnYXPi
 hz61+UaJsCQEsZXo1eFgFiK/9rSguQzIdkhPqN5Xu8hRFeXkWEp94Muuo1i0dAoctA19
 +PHo2yYcPSxH2y6C8bIGlONVADXHN1pqtyJl/09AKCIPQmvBF4Bq31QeHAVWtlov8xGn
 X1dkOI3im0uerXx9HZ6+99eqlRZqT0ofrfC+Kq9cZAHojyODbtMroFHjqrnKyrxMOnkG
 2YZUonRvsWSBt0gXVYdiPLglpTKfw23yCIU2NqP84X6c3cA4xVpL1dWDUJtcRjdPG97p
 zK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747829835; x=1748434635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aBq23qCIeXQaaV9ExnAmMr2oFM3el+oqJ+ucMHhrWJM=;
 b=ehQiA5DdHFF3iFPBjmSUdEJHwV/HCdUGTP/aSZL6yHkJWDONpGeHu9eXA0uWcO1Erq
 1/dNJtLrxBr3ZNVVBqEJADK/ysM98n3E5yt8ScJKWTqj1vLwO6YaLysnKF4hTl2fnIOv
 CS3vO9BltDb4SVnIcPOupzMl8koCXvHHgL5I3ILBCFzskcAcNAL9JZgjEseHhgKkqQ8r
 DfyCofz7nNMdU3kumobP1bUG3kugXAAN1zI0cMFj3nXWQQJSIHtelnnv01GxH7zlUgEN
 T3ldB0tzUwF7ZmglD/DxQjPN2yd+lcMUo2BYaLzXRh/N/Eps3ELU9PwG0MSb/pefzHkx
 5Fiw==
X-Gm-Message-State: AOJu0YwiQPpRjaKSRk1wIM7bKWanjR0NjpWAHkT6tfToZfGbUzrosHHl
 muEp5iMH3qaZeAeiOnnhpr01bExT3GF4bZpMwxciuJcIUzGtP4ZM88C7t/CQwz+P5QM=
X-Gm-Gg: ASbGnctTyiSsCLnGFyjxG715OI1OpSAyMIpF0/thaIk0B80bT2Qhn/uc/U5pAGbtWS9
 r/okt11DAUnp7w/0Up6LONKRwtQlqX4Rt22Xrt4UOeZlXR5xFMa7IMqoiF6yiqa59TF+txvcrtR
 hAPWi+Y5wZIRHCcR7cNL7CF9s6CnQ66pwh4QuYsUsfh5t9xCGRqoXGwGxUr3eUK/m0lPYHlw5HW
 MPLLtyMSRvHY9vlupzzL6HwajO9XcHZDyTvlWTUTsYNSNEbcrgvcXOLnswFTc/j/UaJsNJSAh8U
 hwoIAItFSGsfKGCD8cCS6ASFqQwipjNzMLeoG9UHN5pbtZTZyrlQrLJchQQ=
X-Google-Smtp-Source: AGHT+IFhogJJG4BPSN7oXVVH4EqBCbOXece4lDeQIvJyavK5aqyDnLVaIB2C7B5XjIGFUzFWlv4vZg==
X-Received: by 2002:a17:902:c411:b0:231:c6b9:ddba with SMTP id
 d9443c01a7336-231de36ba26mr240098755ad.20.1747829835578; 
 Wed, 21 May 2025 05:17:15 -0700 (PDT)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4ed897asm91916465ad.250.2025.05.21.05.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 05:17:15 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/2] tests/kms_plane: Fix crash on fail
Date: Wed, 21 May 2025 15:16:41 +0300
Message-ID: <20250521121641.32384-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250521121641.32384-1-juhapekka.heikkila@gmail.com>
References: <20250521121641.32384-1-juhapekka.heikkila@gmail.com>
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

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 2831b2d18..f7b672c7a 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
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

