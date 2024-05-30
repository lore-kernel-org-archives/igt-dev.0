Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E649C27C43
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 14:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB099113662;
	Thu, 30 May 2024 14:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jLFjUo3D";
	dkim-atps=neutral
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA955113662
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 14:20:06 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7024063f5a9so36400b3a.1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 07:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717078806; x=1717683606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Setj78gsw6oEdtqR1PeWNbQ5RwL8SGGkWXVSUHtoa1g=;
 b=jLFjUo3DM7vMVW9rXFTF2iWPTucbSP6XYT/NZU4t7SjKCNk49LB+xem/l97WyKXp6i
 AmwD38S0xdJg13fArFWcFG+QB+QMOox2bzmVFsfF9aypXMSZkbbM9f2LKWV9UcS1J0Vk
 fLe+fvhuCAgh2w9eVR+c1OuGx6lfH+UwfHSJp2UyjoQSiZXxFLPKWLHuZa7ZuYYrsPDd
 Q33OfMAUaS/rzVyxdGoKTox+Q5TkREA2+T+jp8BgiWPneDWJJw+M6ISNoSFkRylgX3sc
 FF5D0plc/oDRJokgLnSHhClZql8LPcVyp1SkJyA6EhIDOhvqZhTeGJvUVVBKdQflc+lJ
 XuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717078806; x=1717683606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Setj78gsw6oEdtqR1PeWNbQ5RwL8SGGkWXVSUHtoa1g=;
 b=XesxLdiaX9oS+JP6qUQCrdg7fK0m906KyVM4q+Vo4zNDjWblF2CkIUt2S9/+h5CEiD
 PW4LzEIoaNHQaoqQmHaNl1htYgHYX5qfQF79Hlxf1+f89PYwTARlyi3/kB5cIzrffp69
 ToPFKQRA/ZpVeZQ9st98sfBQjDXDceW7PJaCsRA89ipoOluWoFpNhmTehrMlfmJ3Jz5c
 +uo9esW6nCL4bec3cp11qOQeAuklaOlichyZ3Digr290GvG7ya28fQjJt1qRTylv0Hiu
 MUw8HdZ2ITBc0jK+f1cHKpa7DeTb/e8EBzfDodxZ2pprycVLoXpAPR473jfTBes/0HrT
 t6kw==
X-Gm-Message-State: AOJu0YwqdKZpRToY85PAC5Yw+WZEp0B33f33cHlK7/OJcLS+rQ3i5Y8x
 Pt3L9nSnipaZ14GltYqnXoCfGaPC20HJJK1bofu9qiRSApNPxPgizkSvLr0f
X-Google-Smtp-Source: AGHT+IHcfrYPHClFBE8ex3rnCggAlaHCINw1ZbM4Nb6sA4kJ4JVAjdQ0i+x0WDasyUoAKm4bLafv6Q==
X-Received: by 2002:a05:6a00:4095:b0:6f9:f67:d570 with SMTP id
 d2e1a72fcca58-702311b63e0mr2527947b3a.24.1717078805832; 
 Thu, 30 May 2024 07:20:05 -0700 (PDT)
Received: from localhost ([134.134.139.78]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-701e2d1b155sm3838931b3a.184.2024.05.30.07.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 07:20:05 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v4 1/5] lib/igt_fb: make blt_compression_format function
 more readable
Date: Thu, 30 May 2024 17:23:42 +0300
Message-ID: <20240530142346.1511811-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
References: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_fb.c | 63 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 26 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 5df5cb08f..707eb0a1e 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2825,6 +2825,32 @@ static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
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
@@ -2832,33 +2858,18 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
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
2.43.2

