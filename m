Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233ECCC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 13:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9835F10E168;
	Thu, 15 Oct 2026 13:17:31 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DA010E168
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 13:16:35 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-3acb11973c3so183372a91.3
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 06:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792070195; x=1792674995; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IvMmXSqTmrASafe1jW5j6EUZL4Wlz8EttZ87Qm5c8hU=;
 b=cMHTZ7UUzJwlkcTSQOZ+PlZCfBNlqe2UrDWy/2cn29j6HiL8TTLkWSq1a0mi9WKJCy
 KTRTii+ARy9Z+r6QKRSFaVjTpy3mihkOpEBMNi3wKtMDGU5Ztq54knRv2bErkPZjreh7
 U6iC7AZXBrzJMZ4T0vFiCsR0UKOE1+OQ3JaAiCm3o4EFu2ogR1wt66PCTnFX0o6EAa48
 nKKBgyXUdgpjt8QBIWM4N67EP/ZSv+AIhf6WGDvbmbo2q7wNEs9qi1EWp+UCPZEbgPy5
 aMrSLbzBso3wMKJ1EkOs+wAvhHHcXnGiA0fElNagYCVRM+NH5VYH5VsCD0ZzOHDIP2d0
 LGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792070195; x=1792674995;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IvMmXSqTmrASafe1jW5j6EUZL4Wlz8EttZ87Qm5c8hU=;
 b=kemED+pgEbTp8Khld4ZhpOhxN4lRqfJ7pyGG+eSHHPZkg1M2FzJJ+BrGAC1Mz+0dG7
 3trpfuCX2t4Nzi1+tEjvCAmjfky5jqt1M6p8yogB2qFM3ZuCT3T2RbXsxFLjZ1itNwLr
 6UyGCYZe6V56hHPVBHU/DcZ4N/rN67Qw2T3xadlWyDer+jwHrvKtM370oem54B5+FIdZ
 Mxt79J/myeLmx5I9yjZ34MguRL9f7UFEKAfiXb4bX766V9gZ97lvlpsQE2cd+0tSa/Wy
 0RnqLoojmAuTpvru0kueHlXcNqm2n0+Ww4pY+NlX6c4W+1jcQ1ByQTd4PG4ZUDNb2POo
 FBeA==
X-Gm-Message-State: AFq9FYKJ5+E4MX9KiZAgPi8LnI3ff6qzj0xHJ+Po8ApfC+xFhauz2wIL
 cTRVptifKO6nPu91J4jh7GUW1hvRPN21CKUebozbgSs/eX/g27ja4aSrI8vQug==
X-Gm-Gg: AYBFou2qX7sORhALxCEt7FR2PTxS2NQUaX5f2E0fmZB8vPOJGtDBlb67RC6OfYnD0/e
 PIF4zEWWd4TGeb9F9baBidWGYDk7xCT8e39C9WHlq8XmHTuKzWO8YspmqG1kGbr5Eqap4MFoizv
 sd9DaIafjVVo1gdz97naJIZ5y7qVN5+fKe6p6EgrgfaOu/iJFUPXK0I+ygutUmefyAiGO6hmjJu
 HhKHN2qLoGUOuROh+489qHRKNkLlTfwq0BDUvexnAhAnePmasxnL1dRGnTuXrRNHemYm04CNDM2
 wB+JP+PzbsATthOvn9GE7MRP+QGLqtXH+hztIzqTrTzQNUO6fcIAQZ/AOAOzstBlPCUezYIC6Ox
 nWIAM3TUdsVQs3boYLxP+NSFcsOCRrjoTrjB6MBCt8HzBMUemHOjHLTXkZetd2/2nj+UCgdZa+A
 mc2nZYw8eOfcX0Hf+zPPy7PPFM7NnsOn5pDHEaSKzu4TQ5lEfS1UnevHPEMXiwyAM2UgkhfgLX/
 4/azzoJYQC7rnjSCBxvH1IQYpZLE3rmNFRv0i9OW94uelM=
X-Received: by 2002:a17:90b:5346:b0:3ac:86a0:5766 with SMTP id
 98e67ed59e1d1-3ac86a05c0amr3642456a91.63.1792070194586; 
 Thu, 15 Oct 2026 06:16:34 -0700 (PDT)
Received: from localhost ([134.134.137.74]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ac943e74b2sm4457681a91.5.2026.10.15.06.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 06:16:34 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/9] lib/igt_fb: add igt_format_get_subsampling()
 function
Date: Thu, 15 Oct 2026 16:16:08 +0300
Message-ID: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
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

