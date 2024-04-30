Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D483EC25B10
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 16:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F02112BDD;
	Tue, 30 Apr 2024 16:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VCqscUQL";
	dkim-atps=neutral
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053A3112B22
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 16:29:46 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2de2f5ca076so67625561fa.0
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 09:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714494584; x=1715099384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3XGAEzKmLypwq4UMOcPiiuRfJ4hs6xf1c3d+6sviRAQ=;
 b=VCqscUQLZSY7CGhPsCGmNE5PfqAdWnF/s387B51lZrj8pcj3mFz6GG2bCzLlXudKxT
 4x8rj4qCOE99WNdYI+d5RQFtXTDP86r+mE1puuc/OgP6wa3F5FHcp9M1qa9MDQE2KY3f
 RqGZcyvmL59sPDatEZN1Aev87Vn970K6o+w76iOHylDGVnZ2B8K7100VzOrUQqL7g6Nc
 woOixbcAqB0HXj/jlaDGjhJB/5cP9X8hxlIFu7hZG2wWqAxWAgAPmzRanafdzXBc2h1E
 R5AH23TPz3WmedMo7o/WfOM7t4Jq1Q2QsCUlNwV3BE8c+jrNxMUWWpanRFKUma7J2mJH
 +3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714494584; x=1715099384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3XGAEzKmLypwq4UMOcPiiuRfJ4hs6xf1c3d+6sviRAQ=;
 b=NiKpYPlReOkGNX4kSHs+Hrnjo8LXgSgy++YSCP2kPlijys/FB5DZrDDR8/Oj1nXbv+
 GadKlY17KzbpLXWHXzngl4xj8hUph9Ga0z5DOSBEmNm4WXkD++1HfU1s/UNc0VCCYlAn
 YJGz1AZQKKMOupbJNB8q/+8ordExc/1vtMUNKT/nDxcbdFxifpGxbDrCt1DbPYKTjmBk
 qOsNwxZ3j0iXDbV1csBNv/E4f9yN9KwHB3KPQN+DMo9HALyqiA9S6S7Y5Jjmy9Xm328w
 J2f2pJCxo4ke87WY04+n7umFaaCEA13N1s2Qd2Lh02DJlfihk4t6ODprLO5OS0OPXXf9
 CoAw==
X-Gm-Message-State: AOJu0Yz6sFh1uItaDwDsQ0pZ/RizDZrzYhdRo8Wg78Kl5Hgrb1RBodto
 tyv33FZGmnZegZ86/fhRRyyDkss6kWVyNwGflI/h+PmxNvLJXScmYNxVJzDtcsM=
X-Google-Smtp-Source: AGHT+IGrCsvAuM0DL1sbOYAoqTE8y6n1zswUhp+Gw8Duydo0XIcCbrr6I+RkDYEsTxyikqwDiKa/zg==
X-Received: by 2002:a2e:b16e:0:b0:2df:97b1:e21c with SMTP id
 a14-20020a2eb16e000000b002df97b1e21cmr100990ljm.31.1714494584329; 
 Tue, 30 Apr 2024 09:29:44 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a2e9b93000000b002e0e410ad06sm302814lji.138.2024.04.30.09.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:29:43 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v3 2/6] lib/igt_fb: make blt_compression_format function
 more readable
Date: Tue, 30 Apr 2024 19:29:35 +0300
Message-Id: <20240430162939.272990-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
References: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
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
2.25.1

