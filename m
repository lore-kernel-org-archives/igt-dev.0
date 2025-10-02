Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431E7CAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 15:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC7510E1BE;
	Thu,  2 Oct 2025 15:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="otfmRh8F";
	dkim-atps=neutral
Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com
 [209.85.219.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7257410E1BE
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 15:17:18 +0000 (UTC)
Received: by mail-qv1-f73.google.com with SMTP id
 6a1803df08f44-78e50889f83so33203186d6.1
 for <igt-dev@lists.freedesktop.org>; Thu, 02 Oct 2025 08:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759418237; x=1760023037;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DWuBzH34wx7+JSR6J1VDXOgr3pvOx1+3BLO//xGhmvE=;
 b=otfmRh8FF1DMMjWTfvtN9yB+TdPakaVfjKIukIIQ29p3iCPxuRqPp2+HRjre9ByWjp
 MGc9ZCTSdmj2YnUrvAecGW+tBIFh2sPtNdsoZNItROXAzh9vtx+6U2kLVolUu4G0N4yb
 j0/xNXhngELRL0YpSQviqTubP0Wm7DJPzVgJj6FToy9k+YogH8RaXSvZACa2S1K4AGwH
 Z7ySq9XbljhcSt1EhfPmyYmLqcPeZBBwwjqo1yob98HQmH3+BgLyTMduI1s345FtuVOg
 4N5vauzmlMSVq5JYM91sDDyeN/jzMI+t10DRDwkmC1XHwQkjzwiAVt+PT0fIY4vRqOb9
 DZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759418237; x=1760023037;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DWuBzH34wx7+JSR6J1VDXOgr3pvOx1+3BLO//xGhmvE=;
 b=vz2cv9KrMik5hnDdEo7+V5muHv5uELhZEoZ4fwIoo5XcwN1jEh+OWVfUViIl/UNDbJ
 XFM1eQIY4CbpSl4tQok7pXJtcRuPvku0lQt49s4RFEeYBYgQYeh05kdOkSimJijuu6cT
 oBQxEn0+ctSnu7hl4fijW8ENVnqs3UUp4o+SGSw5DWOF/LipNOqxkiTxQn0YOpKMWmNw
 DJBGuKM7bvUsdAJM6AJ+agvLVLY/PMkO0KInwP5x2cLlFBvOSySFy/2v44/u7rt+g7OY
 9efvsDcHS97WFNRRj7ErMgVG7VwcHba6IOHNGLzGLA9+aKKxvg1sAOaqjY8Tf6lIwU+a
 KQpg==
X-Gm-Message-State: AOJu0YyIuigzU1TgQjuJuYUgg/YoXV258WLifa3tCffVr3Vw06XDc0zY
 wHhfszetnxns7eJVPkVPyp8FSm7xs3rYTI4OSkLi/VOGM7jb7VCunNB2CBTKOSRjIbdjq3mjjTc
 1JIsObto1wjlypA5o8O1yLv7WPJyDY0UGpyfyF5bdqNJ1ZsAhaVqhTbLuWLZnc+IX9cWVB3PF6Z
 JFOGCbhCdi5/51BZKGIMXL1JbE6qs+WlGPN1jT50BE5/iszZLy5+hNBJQGG2HnFM/GKzg=
X-Google-Smtp-Source: AGHT+IFLFjJSZO9z21H1VBWeAl4KX619vd4ybybwdEIEpK+pwtjvumEP3nDJgtZi08Xdhm7QFNAdtMyo3VuXNHBq
X-Received: from qvb24.prod.google.com ([2002:a05:6214:6018:b0:82d:33b2:fba0])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6214:2581:b0:856:d1d4:d116 with SMTP id
 6a1803df08f44-873a4ae873amr97449736d6.40.1759418237017; 
 Thu, 02 Oct 2025 08:17:17 -0700 (PDT)
Date: Thu,  2 Oct 2025 11:17:14 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251002151714.595492-1-markyacoub@google.com>
Subject: [PATCH i-g-t] lib/drmtest: Add Support for Virtio-GPU
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Mark Yacoub <markyacoub@google.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
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

[Why]
Android's Virtual Device (AVD) has virtio-gpu has its primary driver. We
want to be to detect it so we can filter out it through DRIVER_ANY.

[How]
Add DRIVER_VIRTIO to the exclusion list of DRIVER_ANY

Test: ran kms_bw on AVD.

Change-Id: Ie7987c706546bc0fbd437e221f7ecd4c7bc759a9
Signed-off-by: Mark Yacoub <markyacoub@google.com?
cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
cc: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/drmtest.c | 1 +
 lib/drmtest.h | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 551385867..a1fb0b5ba 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -223,6 +223,7 @@ static const struct module {
 	{ DRIVER_V3D, "v3d" },
 	{ DRIVER_VC4, "vc4" },
 	{ DRIVER_VGEM, "vgem" },
+	{ DRIVER_VIRTIO, "virtio_gpu" },
 	{ DRIVER_VKMS, "vkms" },
 	{ DRIVER_VMWGFX, "vmwgfx" },
 	{ DRIVER_XE, "xe" },
diff --git a/lib/drmtest.h b/lib/drmtest.h
index a9542dde2..8416aa491 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -56,16 +56,17 @@ int __get_drm_device_name(int fd, char *name, int name_size);
 #define DRIVER_XE	(1 << 7)
 #define DRIVER_VMWGFX   (1 << 8)
 #define DRIVER_VKMS	(1 << 9)
+#define DRIVER_VIRTIO	(1 << 10)
 
 /*
- * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
- * with vgem as well as a supported driver, you can end up with a
- * near-100% skip rate if you don't explicitly specify the device,
+ * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if you run
+ * on a system with them as well as a supported driver, you can end up
+ * with a near-100% skip rate if you don't explicitly specify the device,
  * depending on device-load ordering.
  *
  * Exclude VKMS to prefer hardware drivers.
  */
-#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS)
+#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
 
 /*
  * Compile friendly enum for i915/xe.
-- 
2.51.0.618.g983fd99d29-goog

