Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179A5C61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 17:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A8A10EDED;
	Tue,  1 Sep 2026 17:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X2rLTEpk";
	dkim-atps=neutral
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32AE10EDED
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 17:07:49 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-cc1e1ff659bso142848a12.0
 for <igt-dev@lists.freedesktop.org>; Tue, 01 Sep 2026 10:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788282469; x=1788887269; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IvMmXSqTmrASafe1jW5j6EUZL4Wlz8EttZ87Qm5c8hU=;
 b=X2rLTEpkitsW8p1cSSQ6L16/HmyYvTpKydxaptEa1y/2pSwLoekVJ2Qj0ntuXfC0bn
 dXUqwyx/WQQUJ36fO8bNhAyLdo2RgZVDAKgiODDBhAaIHYXtPBEqko27th08r3Og2Xkz
 l8SjBqN5Dy8uGTnI6TKdV47eNZpqvH4n7ColriH7ODGYYD+mOA3DJkeKTpMd5A4SxYme
 UjRq/s7VhA9xIB5PmufeZda5n0FdzvuCCFG4JXCx8JjJ2LixkyiB00IDROJdhZlKfdAT
 U0f3aIf4v5haJimDg0vdaVC/nLMKQh52EKhMEnqgoj36MoDYphM7IV9amd9sGl9blnd1
 hJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788282469; x=1788887269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IvMmXSqTmrASafe1jW5j6EUZL4Wlz8EttZ87Qm5c8hU=;
 b=IQRH0ylWY3CL4dyIm6b2V98UDgUaW3aK5yymRJu24WOd8Gm56X5MdIyGE9ptAUdyrk
 uQZ910moCEpaw+U9pO5DaGZniWmZqDmjjcs4naYq4XXSBMFlqJwJuwFy9d7DfKtzfqkk
 PTXIQHT16Re5j6loWXsHYKNPAXZO8SH/BVD9oKoJZpWILKK7/beP02uJMsT/rhbs7q9O
 RYcVvDjHhEBJT5rhubY/3DACSsTrc4OGApzh0ocxGg/1UkflltIJBHPRI623KGe7na9c
 GQjQW9a1vdS/XHeDnHP84xkVFZFTXCkmFcqwrBT9CZoPMazd0qjP+/oDnvmDt2/Rjx6F
 8Udw==
X-Gm-Message-State: AFuF++lhS8qjAeuvaoqBGorWZe8lhRWbEPemHWaUZbrcy8+zn7ubSr6P
 DGJVOjQUyx5klB/J2mPbQXts5imQBhctv/a/yD+GmzRZlTxZuOJTbON+PCOU5T60ia0CpQ==
X-Gm-Gg: AYBFou3O/8HAXxiVaJokiUAACQQHli7XNUNlL3iMheh6zuHSFtL1PxSP+o1OomyuWOz
 JtWVU/rUca210k/PgJD5UVldBz0IWZQgHJgd+wSbqcBTCEazM2nyWYn7jFQxk7RdY/+Qi9wxMHI
 UzxxJJuz/rfVTHLKNkalp/PdhMiMkpv0ZeUQIudBkLU58zWQvE8uobitUPll6Ey3FlDcG73fsRo
 jSgTkO5fqHVeNWFKzpYTqsCsBRSvYpaV85m/FepNce8a1Q9o4/pBO0RPM8VIHNbNnBVQ5OL7ytu
 JpEzzBtGOWuPL5ZyU9YRDCWC+MQViDSI4gdtQVZmWhGe7Av5Qo3qeiZkAD+gnQoZE2f8yPKHo1n
 aPerlwqKarSyNErNYvzayA4hGeClN6YZ3tddxOkMB4YzdtshQnLEQEkPU02ZyBbV5Pq0aUa5WzK
 X91StHEBrN7w+NcqtE5Ksaf2Nb1tTdC5R87JrPn490Ax8mlmvhKyRMoFO68ESfBIXVF11mPYvPN
 bvEzqD0Cb8f/n7o9JacBRxafEg=
X-Received: by 2002:a17:90b:1dce:b0:38e:5b59:c2ff with SMTP id
 98e67ed59e1d1-396d0ea8b47mr54790316a91.3.1788282468662; 
 Tue, 01 Sep 2026 10:07:48 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396d7853da8sm7984104a91.4.2026.09.01.10.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 10:07:47 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/5] lib/igt_fb: add igt_format_get_subsampling()
 function
Date: Tue,  1 Sep 2026 20:07:36 +0300
Message-ID: <20260901170740.1079715-1-juhapekka.heikkila@gmail.com>
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

