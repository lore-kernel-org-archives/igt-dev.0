Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C52C021B4
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD11410E7C3;
	Wed, 19 Feb 2025 09:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NF7X92gk";
	dkim-atps=neutral
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7292510E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:26 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-38f325dd90eso2361609f8f.3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897424; x=1740502224; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okHVFsnZPKYQbAYMSs8NhXoUGkn0YH9pMMJQWyC49u0=;
 b=NF7X92gkSonACSB6D13+z/gMhlqJDgSJYOTuVpJqF7FZSLUqgAAJzQQFkVrJY1PGZ+
 fSn2H+Kfy4Q9w7GfSJyuNOFXlkvqSLWECvu77dh5hbDLTKxvIwRfG+GoR94ZIVbJZ3W1
 keSwL04dBh5mbnzmWxDUg9u2AnK49AaR86n8i2vRE9Wrjux64Pa6LJ81TYuBvAe93yu2
 ct5xgezF5rho43taTIFYsmARRzkjmEcdRxZRZDxYVEyh4k7/zFymyyerGJ9QmS0fl3Lf
 qIvOFZtLKwnVH0Xh9QjGXn2TU0QKJLk/KvO00x0TAlXxOB8UkTozZvFzBjCadcp5vNBW
 Itww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897424; x=1740502224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okHVFsnZPKYQbAYMSs8NhXoUGkn0YH9pMMJQWyC49u0=;
 b=ug/N2Af1vfZgYPAdYfxb08Acrg8iw/oNkD2kEe3NlHhjHadg5Vohc7k0d58UFSstux
 wZYdZiL2AJW0/mO741OsrkaCoPWUP5aW0J4nmQ2FU+f/aBN7dwV6CA7UcNfXpzQi1drN
 B5uwYs9XvQxCHSUEaG5ASpitmCUsiIpFIS+OuFF9DR1bEVUNKanbYJn1bBMXJYRnHFdM
 PmggcMEb4/Z4McvhAmLdrvS248UY3MiMZXOIAGC4Vxn5HnZHHuexm+qllo+6kAKSsn1I
 ozvy8OPk7F+d9Ie2rqXrKdCcLLw1xhB5zjmJe7mxmXSgjLnb6NdPil6TCUg39SeJ+ExX
 l1Lw==
X-Gm-Message-State: AOJu0YypCTNn7Ni/A3YRn35A6kKiB8Ow3w+Sbb2qH8DBoPvV3yrdDe8I
 0Q/UBB8pT5bBiNK5s75i6CcR0QZ2tU7nZyPT4uWv/4ViDP5WTi4FvItx/rSq
X-Gm-Gg: ASbGnctHRYFzeEwscl+rBPwpfaOYxdt2oZA5qd+l8pbpDOBXh+oNQvhqs2GUxbRgA2b
 ldEMOo6LtLORxdjSFGFTjzsXLIjqaU3JoMeZ3P4AI9gWMainupMFfibwXHWOJyls7Hcc0hjZayh
 7bfWhccLAX4dHbfW9bsGHLbN9QLTASKVCIlsSBc/gG2WapmIsrl8/JRV/ng2e3PkhGKpBAvDBUg
 r4vkbGUTwBt3WUiqjdN7tzdrjaSnJ68wWvKsQ47thgiaVgLHtb3wULZRkwskObD33/qMli+5/xe
 MvjwAekixpHDZRawNw==
X-Google-Smtp-Source: AGHT+IHPwn/y9k9he8cs/lRRm9BMgRMu4YecUN+SJ+rY8WieMilmGz0hCwEiNLnu58nDYr6kilEDCA==
X-Received: by 2002:a5d:6d08:0:b0:38f:4b15:32f1 with SMTP id
 ffacd0b85a97d-38f4b1534a3mr7145356f8f.54.1739897424445; 
 Tue, 18 Feb 2025 08:50:24 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:24 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 11/39] lib/vkms: Test CRTC default values
Date: Tue, 18 Feb 2025 17:49:43 +0100
Message-ID: <20250218165011.9123-12-jose.exposito89@gmail.com>
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

Add a helper to get the CRTC writeback status and test that the default
value is set when a new CRTC is created.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 19 +++++++++++++++++++
 lib/igt_vkms.h             |  1 +
 tests/vkms/vkms_configfs.c | 20 ++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index a7dad43e2..4021f9aea 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -24,6 +24,7 @@
 #define VKMS_ROOT_DIR_NAME		"vkms"
 #define VKMS_FILE_ENABLED		"enabled"
 #define VKMS_FILE_PLANE_TYPE		"type"
+#define VKMS_FILE_CRTC_WRITEBACK	"writeback"
 
 enum vkms_pipeline_item {
 	VKMS_PIPELINE_ITEM_PLANE,
@@ -377,3 +378,21 @@ void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name)
 {
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_CRTC, name);
 }
+
+/**
+ * igt_vkms_crtc_is_writeback_enabled:
+ * @dev: Device the CRTC belongs to
+ * @name: CRTC name
+ *
+ * Indicate whether a VKMS CRTC writeback connector is enabled or not.
+ */
+bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name)
+{
+	char path[PATH_MAX];
+
+	snprintf(path, sizeof(path), "%s/%s/%s/%s", dev->path,
+		 get_pipeline_item_dir_name(VKMS_PIPELINE_ITEM_CRTC), name,
+		 VKMS_FILE_CRTC_WRITEBACK);
+
+	return read_bool(path);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 7f70f92d3..59f6a9775 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -34,5 +34,6 @@ int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
 void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 
 void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
+bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 398232c03..95779d336 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -300,6 +300,25 @@ static void test_crtc_default_files(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: crtc-default-values
+ * Description: Check that the default values for the CRTC are correct.
+ */
+
+static void test_crtc_default_values(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_crtc(dev, "crtc0");
+
+	igt_assert(!igt_vkms_crtc_is_writeback_enabled(dev, "crtc0"));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -313,6 +332,7 @@ igt_main
 		{ "plane-default-values", test_plane_default_values },
 		{ "plane-wrong-values", test_plane_wrong_values },
 		{ "crtc-default-files", test_crtc_default_files },
+		{ "crtc-default-values", test_crtc_default_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

