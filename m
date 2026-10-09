Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F32FCA601E
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 16:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61A710E192;
	Fri,  9 Oct 2026 16:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aDVKNdnz";
	dkim-atps=neutral
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C8910E192
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 16:37:41 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-8ab432273c5so45069727b3.3
 for <igt-dev@lists.freedesktop.org>; Fri, 09 Oct 2026 09:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791563860; x=1792168660; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IvMmXSqTmrASafe1jW5j6EUZL4Wlz8EttZ87Qm5c8hU=;
 b=aDVKNdnzyOTVlyZI1GTDI6h2JdLii2Kv8gUpIgXFgYUw+40XQhmE8+TzkZmWSFQlGG
 Sl375fPTM1/uyKdJAX3282khJzIfMGivqdsr1PRXNlLFnU8BM3wkzjkl3EhgD1OfhSqQ
 UVbRm7wjlDhQtF0J1TsrhyPbY+uVbL29fMz2l2V/fZHruiZlCOsHEHCw/WhMUS59YtoY
 cyipZ6Y3AsluSoikO+SeOd4kCOjDUSHuHmbeIJbMn38uJlYaxBUEXviS4b8AyyqfQAZz
 +IovzftAgtQ0UiTfJIvMsrxqHN0wGqW6KSwYiffVwVIvT97XXjpkSt+SsXHHRbvq96V2
 Rwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791563860; x=1792168660;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IvMmXSqTmrASafe1jW5j6EUZL4Wlz8EttZ87Qm5c8hU=;
 b=wQnp6g4viOFgaqpiRdpeGRh87P3+CObQ7844gmHYYyxtk4ZlKx5zZtwCmUctPalO7E
 gdi37+xohubbieqJs9iK/owASQhPebUDmm8dOo+yTk+Pv2f5ioHVhoGhM0XcJt3Zr4Bo
 gI09UE6TGjiiA6WC84Y4EcKnWo/AKEMNvkDrtIbUZeLupkkJmqJr0ySPyPLwsLh/eHk0
 fMQwmIPvIW/Ix+1dBVeNYeKOlcm1aW9sXQAIlC3rTdChrxz4iU+lUdo2VsUNF8xfbV5o
 Yc2zTT8qfPR1zxO8eYkX+u3F2iL2jve/WK2GV8HD9EdXn159w2+aDcrBMDAfarGgBsD/
 eXww==
X-Gm-Message-State: AFq9FYIrkRRFe1cg007S3gce4qZShNANOzol+QDMiSaP3453IYn/3U6A
 E+a6cOPa4OfWjCfAmh6SmXSJVVqIDU+pfZYWIkkLjHcDgRqYiNosxAI30GoOKOEpezw=
X-Gm-Gg: AYBFou3qj73cq3aY6rbXiv7Ty/uxsaPXzQQT5vG9p26CijIU6T2PmvsUOUIbLeCwwy1
 sFod7kpUuFfgzBvMXZKUtmf+SlBtgnPbb15B9ZhLKgguGgnR9kx0KwAz8jBxYp6ySb/u6AcWYWx
 aTxu4ppO9SuWgKNBSRpJ6cZLxcSS7O7tACxaEvDPjbwicqF2RhboKyJBtb+kaMZ4NDwyACezHe8
 u+tJDUkphAGmrTvscU1aiMjiNqgMtZ/hz/2Pejj7Drrur8c5Lrnx7ZAWLnET8TvnWapzuJL7M3L
 z/DuuVSdjWIo0D77rWu687QKX8xDAaUbO9UHtNtQfv2bBnMFnhSJGxsLyD8mTEr78kCD+MONAkj
 kKz7rW5U/kj+JYtuzID/prKHBtbyLCTN1Unv921aLvoUjFxsJZV++QXGgN2wNhh0YtEK7o8RHQl
 QQpHGe8Y4TQP6m5ViPV/WAgugUIcSyMLTq9iWNDJc0PkUiwEG3CoMjNVlU5Eal5/PUvLEFYLRE+
 7tMIMyKxVg+xrzLvqm2YDmHbmUeC9xmmcc=
X-Received: by 2002:a05:690c:e146:b0:8a5:208a:d928 with SMTP id
 00721157ae682-8b07ee7df8bmr7625957b3.42.1791563860217; 
 Fri, 09 Oct 2026 09:37:40 -0700 (PDT)
Received: from localhost ([192.55.55.42]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b07f22edfasm9431397b3.34.2026.10.09.09.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 09:37:39 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/5] lib/igt_fb: add igt_format_get_subsampling()
 function
Date: Fri,  9 Oct 2026 19:37:10 +0300
Message-ID: <20261009163714.3809917-1-juhapekka.heikkila@gmail.com>
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

