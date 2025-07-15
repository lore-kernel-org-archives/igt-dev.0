Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC62C83F1D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F6910E1BF;
	Tue, 15 Jul 2025 10:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TI0YvSDb";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8234310E1BF
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:25 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-455fddfa2c3so30199785e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575123; x=1753179923; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Ub0AeWAGOeKklVf9pWWdBNQ/WUSAbiT3u1YXLmQQ34=;
 b=TI0YvSDb4YDVhCnqve5wgaOFqLigzRrqOj18stDuhzYP6TqOaRKNCRXLA50OFoMXNm
 XuVyP3MWtujro5HQw3CmdyfS69ZXQjCK4cp+tcq6wnNmr47G8Hit7tT9F4tYGflIigU8
 3AZNGp8G0eLZc8KDYwOmyTuJXhLGQOQ64Axb8KH5942+1LMH2vnkWg09FsWjSRBuOepg
 2ha6qKjzmQvPQ0TkrdQD6GZSdQ7OyUD8nQGr1MkkXvOUndbtNks0etlDWeRpLRVRAVEh
 maop4AaBKS/qE26jxXM103l5dw5dplWcZfPUjTeIEiuwUt6bUTq+nzniJByGn5uNg0r/
 B6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575123; x=1753179923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Ub0AeWAGOeKklVf9pWWdBNQ/WUSAbiT3u1YXLmQQ34=;
 b=TaxLtwxguXnv3BnN0JHXl4wgb524FsPd1+qcm1cGDKM6LOQ12w9gp9S2W4YaXX7tXX
 Q47X8w06yzmGzwVDhxR9pamD4QerayEdNIQLXHUaYyIciopMT9Ie4VmnsAAH/dkHnBz6
 eVBwfSXRZjqjCifg9fHXiBXUBBc9necHENAY+fJ72/EMSBCZDgxZWJzvf93CT1BwV6ZE
 jgJRYVAp9eV8JKzhgAfbAjr5uQ8r6ncWW2yvjSofLi/Hw7MZG8YPPYqLcS6JjCG3suau
 F7p78dcN3HLx1EOaJm2T+DuwPaz6YrqjDPKXfOBmPA2xwUY+BSqq3IqVOximt1vdMfWZ
 zdig==
X-Gm-Message-State: AOJu0YypDgsEGbCecpDmR6EmWWXLR7EqGyu0I8y0gHggTedWkskHf5b4
 yWWRbEywWZquENYQVHuALMHHP0B/eCEptOt0ywifzEUwZdSnIBdGomTbNo1Osg==
X-Gm-Gg: ASbGncvwZkP90z1ybz9rEZhjEInuRA4WDHZ60UoCHTl+ehBuCBtOuXJrCKkAkLASSGg
 VxxQhqZWIq9hrJ2dix36o9IS9iTiUNmonNVI+I2JWJsnHboCczZ1RIMpeadDI8VF/O9v71SU1d8
 FdYhATEaupB0UGBH+ngi73SHoX/3Fg06URs0qagzGzcxq8xcmHLliWik1nGk52OTlsJUPq/gBxI
 59hwEgFKqXFHCUZ1tXBguopyRcqmUETHQcjV7xd9l0be+yHEI1ZPUyiE38F9dg7EThaICdI2fNi
 YJd8nlGtxuS0JCchjvvublsCHEGR78PdbBruuRBTvyq4tkNxnf6U8v0dwPbeJWll9d26UQVi2Oo
 pDV41mgc41QOgtgEMLg==
X-Google-Smtp-Source: AGHT+IGlA9nuIQSlL8ka04qBloNmJ+f34N1DRDlE9hKmGX9vyC2yR26xD15PGZNUyl+1JyZEBRDY1g==
X-Received: by 2002:a05:600c:3481:b0:456:1752:2b39 with SMTP id
 5b1f17b1804b1-45627727ef0mr17368345e9.33.1752575123328; 
 Tue, 15 Jul 2025 03:25:23 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:23 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: [PATCH i-g-t v3 01/41] lib/drmtest: Add VKMS as a known driver type
Date: Tue, 15 Jul 2025 12:24:33 +0200
Message-ID: <20250715102513.5636-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715102513.5636-1-jose.exposito89@gmail.com>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
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
2.50.0

