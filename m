Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD69C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 14:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63273113407;
	Tue, 23 Apr 2024 14:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CtyIMomA";
	dkim-atps=neutral
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DC610FC9D
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 14:33:01 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5196c755e82so8082861e87.0
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 07:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713882779; x=1714487579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pk+YTwWVBhVFqGdx609i5a1NopBqjnCjXrqG28rOUmc=;
 b=CtyIMomAleNKhioAAicczLjq1VnshahKlgcgeza0xgwC9Fs4ds5bMKge5wtDkh5ffs
 6pH0IoN8lSerOuu6YLKad/LQv7SZyFZfreEIGkDTK9oNshJ0YuT/N1PnPsFucaPw/lMC
 xQgR/fXHfpW0rL/UXGhWGKIQFAJhRnyZzDLDcAkdyVxRmcg1ZbJLLNX+SPcH0aNfrd4n
 qov7LVo0qKztz/S4YmfabRq0evI8C+UUpXGB2IvJ2NoL7an02yU5ql4lwKIBeXlhtL+s
 eOb0Suod+3rmnl/Qy8z2M7or98c1EwL0d6YM5g0BqodENN9x7xK9jy+RYDsAi310urvo
 Om1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713882779; x=1714487579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pk+YTwWVBhVFqGdx609i5a1NopBqjnCjXrqG28rOUmc=;
 b=Lc6aQZZx83DStQZ1Iigh9ygJh1O46OB3uk2H+pOSfwgDslC0+kxiSMpjXvVcShNbCJ
 TlbxSQ/0tTVmPmM1DsQ/bPCj6KzLjqbLHS9rb5kbThvobHyMApiTshBbCEQ6UGnTF4sZ
 z8bYYLnKN/m87dsIyM26By5pg/yECKKg5UMIazczPO+h08TGkmhtDnDxMkHvkkZOUS+O
 8Y/mwJkWq8FCvP/7LYC9oeGiPdJ+RXn2YkfB2JMmVOLhFlzAV1E6kvoLZlKyqbI2pT5i
 y9V/2jLOh8/SmJ6LchdxGXTFviA9MNfcSP/CloKMIimU2TvQPVRfUsiSdfuNFyyCfU38
 AW1w==
X-Gm-Message-State: AOJu0YyLoOGD6AZjLCpdSUPpr77wUouVuygeOcIS+w6RAZd0i9dfg1Kw
 APQstN3h01Z+nb9HTQU0KSi3MgMdGx5QwXoUjDL7HXIObgZhAsK8BY8SU60JcK0=
X-Google-Smtp-Source: AGHT+IHCCwbi3USWPwwnCZqv5QIDBWlF2ufOZ4GJ/k9Waz55H06nAgiMFbmYK86zNyqXQEqTsxEilA==
X-Received: by 2002:a05:6512:b88:b0:51b:b070:a55c with SMTP id
 b8-20020a0565120b8800b0051bb070a55cmr1275826lfv.57.1713882779192; 
 Tue, 23 Apr 2024 07:32:59 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 d25-20020a196b19000000b0051af5cba0f3sm988781lfa.11.2024.04.23.07.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 07:32:58 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 2/6] lib/igt_fb: make blt_compression_format function
 more readable
Date: Tue, 23 Apr 2024 17:32:42 +0300
Message-Id: <20240423143246.130884-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423143246.130884-1-juhapekka.heikkila@gmail.com>
References: <20240423143246.130884-1-juhapekka.heikkila@gmail.com>
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
index f6f280b13..f9868e269 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2824,6 +2824,32 @@ static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
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
@@ -2831,33 +2857,18 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
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

