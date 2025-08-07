Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A015C87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B651310E7F7;
	Thu,  7 Aug 2025 07:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xrq9ANM0";
	dkim-atps=neutral
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB5210E0D6
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:06 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3b8de193b60so291915f8f.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552765; x=1755157565; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cd3+WQtHxo/nBJNtytb+ujvN61JYyRnrjbm4UIG2ugY=;
 b=Xrq9ANM0T6bx9Vt448LSVXg3EvZA88LI8UXVNgxQbBHDjBuK1C5SdVvf8JingBM7/L
 yQ6hMtTf9h2RFpdMwbFvY7er5ZnB5c+o/bnG1gujIgY06jTD3XwUD2e6s52F7iF+nHKp
 Pe+BEOvJwQKD1gamY+WAVJPG9MEOPkYGSrChK7bOFLd5OZ1M+b3zBv7TBWfnSmOZUv4I
 6N6x1ZlJu7exNaYNrJd6Yy4H1B4T5L7DvMA9g9fUnpaMpfpggefVxbzxt2CDcWrCSK1d
 vsW420Aen3dF8mYZSitCUZjdga+F24x8eehnb8i4xO8+omlu6Jj3h+1SKGexNywYe4UV
 NQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552765; x=1755157565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cd3+WQtHxo/nBJNtytb+ujvN61JYyRnrjbm4UIG2ugY=;
 b=jbIIKTb22MGOdbPIWiYWqGJ/sP6Eim+23D1r4GezmPtpamUhcqkky8qMZey02kGmuv
 Xz4A3iuMoFHT55olL47d6V19LTESitJqPoRcNVzkTGLD7oRXynCH6UIfez5piMa1plYL
 0YEzKrSrGJvCwW31R59v6WZPHRKqKFWMoILkIwSk2DBZ05SlysVIQe5bdZSKj1HMJXVM
 cWxcopkzFbDcpgToTmttBxyualjaMvDlCQnU1y4SrQYYNVm10/+Ut+aACFuMKaSr454c
 HssXIcrem2x4KFKtv3NkP1q+lGYTjbrgz6v5swyKI6oWyU0WmTGCghtK4gcCUo3p2XI2
 8RBw==
X-Gm-Message-State: AOJu0Yxc886wcV2ezeuAi5aqgRyTTKx6PZHMdOsew3xDbrLCqbtmkf/s
 3VCMpqLW/WM9avQk6VW8LiOzqJO9tA1j9n8bKEq8TOJDFvzZV9Yk916H6OY4MMNz
X-Gm-Gg: ASbGncsH6M7/vx5iG0noYJ5caj5QiIXzYZbGmXxPbn4yFLjWNW9jJI8F02R8egzZDwt
 NznFDyhzFlbDRQflxortusUGKCZGsbEKZ2yqVAkxlFZk+1vsniPYApKiqaRGLrL7FSTWldy2VSk
 dwjz6gxppv0gvDRT/xkYn6ygn2WrMbYrg3rJn04esWylHrv1hF0vT9vg0JOx/TtUVbYi1vgrYfM
 w7yDiPvvFxmZAfeojubZrnCBMHyytmn2nKTGJo7GolnzL9+yDZ6+ELZAJmRBUA2LNDXM5sDro+e
 coIDiphceNj3CYs3NfaZNBmNkVoDI7Yzl2A+fh8gZYzPV7aBgK2kgPiv9qWtljSWglc43a6dEnr
 pPrr6pe0MyZK0OP4oRA8=
X-Google-Smtp-Source: AGHT+IGMkqszQOvQ5YbnJuiG4nKtpz1UA5c+JZkvxXDwey/RfatquaBKgV6Fh2v4LAERsxjy8gDpFA==
X-Received: by 2002:a05:6000:144f:b0:3b7:76ac:8b72 with SMTP id
 ffacd0b85a97d-3b8f41a80d7mr4650415f8f.12.1754552764827; 
 Thu, 07 Aug 2025 00:46:04 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:04 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: [PATCH i-g-t v4 01/41] lib/drmtest: Add VKMS as a known driver type
Date: Thu,  7 Aug 2025 09:45:10 +0200
Message-ID: <20250807074550.6543-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807074550.6543-1-jose.exposito89@gmail.com>
References: <20250807074550.6543-1-jose.exposito89@gmail.com>
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
2.50.1

