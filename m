Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA47C83F22
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0F510E5AD;
	Tue, 15 Jul 2025 10:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jwOa2A0v";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC46610E5AC
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:49 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4560add6cd2so20674855e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575148; x=1753179948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ig02SiP+ykGqZ+gGeuSCUJcGTYQrwn509Sy3Sk61BJM=;
 b=jwOa2A0vi3WrPyojEHh0PjFaXfLcOgiSVy5NGBdg8yzKDiTT6xrSDIv3vnyvDW9wbH
 X4GE5FWxWwaUItZuij6q3nbu8idrulgK7TMkS4BPYip99wjN6vEdM5Lbn5mtdYDT09vd
 A47ou1ipEnWnAHBcMZmd7kSYQN1e57RJXHSSiqOB/AV8gih3QNBbgjQZsKdooI3rqlsY
 dvahKIQNBstqxkkrg8ytiz+Ljl6ktcrGQKpKQr6KVGlPVf8liAZPNBm7owWr1L+r2mZ/
 N4vSiEmWGM/fkIPblK//YUL6MGWYLVp1oVVaMzp3I1gxeBBgCwp/EylUL5bV22XmrEQ2
 wpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575148; x=1753179948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ig02SiP+ykGqZ+gGeuSCUJcGTYQrwn509Sy3Sk61BJM=;
 b=tDWS/pQWtB7G9C+JiUAIHIvqMSwj0thKKXMNXYSGq5pOMp2qwu6O1o96KNDudBzSl0
 tD9q7LIt6ayi91DlX40Vaef+dkiNRgOMn+Wzw2C92gi02pnyt5LYc85aHBUqprGjKLF0
 2VQ7bt7SLv1wPE3Ao3Yx4qymEA/jXsHVhbcESXqYTkCfAX5bkxNwOr1ppT84wc8LvZTg
 U5TSNqX+Z0MVF5EMdzAcg2UupcNd0tSRJ4fR5fR3O7MSPnjFy9BxnXE6OQ7tH7urHZgT
 8FFjIyWlIGSpDdFCvxqoiV+RZPLxjb09RnF5QI8hvmn42wmrXUVHwWvZtnXKiFEYlWRA
 0SnQ==
X-Gm-Message-State: AOJu0YyueKlWEbYGnlg8iuG7jcqraWdHZHC6wnw8Qg+1g6xSDeurM2Ha
 XuLZDeLXGTKvO/MCcgGYV16HRKQ6byock7Tn/hu8eJIDN7vnD6isTWrsaNsgzQ==
X-Gm-Gg: ASbGnctJ64xFq0qfqeRaKROwCbkrlNe2PvDGhktECN7M8VOZtoYyN9bIdhw/OEd3LKE
 jIkjFvHZ01ABMAi1zxJLVYBGe8bgGfnOBBNbwQ3ryM708/w2x29sHrkXdrsEz4ES4QWcOJt1QxA
 Vpj0cWspNU6NTYoVLgjkDuz0OBLrHvRfwtPQ2DF0fIiqW/fTVYHhIfNicEZqYMFaZ1qJUjKwSzU
 hf1YJ7Zn1U6FZBYZ13cGWR7vpRQEdCuZlztuZzKxF6sp7JJLZWHNoSaqTy9IT5DVMAO2BFKktjH
 dxpudPwnpZdTuMa9Hn7gDtATBPLw2nJDCkU64x4hHDoiDCjEGdRn3UViBbuKoe9jx2qyL/78HOR
 2V6uE1n0PxmkaksNWMA==
X-Google-Smtp-Source: AGHT+IGcN7yaR4MA6dqSIE8p122nEwK9vwgbKiKHVsZXAmPa30vqVZNiJ2wfnqXoTdQhCeYRyQmdCg==
X-Received: by 2002:a05:600c:4e14:b0:439:4b23:9e8e with SMTP id
 5b1f17b1804b1-45625e1cc84mr29279665e9.3.1752575147829; 
 Tue, 15 Jul 2025 03:25:47 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:47 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 31/41] tests/vkms_configfs: Test enabling a device
 without encoders
Date: Tue, 15 Jul 2025 12:25:03 +0200
Message-ID: <20250715102513.5636-32-jose.exposito89@gmail.com>
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

Try to enable a VKMS device without adding encoders and test that it
fails.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index be856876b..5be89edef 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1216,6 +1216,47 @@ static void test_enable_too_many_crtcs(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-no-encoders
+ * Description: Try to enable a VKMS device without adding encoders and test
+ *              that it fails.
+ */
+
+static void test_enable_no_encoders(void)
+{
+	igt_vkms_t *dev;
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
+		.encoders = { },
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = {},
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
@@ -1250,6 +1291,7 @@ igt_main
 		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
 		{ "enable-no-crtcs", test_enable_no_crtcs },
 		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
+		{ "enable-no-encoders", test_enable_no_encoders },
 	};
 
 	igt_fixture {
-- 
2.50.0

