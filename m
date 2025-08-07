Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED16C87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC84910E0D6;
	Thu,  7 Aug 2025 07:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZcCj5gEJ";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A3410E808
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:22 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-458ba079338so4620125e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552780; x=1755157580; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gk+nwuIXbVR1HkKsoFjRi/a1YJiWM1LqyZUBs2UueGU=;
 b=ZcCj5gEJhYc0SzPPIbZ5s/ee1xFqX2xa+g+YKgrExXfN04gqHTfLVrHeeBBxEOIipv
 4R+btSx2Uhbsr8mMNRmpeOPOzowki87eL5p4PxakFpkiN25EYEc4nMCSYG04XuF0PXmv
 q2s8P+RFQMmRqYESrCTt2XdbH5uHAHamW9srWfWutDc4s6Ilpnl2ja7vwvJkk4jMpHwi
 nF/f6Suk9LA+2TrfyxQYJruaaAVgp00LiRWnAFpV4r91k1QmuoHWBliy0ZMzCVoEFjek
 J7Zm/7hxbimkswxPRaVozrG/OauRpeHwQxIt4NzWJRtUCGcLCaA7wl4rnX1XhXi9DweR
 iNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552780; x=1755157580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gk+nwuIXbVR1HkKsoFjRi/a1YJiWM1LqyZUBs2UueGU=;
 b=SbnzVqnQcEDhirAfd8iPW9kDPRLiDU/jNI2ySCpt+qhlhwfSe17jg8B0U513JVqaR+
 4CIXZ5A0xcZGG4b+iRQdl2bn+v8sRpLdEoMLOgaXda4S6dS2MXV8L55mdWZqAx5ifVJP
 8G04Lg3rH3ee4s1O1xBYq7eiPYCQ+IgjJyQWXJIZw+6M9TQkBPguDTsbXPmkInsiaV23
 0QCN7NkkwIilDac2/hPqg0LuzC+6Ou//XQegop2LD8l+yFbZumPhZEGji2MhWbAltwm6
 ySxbT9pMqcvtEv4AyaPp4H3uZbtuXxWh8HsqxPx7Xmzu/fJ1z3y5UJK+ASeXW/rIZQlg
 CL+w==
X-Gm-Message-State: AOJu0Yz7CXAth6CBJOGitnCUMELuXroJ9+0p51mgMr90voXrcIURXtld
 maIE2QXO7U1/ZdLr2zC31UKlA0f5VVYXdfj8RQ8pHkTe5lxofeHuzmrv2E35QMTr
X-Gm-Gg: ASbGncu7IVxbGKpWWSGAaFNLF7gHsqQnosmT2+BzsHUYmaBnR6Ua7SX8rR04oOeHeaH
 wcYaX82fXWVv/+H8rOVSj7B/8kjNMvleeHK2cKNbwfY6oqPQNHEmJl5gXX3HmxmxkvxqVF2GnKC
 9b6WtK70sFbKGPeeuC+CwUTOhQHoXKq7UtJQuYf5uYIh3UF1O72ICme05Cqg3pP06uzuIlLL2RN
 4GESOk1phzQjP6CVEU1WK6ZZfNO6Sy815DxSUypvGbb1anU1XuTjc+scd9g8lzDW+LArWRx5hx5
 ZH7KTnwyYRkefmnPL5hIaI564afngpX/Xi01O+OAvTNArURD+3Q8JJO4GFEVnUddNxd38ieEOa9
 InwsBjztDe0JtNPMmLUI=
X-Google-Smtp-Source: AGHT+IFvylu8SQmVzYzs9+rPHRv4CVagTe6nnjQ02ZsY4LCDwao1HxVsShq1I8BoJtRpwL1uVU4UEg==
X-Received: by 2002:a05:600c:310e:b0:456:1146:5c01 with SMTP id
 5b1f17b1804b1-459ee0c7284mr21588055e9.12.1754552780340; 
 Thu, 07 Aug 2025 00:46:20 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:19 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 16/41] lib/vkms: Test connector invalid values
Date: Thu,  7 Aug 2025 09:45:25 +0200
Message-ID: <20250807074550.6543-17-jose.exposito89@gmail.com>
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

For a VKMS connector, it is only possible to set invalid values in the
connector status.

Test that setting wrong values fails and that the connector is not
accidentally changed.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 24 ++++++++++++++++++
 lib/igt_vkms.h             |  2 ++
 tests/vkms/vkms_configfs.c | 50 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 5d9e13ed7..a86d5e05d 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -613,3 +613,27 @@ int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name)
 
 	return read_int(path);
 }
+
+/**
+ * igt_vkms_connector_set_status:
+ * @dev: Device the connector belongs to
+ * @name: Connector name
+ * @type: DRM_MODE_CONNECTED, DRM_MODE_DISCONNECTED or
+ * DRM_MODE_UNKNOWNCONNECTION
+ *
+ * Set a new status for the connector
+ */
+void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
+				   int status)
+{
+	char path[PATH_MAX];
+
+	if (status != DRM_MODE_CONNECTED &&
+	    status != DRM_MODE_DISCONNECTED &&
+	    status != DRM_MODE_UNKNOWNCONNECTION)
+		igt_assert(!"Cannot be reached: Unknown connector status");
+
+	igt_vkms_get_connector_status_path(dev, name, path, sizeof(path));
+
+	write_int(path, status);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 13d7ed094..596990547 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -58,5 +58,7 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
 
 void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
 int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
+void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
+				   int status);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index b3fafc069..987491373 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -485,6 +485,55 @@ static void test_connector_default_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: connector-wrong-values
+ * Description: Check that setting unexpected values doesn't work.
+ */
+
+static void test_connector_wrong_values(void)
+{
+	struct invalid_value invalid_status_values[] = {
+		{ "", 0 },
+		{ "\0", 1 },
+		{ "-1", 2 },
+		{ "0", 1 },
+		{ "4", 1 },
+		{ "connected", 10 },
+	};
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+	int fd;
+	int ret;
+
+	/* Create a device with a disconnected connector */
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_connector(dev, "connector0");
+	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_DISCONNECTED);
+	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
+		      DRM_MODE_DISCONNECTED);
+	igt_vkms_get_connector_status_path(dev, "connector0", path, sizeof(path));
+
+	/* Test invalid values for "status" */
+	for (int i = 0; i < ARRAY_SIZE(invalid_status_values); i++) {
+		struct invalid_value v = invalid_status_values[i];
+
+		fd = open(path, O_WRONLY);
+		igt_assert_f(fd >= 0, "Error opening '%s'\n", path);
+
+		ret = write(fd, v.value, v.size);
+		igt_assert(ret <= 0);
+
+		close(fd);
+	}
+
+	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
+		      DRM_MODE_DISCONNECTED);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -505,6 +554,7 @@ igt_main
 		{ "encoder-default-files", test_encoder_default_files },
 		{ "connector-default-files", test_connector_default_files },
 		{ "connector-default-values", test_connector_default_values },
+		{ "connector-wrong-values", test_connector_wrong_values },
 	};
 
 	igt_fixture {
-- 
2.50.1

