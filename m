Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EB8C021B2
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5265510E7CD;
	Wed, 19 Feb 2025 09:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fxx2MngQ";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD80110E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:17 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4394a823036so59857375e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897416; x=1740502216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9wxKl9WTs10ezejb03qy5pDbX6Xecn2j5Jd2KLjCtrg=;
 b=Fxx2MngQD2G6n1CoVgablUxyZh7rY/uhQzoEw7nORdhCMHy02yWKAxcReuRxBNyIZX
 0LM9VdGZWok0DXLYn5/D0S/j3GK+pM/id+ejzfa5XnxddGopgDQzZW4Zz4u8mrX07Upi
 2Y2aX7+LP01Er8TKFzMyO2ZgGYLSSZIkjBqyMyO22SuDOc/r8hxY2GPyDi3H7ipBd9I2
 /i+wCYo7Xn6CglrV6umZHlBLpZ1HA6fTPB3XZtfaHELXCUMWKppxwQUhIKUVlWtAZ9Qp
 yoEyruKuWWee44TohdIn0BQc6WIHkxrfemWGYaP/hcszenL0xhgnhQNb05uDOTe/LaBl
 jdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897416; x=1740502216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9wxKl9WTs10ezejb03qy5pDbX6Xecn2j5Jd2KLjCtrg=;
 b=j5u1j8GaCDJeRqYMnjU283U8hNN7hmCupBI6PyeJ07NreQUFYREoCmwFcMyAAaQ1Uj
 6folK22qSkHxOtJ20SxDc6UdBPo6A1qC7+Vis9/v4Agcgb9XwQmrJduhUeUgP9T9LNA3
 i8OSBmB2XV+2jD0NzBnE0drKMG0zOmgYfbvpXOIK7tba0vZVZQL2U2oENh1MA9/EW3/h
 qpj9Va3b+tS/fgRiL+ZA362Oz1cgstrq0ToNFC78m7kVFPYVaPhz4YhCrKE7a0Vaqp1T
 GNS3Ys1KBm3jvELZzaQ5kkIGiKJ9X2pdZAM4jij90BRzlg9aHfcGvbKf+x++TUO4EbA8
 w3og==
X-Gm-Message-State: AOJu0YxDaSwCJmV1XYMvbhSvNBT6/QDWggr7rYUcj17YeRKT5ZhbNvMG
 3gj207oprpx3BzShfdWlQ/nqqR1cL7jIVxFLCVshGGn9tNgtr8mqrempCS6f
X-Gm-Gg: ASbGncszfatDaaponKibLNttXe3VVOFM78YAgaF1RI6GzoSawMP0lcztgaBCC5PeCz8
 Ja6jFRoJldlNvv0byZ8jUeZY2W49xEb3jDjWt/Zqz2JytjUB7RmRqwr7Oe7bXiNwhS/xuv0wt7m
 LtQdDg1XM033apxtEdGXPz24XIQ5XvlsfQG8nHJx93RyuqtmYBLqjGhuR5KrXCpPGF3EkQAub+C
 Ua+tenWQ0o+Wty/JbPWztxn+m2W4pwvyt/+ItTkJJgDitrTNu/3r5qnnA7l8YkOTbQcmebKOyOt
 Sf9Wq8u05m8XzkArKQ==
X-Google-Smtp-Source: AGHT+IFpR34/EJT87xBSlbnf4AKTiFCmbVRNhA8JNhvoD0PlHYw7E+zgiiBmFHj327VoV/OofeXaHw==
X-Received: by 2002:a05:6000:188c:b0:38d:b6a9:2cd2 with SMTP id
 ffacd0b85a97d-38f3407371emr15723441f8f.46.1739897415646; 
 Tue, 18 Feb 2025 08:50:15 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:15 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: [PATCH i-g-t 01/39] lib/drmtest: Add VKMS as a known driver type
Date: Tue, 18 Feb 2025 17:49:33 +0100
Message-ID: <20250218165011.9123-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218165011.9123-1-jose.exposito89@gmail.com>
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Feb 2025 09:31:45 +0000
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
 lib/drmtest.c | 18 ++++++++++++++++++
 lib/drmtest.h |  8 ++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 436b6de78..2cc6e0c29 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -971,3 +971,21 @@ void igt_require_xe(int fd)
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
index 27e5a18e2..1b57e49ec 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -54,15 +54,18 @@ int __get_drm_device_name(int fd, char *name, int name_size);
 #define DRIVER_PANFROST	(1 << 5)
 #define DRIVER_MSM	(1 << 6)
 #define DRIVER_XE	(1 << 7)
-#define DRIVER_VMWGFX   (1 << 8)
+#define DRIVER_VKMS	(1 << 8)
+#define DRIVER_VMWGFX	(1 << 9)
 
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

