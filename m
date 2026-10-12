Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AF4CA9EC5
	for <igt-dev@archiver.kernel.org>; Mon, 12 Oct 2026 12:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5390410EA7D;
	Mon, 12 Oct 2026 12:30:41 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397AB10F077
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 12:29:49 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-1433e7b057fso1150342c88.1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 05:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791808188; x=1792412988; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IvMmXSqTmrASafe1jW5j6EUZL4Wlz8EttZ87Qm5c8hU=;
 b=VBBbWkY5hHkQBPEq1GjY4fZ1hSAt0skc6SOXb3Cj4KD3PJ6aBH3eGdtWX+SiyCTE1I
 AW1etvxPgRgmOF+7zAVQf/G/ZJX+bdAuBpzesEO3ZafPC6iYchz9/EANnNrDJAof8h52
 W9RGG5yA/ptS2/t0/0pNXTbOy5p7LwEb7REux6oH/yukilMF0vt/qh7w5mpXC1Ycv/Qb
 ZcUvBwm1uiiwHh69YxJPr1JJAZsha6PXU04qOO1nU0G2XJxqVSZV9b+/NhPv7wpLxr8m
 AZEXzkuyVwMioL4e1ysOdUzVgfBz2f9PFY7e1yPPuYDTRtdk9cbZwa+M/Og01XStvPYd
 8F1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791808188; x=1792412988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IvMmXSqTmrASafe1jW5j6EUZL4Wlz8EttZ87Qm5c8hU=;
 b=KZW1CblPNFzwkmj4CtDO7o1eq2yMXfZ4irxT0LwhU/amuqaZZbY58Pc6xe2b/IeQTE
 PcDleLfE+zV6yL+D0xqCmbfphOKnAGaIPN2ijZ4YwfMaDKf/GZ+F/+brZErCwkGqY4gR
 0pUdIyFy4N1xpow8HGDTa1PCk5BMVFm3sd44xMQmkDBnAQzlzaK4KjN6KbKVO06TqgqI
 uR9mRILIFgss/KqYF5uGRkQH+GkGuaqSudHP6Cl23M9VRRDRtgRv7YCkdvZliYeDZKME
 OdYWptH8eKeWWpAfcTvsr2dSVuXfW9d+y49dKor1Ra5lMrcK+SQ3k8meFn/z518qWIDC
 neWg==
X-Gm-Message-State: AFq9FYL8Ep35NoWnHWwnhvokTowrktweXYlA+2QquwkPXOFXBodCV2JO
 xxfLT7O01y0DqiA7aMMDCJJ0TvO3olHuVDTpdOw1m0mh0QY7e3uazP7M4QIoPwPMR5w=
X-Gm-Gg: AYBFou2eVukuGchq1C9sc5TnXrNH9/9cWR3t2KuvlEFm4f7ltuM4w7BSZzBAAoG+OUv
 d9qdxDMe5Z49mNo2Sfm2d9jOZdv05FYFbrip7IXYE4jwMlxymrubmtq5+YgNiYusacLUHEpne4Q
 QRP2TKJ9goVSkwXcQ9Xd7B86Cnc+TZ5kIwPkB/0+Ou+ku0QQIrjUhFnQ9JcbOOcTQruJ69WKzXn
 iEFxjKODOog2OZiA7EqiVGEP0VQW0+CKXO8mlO9W7xHAuj1K+U4TfQctJQErN3Y0KU575JPlFyZ
 2/FY1B/+/KIYPsw0lSBytGtmw3oTywce8nns3C4S41FwEqZhln1VfKVmU2fAz1NKSxeFWlp2GDn
 GZ/ZYXoj2CHJ0PybXV/ETEjprPBMJ6T0s1QhJvdoUNdypiyZ/EXyXLqYkaWesmZKRVLs8homnkJ
 mveW1KUYICPr3CtmJz+CPJljZgfM0HW0Dp+FxzbT2chJ/Xov6yp/LY39D1Wk050uenNyy5L5wuv
 YjWU7I+/ls7pV2locxRfsi0KqDFNs4OoQE=
X-Received: by 2002:a05:7022:b042:20b0:15e:ea40:86b2 with SMTP id
 a92af1059eb24-16a6090cdedmr14722128c88.30.1791808187973; 
 Mon, 12 Oct 2026 05:29:47 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-169a1dd57d0sm30152918c88.8.2026.10.12.05.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 05:29:47 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/5] lib/igt_fb: add igt_format_get_subsampling()
 function
Date: Mon, 12 Oct 2026 15:29:35 +0300
Message-ID: <20261012122939.233749-1-juhapekka.heikkila@gmail.com>
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

add function to query given pixel format hsub and vsub
parameters.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 22 ++++++++++++++++++++++
 lib/igt_fb.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 6c3b9b0b9..3d15f0595 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -5300,6 +5300,28 @@ int igt_format_plane_bpp(uint32_t drm_format, int plane)
 	return format->plane_bpp[plane];
 }
 
+/**
+ * igt_format_get_subsampling:
+ * @drm_format: drm fourcc
+ * @hsub: chroma subsampling factor in the horizontal direction (out)
+ * @vsub: chroma subsampling factor in the vertical direction (out)
+ *
+ * This function returns the chroma subsampling factors of the @drm_format.
+ * For non-subsampled (e.g. RGB or 4:4:4 YUV) formats both factors are 1.
+ */
+void igt_format_get_subsampling(uint32_t drm_format, int *hsub, int *vsub)
+{
+	const struct format_desc_struct *format =
+		lookup_drm_format(drm_format);
+
+	igt_assert(format);
+
+	if (hsub)
+		*hsub = format->hsub;
+	if (vsub)
+		*vsub = format->vsub;
+}
+
 /**
  * igt_format_array_fill:
  * @formats_array: a pointer to the formats array pointer to be allocated
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 213e2d777..4562164df 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -237,6 +237,7 @@ uint32_t igt_drm_format_str_to_format(const char *drm_format);
 
 bool igt_format_is_fp16(uint32_t drm_format);
 int igt_format_plane_bpp(uint32_t drm_format, int plane);
+void igt_format_get_subsampling(uint32_t drm_format, int *hsub, int *vsub);
 void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
 			   bool allow_yuv);
 int igt_fill_cts_color_ramp_framebuffer(uint32_t *pixmap, uint32_t video_width,
-- 
2.43.0

