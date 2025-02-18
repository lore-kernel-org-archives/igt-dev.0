Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146A9C19778
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C947B10E7B5;
	Wed, 19 Feb 2025 09:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OYnb4Swa";
	dkim-atps=neutral
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F003310E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:33 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38f2c4382d1so2566116f8f.0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897432; x=1740502232; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yVdeckQLIKxD9V0q3CN2K3LcBZwsITHqh08bH/TnAEo=;
 b=OYnb4SwaRJsU2EAy2QmoNm+LB8ga5ln0XCMSSDJktm2EeLgtSd8CKGEvoNXaAQLLmo
 ZGGPAd/z2/Mle65GJqM9VTNw0hbeE8V3vyaJ+48zlfRvFAH0GmDJdzoRn1t65RH/Lb4m
 wHMVYx0YHsiOSp+kYYECg6i7VaNNR+3Zop46xTgbv+L/oYpnQAYa6x42njGIJxq2mkBZ
 C3tsDhm8CWbDro7Ugs43oNasBAGnz89rjNFGXjGi98FsbRhHDQRKWOOkFw/e/mczL6pj
 DdFOOT0UI0WsHOX+Oe95S66JUElbV17ncW72NQA+uhzfjgqxjs2J9JmEvHtVlpHBZZd4
 tg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897432; x=1740502232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yVdeckQLIKxD9V0q3CN2K3LcBZwsITHqh08bH/TnAEo=;
 b=C6kHHagyjvgrai33uUsesriBXCGqj5+ZonpdPE+5YV95ggCPGxpJJQxKJ6V7ig8JJv
 0+bdvUJalGFnnQ2C7cpmZFT2Y1cgmyOTIWwycB8OhWkO43DIRjYf14zJ6tTsFVx1l8Bl
 d5Z5vQ2Uu1N6tHFHI01yAqSlTtC79wWLxpruOt6B+XnkNt5KLOA6smU0Oh9gpVESMj3o
 N+FnsyGf4Tuj2yDKqa6N+NXnolZ+6ySsrl4+pfmFC3QIkEiKyAOjwMs3dZpHkH+mmFGz
 0xN1SDZu3wBoG09MIO7sEbER2FPvEgjfIjJ//qWZgKgF/Eng4MpSO8j2IMY2ecKIfwxH
 wcdQ==
X-Gm-Message-State: AOJu0YyMoZzWCAO9I67HywV1MR0/VpQr+XBQQBa3WpPMi+fQyiD71Awo
 uFaxSRSGEkLikszP9Tlk8wFGkIdN/yJMam+FUBNby83A33gYfuHqBwIUdR5R
X-Gm-Gg: ASbGncsTdbbGu1gGsCRnNXLThwMDFwANIwea980unstxl8Whq8YLpadT+AoxIKp3asW
 LthFjASuHz+1nWcUuj8kG44IdtJam4QQU8mbApXpNM2UV+sV+L6mFmwNd0lyBg0uZZ+rWH+xlcH
 rHh3bKZu4ZyuSxLKgHzKSiKYgiYBNt93W8poWpC+mAZ6DaHX60JTRnng5wAXGqLcmWzyyvUF+pV
 ODZWnVK00h9AbYf55uK2qSYmXBMNW6bl2mkaZssk2xMySg27X3iznPd1D2S4IWL4VMnVTcxX6w3
 IwL8dVoY73LARdCYDg==
X-Google-Smtp-Source: AGHT+IHXrc4HjCSB85zCwOXu30GRL2hCXeOkM+8F2iPCqoaPEWSyomdKKtG7pK+lJ1ucCDF97KaZ4w==
X-Received: by 2002:a05:6000:1786:b0:38d:a695:6daf with SMTP id
 ffacd0b85a97d-38f57d9309cmr399441f8f.19.1739897431965; 
 Tue, 18 Feb 2025 08:50:31 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:31 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 20/39] tests/vkms_configfs: Test enablement without
 pipeline items
Date: Tue, 18 Feb 2025 17:49:52 +0100
Message-ID: <20250218165011.9123-21-jose.exposito89@gmail.com>
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

It shouldn't be possible to enable a device without creating and
attaching its pipeline items.

Test that the device is not enabled and also that no actual device was
created using libdrm.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 60 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index dc3dbe80d..87d660fff 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -108,6 +108,42 @@ static bool attach(const char *src_path, const char *dst_path,
 	return ret == 0;
 }
 
+static drmDevicePtr find_device(const char *name, drmDevicePtr *devices,
+				int n_devices)
+{
+	drmDevicePtr dev;
+	const char *dev_name;
+
+	for (int i = 0; i < n_devices; i++) {
+		dev = devices[i];
+
+		if (!(dev->available_nodes & BIT(DRM_NODE_PRIMARY)))
+			continue;
+
+		if (dev->bustype != DRM_BUS_PLATFORM)
+			continue;
+
+		dev_name = dev->businfo.platform->fullname;
+		if (strncmp(name, dev_name, strlen(name)) == 0)
+			return dev;
+	}
+
+	return NULL;
+}
+
+static bool device_exists(const char *name)
+{
+	drmDevicePtr devices[64];
+	int n_devices;
+	bool exists;
+
+	n_devices = drmGetDevices(devices, ARRAY_SIZE(devices));
+	exists = !!find_device(name, devices, n_devices);
+	drmFreeDevices(devices, n_devices);
+
+	return exists;
+}
+
 /**
  * SUBTEST: device-default-files
  * Description: Test that creating a VKMS device creates the default files and
@@ -689,6 +725,29 @@ static void test_attach_connector_to_encoder(void)
 	igt_vkms_device_destroy(dev2);
 }
 
+/**
+ * SUBTEST: enable-no-pipeline-items
+ * Description: Try to enable a VKMS device without adding any pipeline items
+ *              and test that it fails.
+ */
+
+static void test_enable_no_pipeline_items(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	/* Try to enable it and check that the device is not set as enabled */
+	igt_vkms_device_set_enabled(dev, true);
+	igt_assert(!igt_vkms_device_is_enabled(dev));
+
+	/* Check that no actual device was created*/
+	igt_assert(!device_exists(__func__));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -711,6 +770,7 @@ igt_main
 		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
 		{ "attach-encoder-to-crtc", test_attach_encoder_to_crtc },
 		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
+		{ "enable-no-pipeline-items", test_enable_no_pipeline_items },
 	};
 
 	igt_fixture {
-- 
2.48.1

