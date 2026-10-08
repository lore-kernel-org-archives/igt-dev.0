Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0626DCA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 15:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B8F10E45C;
	Thu,  8 Oct 2026 15:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EgfKB8SS";
	dkim-atps=neutral
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566CE10E45C
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 15:16:22 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-3ab27c7e68aso100686a91.3
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Oct 2026 08:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791472582; x=1792077382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4kwEQrS3yca2u1YsB63pDt0+9uQROEBZNrSIYROeZNg=;
 b=EgfKB8SSUR+dRApJNKkJGBfta1Ly2fUkkAeTzVLFLF3aMrkWdTqFrK+2TEko/9Vrp8
 Hf7ywLWxsyeTKCwntS1zjMQFq88mvYGCYO3Jr9hr12pu60JXit04Wyg4E2dsSbH4DmIr
 gwMrf+DApTiurGmPeJQJS+8fOJy0Ek10nx6q8ZpeR6zNK6tYrF/E1kDfkV1og1rUUMwo
 StixATm49832AUdDYhXLaRwZqENOk19jJAgB3Nz94sZRte+WjQkGcFCcQogo0oWbZKMs
 8z7CyVnqUM6FtdYj5iOg5itPA/8D3S4Yl8eUXfoh5UN+ZrXEWlPuve+ecAzK2wXECda1
 7a7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791472582; x=1792077382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4kwEQrS3yca2u1YsB63pDt0+9uQROEBZNrSIYROeZNg=;
 b=y31hEG70vI/d8D+N2AEoiZE/RHmYVEpgd8B2ca6FXF4SJwHWyzCGK4A3EiBx2+Z8f5
 7nXkEB6Y9Wv8LH1fRZFr4jmGt1yDfOguuc/KvOp8Eeewuzq+VQyuk83YYd/TYPwtpoIN
 pBQFn7AbobI+FtBrA2b5fo7jm4qBnA2kA2lTr+EYT57vbqLaZiZPdwJzuLZbb2EEPmI3
 XyKhD6obGMBFlHVtkyaL5fczkj+/8b7nHJ8Yw05bT9vSmegmFgzINNcpulEYeEp/NOR6
 5V6tzcH1eFUnoM11b5ZzeYn+DMnmSDKbeNloBFFx2wkf48IwPd5XKqRKVhfcNa/65L/l
 QUxg==
X-Gm-Message-State: AFq9FYKS4BH1s0y0w+HrRrMlavGKOYZ0D+qiNXIXIpVxAtFUCgvNQ13t
 hcIxfCYYu0dfpikuxcpRd77gxsKfCxFKLwCq3X1TKORXzBDeQxXWwGcVO5mkgQ==
X-Gm-Gg: AYBFou1OQhmDsmvXjB0hVQwjcKbO7NdSGUyY4W/x6vpFby2kr7eHzWWpVmrQP3Yk6eZ
 twf5mhw85ZhawKOuD48GCg2yZCLDMYr8Ydw6+zKarq8N19FM1ha4tgkqssr/yTXZ7LN0Xxib5ww
 s+c1XG0Vvnr+kUUJ3/KnFR3hboppg/1LgPE0/TxZ3z1voTIHr3MsUTdKLQG0yAu2MCS/f7RGaSs
 F94sLNE8XrfariqbJLQUg9lcqYIEj88hw9eQMNCgJKyjDBnUBbx2L7+T/0ssKEkcfhjP8AlAMeg
 iKeGGZxKH7KeKLPpKKUTaehAo0b/BoRSKPdfFJ+vUtwQrwaCd2zNqjkUsAj454zrjrVdxEHLD6Q
 96X8xEzNtiR7GhsUiYveiRhs4SfiIMP1VAvb1hK98xAvUZqeJP6zXmyjZUpvGZOIvQDW1u9BKn6
 2pSIC/sKpmVBrsQ+GuEyo34+t4ufOueC1CMF0P4jNvev9RbVjkSwodZfk0/5TPjQHyypkr6ERHd
 NyhtEQVUie8MGrJg/iawLy4ZcmCdMR3kuo=
X-Received: by 2002:a17:90b:5604:b0:3a4:e735:b39d with SMTP id
 98e67ed59e1d1-3a8a1ca90aemr3961743a91.64.1791472577032; 
 Thu, 08 Oct 2026 08:16:17 -0700 (PDT)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a9ff8669eesm4493786a91.10.2026.10.08.08.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 08:16:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/5] tests/kms_plane_scaling: add search for scaling
 limit
Date: Thu,  8 Oct 2026 18:16:01 +0300
Message-ID: <20261008151604.2657835-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008151604.2657835-1-juhapekka.heikkila@gmail.com>
References: <20261008151604.2657835-1-juhapekka.heikkila@gmail.com>
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

