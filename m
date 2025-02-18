Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493DDC021BE
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110CF10E7C6;
	Wed, 19 Feb 2025 09:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="km8z9F6C";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13C310E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:32 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4398ec2abc2so15424355e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897431; x=1740502231; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lzXW1GQm/l9q8TMQblUN8rtjWL0FSVlNiWzUb2V+rDw=;
 b=km8z9F6CrtNQhprKEertXphARU3twaBdinucrVGpEjOBokPYamCI8lwJyDLfjZmlzx
 L8vTsSHJ54kDkRN6lDLgfonXVnjxgnvWM98oz2rvXA9Q9B7F60YAgwTtg+2MUbC9UqG/
 jMXwa+0jsRR+gmhz2muiyEVINnYPY/jCmt/YeBUQ/ZqEzLgsEzI5OGBeZ8nmn2MpFdeE
 jYvMlxv4DkhQkPx+T8CerZuUuyNm7q4d+dYVvu3EKKom7i+noRcekJ8gyCtGffQ3pM0S
 2xHvxNp0ZQbOcrpJXpdfUKqfHSx5nxshErMUAMPzHSCkoZKyNCzQpajjEjY4fi0JwKQM
 RdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897431; x=1740502231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lzXW1GQm/l9q8TMQblUN8rtjWL0FSVlNiWzUb2V+rDw=;
 b=Hu1oiXeQRpvsjuW67CZdJTfko4cyFV2m+Vs3JAT/OnG5JdEOVhUIr9/p3sLsCV5v5a
 WMcKsn/l8jm9VEtFSvHmZS+4RV2RgCOTsVPaCUIBwIoY0ToSbFq1jm/gWrMFcxTo2HWG
 M4OKFlUbVP+hDcpJ1XHOKlVEEiWKtWJ/1lAgFmzPEf9mrVzHc7f0nJ8tS0vu82f8zvpQ
 iU8AaD854v+u6A+45MxHLxEd6E4UW4UTa7FCSTMltK3v+SIP7X2H5dYCwmqtCa8z3u+n
 fkVB7XkiND19wj9JWIW8u8TQzuc3kdGebA3YrGxrASRaz+C811bHx+2tnkIqDcugzi8U
 2pzQ==
X-Gm-Message-State: AOJu0YxNM8lzjk0ZoOKcMTbEPbdMGHw57eh4dwv4qWej4vbvpV9sQe0W
 dlk1GCiRIKTOHK9KZabXfOPY6/44amwSmsKVWeC+kdu01U0Ppgfn6OL/R8Qj
X-Gm-Gg: ASbGncuoydpgzdvJnx9Uul+iQ8lkCokvZs7otsgvLPZ19WNVDzDjDP1yMlSDPn85NMM
 xx+iyudVt8vo1WIsatg0Zh+7GXZqRxE5C7Fhep3mEGJEY64PFpwV4TWwDp3LjVfk89UBV2uizEp
 JlWb8BZw+lr7JN+dpS3BVEO6By9Y1zheX1PDsLjgB51Eu6U3aUhambhWjMT1+X7cRRIdXBuJMOU
 cDG/X1v9OyxSzkIHYgBAe+a2kBlN9O8sVVJ1nFqAd6g9j7sbMAAoqHuIqkBjahFczW1qlrRyS3g
 W6QkIolQkjtga8MPTQ==
X-Google-Smtp-Source: AGHT+IGPvG+kXyEWShCkwq5T/MhacNYV14KVP4CI87Bb5jVL4DVzQD8F2CBt7K734MqavjhiiFB6Zg==
X-Received: by 2002:a05:600c:4f55:b0:439:95b9:91fc with SMTP id
 5b1f17b1804b1-43999d8b49dmr3913425e9.12.1739897430622; 
 Tue, 18 Feb 2025 08:50:30 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:30 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 18/39] lib/vkms: Test attaching encoders to CRTCs
Date: Tue, 18 Feb 2025 17:49:50 +0100
Message-ID: <20250218165011.9123-19-jose.exposito89@gmail.com>
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

Add helpers to attach and detach encoders and CRTCs and a test checking
the different valid and invalid cases.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 31 ++++++++++++++++++
 lib/igt_vkms.h             |  4 +++
 tests/vkms/vkms_configfs.c | 66 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 147234e5b..dba766c28 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -521,6 +521,37 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name)
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
index fc8db268b..0cc09eb90 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -43,6 +43,10 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 					 bool writeback);
 
 void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
+bool igt_vkms_encoder_attach_crtc(igt_vkms_t *dev, const char *encoder_name,
+				  const char *crtc_name);
+bool igt_vkms_encoder_detach_crtc(igt_vkms_t *dev, const char *encoder_name,
+				  const char *crtc_name);
 
 void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
 int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index e1572d65f..6ac475ff4 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -556,6 +556,71 @@ static void test_attach_plane_to_crtc(void)
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
+	snprintf(plane1, sizeof(plane1), "%s/planes/plane1", dev1->path);
+	snprintf(crtc1, sizeof(crtc1), "%s/crtcs/crtc1", dev1->path);
+	snprintf(encoder1, sizeof(encoder1),
+		 "%s/encoders/encoder1/possible_crtcs", dev1->path);
+	snprintf(crtc2, sizeof(crtc2), "%s/crtcs/crtc2", dev2->path);
+	snprintf(plane1_type_path, sizeof(plane1_type_path),
+		 "%s/planes/plane1/type", dev2->path);
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
@@ -576,6 +641,7 @@ igt_main
 		{ "connector-default-values", test_connector_default_values },
 		{ "connector-wrong-values", test_connector_wrong_values },
 		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
+		{ "attach-encoder-to-crtc", test_attach_encoder_to_crtc },
 	};
 
 	igt_fixture {
-- 
2.48.1

