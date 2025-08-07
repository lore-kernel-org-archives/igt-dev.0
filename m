Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B25C87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D664910E800;
	Thu,  7 Aug 2025 07:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RI7FWUDf";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C9210E7FF
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:14 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-459d7726ee6so3543235e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552773; x=1755157573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/L3pDAHjmySXfoPXA5eRP8nC558nlGBczTO4SODhr4=;
 b=RI7FWUDf4Rn4JYk59E0Ut5+FBXEwAJ3Xjq2gCe4G6JK99cUdOfShV3YCr77oPi8laM
 WxtZ9MsJDOK+qjsNbmTn6G3kmC+7wjS0XI5pqLMTSjPZHA3KoPpf+yhKqim5Ie3fOzt5
 zzE3mFPBAH+3qV8JcfKqd+EClIHBozpXkHmfLkbAxsecoRQ5ZIuBGZY8BLzPwqLUMPGf
 3ls9pdMhjvaCJfgwzyjToMiYzweyvaU1vVZlGG/jeaLy8pHd7u3LMJ6GV2Q75295TSpO
 TFwUDOCE3yc5KPR4fOSbW6s3kejhknYJN9OCRQUqlhX4Lo52zqJO+XN4REr6IjSRy2WZ
 SjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552773; x=1755157573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d/L3pDAHjmySXfoPXA5eRP8nC558nlGBczTO4SODhr4=;
 b=FmIOG/Zyu6obRBCUkYafOz4DxI6Jb6o3XX0+DIwb9s3GgCUKAAiu5nQIdnI7LuFoeu
 jv8DkmCM7xVXNxbBOrB1c9WYGXmHnFCliK4ZHn/BgUbvOhVvXu0SWrCAIjN01hmKrh2y
 wlNHUyr08fw2FDdKabzxDT6xKyO/mDE0n1La9gMyV++Oej3yUTKwmAfUcXSTuSdKTK2D
 qQOWV/f+L6BTmZ3nk2oH4N3POiO/EnIARUE1jEc6XJ2B5jFk+prGxG25PkMd3bceerCH
 0BGCD3gVRb31n+QPCJbQNrZvl5YFbJEsPolXML7O4EdzHRvQ2zqE0dXkvAVaiuT/4Zro
 6jwQ==
X-Gm-Message-State: AOJu0YzO7uCdGd2PfscfLhZjVo+qcTTTHn8ko1NgRkPy2KWFp4jwMFXO
 ynbY/esvdthr6vBSjeo7MgdkDe3qmKoq3HAEf/PPbWitCedl54Bjgs+n05VuF9G8
X-Gm-Gg: ASbGnctNlXfzVMgrAgYWCuJXYRy4U/rabshqrv8vvbqjNxexkISl1ktUmDzLOvN+1U6
 xCpCqeFpV7iAqMjREgxjF+E4P3Wk3Z3W19YBsf/lJH3r6/swI0Oz2x59O5f0R1ybOfvnc1VzuKx
 XU0EecHaR9zNLEQoyaw/9RLe9ABKRAA4z5n/u6TeRIbaAbNZgZyZl3jlMJSfx28EgVnqzKnuL+P
 LKFK2EOYRbD4WzUrYEu9YXhnbi2oWujk1OgkzmSc3CVpsj8ZXC03aVUlByupEZSqGCWnDnZW1DD
 WIhxXB7xqAcPKMyRPwowm1bvrh93ERHobJFBJEwja8GlIao12WU1OvynMY/XZ79+XneenxdguwR
 eK2Ez/GdcdbkHkOuBMPImTcLzK/q/rA==
X-Google-Smtp-Source: AGHT+IHwYCvDRm6ny/v9XdbOCCAX4+5PBrCBFhTGi3jUmwK5ZPGs2X+7kY5OyaKyycTiK+OgBF5L9g==
X-Received: by 2002:a05:600c:4f8e:b0:456:1e5a:8879 with SMTP id
 5b1f17b1804b1-459e7098c94mr53152395e9.9.1754552772540; 
 Thu, 07 Aug 2025 00:46:12 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:11 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 08/41] tests/vkms_configfs: Test plane valid values
Date: Thu,  7 Aug 2025 09:45:17 +0200
Message-ID: <20250807074550.6543-9-jose.exposito89@gmail.com>
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

Test that all valid values for the plane "type" work and that it
changes accordingly.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 163b542d0..6adb74213 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -279,6 +279,36 @@ static void test_plane_wrong_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: plane-valid-values
+ * Description: Check that setting valid values works.
+ */
+
+static void test_plane_valid_values(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_plane(dev, "plane0");
+
+	/* Test valid values for "type" */
+	igt_vkms_plane_set_type(dev, "plane0", DRM_PLANE_TYPE_OVERLAY);
+	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
+		      DRM_PLANE_TYPE_OVERLAY);
+
+	igt_vkms_plane_set_type(dev, "plane0", DRM_PLANE_TYPE_PRIMARY);
+	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
+		      DRM_PLANE_TYPE_PRIMARY);
+
+	igt_vkms_plane_set_type(dev, "plane0", DRM_PLANE_TYPE_CURSOR);
+	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
+		      DRM_PLANE_TYPE_CURSOR);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -291,6 +321,7 @@ igt_main
 		{ "plane-default-files", test_plane_default_files },
 		{ "plane-default-values", test_plane_default_values },
 		{ "plane-wrong-values", test_plane_wrong_values },
+		{ "plane-valid-values", test_plane_valid_values },
 	};
 
 	igt_fixture {
-- 
2.50.1

