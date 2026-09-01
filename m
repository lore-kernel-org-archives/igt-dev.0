Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCE7C61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 17:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9609310EDF3;
	Tue,  1 Sep 2026 17:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DwmSSM0s";
	dkim-atps=neutral
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3067710EDF1
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 17:07:54 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2d8fd3b729dso64855ad.1
 for <igt-dev@lists.freedesktop.org>; Tue, 01 Sep 2026 10:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788282474; x=1788887274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rtXjbHDexOA84B+QzAKPNsomuV+B7DR68fw29eCSZS0=;
 b=DwmSSM0sBuXp5OXkeSJt1PYnuQoxSpYDHzDBnpd77O5nqoFcTNCjYPM26YSYYkkIW2
 owiUR8sebhiNhxEHrb6XspnmFmfBn4z1DLOkSV20JBdBF2N+V8RmiVvu7ZHnJsonSeOO
 N2E1kDDa6lBrw4rAj4SMPq+OKHPKPLIWDytUWUR/sdUABphHlZSCGZYiQLpoxxdFALjR
 or7enbZVTZpb3m2XaCRkX6Mr1Sk9oh6S1adPEY7eJ3jrVwNzZ3bGXJMXXt2De9DTgEJF
 bSqjP/fqB67kzpSrVr9KL0qRjltHbgHt84WA217rkpVIIj3EyAf7nJjVoC7wT3TocVZM
 MZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788282474; x=1788887274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rtXjbHDexOA84B+QzAKPNsomuV+B7DR68fw29eCSZS0=;
 b=ZBi+hNngnlhQD1YvniGenBv+jZjbpsqUEwrfqk30saA+EOeOhi4zpg75nKKhRS/3Zd
 1qwwKFVvy4MRgqW5AfKTr/S0dBQitwdeOzoSNPig0OBRTizjzpYWVOW/JSVWHQX7cA9z
 LYc9hwA/SF498hjz7eC952liuFlqxSXd24tkTizDVNb8T2EeXKJQNZxioBX7zXRmuFbJ
 lSvwOCTI3IbBGtgKyaCRI4QotZmgCLGVzFjX9TLdX0vgO84nER8VfuUz7Oq75xmXYMgf
 ODWfOo1rxXCeQzEzNX6t03Ar6YKaTV7ka/FwqWf2lsT0wEUIStP8vvNWC2IOIsGTO8cv
 xxJQ==
X-Gm-Message-State: AFuF++l+uI1i+pnZwrAQvXCV46WK+1VMsRUpTvHjjQcITMKMoYRiMoeb
 lVtJu2TcuxROAzg/QQ/+h1wmGNsKbckkb/23Y/lebLVpA2ihLVestm1fISMK/WOT+ovftw==
X-Gm-Gg: AYBFou1LCu4t6pklt7Am2P85KnM/TG98ioZI36TE4VqUdu/zdO/Syr5trJEKqkWENEP
 HYmiw1zxFEhQfI5MyOQzg0RHeqdaOmpoii82Z5gkMLZ9rZ1lTFAXkxk1GwbSeUcTpdgOgj30MDZ
 AgFOIHBuRcjWDjTMobKR5xbY9QPyYgwWOSAX0hRBcPl1IqmqoqB/4ITUa2NRDVPEQeU1MhnrqxP
 bSVn0Ty6ulANt5HeiiiXtQbHCLzOhaxlK4fpEXaZVbdilqMSW/2CSDAWspAeTg10/K0ppIPf9BH
 ZpSnRRD1CRe4t2vDDHC6daK91nHlD2PgOpLBjG6768rcI+GxnMHuBlZLQjOLE/6wpJnG7a1gTqm
 842diNz9h9llowvoOQxM2MB9H8ZyhQAGcj+7JdHI24/9cCB0z6wT6Og2Ul0htel5UyhZSC8ZBZ2
 X+h6UpzhUF1DQkrDA3q9zmXAkFxjZfjnH8WNQAwqEL+2HDUb42xW4nDTUFfjEtOM+O3E7HAZrmk
 NWeonfdO84mccdxe6tjNGAiq+s=
X-Received: by 2002:a17:903:1aab:b0:2d9:e1b:73ee with SMTP id
 d9443c01a7336-2d94a760fc8mr132564845ad.8.1788282473389; 
 Tue, 01 Sep 2026 10:07:53 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2dadd4a7921sm1702085ad.59.2026.09.01.10.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 10:07:52 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/5] tests/kms_plane_scaling: add search for scaling
 limit
Date: Tue,  1 Sep 2026 20:07:37 +0300
Message-ID: <20260901170740.1079715-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901170740.1079715-1-juhapekka.heikkila@gmail.com>
References: <20260901170740.1079715-1-juhapekka.heikkila@gmail.com>
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
index 90dc55935..b7980d6f8 100644
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

