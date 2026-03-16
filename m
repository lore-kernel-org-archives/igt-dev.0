Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB07DF53D69
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9070310E098;
	Mon, 16 Mar 2026 16:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MwtTPPcC";
	dkim-atps=neutral
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E1A10E098
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:12:16 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-829abaaa92bso3100766b3a.1
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 09:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773677535; x=1774282335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mzkpEnvNHey4CxEjLXvWYKmo/z8p6HT1HpN9kvUabjg=;
 b=MwtTPPcC83bTx8xe2pFWxAOMASUZHsJNOUcbRSwMeSQBrHJQfHRaKtQ9vFMxuCOfuo
 M7jicpCUI7EBploWvRRRc+92jconKySCpHTw2CXTv4kZ17I01qjExz2YKbss+WkEFozg
 hI0y61XdgyWL7e3SmzsWboRsx1po1B6J0Gh4LeVZnm5qqIkBhLnrXj2cAUxIbloDsrtj
 QmeN7f5pwUAjur/oV68AFrvQhZFSe+J9sNRMJTF1jbEqgEPykwOqvXZUqunm2Cza2qzw
 gaf3noVsZzuj1yUHuNQ9K4meppU9qghL2kmkI7+zHIISP2E+ecquCth2570HOMdt3E9D
 fUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773677535; x=1774282335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mzkpEnvNHey4CxEjLXvWYKmo/z8p6HT1HpN9kvUabjg=;
 b=ouHVuF+kNB85bsrYF0f4OLtPRPCzVkKexTei2GVeuznllIEevZBPUmc/DL54dahBK3
 Lc+I4uC9++eLI4LqRPcMK+J+2l6IDh2ExdzpvAWYwC+1qP8djBJqjljxQ8nX1mQHRLBU
 dRASUPpDzfDmwdBOZPefvPAY7GTZuDHs3G+g7irP9fAZByM0UEPdptwBgOCMbJ832TLB
 26rnZvSf3L6GVCLqec0Zodyhcom4Zk2jm1mQrjiLtJatgRldTIddObcGfge4dWkBcSjj
 4a9m9EMmL0rt9qBeTpciJfNDBbb2eTSg3pyoBn53qgMMIZ5TvSuUO9HqBAyUvnFxlNYl
 yqqA==
X-Gm-Message-State: AOJu0YzeRNgnhk0FWV7qJmohO9VHhqrDSxKp0aWkUEd1Yc42VSHmpQpr
 VsWCtJMplD/MCyuFMPUGvIDQDEB5UeHmsyh+UXn1u3vnK6zLJ9BkeH5MT2B5WdbZ
X-Gm-Gg: ATEYQzyCHN8KstSu2e+p66R1aQsSjoVrTSUzESB8dNK24hsHI03nU1QDkiqh8o/BgoV
 0SOg/AAQt8pZN8Xrb3ejqkeC17C30SlF53QQm/sxXY5bwOd/0JNnBFeNQ/ybnr8Kt4gi2uwS5E9
 aHAfIr5gZU2P3N2eZ/J8TKOlLo44m3xKwnaMN/tDXp9/771y1H4U+x4dK1tr8YI3MxcSaYtAkO/
 3APJewuz3Urqq+GreZ27p2v2oq+pcQLDFJ/JkB0F09MYbA5aIcBkmzhcVDLaLPqAgP0vPPEMLFN
 5gO/5cDYDqPXkVLp6p+NRMTAJ84MVPebj9HDxIX0kmPGU1zxJOUB9ggrcnqboCh9o02kBGVmmsa
 g/6MBmssI0x3f0Un0TLyFxF/KaFBQndkgx6K+qG7oA5dnUNsSE9PrwNp1PkMW+8fcLDpcd0x34x
 VhPMUFAuYZwCQ+va7v3PCH7Da5zh2jn6OISC4+1QAPHeMQV5aW9bnqB8e0kVJ/SQ==
X-Received: by 2002:a05:6a00:3c92:b0:824:9451:c1e2 with SMTP id
 d2e1a72fcca58-82a19937ad3mr12850350b3a.59.1773677535295; 
 Mon, 16 Mar 2026 09:12:15 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a07365090sm13833565b3a.46.2026.03.16.09.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 09:12:14 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/1] tests/chamelium/kms_chamelium_frames: add intel
 related yuv restrictions
Date: Mon, 16 Mar 2026 18:11:01 +0200
Message-ID: <20260316161101.2808556-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316161101.2808556-1-juhapekka.heikkila@gmail.com>
References: <20260316161101.2808556-1-juhapekka.heikkila@gmail.com>
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

Add intel hw yuv related restriction handling; 16bpp yuv formats
need to be set at even coordinates and even width. Palanar formats
need to be at even x/y coordinates and even width/height

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/chamelium/kms_chamelium_frames.c | 33 +++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index efd9ff1b7..404e32b87 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -333,6 +333,21 @@ static void randomize_plane_setup(chamelium_data_t *data, igt_plane_t *plane,
 
 	*width = max((rand() % mode->hdisplay) + 1, 2 * min_dim);
 	*height = max((rand() % mode->vdisplay) + 1, 2 * min_dim);
+
+	/*
+	 * intel related restrictions for yuv; 16bpp yuv formats have to be
+	 * even horizontal width/xposition. Planar yuv formats have to be
+	 * even horizontal/vertical sizes/coordinates.
+	 */
+	if (is_intel_device(data->drm_fd)) {
+		if (*format == DRM_FORMAT_YUYV || *format == DRM_FORMAT_YVYU ||
+		    *format == DRM_FORMAT_UYVY || *format == DRM_FORMAT_VYUY)
+			*width &= ~1;
+		if (igt_format_is_yuv_semiplanar(*format)) {
+			*width &= ~1;
+			*height &= ~1;
+		}
+	}
 }
 
 static void configure_plane(igt_plane_t *plane, uint32_t src_w, uint32_t src_h,
@@ -355,7 +370,8 @@ static void randomize_plane_coordinates(
 	uint32_t *src_y, uint32_t *crtc_w, uint32_t *crtc_h, int32_t *crtc_x,
 	int32_t *crtc_y, bool allow_scaling)
 {
-	bool is_yuv = igt_format_is_yuv(fb->drm_format);
+	uint32_t format = fb->drm_format;
+	bool is_yuv = igt_format_is_yuv(format);
 	uint32_t width = fb->width, height = fb->height;
 	double ratio;
 	int ret;
@@ -364,6 +380,21 @@ static void randomize_plane_coordinates(
 	*src_x = rand() % (width / 2);
 	*src_y = rand() % (height / 2);
 
+	/*
+	 * intel related restrictions for yuv; 16bpp yuv formats have to be
+	 * even horizontal width/xposition. Planar yuv formats have to be
+	 * even horizontal/vertical sizes/coordinates.
+	 */
+	if (is_intel_device(data->drm_fd)) {
+		if (format == DRM_FORMAT_YUYV || format == DRM_FORMAT_YVYU ||
+		    format == DRM_FORMAT_UYVY || format == DRM_FORMAT_VYUY)
+			*src_x &= ~1;
+		if (igt_format_is_yuv_semiplanar(format)) {
+			*src_x &= ~1;
+			*src_y &= ~1;
+		}
+	}
+
 	/* The source size only includes the active source area. */
 	*src_w = width - *src_x;
 	*src_h = height - *src_y;
-- 
2.43.0

