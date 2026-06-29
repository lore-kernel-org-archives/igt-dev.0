Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858F4C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 18:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F0B10E0C7;
	Mon, 29 Jun 2026 18:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gvtBJpEa";
	dkim-atps=neutral
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA35110E0C7
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 18:00:38 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-845eb7b96feso916855b3a.0
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 11:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782756038; x=1783360838; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rtXjbHDexOA84B+QzAKPNsomuV+B7DR68fw29eCSZS0=;
 b=gvtBJpEabo1q1T+hhzCLeQO65bskhbYZCQns0Nm/Dq0LGrT2fFonD7wVFbTqlJYTtp
 H1fwOhvqBeQjbafdfxOdDFsvLs5jbLJDMdn8kCa3tKwbBVVMIIOOiY2uYvF79dhqStEE
 VVgYzZrCnEJaTlGI0OrFoNfritR750AjY9S397E73o61Z/KulSPGqUCzW/ceGNuAzc7p
 KSzblawzxteieNsDQ0BTsxVJI45ZJs5QLycpTHbxt+NEOcdztobHNpPz/mEMm59RRCIF
 l553Ylc0P6myNbSEQvtc1ETxzeOGLN5gTIaQeI2f9dqG2sX/KXBqLSwdew9Y6L0uG/9/
 ArlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782756038; x=1783360838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rtXjbHDexOA84B+QzAKPNsomuV+B7DR68fw29eCSZS0=;
 b=hiqqJeY7AF8jzK/Gp1o5FntyiLsgqw07Wh7n6XaowmnsjVq7tHYx3tPeNP0qjDmwCm
 9oia+I4kWn0ch873Mlcu+9xrRsWDDpZ7Rb/8wojVQsTKuWwt62oSmhkJNu1KeHEoJ3hs
 n+BJVIYS/OBZIWg8JcMin8zlO8wV0LC4r5Pt4PPJY6arKDbz4VDddyd/18h98LqC3ew0
 +3V0U9vvGi6rMR0o1b54wsoCsZ2Q0+Gmz4r+A243VI8BO25Es3us+i7CY02lhx5mfuUn
 NtHcdhZ0Zbc97LDO/ukJ+WAJELJqB1VPfFMjsx4uQfc+nrvh/a643RDZwt6dnYNnlO3B
 ghOQ==
X-Gm-Message-State: AOJu0YyFMXneF8YzTLcrB3XhQlI3Hj/2G/eygthykqMVIcWuxf6K1fNw
 xbSPS/BEseTdoxkwFOZlE/3m0p9bcrc5Suy+8wK42UQ2EWYUmFoIcONFp/WShO3e/5A=
X-Gm-Gg: AfdE7cnGQhezQT3OuZ3CvZ9sMBUAyp1XIEWXXGAfewHWWBhDFnuXOgs0YBaLFbBx70Z
 nHsNtEF9tmuWOBRlAF04uRaED76zjWWj/4ZKM4ixc2JMJPg50HfxLwFtVqAoLD2VJmL6Kfn7zt6
 dTipxHbqLCjsYM1qLhxIMtV1Q+z2x8YzVMs573NlfpsE7i8H2iDCfbrEFENjfESmQL/jpWzfWbZ
 XC3FjCv6vQYPOM7y5Z2YIhoV2SeHcj4Dn6i2j25AfWQn4cGEtKAXBsRx4r/V4XacfMhGm6Mxz4/
 VbLHznHua3pguZVigsDBNKtqLYyw+0MqVC0rujNEozggDiNWqWpZC9UPtrfJay9NTE2DP7WzRc4
 MhWTW9+o1o1TKw0haoa+Zkf4IPZcy+5MtplG3VFKe8osjZKxBhX+HXgJCz9I4AF2zmQ8fs+y4Q/
 X5mDaA8lh1PnkjVhF89VIwS6Fm59a1trUP7H9yw0lAhBHb2LENd1A=
X-Received: by 2002:a05:6a00:4c08:b0:847:982e:cca0 with SMTP id
 d2e1a72fcca58-8479f12c788mr392809b3a.19.1782756038193; 
 Mon, 29 Jun 2026 11:00:38 -0700 (PDT)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8479ff8c6f8sm139433b3a.1.2026.06.29.11.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 11:00:37 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/4] tests/kms_plane_scaling: add search for scaling
 limit
Date: Mon, 29 Jun 2026 21:00:01 +0300
Message-ID: <20260629180003.3215052-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629180003.3215052-1-juhapekka.heikkila@gmail.com>
References: <20260629180003.3215052-1-juhapekka.heikkila@gmail.com>
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

