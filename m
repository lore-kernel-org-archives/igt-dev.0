Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8073FC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A19510E914;
	Thu, 13 Mar 2025 17:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bQzYD6cy";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D07610E90B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:45 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso8178905e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887223; x=1742492023; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mGCHQKvRWKoEeqe6V2XMWVvsnwnZB1MQJN3f1QqxAiA=;
 b=bQzYD6cyfSRMZXy/HUOf0vstordxEsO8jFiqssiHk/TQsmC4L3REfPNfpbdiSNbmfG
 +p3tIal+cNlEVz99kh3gIJvEdPU4VOocKAcOBAeK5fKvJATIbhYu4q2KIXpTY3seV1z4
 WBHKqAFvGuOP4Xq563wEJ72CHqM06GdvzbHL0E0lxuAe5wsv2pLyI5BZCoIp2jGIOXNa
 h9eMxpKgcgpM4bpNqUlkKeLm3OHI1D3W0UN1cNox7uP+SPuPeHLyDNGqrgiDjxVStxSO
 KG565aHRbJK4kbKkecc/onpY0lUA0b7Pr2T12uA4t5A9Q6OzTvh6PU2SaYQ6iAwaktXU
 MYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887223; x=1742492023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mGCHQKvRWKoEeqe6V2XMWVvsnwnZB1MQJN3f1QqxAiA=;
 b=gq+eDr87aUlFa0fm02cxdEwjSs0PbXQVQQOFW8kfj2O1LLUBn0tVYHt9kfcYBE8gdt
 bOq4nKLdx0IOBZoBTg5nwcCkoXHWfjQ2cfkvN64xz6aYD9N7JQLb9NS5XboZ7mPwlnBd
 YPHHU8AS5Wqk2WxgWdjU516idX7pOzvPD+PnYMGt+lS7keW/6CiToSWxTleP6aULf6Mx
 cNBo938BwgPokGXBadsSIXYZYcsggbEhcsytA7AwY04e86o1E0XYbdkZs0SihYRzydgy
 BbDtyKyqrz/FunzqaMFBhw7jSN3gmlO2jXgyPVG/N+gJVFHdsWAlcossSMyFlh2kJN9e
 klXQ==
X-Gm-Message-State: AOJu0Yy9A5GUUGBsRYoasPtd40lgVTJ040ECo33oTk8Gmo2rRNtEBxIz
 DdsdaITfz3kFhMXeh4KgxtaT7G9pXHGmnObpi9TvXAUZxRyQT32dQIydHIor
X-Gm-Gg: ASbGncvQjASdS8+5s4EZFCQzlVgEZR55N+FEDgT+wqGbQDJMXOQOFMrpLQEdfx1DZTZ
 Mx/jHnJPji53pePh+e7Q6gC8f4I44pS7sQWy06meAZlpEBKA/8jLJR0xipwjqsR0v/Fr2XK61k6
 rTcFnZNjuXynxPaGuvlMrKVHHhdinBkUFBwYBWVrcj/EY3no0HrLuqBXGm58hoafat+TwVSsmrv
 e/J/g5qeAG6vbjg0m3ydQ/E/7XMBIlvuBveVjU2MYSh9E8j/yjaScv9BGKfuLEdi95hWaE/vfwL
 17XpW3wM+PkbJ2mQZm903GNRB3qm5Vdiv0lUZ/fK8Htc
X-Google-Smtp-Source: AGHT+IGO77srOC9VjAFoBQS2kBhZG7QFQkzPiZCZZ7ecJw5NJsA5QEbfuFI+In8idn8FMObQszHiMw==
X-Received: by 2002:a05:600c:4fce:b0:43b:c0fa:f9dd with SMTP id
 5b1f17b1804b1-43d01c25c64mr103083625e9.25.1741887222621; 
 Thu, 13 Mar 2025 10:33:42 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:42 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 21/43] lib/vkms: Test attaching encoders to CRTCs
Date: Thu, 13 Mar 2025 18:32:56 +0100
Message-ID: <20250313173318.5818-22-jose.exposito89@gmail.com>
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

Add helpers to attach and detach encoders and CRTCs and a test checking
the different valid and invalid cases.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 46 ++++++++++++++++++++++++++
 lib/igt_vkms.h             |  6 ++++
 tests/vkms/vkms_configfs.c | 66 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index ea18816e7..b6f22721d 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -364,6 +364,21 @@ void igt_vkms_get_encoder_path(igt_vkms_t *dev, const char *name, char *path,
 	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_ENCODER, name, path, len);
 }
 
+/**
+ * igt_vkms_get_encoder_possible_crtcs_path:
+ * @dev: Device containing the encoder
+ * @name: Encoder name
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the encoder "possible_crtcs" directory path.
+ */
+void igt_vkms_get_encoder_possible_crtcs_path(igt_vkms_t *dev, const char *name,
+					      char *path, size_t len)
+{
+	get_attach_dir_path(dev, VKMS_PIPELINE_ITEM_ENCODER, name, path, len);
+}
+
 /**
  * igt_vkms_get_connector_path:
  * @dev: Device containing the connector
@@ -707,6 +722,37 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name)
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER, name);
 }
 
+/**
+ * igt_vkms_encoder_attach_crtc:
+ * @dev: Target device
+ * @encoder_name: Target encoder name
+ * @crtc_name: Destination CRTC name
+ *
+ * Attach an encoder to a CRTC. Return true on success and false on error.
+ */
+bool igt_vkms_encoder_attach_crtc(igt_vkms_t *dev, const char *encoder_name,
+				  const char *crtc_name)
+{
+	return attach_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER,
+				    encoder_name, VKMS_PIPELINE_ITEM_CRTC,
+				    crtc_name);
+}
+
+/**
+ * igt_vkms_encoder_detach_crtc:
+ * @dev: Target device
+ * @encoder_name: Target encoder name
+ * @crtc_name: Destination CRTC name
+ *
+ * Detach an encoder from a CRTC. Return true on success and false on error.
+ */
+bool igt_vkms_encoder_detach_crtc(igt_vkms_t *dev, const char *encoder_name,
+				  const char *crtc_name)
+{
+	return detach_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER,
+				    encoder_name, crtc_name);
+}
+
 /**
  * igt_vkms_device_add_connector:
  * @dev: Device to add the connector to
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 58896790b..2dd91df9d 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -35,6 +35,8 @@ void igt_vkms_get_crtc_writeback_path(igt_vkms_t *dev, const char *name,
 				      char *path, size_t len);
 void igt_vkms_get_encoder_path(igt_vkms_t *dev, const char *name, char *path,
 			       size_t len);
+void igt_vkms_get_encoder_possible_crtcs_path(igt_vkms_t *dev, const char *name,
+					      char *path, size_t len);
 void igt_vkms_get_connector_path(igt_vkms_t *dev, const char *name, char *path,
 				 size_t len);
 void igt_vkms_get_connector_status_path(igt_vkms_t *dev, const char *name,
@@ -61,6 +63,10 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 					 bool writeback);
 
 void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
+bool igt_vkms_encoder_attach_crtc(igt_vkms_t *dev, const char *encoder_name,
+				  const char *crtc_name);
+bool igt_vkms_encoder_detach_crtc(igt_vkms_t *dev, const char *encoder_name,
+				  const char *crtc_name);
 
 void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
 int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 5ee03ed2f..fdbfa61a6 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -642,6 +642,71 @@ static void test_attach_plane_to_crtc(void)
 	igt_vkms_device_destroy(dev2);
 }
 
+/**
+ * SUBTEST: attach-encoder-to-crtc
+ * Description: Check that errors are handled while attaching encoders to CRTCs.
+ */
+
+static void test_attach_encoder_to_crtc(void)
+{
+	igt_vkms_t *dev1;
+	igt_vkms_t *dev2;
+	char plane1[PATH_MAX];
+	char crtc1[PATH_MAX];
+	char encoder1[PATH_MAX];
+	char plane1_type_path[PATH_MAX];
+	char crtc2[PATH_MAX];
+	bool ok;
+
+	dev1 = igt_vkms_device_create("test_attach_encoder_to_crtc_1");
+	igt_assert(dev1);
+
+	dev2 = igt_vkms_device_create("test_attach_encoder_to_crtc_2");
+	igt_assert(dev2);
+
+	igt_vkms_device_add_plane(dev1, "plane1");
+	igt_vkms_device_add_crtc(dev1, "crtc1");
+	igt_vkms_device_add_encoder(dev1, "encoder1");
+	igt_vkms_device_add_crtc(dev2, "crtc2");
+
+	igt_vkms_get_plane_path(dev1, "plane1", plane1, sizeof(plane1));
+	igt_vkms_get_crtc_path(dev1, "crtc1", crtc1, sizeof(crtc1));
+	igt_vkms_get_encoder_possible_crtcs_path(dev1, "encoder1", encoder1,
+						 sizeof(encoder1));
+	igt_vkms_get_crtc_path(dev2, "crtc2", crtc2, sizeof(crtc2));
+	igt_vkms_get_plane_type_path(dev1, "plane1", plane1_type_path,
+				     sizeof(plane1_type_path));
+
+	/* Error: Attach a encoder to a plane */
+	ok = attach(encoder1, plane1, "plane");
+	igt_assert_f(!ok, "Attaching encoder1 to plane1 should fail\n");
+
+	/* Error: Attach a encoder to a random file */
+	ok = attach(encoder1, plane1_type_path, "file");
+	igt_assert_f(!ok, "Attaching encoder1 to a random file should fail\n");
+
+	/* Error: Attach a encoder to a CRTC from other device */
+	ok = attach(encoder1, crtc2, "crtc2");
+	igt_assert_f(!ok, "Attaching encoder1 to crtc2 should fail\n");
+
+	/* OK: Attaching encoder1 to crtc1 */
+	ok = igt_vkms_encoder_attach_crtc(dev1, "encoder1", "crtc1");
+	igt_assert_f(ok, "Error attaching plane1 to crtc1\n");
+
+	/* Error: Attaching encoder1 to crtc1 twice */
+	ok = attach(encoder1, crtc1, "crtc1_duplicated");
+	igt_assert_f(!ok, "Error attaching encoder1 to crtc1 twice should fail");
+
+	/* OK: Detaching and attaching again */
+	ok = igt_vkms_encoder_detach_crtc(dev1, "encoder1", "crtc1");
+	igt_assert_f(ok, "Error detaching encoder1 from crtc1\n");
+	ok = igt_vkms_encoder_attach_crtc(dev1, "encoder1", "crtc1");
+	igt_assert_f(ok, "Error attaching encoder1 to crtc1\n");
+
+	igt_vkms_device_destroy(dev1);
+	igt_vkms_device_destroy(dev2);
+}
+
 igt_main
 {
 	struct {
@@ -665,6 +730,7 @@ igt_main
 		{ "connector-wrong-values", test_connector_wrong_values },
 		{ "connector-valid-values", test_connector_valid_values },
 		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
+		{ "attach-encoder-to-crtc", test_attach_encoder_to_crtc },
 	};
 
 	igt_fixture {
-- 
2.48.1

