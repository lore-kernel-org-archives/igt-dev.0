Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCC0C83F34
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6400F10E5B4;
	Tue, 15 Jul 2025 10:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MPIentq9";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A008A10E5AF
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:54 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-45617887276so16995555e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575153; x=1753179953; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t1oJGe8zl62Kf5lG0aeZovWEsUtWPy8xLdtrVHDRtN4=;
 b=MPIentq9JLszITJS0fA8TxYCIV5jN2MAcl/aXOd39ioQf7dcFxZ5rEJOFXgi0AcqTm
 o3nMLIFK3BnA+66nc0mFxxh4RD1pKnE/xhAvw0duueei2gnUAFUiJmqCtR/PJX/yMpmo
 XJqB4Z2LTgoeAX8mD0I53/eNZykXkKcVvKX5I1AAHl2WkkLvNl3xdFX5MsiYeqVDi0fC
 HSDVkbT4BcMssZ4FRQ2nYSWf5MVEJY1JWm7W6R3BMy/0s3sRSM60/nDUDsHe4ubBy3FA
 3FwDnYH007ZwKSgl5+gErF/pT34M3/ZzIGPHtqIiN1i/KxtfDyHtgKCswgaanEYrxMKE
 pPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575153; x=1753179953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t1oJGe8zl62Kf5lG0aeZovWEsUtWPy8xLdtrVHDRtN4=;
 b=dcsn1dYYhJf7fVaaXpwbjWoBSSEdgpyQPxyl9AYrkv5wKFD+WTjIl/8qh7C7y3yL93
 Nb4kT4Ro4PRQKX5xDzdIsnawkmTBcCcFEk6CgR8eIbLNxpCGKDZ2fqQjrzcxpQlNMDjB
 WxadYh6xTVawZ9n8wro9nsz7pt0zqEvN/2i1nIUTYouMRUytK9VKS9S2G2JMI/u8lqeR
 galYPkexNYR9HlVQs/tjSXRg8tmNNZ+wa/d4ZnbthN5+w5lDoimwLX1hf2AW4BLIgTGM
 2WB25H6U5nPmPBkm1hcsfP4F6hOSzj4Y5pM1FGH0+O1fO+uu+XB/dhAbZAwP1g35HKWk
 RPQQ==
X-Gm-Message-State: AOJu0YyzZMfSnLeHbQRcjdnLPM+1hyHujWh3c6Zwn2D7cbLLvjiaHg1G
 5BTwynk64R7COjTHbWh9sJyaB7gXPlC4MBFUvYt25NY7icl4K9m80E2S7TmzKw==
X-Gm-Gg: ASbGncv8eKOC2e/LL7kzrqXyEGqtVTt0Rt8o33iCexVoCBjG3VGq219rlh9d+xtoZCl
 /xuZ/kY4313xITaG97LSpWPb4A7HRVyGDqk3cKKHHIOmZe4QpwGyLeK54LfMMv1aYHnQGuxLt73
 FcztKs1TYPaQzsHqPZGX3asF/LI1QN+tuk6Q6bTetBpMznLo+RV7X/WJ26VpPHwITvgjJz0/fm+
 4r2OigIOBBiQTGOSTuoEH9POxwkMHBzt2l9aHivke2JPbiFG/G6xKzCtSP8q5UNysP4PqrGLuNf
 NvgjZvO7J71mF5SHUxp1UbL97gwdKxUE6JxLAUfWyh0LwgjCa6/VNkRSTETjUskMmalrnTkHTb7
 pXuebXw2dUVnY3WaTgg==
X-Google-Smtp-Source: AGHT+IFcJMlpgXLXlCUIlbjwG5fDaTT+4BPKc8XYWty4wF4MHv38v4Bm8rwv5APNVJ3NhcAO2NkZiQ==
X-Received: by 2002:a05:600c:1c10:b0:456:1e5a:885e with SMTP id
 5b1f17b1804b1-4561e5a8f83mr56104475e9.3.1752575152763; 
 Tue, 15 Jul 2025 03:25:52 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:52 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 38/41] lib/vkms: Test changing enabled device CRTCs
Date: Tue, 15 Jul 2025 12:25:10 +0200
Message-ID: <20250715102513.5636-39-jose.exposito89@gmail.com>
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

Test that, once a VKMS device is enabled, the CRTC values can't change
and that deleting it or the attached planes/encoders doesn't change the
VKMS device.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 12 +++++++++
 lib/igt_vkms.h             |  1 +
 tests/vkms/vkms_configfs.c | 55 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 96f13d628..5923e8527 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -804,6 +804,18 @@ void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name)
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_CRTC, name);
 }
 
+/**
+ * igt_vkms_device_remove_crtc:
+ * @dev: Device to remove the CRTC from
+ * @name: CRTC name
+ *
+ * Remove an existing CRTC from the VKMS device.
+ */
+bool igt_vkms_device_remove_crtc(igt_vkms_t *dev, const char *name)
+{
+	return remove_pipeline_item(dev, VKMS_PIPELINE_ITEM_CRTC, name);
+}
+
 /**
  * igt_vkms_crtc_is_writeback_enabled:
  * @dev: Device the CRTC belongs to
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 786db224e..9785a64e9 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -105,6 +105,7 @@ bool igt_vkms_plane_detach_crtc(igt_vkms_t *dev, const char *plane_name,
 				const char *crtc_name);
 
 void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
+bool igt_vkms_device_remove_crtc(igt_vkms_t *dev, const char *name);
 bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
 void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 					 bool writeback);
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 11dea86ed..62dfb99be 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1635,6 +1635,60 @@ static void test_enabled_plane_cannot_change(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enabled-crtc-cannot-change
+ * Description: Test that, once a VKMS device is enabled, the CRTC values can't
+ *              change and that deleting it or the attached planes/encoders
+ *              doesn't change the VKMS device.
+ */
+
+static void test_enabled_crtc_cannot_change(void)
+{
+	igt_vkms_t *dev;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc0"},
+			},
+		},
+		.crtcs = {
+			{ .name = "crtc0", .writeback = true },
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
+	dev = igt_vkms_device_create_from_config(&cfg);
+	igt_assert(dev);
+
+	igt_vkms_device_set_enabled(dev, true);
+	igt_assert(igt_vkms_device_is_enabled(dev));
+	assert_device_config(&cfg);
+
+	/* Try to change values */
+	igt_vkms_crtc_set_writeback_enabled(dev, "crtc0", false);
+	igt_assert(igt_vkms_crtc_is_writeback_enabled(dev, "crtc0"));
+
+	/* Deleting pipeline items doesn't affect the device */
+	igt_assert(igt_vkms_plane_detach_crtc(dev, "plane0", "crtc0"));
+	igt_assert(igt_vkms_encoder_detach_crtc(dev, "encoder0", "crtc0"));
+	igt_assert(igt_vkms_device_remove_crtc(dev, "crtc0"));
+	assert_device_config(&cfg);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -1676,6 +1730,7 @@ igt_main
 		{ "enable-no-connectors", test_enable_no_connectors },
 		{ "enable-too-many-connectors", test_enable_too_many_connectors },
 		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
+		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
 	};
 
 	igt_fixture {
-- 
2.50.0

