Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A2EC87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9815810E808;
	Thu,  7 Aug 2025 07:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MqonmEsd";
	dkim-atps=neutral
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7DF10E7FD
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:31 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3b78b2c6ecfso305397f8f.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552789; x=1755157589; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pky0bXfZtw84Um2Pi3x7MdfFJP71TQNZ2kjijL+1wU4=;
 b=MqonmEsdoXjcos57CBw3oRF5Yu7cc0ILPm/ggHkBQfazF1O22QNKMJMIQYtTeZ9iJj
 Fd0e2YNU60olzqQ49yzEuOxesBw/GuMdlyGNb8WgbkawhLQEcY+hhiS8noXOAWpWYuRf
 DA7WwEL8e/kRnPMCE41ZJfZys7vFPJ/gtOwjjSbeg8nrWO21k56SCaQip5OdsPpjsbeL
 ZBp9FY4POLHKplXytzxqZXT1k9eT7xBdrulF15bjg/KW3A6kqz/vFmAsjJFGJN3ARqt1
 wKcWxvLQyQ+UyAdoISGoZlDLr+Ckch2cSxGVf4Qy/g5dY+HY3R46umWualLZGQYFlVnq
 TFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552789; x=1755157589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pky0bXfZtw84Um2Pi3x7MdfFJP71TQNZ2kjijL+1wU4=;
 b=FtSrOfAr8JH9Xboxqj7JJx6Sf2MZAh0naz/M1jcH5AFpSQgvyqz8/c38MvVwvc8r57
 mb7eKuiBANqsyfrhUnDw8IhoMBqmoaFTV2prqgi2w3xAMMuxMzU1TNkioeeXcQwvf0Py
 JvdwnCYzasu4d4XZ8IJcb2iIIXHn3VGKV0hGq8NXBbpk03ps1+NjmQVTWVqWjAeDcl+/
 Qxm3gY7yldZpFFSUnjJJbqh1KscgznuL21UaJR8VoQhVVBYjX2tPCS4+Lull+uQph0JZ
 GkQUilmcgv4jUOsm/SWWo2I8GpcbnjUR1PRWXUIXLPcuC/b0jiqB1rRux/lCpzuOnHV9
 uHJg==
X-Gm-Message-State: AOJu0Yymz8F+bmo1RTH290+KLfYJfwlqRIMl70KBhff726IGUPtQaTuM
 EcGyTwOzjgyZEFBaPnlM8a3oMmwnj0AG8PJ6B+FMLbzw7m1bqa52pOQuH00Rbvyj
X-Gm-Gg: ASbGncu6Pn5C727hOAUjU3giHCIiflkXLg0TcHtrwm+LuxbDTtl4rzsWzsCM7Qb9Ivr
 ELPQBtG4m42I2yJ26A4KTB/KJk3OAk294wU63cJdbOSTqdtG6ZNqahIKj1CY1t3UL3XayZXogVA
 EfOwOfjR3B1StPGtrG6dXhav/obq8ejU8Iu0Obv9vDQ43hWdJtXTLzYfzjiXOW+t7Yx9nx/uVnc
 t4xoVY0r/TqK48CH6sAEPY8iOA1bC2Ku+mRTdGe7kj5i6YGIlJg23Rbu9FD7g0VBagkwp8pS8yb
 r3Y8fhpbnRP+3443o5zIQ/cbRqKu3JcgVstTG4DQJweI+TGLnZZT/tZ50CcywjNJOqxg95YfcyW
 uAHlLcuR8ptrfsoJqj+c=
X-Google-Smtp-Source: AGHT+IG5QJ/0IAv99FbEqPLQHc+wPmRUHU4IezS+zw3qxnqmdQ7ft//a7DvgacjwJzU5czLzNyHH0w==
X-Received: by 2002:a05:6000:2212:b0:3a3:7593:818b with SMTP id
 ffacd0b85a97d-3b8f4166627mr4446401f8f.21.1754552789233; 
 Thu, 07 Aug 2025 00:46:29 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:28 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 24/41] tests/vkms_configfs: Test adding too many
 planes
Date: Thu,  7 Aug 2025 09:45:33 +0200
Message-ID: <20250807074550.6543-25-jose.exposito89@gmail.com>
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

The kernel references pipeline items with 32 bit bitmaks, therefore,
adding more than 31 items causes an overflow.

Make sure that this limit is handled correctly.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 57 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 551b7610a..6937373d8 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -850,6 +850,62 @@ static void test_enable_no_planes(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-too-many-planes
+ * Description: Try to enable a VKMS device with too many planes and test that
+ *              it fails.
+ */
+
+static void test_enable_too_many_planes(void)
+{
+	igt_vkms_t *dev;
+	char plane_names[VKMS_MAX_PIPELINE_ITEMS][8];
+	int ret;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc0" },
+			},
+		},
+		.crtcs = {
+			{ .name = "crtc0" },
+		},
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
+	for (int n = 1; n < 32; n++) {
+		ret = snprintf(plane_names[n], sizeof(plane_names[n]),
+			       "plane%d", n);
+		igt_assert(ret >= 0 && ret < sizeof(plane_names[n]));
+
+		cfg.planes[n] = (igt_vkms_plane_config_t){
+			.name = plane_names[n],
+			.possible_crtcs = { "crtc0" },
+		};
+	}
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
@@ -877,6 +933,7 @@ igt_main
 		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
 		{ "enable-no-pipeline-items", test_enable_no_pipeline_items },
 		{ "enable-no-planes", test_enable_no_planes },
+		{ "enable-too-many-planes", test_enable_too_many_planes },
 	};
 
 	igt_fixture {
-- 
2.50.1

