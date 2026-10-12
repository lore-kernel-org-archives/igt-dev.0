Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC996CA9EC5
	for <igt-dev@archiver.kernel.org>; Mon, 12 Oct 2026 12:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DE510EA7D;
	Mon, 12 Oct 2026 12:31:27 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEA310EA7D
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 12:29:53 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-30b6dad2382so4268287eec.0
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791808192; x=1792412992; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4kwEQrS3yca2u1YsB63pDt0+9uQROEBZNrSIYROeZNg=;
 b=rGcHv5moNbaH2ZQAkhteeJUc1TzzD36bN8VXknl7TfiKi27aOThURme7WmzUdpnxL0
 4JCg9NQzsjQuqIPFUBgeN6SKRypqeTk+zLLPdJbBh+s35mGXMMd9SymaFjU221mhQH8m
 jXgmObi1zggGOXhTxmKEhJo5ayv36cebb31IdF67rbKOEn6rrNONZyTw/VdbG6Dy/rm0
 7ATG21Z8uXhLcPP/NxvDqgR+9XGWoW9Grr8pAps2Y3P6jDpEWTJ3BR/NzFBs4K3KY+d5
 8qTJP1kXWQhrAVmqkCvIiyt5p9PIJhGz1POttrR7LXiwrH/pGXjZzl64uYTF9euEA0fh
 9LZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791808192; x=1792412992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4kwEQrS3yca2u1YsB63pDt0+9uQROEBZNrSIYROeZNg=;
 b=EDGWsf66f5g9Z/wQCGYZZBf3hFQCQPXCNdpLB5PLqW6/VNc4qQQE3Jn1zNW/2zIzY6
 5ZErYdzlS9Ntq8h1MA0myhV3kn9j50dlj4zGrGhwJIfhudBUesPxOXxfTECl8o8Q4z9Z
 PmoyWr8Fcpm+DrUrAvHtCK2B7HtWgUxBWS37CMduGVLWfGh6TPHupu3cmDcqsvU7BrD5
 AkoFiRltEornn1PGTaXEgHBoiVDm254T7DEbv9sSF0d9hPoc4o68QXwqu811+DKjfbM8
 00qOa52IQ3LeFXnTbTXhnPbhS6Fm+Y8wDnt0k9gnS8N+libFoC2TzQbgTYR/O+kGoO7L
 2KJA==
X-Gm-Message-State: AFq9FYInSGI1KW3iu2r5H3jF0fdobQYwCY9lV2VuCn+fI/5eTICCZgu3
 T1mTz9aKNjPdlnrixGG5dinYE1nV+bsMgXij6W2Y87uBsbagVy5XQcBiSiqFUHxVNUU=
X-Gm-Gg: AYBFou3XqHyTBvbrIsccjmnOcpkVuE97gAwovetbgcpyb9VMvDjlLUjxtvPWZ+OwwpO
 Qh2SH1sXxC/3i334bDn+ICv/oTjwwuxVLaoO+WyN3Sa9BI+XIAicwqTKDsyBATRK458IuItHIWa
 1P9DudgkOso5WK7KLyltDiWPjqFUTXrSG7ceGn9InUHLN8JIskbHoBdnUNZDLq2oG28ZhJrmTkx
 iib3/cbnptqj+m3o980ve3BDqDQA5ZuhqFQpw86yYezyiP0l5/npaUfVyrDK6q6x4+kYuXh4k1j
 wOoz+K0jY2pXLpD8onTtgsmNFZrEsTaJPR2tTuvtoriyBATidUVTfABFnGMOfCN+UmWeGCmb4jn
 01Bjf6a3OtbwufMe8faHNmEZIhwa/TxgxSs91t1NqU+A1acelE2Ngoj6ECAwf+87VBVRljFgbAz
 dBjwpktNh9F/v8BaKFXyQZuFErjHTnn+3MChHP9PwFKeMmdVK/dCujf7bs7NR3sypB91oQxE5JA
 LtFMOHpUO55CQSrtun4EhqwTwPugG8bi1c=
X-Received: by 2002:a05:7022:5f14:b0:168:6ad8:e89f with SMTP id
 a92af1059eb24-16a56c9dd9dmr12519325c88.3.1791808192204; 
 Mon, 12 Oct 2026 05:29:52 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1699718c547sm28850945c88.3.2026.10.12.05.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 05:29:51 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/5] tests/kms_plane_scaling: add search for scaling
 limit
Date: Mon, 12 Oct 2026 15:29:36 +0300
Message-ID: <20261012122939.233749-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012122939.233749-1-juhapekka.heikkila@gmail.com>
References: <20261012122939.233749-1-juhapekka.heikkila@gmail.com>
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

add find_max_downscale_src_size() function to do search
for largest accepted scaled size for given plane size

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 81 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 091b8114e..41f56a5ed 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -709,6 +709,87 @@ static const uint64_t modifiers[] = {
 	I915_FORMAT_MOD_4_TILED
 };
 
+static int
+find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
+			    uint32_t format, uint64_t modifier,
+			    bool scale_width, int dst_w, int dst_h,
+			    int align)
+{
+	igt_display_t *display = &d->display;
+	struct igt_fb probe_fb = {};
+	drmModeRes *res;
+	int fixed = scale_width ? dst_h : dst_w;
+	int dst = scale_width ? dst_w : dst_h;
+	int fb_cap;
+	int lo, hi, best;
+	int ret;
+
+	igt_assert(align >= 1);
+
+	res = drmModeGetResources(display->drm_fd);
+	igt_assert(res);
+	fb_cap = ALIGN_DOWN(scale_width ? res->max_width : res->max_height, align);
+	drmModeFreeResources(res);
+
+	igt_create_fb(display->drm_fd,
+		      scale_width ? fb_cap : fixed,
+		      scale_width ? fixed : fb_cap,
+		      format, modifier, &probe_fb);
+
+	igt_plane_set_fb(plane, &probe_fb);
+	igt_plane_set_position(plane, 0, 0);
+	igt_plane_set_size(plane, dst_w, dst_h);
+
+	/* Baseline: the unscaled 1:1 source must be accepted. */
+	best = ALIGN(dst, align);
+	igt_fb_set_position(&probe_fb, plane, 0, 0);
+	igt_fb_set_size(&probe_fb, plane,
+			scale_width ? best : fixed,
+			scale_width ? fixed : best);
+	ret = igt_display_try_commit_atomic(display,
+					    DRM_MODE_ATOMIC_TEST_ONLY |
+					    DRM_MODE_ATOMIC_ALLOW_MODESET,
+					    NULL);
+	if (ret) {
+		igt_debug("Unscaled %dx%d source rejected (ret=%d)\n",
+			  scale_width ? best : fixed,
+			  scale_width ? fixed : best, ret);
+		igt_plane_set_fb(plane, NULL);
+		igt_remove_fb(display->drm_fd, &probe_fb);
+		return ret;
+	}
+
+	lo = best + align;
+	hi = fb_cap;
+	while (lo <= hi) {
+		int mid = ALIGN_DOWN(lo + (hi - lo) / 2, align);
+
+		igt_fb_set_position(&probe_fb, plane, 0, 0);
+		igt_fb_set_size(&probe_fb, plane,
+				scale_width ? mid : fixed,
+				scale_width ? fixed : mid);
+
+		ret = igt_display_try_commit_atomic(display,
+						    DRM_MODE_ATOMIC_TEST_ONLY |
+						    DRM_MODE_ATOMIC_ALLOW_MODESET,
+						    NULL);
+		if (ret == 0) {
+			best = mid;
+			lo = mid + align;
+		} else {
+			hi = mid - align;
+		}
+	}
+
+	igt_debug("Max downscale source %s for dst %dx%d: %d (fixed axis %d)\n",
+		  scale_width ? "width" : "height", dst_w, dst_h, best, fixed);
+
+	igt_plane_set_fb(plane, NULL);
+	igt_remove_fb(display->drm_fd, &probe_fb);
+
+	return best;
+}
+
 static uint32_t
 test_scaler_with_modifier_crtc(data_t *d,
 			       double sf_plane,
-- 
2.43.0

