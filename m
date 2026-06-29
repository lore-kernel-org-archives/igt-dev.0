Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1535C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 18:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B48610E0C7;
	Mon, 29 Jun 2026 18:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J9uLxU3x";
	dkim-atps=neutral
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3E610E0CE
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 18:00:34 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-845e363246aso1604825b3a.1
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 11:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782756034; x=1783360834; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t95nATqkdrJkX6eZ9nYVm0zeVZVpa1KTv5C2qxZC014=;
 b=J9uLxU3xT8lJ92VHJSWzmMRlPODbWZLfof0jsWGPv5BF1mt9/RVJknFYBj5fhevKih
 36qOb8prm6XPIWbzNWaoItMHV4/XAEI1xzqdpjoJnyrYr/SmrbjKfOtJoINxoMtXFcON
 +ekODlFgLTnRFZ6wi76RmQMTtnjl9yQYEF1bmNphLG4wXTxvqsGuYKgnBB0lRNzGbCpQ
 XqhdJ7YZEBo7i7ypzgegefmOeQphdJmyCPGjjMp1gs/6evylNz4GY1METQ3idgO/GGKa
 sKZjEmwPX+/XryT/1ari7U04UeUi19sJ23ExbzZ7AyEAp9QYTcSXC8BqVCv3lJFjPBx6
 PprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782756034; x=1783360834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t95nATqkdrJkX6eZ9nYVm0zeVZVpa1KTv5C2qxZC014=;
 b=X/ZUCgazatgRRiM732wX7YD+qglX3L0fZCJSdvUwLmb7NO7yz/9hEsKvzNbos5dsb4
 4mYZMr7zZAbmMmhkfStymcWTgD3YqYr9oJbhsdwoBagvrlW5677y0KWndP7fXUafavGT
 2JOHyTkwV8cizhp4mOcmt00VSckQEQDW1tuBVXcUadcJwtW4q2LxQKV1UzXMYh450BRb
 oCBf6kvYLJp9Ga9rUdSv5CbvFXeT/VDswbROse+d6KAk1Wjw3B77l9KgN9KwJI7EbGh+
 JLC6v5rkVNO90T7hZXk4c+ZBQvr0TStkTVa5s4RVjwLeEvuDIojQaeyjR1v98wXow8Ia
 ZdXA==
X-Gm-Message-State: AOJu0Yz21bNXeN4s9nIvTFwJ6yyFDl5DiVG0YOFR38iON7QFxfPqrPQq
 SG3+xNwyX7+WvzOE/XhYsb6JCXA01Kyqgma17l04xHNY/v5QWCRAKC4M+w//ppAN8ME=
X-Gm-Gg: AfdE7cmFpg6X04dzonw2ZyibCViDy1yTocDYqF3V9f5U1OIPIYddT7+Uy0fGMI6E7nN
 xmGahvLZLfTOmC5pDLmwEyOiYI17GW8FOSpFagPEPYpueJzWPfoOq3JZHAsqQRHT0FMnht/QdrO
 taZADXkPkoPISMV33ChVvYTGv8GuCkWEs8jGMyhuMxyxEKy7IxgRZzhZGHeN8leCpAsyM792Al/
 lw6EHKFE60+kMQlIdq9XSAX78RfCo5QX2nP50qMrYLUSa+ukLA2t4O9W92wL7yVMlRXfTSeFHYm
 oC0M9BHSRhWIng8B7C+VezgRgl4qD43rZRo04KnJ5zO0OnNfi3dFZl58Dn45JZ9trOdfs3AGmiJ
 lKVLCHqkWCBt5avcIKd+sMXWLNKVgBx19U7v8wGMKBocnFnM8R2pcYTUsYm6fOAEE24Ycz/fdza
 GBcGXybDHv6J27hEsQAefLkzO5nZrSBD2Givyu5pdfLIglOTyVyG4=
X-Received: by 2002:a05:6a00:8cb:b0:847:8048:be94 with SMTP id
 d2e1a72fcca58-8479f27b2admr374326b3a.33.1782756033599; 
 Mon, 29 Jun 2026 11:00:33 -0700 (PDT)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847a0076439sm139173b3a.26.2026.06.29.11.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 11:00:33 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/4] lib/igt_fb: add igt_format_get_subsampling()
 function
Date: Mon, 29 Jun 2026 21:00:00 +0300
Message-ID: <20260629180003.3215052-2-juhapekka.heikkila@gmail.com>
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

add function to query given pixel format hsub and vsub
parameters.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 22 ++++++++++++++++++++++
 lib/igt_fb.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index e623b2f64..a7b5247bf 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -5259,6 +5259,28 @@ int igt_format_plane_bpp(uint32_t drm_format, int plane)
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
index 8e5907dab..e019d7428 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -231,6 +231,7 @@ uint32_t igt_drm_format_str_to_format(const char *drm_format);
 
 bool igt_format_is_fp16(uint32_t drm_format);
 int igt_format_plane_bpp(uint32_t drm_format, int plane);
+void igt_format_get_subsampling(uint32_t drm_format, int *hsub, int *vsub);
 void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
 			   bool allow_yuv);
 int igt_fill_cts_color_ramp_framebuffer(uint32_t *pixmap, uint32_t video_width,
-- 
2.43.0

