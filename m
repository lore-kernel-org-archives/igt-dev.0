Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E421C5ACD1
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 16:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E49310E811;
	Fri, 20 Feb 2026 16:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fic+7xVg";
	dkim-atps=neutral
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31A610E817
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 16:18:13 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-2bd62e10a72so4483413eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 08:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771604293; x=1772209093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xNvrsISr+mbAQhEkd+uBVye9SWKK8mq9iY0K3HEyNDM=;
 b=fic+7xVg4NlzqGw1ztNGKGvLBGpXgeSZ8/4UZlPCM6ki5HTjCROW0eM28QSIO8pLrc
 OUUVKBLAXJ2/FrhSRMHv4EVmXoNA6ky4MoAE+Eh5gbOouJfXKnJqtSYND7T+cL0RQJDy
 xaM8LDHmAsEjGvl5zCa60HROSGYTRCEnV7+FzWQEaslgmu4G/MNDLYTekp5uqhhJsPHw
 ANd6os7G0u0ladT/YaE5/OCko2GHRsKqekN422ahutG16XC+31NMDIEfyKpEDQsAXJ97
 61EtSq5Kr39qNa3/votM1jGTJgCkO/Ayi3JptYHj9NlWgtk3bY7OoLSpTPOvgH+Dk6a0
 5feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771604293; x=1772209093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xNvrsISr+mbAQhEkd+uBVye9SWKK8mq9iY0K3HEyNDM=;
 b=Sx6Kr8fmuUqmxLjMyJgJCZYbPvuZssHWpijy2z1DjiGMvVmP8vYSD1gfMEiAK11B7p
 KvWk7BBZgg2UT4lGK2sXRRmu+mGUufKCl/awe3dE/J5p/MDyow/lxSeZE6sZIh+3QSyO
 flZYu4PZoVAJSs+OfU52xcLu7pgGHKh6LQ1b5yqtLcV5HS3lx9+5Qg5erRiwO8nlc9UA
 y9UlWURxCv1IkFyetJSgRbRPrr97c7nH8dBVb+xsQcKNPMDGQYzrp6P7c9cPADYfq9PJ
 o0EgdPco3RtpONeeF4ADo/HBbumVIUxlUDRkmE2vDXMJirg+6shQgYcnCGelxQ8eX+j9
 plsQ==
X-Gm-Message-State: AOJu0Yxx2L0AtZsoIUMaXuiVC7dFZO7RgTsxyqtff0mGbEoUkaT4CckT
 1LwtZQRjFgW4qStPcxju+B5VkxEN8DW+238KZCpCoLq5kWEi4ZlhBr8oW1a0QD4V
X-Gm-Gg: AZuq6aLLZY/Tq75MmgooL7ZfXIXaITNssiBpPJ5efoEqmL3EDmc7HyAcGz/zsjZMPkg
 AZFkA6BO0MDMVPttcMvL5o5ZUtVQ1GRdZvOoYDvKXkyXfxGOfo84g749LzsuKYDbl0eHmcZC/zk
 qObA3oCSQXh/6D8gdcKMZ6ZkUxwUmgab56uBTD4U+msxuZ2iQ34S3eCLRYyjyML0UCq+uOOe+uv
 8vjjDUOsxjA0Jw0pTxB/e2QLTZ22enJnJII8h3VAnbEhW1p4hl2fUAGmvb1l4pLcY8pRbojmO4X
 5lgLPJGsQVuy0aBQn71pN3BwF6Xf7X3eN1GOVFdqonNzchKYxJDo+n5+xH5rtVY9l4z7uGwhiqj
 EEROJ0RckNR3e1VeNqyy0awY/1Okxg5nDy0dgj3JolnSUYrYkKN6Eua1lZDl8qzi/eg+w4vHla+
 PMiW3ooeMbXJQG2ipspuDYEHCQQ/uHKfW2t1QYVYHHM0z2zgMP8bKkJZqoF+E=
X-Received: by 2002:a05:7300:d70b:b0:2ba:7404:f587 with SMTP id
 5a478bee46e88-2bd7bd5a0c9mr64954eec.21.1771604292797; 
 Fri, 20 Feb 2026 08:18:12 -0800 (PST)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bacb66bb08sm23671918eec.26.2026.02.20.08.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:18:12 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 7/8] lib: Enable Vebox framebuffer copying on Intel Xe2
Date: Fri, 20 Feb 2026 18:17:17 +0200
Message-ID: <20260220161718.652862-8-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
References: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
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

Choose correct gt for Vebox and use gen12 veboxcopy
functionality on Xe2

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c            | 20 +++++++++++++++++++-
 lib/intel_batchbuffer.c |  2 +-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index d59fe133b..cfd5d66fb 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2560,6 +2560,7 @@ struct fb_blit_upload {
 	struct fb_blit_linear linear;
 	struct buf_ops *bops;
 	struct intel_bb *ibb;
+	uint32_t vm;
 };
 
 static enum blt_tiling_type fb_tile_to_blt_tile(uint64_t tile)
@@ -3345,6 +3346,9 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
 	if (blit->ibb) {
 		intel_bb_destroy(blit->ibb);
 		buf_ops_destroy(blit->bops);
+
+		if (is_xe_device(fd) && blit->vm)
+			xe_vm_destroy(fd, blit->vm);
 	}
 }
 
@@ -3364,10 +3368,24 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 	int fd = blit->fd;
 	struct igt_fb *fb = blit->fb;
 	struct fb_blit_linear *linear = &blit->linear;
+	struct drm_xe_engine *engine;
+	uint16_t class;
 
 	if (!igt_vc4_is_tiled(fb->modifier) && use_enginecopy(fb)) {
 		blit->bops = buf_ops_create(fd);
-		blit->ibb = intel_bb_create(fd, 4096);
+
+		if (is_xe_device(fd)) {
+			class = use_vebox_copy(fb, fb) ? DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE :
+							 DRM_XE_ENGINE_CLASS_RENDER;
+
+			engine = xe_find_engine_by_class(fd, class);
+			blit->vm = xe_vm_create(fd, 0, 0);
+			blit->ibb = intel_bb_create_with_gt(fd, 4096,
+							    blit->vm,
+							    engine->instance.gt_id);
+		} else {
+			blit->ibb = intel_bb_create(fd, 4096);
+		}
 	}
 
 	/*
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index f3b8aeaba..ef89b93df 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -697,7 +697,7 @@ igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
 {
 	igt_vebox_copyfunc_t copy = NULL;
 
-	if (IS_GEN12(devid))
+	if (intel_gen(devid) >= 12)
 		copy = gen12_vebox_copyfunc;
 
 	return copy;
-- 
2.43.0

