Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A79C28B28
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D9410E257;
	Thu, 13 Mar 2025 17:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g/2TizfC";
	dkim-atps=neutral
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F82210E257
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:26 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso820254f8f.2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887205; x=1742492005; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oO8GuJYOav2hrwqC7MNiKxdwP3oUt+fdcUfSoXRH0f8=;
 b=g/2TizfCFwf1t/y+9aHeTKrijaq/Kn+Wz69kjBQxs+4RB7LyKQFqRutcBp6/c59guL
 YCskSeK7RBZGlI4x0kxOXvvlqqQUrDt2xfqXA9cswJ+6p/zbUE9JSoadT1R9wuOv9Hul
 rahIJmZQY18GSB4+jxBXo7cSFKS7Dakf2Fdi4nssBg2jwDX4QRtVXqJ/9k2Duh3I+tuZ
 rJZu4POTX5jRYyIIWxRL+JGCu8NoMGN+Xpay481D+Mel2LXeedDj1u2YyM0UeMv1Iwas
 nnHzg8JQ6Puo7B4FjowmhJjzhLzwLbadGjeDBu02QN3LTT5Zx8kltpfj5H+pgPjWzD2U
 XJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887205; x=1742492005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oO8GuJYOav2hrwqC7MNiKxdwP3oUt+fdcUfSoXRH0f8=;
 b=n/QldA6t8n8k1xTeo6Aw9le0HEheEnqT0GVwJ7g2oGj66hz7pZG7ThPakjuxdCMpch
 uMMG8REkT7tUfwtqNGEYGEBLfgK2j+vQCc2M59jUdtmAskcjJufNxCspdK3BrMJ61Apv
 tzVDEVArqTvlhZDpoSpS4NADTKsaqBTB2WZDBYiZObHZwtN7olCaNd7tNWQshh7Tl/7b
 +aR8gMGI+Z6VIV5vJfUbEh5lRL9re+tvh2mMz59bg4zKvzrSzYWoinFDn6jcGdtokbis
 VfJfHN/H7B5zvrTMyfNqzOnjsdgBJmqcpqh5ZfexYk4cKsPl7TZOuGaawUV6LSRswQ2E
 7cOA==
X-Gm-Message-State: AOJu0YyWJ4L5AIUwoErGi3Ohr/01T2PLIOBth+P+Ln8dE2hB3lKyLKZ8
 t+rbqtLH1grErahL0jK9USuYgWYKQfOiMHCSJ4Xr+VYh5+xl8vA8sf3As8xk
X-Gm-Gg: ASbGncuTzico6czLEupTzyS3DzuAiYT/sU2gWLGwgiqQtbG3cNoPlqUeJxlXKITufPL
 tL4/KgC0UnnD49JJWYm8SpK1LoBf0OSl1wQfpQhVT+dsW0VKoSJJ0grV9RgvoWpG9xv4PE3l98D
 Lf2s4MFKt51BNjqfKhrOBZUrWntb7LaxxlyLgS76gl5tt50fJJBJXjqebPA5aY8eKq4Z6guLX1g
 7MtC/7KDENOoWWZ3HK+wFEufiz2AMNQUjK/P0LC/Vrn7kJnEAwMs4EPf/+3ORpqwSujQgfLrhYD
 d1bcgqT9Xlq0PTgJ6TIEaOMFttlTHdtbN85rblbG3y4utBiwprUbZD0=
X-Google-Smtp-Source: AGHT+IF2d6yfMeYjUCFdqFZe94SCK1XAQS9DqPS5ibclAn4iPP40OUC2n+xRae5DTdHOjWWHh30Z0Q==
X-Received: by 2002:a5d:59ad:0:b0:391:487f:27e4 with SMTP id
 ffacd0b85a97d-396c1c20540mr445044f8f.27.1741887204575; 
 Thu, 13 Mar 2025 10:33:24 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:24 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: [PATCH i-g-t v2 01/43] lib/drmtest: Add VKMS as a known driver type
Date: Thu, 13 Mar 2025 18:32:36 +0100
Message-ID: <20250313173318.5818-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313173318.5818-1-jose.exposito89@gmail.com>
References: <20250313173318.5818-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

As we are going to add VKMS specific tests, allow to check if it is
available.

Co-developed-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Jim Shargo <jshargo@chromium.org>
Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/drmtest.c | 21 +++++++++++++++++++++
 lib/drmtest.h |  6 +++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 436b6de78..943ea8dbe 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -223,6 +223,7 @@ static const struct module {
 	{ DRIVER_V3D, "v3d" },
 	{ DRIVER_VC4, "vc4" },
 	{ DRIVER_VGEM, "vgem" },
+	{ DRIVER_VKMS, "vkms" },
 	{ DRIVER_VMWGFX, "vmwgfx" },
 	{ DRIVER_XE, "xe" },
 	{}
@@ -295,6 +296,8 @@ static const char *chipset_to_str(int chipset)
 		return "xe";
 	case DRIVER_VMWGFX:
 		return "vmwgfx";
+	case DRIVER_VKMS:
+		return "vkms";
 	case DRIVER_ANY:
 		return "any";
 	default:
@@ -971,3 +974,21 @@ void igt_require_xe(int fd)
 {
 	igt_require(is_xe_device(fd));
 }
+
+void igt_require_vkms(void)
+{
+	/*
+	 * Since VKMS can create and destroy virtual drivers at will, instead
+	 * look to make sure the driver is installed.
+	 */
+	struct stat s = {};
+	int ret;
+	const char *vkms_module_dir = "/sys/module/vkms";
+
+	ret = stat(vkms_module_dir, &s);
+
+	igt_require_f(ret == 0, "VKMS stat of %s returned %d (%s)\n",
+		      vkms_module_dir, ret, strerror(ret));
+	igt_require_f(S_ISDIR(s.st_mode),
+		      "VKMS stat of %s was not a directory\n", vkms_module_dir);
+}
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 27e5a18e2..a9542dde2 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -55,14 +55,17 @@ int __get_drm_device_name(int fd, char *name, int name_size);
 #define DRIVER_MSM	(1 << 6)
 #define DRIVER_XE	(1 << 7)
 #define DRIVER_VMWGFX   (1 << 8)
+#define DRIVER_VKMS	(1 << 9)
 
 /*
  * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
  * with vgem as well as a supported driver, you can end up with a
  * near-100% skip rate if you don't explicitly specify the device,
  * depending on device-load ordering.
+ *
+ * Exclude VKMS to prefer hardware drivers.
  */
-#define DRIVER_ANY 	~(DRIVER_VGEM)
+#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS)
 
 /*
  * Compile friendly enum for i915/xe.
@@ -135,6 +138,7 @@ void igt_require_i915(int fd);
 void igt_require_nouveau(int fd);
 void igt_require_vc4(int fd);
 void igt_require_xe(int fd);
+void igt_require_vkms(void);
 
 bool is_amdgpu_device(int fd);
 bool is_i915_device(int fd);
-- 
2.48.1

