Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C97CC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 13:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DECA10E8C2;
	Thu, 15 Oct 2026 13:18:25 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB0010EBD8
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 13:16:40 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-ccca948203aso2140801a12.3
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792070200; x=1792675000; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4kwEQrS3yca2u1YsB63pDt0+9uQROEBZNrSIYROeZNg=;
 b=QdoE6MzbW7xH1ZBdE9HbTO7Mthvcrly8aaAtpTtO3KCmCyC46OInS/0cOSFgosxzzt
 3ZSUgjzxEupXK42KiqkUAQzybHMCCPafFz6s1BMeoRs+VPXiym4TLmeD1j8KBtAP+PLV
 M9Pybcy1bQ/bcxUG5GDeMSTQhx+plNQ6b5JO8RYSD1W2EvAj1WPo+M1J41O/xW63B+2o
 rFK70XgJi8LyqU+aXH5GolvD9PVtRYZaPWk6tW2QIiJO55xKs44eUyHQ1s9zREwiT0VZ
 53ifqnSMWMpdhDpVQmz7kkzZkNm6CyyuV2D8mIZrDD5g6Z821+gG6C72Gmi+/i/7MCNz
 ZJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792070200; x=1792675000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4kwEQrS3yca2u1YsB63pDt0+9uQROEBZNrSIYROeZNg=;
 b=AnsISYzgiGjmVD+s0ADcNw8ucA7TIMBNUpBK5vUJ8p/lq/q7uxsVEpqepxCcnHMOu6
 gxBR1dzIrVuzvlu0S7rlEQoj7Nk6qxIbjfSdUpwxj9Y5mseT1wvHp2n/eh79Ed9tCRvQ
 4HKBCwIKsAr6ztwo45QrB12rcR2Aqo4y5XTWU1AbNZYTNO7fqTOHlGDCSDSSVvYEzO0G
 7BNXfgSMTTatwj0VQn1Sfvq3pv5UcyWaVsfRf0xVnx0RGmKDXNc6eBrCbW2QXtatnEYj
 ValL4KV7MRMnPkAznef4/bwz7ro2WZXDd7DQ/Gdnm+eTFQtc28aCWB7ToyM69nXq8SMT
 vThw==
X-Gm-Message-State: AFq9FYJ6+L78LVNKbhTu8yUgMQoGVepyWGAp8uDbeNk9XuOpPIYAJtTA
 qlk5YRjBFtwlAcK8EICTp3KVJt1yJ1sxMdKwM2BfUyxGm9V8/2mk8E+RPpQj0w==
X-Gm-Gg: AYBFou2LFUH7MN2F7J4miTZqsnap7IePHn6wWv8Sq/on+Pbnl22qNB7SPvldrqFRN6F
 KSw+zs6dYxR+YveHZVDmf5UGn/3jTankJ0rZTbF54tYiz1zC+BZl2bQCKDCCkAD53bAJIXUPAWu
 oO2AxyPuFn/stLq+gMc2ndjbqb7qfws2eeOsnojNLmTNazbuZJpTKoh4aF4uBHHWaLNHKCDOl/H
 bb3bvkAPqp/ppxuG4gEoXnZvmHo+5JwlIKZrJzB9sc9QAt9YQlxfvtthFTqTG0kLCXpJWKrxP5H
 LNajkM3P+9+qm+CeBX7Qdd1nWFmvfcpVVZqDzwOeKJAE7/3WYy8mjRASbVMJc4AyQtz/zFnmx+5
 6qfjcfaJS7C5TAoR8txYMICV/loGqHJXQ5FYW0PtJGTQUzB4L0ePz/ZAkF3TjUQFZK7I0WpqqkZ
 /A3uOOY5QGS+/ptsneEAlx8ehcmezQa/oOf2ACRBNUFQ1QM4oSXNj0y4pZ4J8gJCHMMASnP8SJm
 OXvfd2cocRomK6wSBj911sqXgFcQerXw8pT
X-Received: by 2002:a17:90b:514b:b0:3ab:22fe:b13e with SMTP id
 98e67ed59e1d1-3ab3ae6b03fmr16750750a91.53.1792070199555; 
 Thu, 15 Oct 2026 06:16:39 -0700 (PDT)
Received: from localhost ([134.134.137.74]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ac947d2706sm4474861a91.16.2026.10.15.06.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 06:16:39 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/9] tests/kms_plane_scaling: add search for scaling
 limit
Date: Thu, 15 Oct 2026 16:16:09 +0300
Message-ID: <20261015131616.3172918-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
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

