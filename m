Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B92CA601D
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 16:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF03510EA76;
	Fri,  9 Oct 2026 16:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JbFlIshS";
	dkim-atps=neutral
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2721810E192
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 16:37:46 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-cc1d57602e8so2135710a12.3
 for <igt-dev@lists.freedesktop.org>; Fri, 09 Oct 2026 09:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791563866; x=1792168666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4kwEQrS3yca2u1YsB63pDt0+9uQROEBZNrSIYROeZNg=;
 b=JbFlIshS1UQcVhifL9lJ0XXkg4JRkNLAopEOfnuCkYEzAAltHEWXNPrRuaLuWzsbol
 tiWC1Trs8CeZFl+K/u0L99lbMHg0YOKccOQyIu3/DycLX2n+oZF0h5rMLF8HIKjpr9DZ
 uUUHGQtv/WGNr/hTaSv2eNJh2ffA2I5akHZrr8qHW44vTcbHzBgfI8K1Xp0wQs64gwZA
 pdKAXdONP4bNiWgOAWjjPkdnoXn8v5pTtG56WX6oJQBjdLgeeT09oBilAMXKYc2rdzDm
 KA3xxXdLPPhX2CgUZVXEBRwQTKSiuBkMYp9aJ5y6KNd/07sS+4DWRYCW1jdCeBtXC6Jl
 dfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791563866; x=1792168666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4kwEQrS3yca2u1YsB63pDt0+9uQROEBZNrSIYROeZNg=;
 b=eYZ05weZsiEKsygYzrihK+JUg9ljsRsI0MLWxkd3joDSjo2Nf+hVHM1ZBnrYRj0iFF
 2OpKMwwU5eSc3Mh7p7fKUYuifxe3fNoKUaVmHumXIsuLVtdxE8iSdLPQN4+xHwZUR7CP
 rOejMKMyd7a2SndEhTXJSSD5AUus6mSMGZZMswSI8RzU2exv/MD2qRoibclLeOgSHHfi
 CEDJCRwNG36/TUSS3Phh73P4E5/7zinXszapNeZRfo7ai7kcgrQX08UkhtMTMBuwzDsH
 GSU2IOO80PirA8TukA4f1wldEAeBPSCllyYisbOCJWbje6LmcOura9S4LkUu9tScGFqQ
 qBvg==
X-Gm-Message-State: AFq9FYJgUfmTQgpTrCBjg5+7p0ZuciQSmfi0a0LYplB2IKUKctFeokJO
 7w5Ups6N6Eb0xUpwAjhRKWMFf+NG+VMjh8GZS49e2EgcBr+camJD9o7/HlDWiw==
X-Gm-Gg: AYBFou1idq5qXTzlVhPqrKUjqdyPY7GcfRMPGdck6qzGJfdyG1WFNPL6Jo6H5E+C6J9
 fD25v4yLonjCEyFK+Al2hBikVDHQkyjne7FM5tROJN2pJtXZNBzmKK+RQcPriklbn8TMEju6euf
 ip0lXakeDxTCRyYwRJXAHu0k33rZhN5/gdbYXCaziToixJlmY1gj9B+6asXN1gwADZ1/nPChcR2
 7jCcVlaJiKrfSP56y0YYz6qkhYyXcNZUy72oyCFwsrmDYQdAb4kyq8bdM34R3IGb0a0BKT6U9pm
 QLYMBfeydFcbIoGgHHWcDtZj7LtK3wXElh2RrqC6TKbgrUnfTcWRrf9UDHt9SVVu5lJ6nywWU0B
 p65PLPNrIH9RKa/U7U2VX1lbyinBbRFcffL/z314XyIWQ4ucM78579Y5xnOrOIGl2eV4CeOc+DE
 drRXwr6zD4t9ttiYVHl8NFSYZzOvkVchWaVlOaG26xFSdCzc/cZPDwY+zW2V1OGdbAYTzb9KZlO
 1W2x32RA/bJSUUBE4cxYnXusN0Lbql4NxvK
X-Received: by 2002:a17:903:22ce:b0:2e5:cf8c:633d with SMTP id
 d9443c01a7336-2e842bc1a5amr22546565ad.34.1791563865468; 
 Fri, 09 Oct 2026 09:37:45 -0700 (PDT)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e841a04012sm13160635ad.1.2026.10.09.09.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 09:37:45 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/5] tests/kms_plane_scaling: add search for scaling
 limit
Date: Fri,  9 Oct 2026 19:37:11 +0300
Message-ID: <20261009163714.3809917-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009163714.3809917-1-juhapekka.heikkila@gmail.com>
References: <20261009163714.3809917-1-juhapekka.heikkila@gmail.com>
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

