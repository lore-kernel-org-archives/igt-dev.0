Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D858C021B4
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026BF10E7D3;
	Wed, 19 Feb 2025 09:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h+CwpGid";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C795610E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:25 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4398e3dfc66so16422955e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897424; x=1740502224; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHD0/k8mtE5gLnp7+Ej/nRG94rDpP0xo3CMDXUvYAuA=;
 b=h+CwpGidclEClARTDbxRPcWue/kfihsrRrkA79LoFUqoH5WH38Aau2THnUu2Kr5/+U
 /kWQqmNwQdvK+kBmHzQcsGr1BxrdHi+HV0hx/zE4eUEtTa2S8vq7RvTaAD0fkDHNf/fL
 zD8HNHgHOBlce2/qBSbSp8zBRTBq8rhSrndyp8IeBfaC2QcPXRcD1MXmo6NWyUeGaM9j
 7HFGtwC5biOVGp7M1MojKbg6ybWPHbeJ2/vJmXzGWIp/RNjDPC1io/RVdT2zjRoFvyVB
 nUpOh+XcSgDcQxHZxcfvv+ioeKR6K1OhAYBomsAmIPlgLAYivLb+G+sUgz8P3H/aejcF
 7D1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897424; x=1740502224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EHD0/k8mtE5gLnp7+Ej/nRG94rDpP0xo3CMDXUvYAuA=;
 b=kWk2XXS+K8ntVXan06XQsi8SGMaTDZdx0vXg9NsmxwuIrVKutZb45D+uA+kVClUQqu
 YQkKOUbBOpl75sDeBn0PTp0DZSZPo2zjSHsDOJuvTbGWP8Pjrzd0SkHvmWostHic8OGG
 sYSbRFUbJQrYM5rOmTy8F8dCdKmSGFZUijXIITfNN/2G8ouMBxLhzyR1ElnXz7f1P0dZ
 H1m5VRFzJY5POn8DjchIkHBJ1DuszJgmHENKZDgIt1x2/Dv+1b8M+XvetC58SGGnzbgm
 7wf4AtQkmyUqk/GdcXZ2opxVq4dN1gsQ5VTVLDUNFvqY1uzcrV0NCWt+C56u5tZpYbtW
 CB1w==
X-Gm-Message-State: AOJu0YwvIlMWpDIb1l0dVNuqfJkg8jEE1BvedEKLYVCTxzMTbwND9QEW
 nZPwP7XGrgbvOyVo/vLUYX7tTg0TEN+mSWxF3CIMxLHIyeHkPKTCbC79Px0P
X-Gm-Gg: ASbGncvINdJViUQ5bEIsZI2h3nS4dKnyp+NXbbPAcS9N4PGJnVtzJJiXGENjtsk1Hi+
 Vb2319QEtnBxPk4VCUl2IeWvKKq/+f8MQtjjGOoS8/U+IPQGymuwDPMdUTg/M60bLEe3dW1c+Bb
 sgZkjEDP3xHJ43m3zPolFoEr9uioUAyanLsuQuK1wn1QS2kVxu7k5tDIOc6dqUEJs0mlTJgRqKW
 JWyOxRWzF5Out0muFNzIBjWWtk6zQY6lwi3/VEt0r1UDO7u8Sd20iQMudA5wG45ndgc/0FDSApH
 /nIGiJao9lnPZS+VgQ==
X-Google-Smtp-Source: AGHT+IHT61gOCxRUKoo6YDGxVBHQ8BHAI4EtW1o6o/GNISJDCzlWnklIEhVjy3mhNKlaRsUxSl+hFg==
X-Received: by 2002:a05:600c:4e8c:b0:439:33dd:48ea with SMTP id
 5b1f17b1804b1-43999d72091mr3861985e9.2.1739897423693; 
 Tue, 18 Feb 2025 08:50:23 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:23 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 10/39] lib/vkms: Test CRTC default files
Date: Tue, 18 Feb 2025 17:49:42 +0100
Message-ID: <20250218165011.9123-11-jose.exposito89@gmail.com>
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

Add a helper to create a CRTC and a test checking that the default
files and directories are created.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 12 ++++++++++++
 lib/igt_vkms.h             |  2 ++
 tests/vkms/vkms_configfs.c | 29 +++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index ca6f37975..a7dad43e2 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -365,3 +365,15 @@ void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type)
 
 	write_int(path, type);
 }
+
+/**
+ * igt_vkms_device_add_crtc:
+ * @dev: Device to add the CRTC to
+ * @name: CRTC name
+ *
+ * Add a new CRTC to the VKMS device.
+ */
+void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name)
+{
+	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_CRTC, name);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 283be5699..7f70f92d3 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -33,4 +33,6 @@ void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
 int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
 void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 
+void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
+
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index d607b1a5a..398232c03 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -272,6 +272,34 @@ static void test_plane_wrong_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: crtc-default-files
+ * Description: Test that creating a CRTC creates the default files and
+ *              directories.
+ */
+
+static void test_crtc_default_files(void)
+{
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+
+	const char *files[] = {
+		"writeback",
+	};
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_crtc(dev, "crtc0");
+
+	snprintf(path, sizeof(path), "%s/crtcs/crtc0", dev->path);
+	assert_default_files(path,
+			     files, ARRAY_SIZE(files),
+			     NULL, 0);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -284,6 +312,7 @@ igt_main
 		{ "plane-default-files", test_plane_default_files },
 		{ "plane-default-values", test_plane_default_values },
 		{ "plane-wrong-values", test_plane_wrong_values },
+		{ "crtc-default-files", test_crtc_default_files },
 	};
 
 	igt_fixture {
-- 
2.48.1

