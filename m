Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A0ECA600C
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 15:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A324610E45C;
	Thu,  8 Oct 2026 15:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U2DDfyU+";
	dkim-atps=neutral
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BF910E45C
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 15:16:17 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-cc4b1f7e8f4so1505899a12.1
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Oct 2026 08:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791472577; x=1792077377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IvMmXSqTmrASafe1jW5j6EUZL4Wlz8EttZ87Qm5c8hU=;
 b=U2DDfyU+mQ5hTwWt+TNno8FoPEsD4pgpNuEVh8+4dnGnamUJi8RDBGnXZQ0fPvbYQ+
 tTqlOf6zXo/Epc7d/aoqP1OrTy1RpR+4H2May4aflcZgVgfGGRNG3jIsFbGfZggv515Z
 1yypSMikrr6g10r2LlmgB6VrBaS1gLhmk9Y8eWkYiR2PRJ9OcBTJL0y73LsDvB0Cao4Z
 ADX6IZbS9WrpbX302ZKASv5IQFC22J2QraiSXlzSKC7cAW0Y6A/aeDHspA/orDG4CaKP
 I4YbWC/Yjy4uOEHiXLjaokGoeIrXvsU2xNhI4mlLer++JUNfIlnnLlXsf3wNo46rF4N1
 yE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791472577; x=1792077377;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IvMmXSqTmrASafe1jW5j6EUZL4Wlz8EttZ87Qm5c8hU=;
 b=kjlOic23G2ftqjKQQBqb8mvN4VgtvpDVwWp4VKHiITSt8TX8jWQFNJ3TYnmEB5RaSD
 lUsmg7izXCqUslz7PsMMFVlptKu6Ponlx3PUd/sFxPHBCto7Cceo7HNxRQB2uVQ4Iguc
 IJTh1owjZpWWIuaqtgvHecNbRBNJNAW07/ujNe7LAsHTQyjURlREaPFzPDqz3wobVS8q
 y6VvxhkJAiuLFxi7WpC5J47NOJGdR8CxR/cwcsuVAbmaTp+hDqbUib3SuLE+NBGzSrAd
 3cxxTAuH2k/5M1+u2coDf2jsW0Gz3meBrHvEKOiIrTfJgWkvtTnTFGAzbbQfEvluKVV9
 IPbw==
X-Gm-Message-State: AFq9FYLe8djUjIjUVpSn/IO+XO332xEyQMjUJAQZAlg47E8O43gv3TXM
 2AemL9OvjLVaM5II4OyOA36MI9tUHNAUOu3bFVQ92fuR/LZUUtv2Tg2Fb5hPq8jjlSE=
X-Gm-Gg: AYBFou06UQXtXtHQvoarG6pV19qRWPvm2vHqS8/mrZVsyISm2tUHNAYnlTr4A2/FPup
 ROWOWlT/JFjmZ7xa6A/AN72EsxW5w+TW0qN7qunzOWhlc1OH35WdIj8HesmTYmKROxnrEIGvw+7
 MiPfvFzYG3WMtDD29qQsIThnSCNePVVGaG0jHe+PX4ZkD0ZfVZoO+SgFj+SL0mtp2mSkwdTdsfX
 ePs/fchcrmP/A01kXXnJoULh+HHBc6RmpAE6AHSYhaC3uKjYYw5pfYIGwS3hgRSZFtVGAP9iDJb
 KxN0g4t/B0kfdDDru3Ht9MaSAIpOlm7OP8J6K+7c2Pl8Au7ns4igWzP1g9zf0rTGde3LnUkIBKh
 sS/taF98S7SDd5EM9u4b82TTRBGc3bsmhljC28XO4cKkHnCBclx0wwj907NKxAeWFAu2f39Wq5i
 B5mYl0UxaSTlbTkc8cgfqwkLxs8hVZ4DYrrQ/DhySD75I/zfGjfNhaXL71Mrb5jSsPJ+kePiRw+
 rLdAn/T5fRfztLidsFDa1hZJrMMB6m3+uM=
X-Received: by 2002:a17:90b:3901:b0:3a4:a525:56fe with SMTP id
 98e67ed59e1d1-3a89f66d54fmr4717771a91.5.1791472572212; 
 Thu, 08 Oct 2026 08:16:12 -0700 (PDT)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a8a60e5166sm4909495a91.4.2026.10.08.08.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 08:16:11 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/5] lib/igt_fb: add igt_format_get_subsampling()
 function
Date: Thu,  8 Oct 2026 18:16:00 +0300
Message-ID: <20261008151604.2657835-1-juhapekka.heikkila@gmail.com>
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

