Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0F7C19777
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9BC10E7B4;
	Wed, 19 Feb 2025 09:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UAb7238W";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B227910E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:40 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4396a24118dso42474265e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897439; x=1740502239; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G025eeI3sASBNRXDkJc1Qp+wPNTsms3KUIlSoRTY3ao=;
 b=UAb7238WYJIsbZfPhI7yR/7h5F1k2j4T63n13Q65FH0Oh+FD0AGs12RBH+fYgjnPNL
 t+lEz6c1TyBoLEbmbo6cMF7hbbLlIukIf+h7bdItvFZ6ThE1z76I4Gv+lDHdrodiLVnN
 QEEvw12fCPRf3dOrc/J56PBTxoKkIplsgHXu+MugPgzrlzjO0/8yK6I820TUodDxrnDC
 0N/q5PknW53cbfw1NCLEc+a5nLEWcrC16z/DcOdr4lOvypFlILbwfp8pxt7RtixkGlI/
 5kO79pj/YmjX0L9vt5uAK2E9yGxT6EsS5ZCwr2++Pom+H/PyPRnFaHKirm0UQY62B7Et
 ga9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897439; x=1740502239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G025eeI3sASBNRXDkJc1Qp+wPNTsms3KUIlSoRTY3ao=;
 b=ALZIMKMqr27npk1QNc+CJYLYLENDdlIpJTbzlP+UP/lCV3oNokmFvKwqb/cWixiWGM
 71Zl7hqj/Dahjo1WBuyVJlrbXgG6ikGAvkcO3zf5B+UhoHxY8SWp0CLxQlnyOGHqM8iF
 irJn8AmOcM25bo0Rr4deA5UbOEJ8jm2tRzfbK/7trDMG5JbOSfOj5oBOj/bZQxCUBt/U
 WSA8mXLhk9OVXWLgjaJsIepaukhnfv4fccVc19w3YUgM6ByVogjnUb1TmEe+tXhihOeY
 CuowLN+gslv6wkke6WZf2hKc5lYMZ5UktDBZmJmF/vas9FQbxK9WCsgPkEcM5PBjSldc
 MAaA==
X-Gm-Message-State: AOJu0YxUXrFBJXqPb3zBqQNDCea52JuiKZGkj8PRI6npuQ1OUuE3Gkwj
 1Tyzm9eVdkihJyDl7/RvoNaZs84bZpLl7txlQ6ozKtiVVfzm1sxu/E/4PV/N
X-Gm-Gg: ASbGncvfsvvrY46cavXkT5fNYih/A4nUZ1RMHlfTm8i/ju1Cns7AhTtV+0odILnWtz3
 G9P6wr8yWmQ2A0JnxAAjSgvxe+QDKOTeCdMXumbSgdSuSNfUH/hKp5ivtt7IEtvYEaZ1lZcfiAY
 6s9HOxofXVY2oWsR07Zx4RMrLjjtDTHsVLM/zYMr4VEbj9ihP4z9RoytPGnaSnnBL5JhQJ9627W
 QC9td0L+Zn7KOjLFInRL7CRXjjaswpyEnmRf9LvfrxUL4pIHIwTZ8J8RWyEHgVjo3FwhOMf8X1Z
 qc7kTIKjZGr8U7LCqw==
X-Google-Smtp-Source: AGHT+IEjv6hVDLty5CNQj8UFesNraDhtmTY1vwkr3Iyn8MoWP4+m3a72U2Fk6QB+eKS+W/Cf+uIUBw==
X-Received: by 2002:adf:e441:0:b0:38d:c627:f634 with SMTP id
 ffacd0b85a97d-38f587e5a37mr90774f8f.50.1739897438790; 
 Tue, 18 Feb 2025 08:50:38 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:38 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 27/39] tests/vkms_configfs: Test enabling a device
 without CRTCs
Date: Tue, 18 Feb 2025 17:49:59 +0100
Message-ID: <20250218165011.9123-28-jose.exposito89@gmail.com>
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

Try to enable a VKMS device without adding CRTCs and test that it fails.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 7d6437c87..59365c91b 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1054,6 +1054,47 @@ static void test_enable_plane_no_crtcs(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-no-crtcs
+ * Description: Try to enable a VKMS device without adding CRTCs and test that
+ *              it fails.
+ */
+
+static void test_enable_no_crtcs(void)
+{
+	igt_vkms_t *dev;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = {},
+			},
+		},
+		.crtcs = { {} },
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+		},
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0" },
+			},
+		},
+	};
+
+	dev = igt_vkms_device_create_from_config(&cfg);
+	igt_assert(dev);
+
+	igt_vkms_device_set_enabled(dev, true);
+	igt_assert(!igt_vkms_device_is_enabled(dev));
+	igt_assert(!device_exists(__func__));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -1083,6 +1124,7 @@ igt_main
 		{ "enable-multiple-primary-planes", test_enable_multiple_primary_planes },
 		{ "enable-multiple-cursor-planes", test_enable_multiple_cursor_planes },
 		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
+		{ "enable-no-crtcs", test_enable_no_crtcs },
 	};
 
 	igt_fixture {
-- 
2.48.1

