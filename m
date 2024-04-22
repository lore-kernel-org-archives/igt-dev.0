Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE8AC07C79
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 20:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EE3112D73;
	Mon, 22 Apr 2024 20:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LPhp4ohL";
	dkim-atps=neutral
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B1B10F852
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 20:45:04 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-516d6e23253so5794860e87.1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 13:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713818703; x=1714423503; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1rzNO+W7422504IeLtnqRJm66Cnk9pVZwxYUDSu4+Go=;
 b=LPhp4ohLDRDVHWqO0I3Fj+GSaRUtjht1NK4kU7iAa3rnjVin+pRNAYUKbsnDrkOI6u
 YpdPEM2OQ/g9K98eyAnnRQNfzJaAFf6MICpBVpilDXLTGC2CXhIHoFFNONpr8Ky+1dlR
 jjpwI0EvaaPnhuj+peRfUTOdGbH0eI8BKvTndne2iXTYQ60bdvePSXa8TBl+7gdFJ8t5
 l8eVRf4/kIvYnKQNGTLfWUtGPPp+HXh3LNjCQjcHhSuocZQaOzb8xSgyQBgj8sRj9jFS
 0PG3zdDjMtRbD0mFH0csefC1JHyHdwOiHtUJ4pNuwVFUHOlfqvLuRgDYJicdet9TzZ+B
 fDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713818703; x=1714423503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1rzNO+W7422504IeLtnqRJm66Cnk9pVZwxYUDSu4+Go=;
 b=XnkAFyvLjxD3OOiidveVWv+L///vDOSb2Za2ozWOMpKF2q7sJsPAlF+VK6sS49KYMy
 6lRVkjnrpngKtP6/MbMJSouYvlb5AlVi08TapDhn7VVm4cESAJfQAZyiirL/Abz6f3Ji
 q6PcXdGNIoENbNLMHSeV+EJeTcP0op6sI7qdEGLGoDO9sLZ9zedoLKVQ9IDYroee/3Yg
 VcEHALnmFN3SaBL1cjhDt09Wjl6zX4heyZ0jHGiCcIokL8yvUpNqL6/eHWif3hmUDEu4
 okxFxjVghKBgQtJnX2wuCv8NW8Gy1nV6wde7XFnuQ79zs+4HYQLLpHET+c0sojGkblCE
 7gRw==
X-Gm-Message-State: AOJu0Yy/qlJ/cKdnTqwkO50FL1Y1GfDgVO/k4iWM6DB9SCs6yh/nx/b+
 P88MvDUF+0qtLpZQn5B+ZyIYQvsBPLDUsV8qlqNso7j294mrkxtfqdPknhJiLt4=
X-Google-Smtp-Source: AGHT+IG4XDFdRYaG0uDo/V22z8tMpGU2fl9N2UgDZzgYBkV9lmzcIn+dXKgwS+Xc4hJdJYJq9Bjcqg==
X-Received: by 2002:a19:6411:0:b0:515:b164:4112 with SMTP id
 y17-20020a196411000000b00515b1644112mr8075960lfb.68.1713818702489; 
 Mon, 22 Apr 2024 13:45:02 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z9-20020a19f709000000b00515cc918069sm1816413lfe.150.2024.04.22.13.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 13:45:02 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/6] lib/igt_fb: make blt_compression_format function
 more readable
Date: Mon, 22 Apr 2024 23:44:37 +0300
Message-Id: <20240422204441.106197-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422204441.106197-1-juhapekka.heikkila@gmail.com>
References: <20240422204441.106197-1-juhapekka.heikkila@gmail.com>
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

Intel blitter compression format getter sanitizing.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 63 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 26 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index a77920fff..684995909 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2821,6 +2821,32 @@ static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
 #define BLT_TARGET_MC(x) (x.compression == COMPRESSION_ENABLED && \
 			  x.compression_type == COMPRESSION_TYPE_MEDIA)
 
+const struct {
+	uint32_t key;
+	enum blt_compression_type type;
+	uint32_t return_value;
+} compression_mappings[] = {
+	{ CD_32bit, COMPRESSION_TYPE_3D, 8 },
+	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_MEDIA, 8 },
+	{ DRM_FORMAT_XYUV8888, COMPRESSION_TYPE_MEDIA, 9 },
+	{ DRM_FORMAT_NV12, COMPRESSION_TYPE_MEDIA, 9 },
+	{ DRM_FORMAT_P010, COMPRESSION_TYPE_MEDIA, 8 },
+	{ DRM_FORMAT_P012, COMPRESSION_TYPE_MEDIA, 8 },
+	{ DRM_FORMAT_P016, COMPRESSION_TYPE_MEDIA, 8 },
+};
+
+static uint32_t get_compression_return_value(uint32_t key, enum  blt_compression_type type)
+{
+	for (int i = 0; i < ARRAY_SIZE(compression_mappings); i++) {
+		if (compression_mappings[i].key == key &&
+		    compression_mappings[i].type == type) {
+			return compression_mappings[i].return_value;
+		}
+	}
+	igt_assert_f(0, "Unknown compression type or format\n");
+	return 0; // This line is to avoid compilation warnings, it will not be reached.
+}
+
 static uint32_t blt_compression_format(struct blt_copy_data *blt,
 				       const struct igt_fb *fb)
 {
@@ -2828,33 +2854,18 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
 	    blt->dst.compression == COMPRESSION_DISABLED)
 		return 0;
 
-	if (BLT_TARGET_RC(blt->src) || BLT_TARGET_RC(blt->dst)) {
-		switch (blt->color_depth) {
-		case CD_32bit:
-			return 8;
-		default:
-			igt_assert_f(0, "COMPRESSION_TYPE_3D unknown color depth\n");
-		}
-	} else if (BLT_TARGET_MC(blt->src)) {
-		switch (fb->drm_format) {
-		case DRM_FORMAT_XRGB8888:
-			return 8;
-		case DRM_FORMAT_XYUV8888:
-			return 9;
-		case DRM_FORMAT_NV12:
-			return 9;
-		case DRM_FORMAT_P010:
-		case DRM_FORMAT_P012:
-		case DRM_FORMAT_P016:
-			return 8;
-		default:
-			igt_assert_f(0, "COMPRESSION_TYPE_MEDIA unknown format\n");
-		}
-	} else if (BLT_TARGET_MC(blt->dst)) {
+	if (BLT_TARGET_RC(blt->src) || BLT_TARGET_RC(blt->dst))
+		return get_compression_return_value(blt->color_depth,
+						    COMPRESSION_TYPE_3D);
+
+	if (BLT_TARGET_MC(blt->src))
+		return get_compression_return_value(fb->drm_format,
+						    COMPRESSION_TYPE_MEDIA);
+
+	if (BLT_TARGET_MC(blt->dst))
 		igt_assert_f(0, "Destination compression not supported on mc ccs\n");
-	} else {
-		igt_assert_f(0, "unknown compression\n");
-	}
+
+	igt_assert_f(0, "unknown compression\n");
 }
 
 static void blitcopy(const struct igt_fb *dst_fb,
-- 
2.25.1

