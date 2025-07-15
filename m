Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C566C83F22
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5389B10E1BF;
	Tue, 15 Jul 2025 10:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="axQeaAsf";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4CD10E59E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:37 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-456108bf94bso16483305e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575135; x=1753179935; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZgDmjsN0n1BmteWfWxGivC3VP+aRA3U3vg4ksPrtLc4=;
 b=axQeaAsfc64Kn4mrXCSvHGYG/hxRRGtP7diyo9S9/z3vB8b6AnLjj9C9CcKTahxmnx
 CTrj3S9yKe6LR/B+UNZFqMHFhFIUaoYOpx78G1EfvgTnzQFPhPEnjaEmJ16GvPGVavhN
 mKUN5POZ9w4DjFH36PF4v9BAbjEWNI108PxOBAdrJFbHxYyCgLXdxrFxSYJZPOQU8uIi
 pqYBO7WKpJebpwC+Fiaz1aHLnITRFq7AYYTrYksjkQjwMAFqy5qylp+tqMBPY4O6xEXq
 faIHqjWdUxALZJC0nMKVRMouK4Qw0WHwSrr7BfBXM3WjPmqBMWjW/q4OVwU6nevMXUQy
 JAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575135; x=1753179935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZgDmjsN0n1BmteWfWxGivC3VP+aRA3U3vg4ksPrtLc4=;
 b=Lp250coh6QWMEs2+EWKdEKZEI/DPReYZiBOf6YEdQ6synDnkWtVOP4Sd6sGxiNSw6r
 6bXZBufAQY/027Wl8Gwfl+vEK9msfnDB+vLL97x6iR4b/1Y3IXrLcwqJHNAG6meHDNUB
 VDkxtG35puQypA/AngdQCvOtrMCLpjSKu6lUjrb2+NzoHLAE1VbRuLOmmHWoncHw5+7M
 OKeHEv7rHdQfv95SHZKzra7arg/4/qKYmto6IDliD2MKjpawR3ZTrjXGydsB4kNgWMP6
 M4tOh85pGZPdRyoNJ8UsNovlTYNRLP685ujtn3hJbDmLxKoUoAoQqxMh4gASuxXcld3A
 iNOg==
X-Gm-Message-State: AOJu0YzGfDBKJmaUg6lyHgxP+sh1OcORgp/gg62h63spyMzEvipqMPso
 krI7D++MfseWH6+0zecy+Cxoy4u7DSD3srIK+pd4ff5TGpCE/bahIfBDCzZ3Zw==
X-Gm-Gg: ASbGncsiPAI3+gf+I8Ov+hG2uVo4Cj/f9k+Q8zH8j8fvQk5diFtFUssxcyhem42/1E5
 t5IL6U4T5o0XsHxGGMEBYTtEPl0CmHHnI3QZs5URo8ZFm/6YixKTbFVWOc2lKsjO0sRo29suX0n
 n4kGuGxjSlQtRx0ba0rshJnK9lhPambb9gHkeTWE3/U/ujIEVD7P91jy8WS59xPgc1cEPwCGViV
 H0HCh5v/5nKGGPq0tMISKBZeIZM0VfiGgVs8lB55D2HpffOm6TwmlI/+Uc+NmPPVeh+7Byk4y9G
 zMjjtf2nx+KjSDyw68vlCEMcBE7+jc0tgL9IyP+4TN+KpI0dTQY9cPok/jUmvgbDIdJ3IaMb/2y
 WzIoSHFCX/Pj0roeZug==
X-Google-Smtp-Source: AGHT+IFGalFEw2SFWYACDGN55nrFUmiDHUBD7U/J6/eUPo9FxUY5xc7dbA0b4RoqpOCBfAO0tc2APw==
X-Received: by 2002:a05:600c:c11c:b0:453:66f:b96e with SMTP id
 5b1f17b1804b1-454ec146a71mr111706805e9.11.1752575135363; 
 Tue, 15 Jul 2025 03:25:35 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:35 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 16/41] lib/vkms: Test connector invalid values
Date: Tue, 15 Jul 2025 12:24:48 +0200
Message-ID: <20250715102513.5636-17-jose.exposito89@gmail.com>
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
index c8b0dd071..1cd560038 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -614,3 +614,27 @@ int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name)
 
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
index 3d27bfebb..df64bde9d 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -58,5 +58,7 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
 
 void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
 int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
+void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
+				   int status);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index d7ce4aa17..c74bbc15f 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -486,6 +486,55 @@ static void test_connector_default_values(void)
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
@@ -506,6 +555,7 @@ igt_main
 		{ "encoder-default-files", test_encoder_default_files },
 		{ "connector-default-files", test_connector_default_files },
 		{ "connector-default-values", test_connector_default_values },
+		{ "connector-wrong-values", test_connector_wrong_values },
 	};
 
 	igt_fixture {
-- 
2.50.0

